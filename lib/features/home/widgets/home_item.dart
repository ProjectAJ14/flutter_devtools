import 'package:flutter/material.dart';

class HomeItem {
  final String title;
  final IconData icon;
  final GestureTapCallback? onTap;

  HomeItem({
    required this.title,
    required this.icon,
    this.onTap,
  });
}

class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({
    super.key,
    required this.item,
  });

  final HomeItem item;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: item.title,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        tileColor: Colors.green[50],
        leading: Icon(item.icon),
        title: Text(item.title),
        onTap: item.onTap,
      ),
    );
  }
}
