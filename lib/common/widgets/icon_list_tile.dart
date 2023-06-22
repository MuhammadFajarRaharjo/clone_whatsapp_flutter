import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/common/utils/pallets.dart';

class IconListTile extends StatelessWidget {
  const IconListTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    this.trailing,
    required this.onTap,
    this.isThreeLine = false,
    this.color,
    this.textColor,
  });
  final String title;
  final String? subtitle;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback onTap;
  final bool isThreeLine;
  final Color? color, textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title, style: TextStyle(color: textColor)),
      isThreeLine: isThreeLine,
      subtitle: subtitle != null ? Text(subtitle!) : null,
      leading: Icon(icon, color: color ?? Pallets.grey),
      trailing: trailing,
    );
  }
}
