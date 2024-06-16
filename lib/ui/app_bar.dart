import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      title: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
