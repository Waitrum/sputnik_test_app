import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sputnik_test_app/services/constans.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final String? iconPath;
  final double? height;
  final double? width;
  final double? fontSize;
  final bool disable;
  const MainButton({
    Key? key,
    required this.text,
    this.onTap,
    this.iconPath,
    this.height = 58,
    this.width,
    this.fontSize = 17,
    this.disable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disable ? null : onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: disable ? ProjectColors.disableBackground : null,
          gradient: disable
              ? null
              : LinearGradient(
                  colors: ProjectColors.buttonGradient,
                ),
        ),
        child: Row(
          mainAxisAlignment: iconPath == null
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceAround,
          children: [
            if (iconPath != null) SvgPicture.asset(iconPath!),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
