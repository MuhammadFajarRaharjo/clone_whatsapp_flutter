import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_flutter/common/enum/message_type.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageModel with _$MessageModel {
  factory MessageModel({
    required String senderId,
    required String reciverId,
    required String textMessage,
    required MessageType messageType,
    required int timeSent,
    required String messageId,
    @Default(false) bool isSeen,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
  // factory MessageModel.fromJson(Map<String, dynamic> json) =>
  //     _$MessageModelFromJson(json).copyWith(
  //       timeSent: DateTime.fromMillisecondsSinceEpoch(json['timeSent']),
  //     );

  // @override
  // Map<String, dynamic> toJson() =>
  //     _$$_MessageModelToJson(this as _$_MessageModel)
  //       ..['timeSent'] = timeSent.millisecondsSinceEpoch;
  // @override
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data =
  //       _$$_MessageModelToJson(this as _$_MessageModel);
  //   data['timeSent'] = timeSent.millisecondsSinceEpoch;
  //   return data;
  // }
}
