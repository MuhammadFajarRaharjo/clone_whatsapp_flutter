import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_flutter/common/helpers/show_alert_dialog.dart';
import 'package:whatsapp_flutter/feature/auth/controller/auth_controller.dart';
import 'package:whatsapp_flutter/feature/chat/repository/chat_repository.dart';

import '../../../common/models/last_message_model.dart';
import '../../../common/models/message_model.dart';

final chatControllerProvider = Provider((ref) {
  return ChatController(repository: ref.read(chatRepositoryProvider), ref: ref);
});

final allLastMessageProvider = StreamProvider<List<LastMessageModel>>((ref) {
  return ref.watch(chatControllerProvider).getAllLastMessageList();
});

final getAllOneToOneMessageProvider =
    StreamProvider.family<List<MessageModel>, String>((ref, reciverId) {
  return ref.watch(chatControllerProvider).getAllOneToOneMessage(reciverId);
});

class ChatController {
  final ChatRepository _repository;
  final ProviderRef _ref;

  ChatController({
    required ChatRepository repository,
    required ProviderRef ref,
  })  : _repository = repository,
        _ref = ref;

  Stream<List<MessageModel>> getAllOneToOneMessage(String reciverId) {
    return _repository.getAllOneToOneMessage(reciverId);
  }

  Stream<List<LastMessageModel>> getAllLastMessageList() {
    return _repository.getAllLastMessageList();
  }

  void sendTextMessage({
    required String textMessage,
    required String reciverId,
    required BuildContext context,
  }) {
    try {
      _ref.read(getCurrentUserProvider).whenData(
        (user) {
          return _repository.sendTextMessage(
            textMessage: textMessage,
            reciverId: reciverId,
            sender: user!,
          );
        },
      );
    } catch (e) {
      showAlertDialog(context: context, message: e.toString());
    }
  }
}
