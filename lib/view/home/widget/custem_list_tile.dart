import 'package:flutter/material.dart';

class CustemListTile extends StatelessWidget {
  final IconData? icon;

  final String title;
  final void Function() onTap;
  const CustemListTile(
      {Key? key, this.icon, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
