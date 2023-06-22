import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:whatsapp_flutter/common/models/message_model.dart';
import 'package:whatsapp_flutter/common/models/user_model.dart';
import 'package:whatsapp_flutter/common/providers/firebase_provider.dart';

import '../../../common/enum/message_type.dart';
import '../../../common/models/last_message_model.dart';
import '../../../constants/firebase_constant.dart';

final chatRepositoryProvider = Provider((ref) {
  return ChatRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
  );
});

class ChatRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  ChatRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  })  : _firestore = firestore,
        _auth = auth;

  Stream<List<MessageModel>> getAllOneToOneMessage(String reciverId) {
    try {
      return _firestore
          .collection(FirebaseConstant.users)
          .doc(_auth.currentUser!.uid)
          .collection(FirebaseConstant.chats)
          .doc(reciverId)
          .collection(FirebaseConstant.messages)
          .orderBy('timeSent')
          .snapshots()
          .map(
        (event) {
          List<MessageModel> messages = [];
          for (var message in event.docs) {
            messages.add(MessageModel.fromJson(message.data()));
          }
          return messages;
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<LastMessageModel>> getAllLastMessageList() {
    return _firestore
        .collection(FirebaseConstant.users)
        .doc(_auth.currentUser!.uid)
        .collection(FirebaseConstant.chats)
        .snapshots()
        .asyncMap((event) async {
      List<LastMessageModel> contacts = [];
      for (var doc in event.docs) {
        final lastMessage = LastMessageModel.fromJson(doc.data());
        final userDoc = await _firestore
            .collection(FirebaseConstant.users)
            .doc(lastMessage.contactId)
            .get();
        final user = UserModel.fromJson(userDoc.data()!);

        contacts.add(
          LastMessageModel(
            username: user.name,
            profileUrl: user.profileImageUrl,
            contactId: lastMessage.contactId,
            lastMessage: lastMessage.lastMessage,
            timeSent: lastMessage.timeSent,
          ),
        );
      }
      return contacts;
    });
  }

  Future<void> sendTextMessage({
    required String textMessage,
    required String reciverId,
    required UserModel sender,
  }) async {
    try {
      final timeSent = DateTime.now();
      final reciverSnapshot = await _firestore
          .collection(FirebaseConstant.users)
          .doc(reciverId)
          .get();
      final reciver = UserModel.fromJson(reciverSnapshot.data()!);
      final textMessageId = const Uuid().v1();

      _saveToMessageCollection(
        reciverId: reciverId,
        senderId: sender.uid,
        textMessage: textMessage,
        textMessageId: textMessageId,
        senderUsername: sender.name,
        reciverUsername: reciver.name,
        timeSent: timeSent,
        messageType: MessageType.text,
      );

      _saveAsLastMessage(
        sender: sender,
        reciver: reciver,
        lastMessage: textMessage,
        timeSent: timeSent,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _saveToMessageCollection({
    required String reciverId,
    required String senderId,
    required String textMessage,
    required String textMessageId,
    required String senderUsername,
    required String reciverUsername,
    required DateTime timeSent,
    required MessageType messageType,
  }) async {
    final message = MessageModel(
      senderId: senderId,
      reciverId: reciverId,
      textMessage: textMessage,
      messageType: messageType,
      timeSent: timeSent.millisecondsSinceEpoch,
      messageId: textMessageId,
      isSeen: false,
    );

    // sender
    await _firestore
        .collection(FirebaseConstant.users)
        .doc(senderId)
        .collection(FirebaseConstant.chats)
        .doc(reciverId)
        .collection(FirebaseConstant.messages)
        .doc(textMessageId)
        .set(message.toJson());

    // reciver
    await _firestore
        .collection(FirebaseConstant.users)
        .doc(reciverId)
        .collection(FirebaseConstant.chats)
        .doc(senderId)
        .collection(FirebaseConstant.messages)
        .doc(textMessageId)
        .set(message.toJson());
  }

  Future<void> _saveAsLastMessage({
    required UserModel sender,
    required UserModel reciver,
    required String lastMessage,
    required DateTime timeSent,
  }) async {
    final reciverLastMessage = LastMessageModel(
      username: sender.name,
      contactId: sender.uid,
      profileUrl: sender.profileImageUrl,
      lastMessage: lastMessage,
      timeSent: timeSent,
    );

    await _firestore
        .collection(FirebaseConstant.users)
        .doc(reciver.uid)
        .collection(FirebaseConstant.chats)
        .doc(sender.uid)
        .set(reciverLastMessage.toJson());

    final senderLastMessage = LastMessageModel(
      username: reciver.name,
      contactId: reciver.uid,
      profileUrl: reciver.profileImageUrl,
      lastMessage: lastMessage,
      timeSent: timeSent,
    );

    await _firestore
        .collection(FirebaseConstant.users)
        .doc(sender.uid)
        .collection(FirebaseConstant.chats)
        .doc(reciver.uid)
        .set(senderLastMessage.toJson());
  }
}
