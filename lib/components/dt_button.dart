import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DTButton extends StatelessWidget {
  String? label;
  Function onClick;
  final bool disabled;
  final bool loading;
  final double borderRadius;
  Widget? prefixIcon;
  final double height;
  final Color buttonColor;
  final Color textColor;
  FontWeight? textFont;
  final double width;
  final Widget? icon;
  final bool isOutlined;
  final Color? borderColor;
  TextAlign? textAlign;
  final double? textSize;
  final Widget? image;
  final SvgPicture? svgImage;
  final double? svgImageHeight;
  final double? svgImageWidth;

  Gradient? gradient;

  DTButton(
      {Key? key,
        this.label,
        required this.onClick,
        this.textAlign,
        this.icon,
        this.textSize,
        this.prefixIcon,
        this.disabled = false,
        this.loading = false,
        this.width = double.infinity,
        this.borderRadius = 10,
        this.height = 60,
        this.buttonColor = Colors.blue,
        this.textColor = Colors.white,
        this.textFont,
        this.gradient,
        this.borderColor,
        this.image,
        this.svgImage,
        this.svgImageHeight,
        this.svgImageWidth,
        this.isOutlined = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: (disabled || loading) ? 0.6 : 1,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: gradient,
            color: isOutlined ? Colors.transparent : buttonColor,
            border: isOutlined
                ? Border.all(
              width: 2,
            )
                : null),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (disabled || loading)
                ? null
                : () {
              if (null != this.onClick) {
                this.onClick();
              }
            },
            child: Container(
                alignment: Alignment.center,
                height: height,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (null != this.icon)
                      Padding(
                          padding: EdgeInsets.only(left: 82, right: 5),
                          child: icon),
                    if (null != this.svgImage)
                      SizedBox(
                        width: svgImageWidth,
                        height: svgImageHeight,
                        child: svgImage, // Show the SVG image
                      ),
                    Expanded(
                      child: Text(
                        this.label ?? "Button",
                        style: TextStyle(
                          color: textColor,
                          fontWeight: textFont,
                          fontSize: textSize,
                        ),
                        textAlign: textAlign,
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
