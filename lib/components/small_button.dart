import 'package:flutter/material.dart';

import '../utils/tools.dart';

class SmallButton extends StatelessWidget {
  final double? width;
  final String text;
  final IconData? icon;
  final VoidCallback callback;
  final double ?height;
  final Color ?color;
  const SmallButton({Key? key, this.width, required this.text, this.icon, required this.callback, this.height, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical:Tools.isTablet(context)?6: 2),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: Text(text, style:  TextStyle(fontWeight: FontWeight.w800, fontSize:Tools.isTablet(context)?14: 8),)),
      ),
    );
  }
}
