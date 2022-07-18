import 'package:flutter/material.dart';

import '../utils/tools.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget ?icon;
  final List<Widget>? actions;
  const CommonAppBar({Key? key,required this.title,  this.icon, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: icon,
      title:  Text(
        title,
        style:  TextStyle(fontSize:Tools.isTablet(context)?32: 18, fontWeight: FontWeight.w700),
      ),
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight
  );
}
