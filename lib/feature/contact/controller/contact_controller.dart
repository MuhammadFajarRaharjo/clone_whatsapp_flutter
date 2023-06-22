import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_flutter/common/models/user_model.dart';
import 'package:whatsapp_flutter/feature/contact/repository/contact_repository.dart';

final contactControllerProvider = FutureProvider((ref) async {
  return ref.watch(contactReposiotryProvider).getAllContacts();
});

class ContactController {
  final ContactRepository _repository;

  ContactController({required ContactRepository repository})
      : _repository = repository;

  Future<List<List<UserModel>>> getAllContacts() {
    return _repository.getAllContacts();
  }
}
