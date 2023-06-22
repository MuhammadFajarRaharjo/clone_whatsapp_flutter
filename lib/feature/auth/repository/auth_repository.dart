import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:whatsapp_flutter/common/models/user_model.dart';
import 'package:whatsapp_flutter/common/repository/firebase_storage_repository.dart';
import 'package:whatsapp_flutter/constants/firebase_constant.dart';

import '../../../common/providers/firebase_provider.dart';
import '../../../common/routes/routes.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthReository(
    auth: ref.read(authProvider),
    firestore: ref.read(firestoreProvider),
    database: ref.read(databaseProvider),
  );
});

class AuthReository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final FirebaseDatabase _database;

  AuthReository({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
    required FirebaseDatabase database,
  })  : _auth = auth,
        _firestore = firestore,
        _database = database;

  Stream<UserModel> getUserPresestence(String uid) {
    return _firestore
        .collection(FirebaseConstant.users)
        .doc(uid)
        .snapshots()
        .map((event) => UserModel.fromJson(event.data()!));
  }

  Future<UserModel?> getUserCurrentUser() async {
    final user = await _firestore
        .collection(FirebaseConstant.users)
        .doc(_auth.currentUser?.uid)
        .get();
    if (user.data() == null) return null;
    return UserModel.fromJson(user.data()!);
  }

  void updateUserPresence() {
    final online = {
      'active': true,
      'lastSeen': DateTime.now().millisecondsSinceEpoch,
    };
    final offline = {
      'active': false,
      'lastSeen': DateTime.now().millisecondsSinceEpoch,
    };

    final connectedRef = _database.ref(FirebaseConstant.connected);

    connectedRef.onValue.listen((event) async {
      // mengecek secara realtime apakah user terhubung dengan aplikasi atau tidak
      final isConnected = event.snapshot.value as bool? ?? false;
      if (isConnected) {
        // update realtime database saat user terhubung
        await _database.ref().child(_auth.currentUser!.uid).update(online);
      } else {
        // disconnect dari database dan update data di database
        await _database
            .ref()
            .child(_auth.currentUser!.uid)
            .onDisconnect()
            .update(offline);
      }
    });
  }

  // Sign in use phoneNumber
  Future<void> signInWithPhoneNumber(
    BuildContext context,
    String phoneNumber,
  ) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw e.message!;
        },
        // if compleate code verivication send to next page
        codeSent: (String verificationId, int? resendToken) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.verify,
            (route) => false,
            arguments: {
              'phoneNumber': phoneNumber,
              'verificationId': verificationId
            },
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> verifySmsCode({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AssetEntity>> fetchAllImages(int currentPage) async {
    // Meminta permission
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) PhotoManager.openSetting();

    // mengambil semua gambar
    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: true,
    );

    List<AssetEntity> photo = await albums[0].getAssetListPaged(
      page: currentPage,
      size: 24,
    );
    return photo;
  }

  Future<File> pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      return File(image!.path);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveUserToFirebase({
    required String username,
    required var profileImage,
    required ProviderRef ref,
  }) async {
    try {
      String uid = _auth.currentUser!.uid;
      String imageUrl = '';
      if (profileImage != null) {
        imageUrl = await ref
            .read(firebaseStorageRepositoryProvider)
            .storeFileToStorage(
              FirebaseConstant.profileImage,
              uid,
              profileImage,
            );
      }

      UserModel user = UserModel(
        name: username,
        uid: uid,
        phoneNumber: _auth.currentUser!.phoneNumber!,
        profileImageUrl: imageUrl,
        lastSeen: DateTime.now().millisecondsSinceEpoch,
        active: true,
        groupId: [],
      );

      await _firestore
          .collection(FirebaseConstant.users)
          .doc(uid)
          .set(user.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
