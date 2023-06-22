import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_flutter/common/models/user_model.dart';
import 'package:whatsapp_flutter/common/providers/firebase_provider.dart';

import '../../../constants/firebase_constant.dart';

final contactReposiotryProvider = Provider((ref) {
  return ContactRepository(firestore: ref.read(firestoreProvider));
});

class ContactRepository {
  final FirebaseFirestore _firestore;

  ContactRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  Future<List<List<UserModel>>> getAllContacts() async {
    List<UserModel> firebaseContacts = [];
    List<UserModel> phoneContacts = [];

    try {
      if (await FlutterContacts.requestPermission()) {
        final userCollection =
            await _firestore.collection(FirebaseConstant.users).get();
        final contactsPhone = await FlutterContacts.getContacts(
          withProperties: true,
          withPhoto: true,
        );

        bool isContactFound = false;

        for (var contact in contactsPhone) {
          for (var firebaseContanctData in userCollection.docs) {
            if (contact.phones.isNotEmpty) {
              final firebaseContact =
                  UserModel.fromJson(firebaseContanctData.data());
              final phoneNumber = contact.phones[0].number
                  .replaceAll(' ', '')
                  .replaceAll('-', '');
              if (phoneNumber == firebaseContact.phoneNumber) {
                firebaseContacts.add(firebaseContact);
                isContactFound = true;
                break;
              }
            }
          }

          if (!isContactFound && contact.phones.isNotEmpty) {
            phoneContacts.add(
              UserModel(
                name: contact.displayName,
                uid: '',
                phoneNumber: contact.phones[0].number,
                profileImageUrl: '',
                status: '',
                active: false,
                lastSeen: 0,
                groupId: [],
              ),
            );
          }
          isContactFound = false;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return [firebaseContacts, phoneContacts];
  }
}
