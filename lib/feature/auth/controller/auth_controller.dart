import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:whatsapp_flutter/common/helpers/show_alert_dialog.dart';
import 'package:whatsapp_flutter/common/helpers/show_loading_dialog.dart';
import 'package:whatsapp_flutter/common/models/user_model.dart';
import 'package:whatsapp_flutter/feature/auth/repository/auth_repository.dart';

import '../../../common/routes/routes.dart';

final authControllerProvider = Provider((ref) {
  return AuthController(
    repository: ref.watch(authRepositoryProvider),
    ref: ref,
  );
});

final getCurrentUserProvider = FutureProvider<UserModel?>((ref) async {
  return ref.watch(authControllerProvider).getUserCurrentUser();
});

// final userDataProvider = StateProvider<UserModel?>((ref) => null);

final fetchAllImagesProvider =
    FutureProvider.family<List<AssetEntity>, int>((ref, currentPage) async {
  return ref.watch(authControllerProvider).fetchAllImages(currentPage);
});

final getUserPresistenceStatusProvider =
    StreamProvider.family<UserModel, String>((ref, uid) async* {
  yield* ref.watch(authControllerProvider).getUserPresestence(uid);
});

class AuthController {
  final AuthReository _repository;
  final ProviderRef _ref;

  AuthController({
    required AuthReository repository,
    required ProviderRef ref,
  })  : _repository = repository,
        _ref = ref;

  Stream<UserModel> getUserPresestence(String uid) {
    return _repository.getUserPresestence(uid);
  }

  Future<UserModel?> getUserCurrentUser() async {
    final user = await _repository.getUserCurrentUser();
    return user;
  }

  Future<void> updateUserPresence() async => _repository.updateUserPresence();

  Future<void> signInWithPhoneNumber(
    BuildContext context,
    String phoneNumber,
  ) async {
    try {
      showLoadingDialog(
        context: context,
        message: 'Sending a verification code to $phoneNumber',
      );
      await _repository.signInWithPhoneNumber(context, phoneNumber);
    } catch (e) {
      Navigator.pop(context);
      showAlertDialog(context: context, message: e.toString());
    }
  }

  Future<void> verifySmsCode({
    required BuildContext context,
    required String verificationId,
    required String smsCode,
    required bool mounted,
  }) async {
    try {
      showLoadingDialog(
        context: context,
        message: 'check verivication code',
      );
      await _repository.verifySmsCode(
          verificationId: verificationId, smsCode: smsCode);
      if (!mounted) return;
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.profileInfo,
        (route) => false,
      );
    } catch (e) {
      Navigator.pop(context);
      showAlertDialog(context: context, message: e.toString());
    }
  }

  Future<List<AssetEntity>> fetchAllImages(int currentPage) async {
    return _repository.fetchAllImages(currentPage);
  }

  Future<File> pickImageFromCamera() async {
    return _repository.pickImageFromCamera();
  }

  void saveUserToFirebase({
    required BuildContext context,
    required String username,
    required var profileImage,
    required bool mounted,
  }) {
    try {
      showLoadingDialog(
        context: context,
        message: 'Save user information',
      );
      _repository.saveUserToFirebase(
        username: username,
        profileImage: profileImage,
        ref: _ref,
      );
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.home,
        (route) => false,
      );
    } catch (e) {
      Navigator.pop(context);
      showAlertDialog(context: context, message: e.toString());
    }
  }
}
