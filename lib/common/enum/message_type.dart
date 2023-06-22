enum MessageType {
  text("text"),
  audio("audio"),
  image("image"),
  video("video"),
  gift("gift");

  final String type;

  const MessageType(this.type);
}

extension ConvertMessage on String {
  MessageType toEnum() {
    switch (this) {
      case "text":
        return MessageType.text;
      case "audio":
        return MessageType.audio;
      case "image":
        return MessageType.image;
      case "video":
        return MessageType.video;
      case "gift":
        return MessageType.gift;
      default:
        return MessageType.text;
    }
  }
}
