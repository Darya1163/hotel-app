import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomNavigationBar(
      {super.key, required this.child, this.height = kToolbarHeight});

  final Widget child;
  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Colors.transparent,
      child: child,
    );
  }
  
}

AppBar buildMainAppBar(String title, [Widget? child]) {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(title),
    leading: child,
  );
}
