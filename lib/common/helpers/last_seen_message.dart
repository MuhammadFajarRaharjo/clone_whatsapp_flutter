String lastSeenMessage(int lastSeen) {
  final now = DateTime.now();
  final differenceDurration =
      now.difference(DateTime.fromMillisecondsSinceEpoch(lastSeen));

  if (differenceDurration.inSeconds < 60) {
    return 'few moments';
  } else if (differenceDurration.inMinutes < 60) {
    return "${differenceDurration.inMinutes} ${differenceDurration.inMinutes == 1 ? 'minute' : 'minutes'} ago";
  } else if (differenceDurration.inHours < 24) {
    return "${differenceDurration.inHours} ${differenceDurration.inHours == 1 ? 'hour' : 'hours'} ago";
  } else {
    return "${differenceDurration.inDays} ${differenceDurration.inDays == 1 ? 'day' : 'days'} ago";
  }
  // return message;
}
