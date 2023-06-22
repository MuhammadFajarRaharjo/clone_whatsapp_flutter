import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String uid,
    required String name,
    @Default('Tidak dapat bicara, WhatsApp saja') String status,
    required String phoneNumber,
    required String profileImageUrl,
    required int lastSeen,
    required bool active,
    required List<String> groupId,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
