import 'package:freezed_annotation/freezed_annotation.dart';

part 'last_message_model.freezed.dart';
part 'last_message_model.g.dart';

@freezed
class LastMessageModel with _$LastMessageModel {
  factory LastMessageModel({
    required String username,
    required String profileUrl,
    required String contactId,
    required String lastMessage,
    required DateTime timeSent,
  }) = _LastMessageModel;

  factory LastMessageModel.fromJson(Map<String, dynamic> json) =>
      _$LastMessageModelFromJson(json);
}
