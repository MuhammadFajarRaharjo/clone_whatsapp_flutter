import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/firebase_provider.dart';

final firebaseStorageRepositoryProvider = Provider((ref) {
  return FirebaseStorageRepository(storage: ref.read(storageProvider));
});

class FirebaseStorageRepository {
  final FirebaseStorage _storage;

  FirebaseStorageRepository({required FirebaseStorage storage})
      : _storage = storage;

  Future<String> storeFileToStorage(String ref, String child, var file) async {
    UploadTask? uploadTask;

    if (file is File) {
      uploadTask = _storage.ref().child(ref).child(child).putFile(file);
    }
    if (file is Uint8List) {
      uploadTask = _storage.ref().child(ref).child(child).putData(file);
    }

    final snapshot = await uploadTask!;
    return await snapshot.ref.getDownloadURL();
  }
}
