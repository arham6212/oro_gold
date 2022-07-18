import 'package:flutter/material.dart';
import 'package:oro_gold/themes/app_colors.dart';

import '../utils/tools.dart';

class CommonButton extends StatelessWidget {
  final double? width;
  final String text;
  final IconData? icon;
  final VoidCallback callback;
  final double ?height;
  final Color ?color;
  const CommonButton({Key? key, this.width, required this.text, this.icon, required this.callback, this.height, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: height??(Tools.isTablet(context)?55:36),
        width: width ?? MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              AppColors.buttonGradient1,
              AppColors.buttonGradient2,
            ],
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.16),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style:  TextStyle(fontSize: Tools.isTablet(context)?22:14,fontWeight: FontWeight.w700),),
            icon==null?const Offstage():Icon(icon)
          ],
        ),
      ),
    );
  }
}
