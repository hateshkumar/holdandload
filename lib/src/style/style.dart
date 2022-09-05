import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Style {
  Size outerSize;
  Size innerSize;
  Color outerColor;
  Color progressColor;
  double progressWidth;
  double outerWidth;

  Color? backgroundColor;
  Gradient? gradient;

  Style({required this.outerSize,required this.innerSize,required this.outerColor, required this.progressColor,required this.progressWidth,required this.outerWidth, this.backgroundColor,
    this.gradient});

  Style.withGradientColor({required this.outerSize,required this.innerSize,required this.outerColor, required this.progressColor,required this.outerWidth,required this.progressWidth,
    this.gradient});

  Style.withBackgroundColor({required this.outerSize,required this.innerSize,required this.outerColor, required this.progressColor,required this.progressWidth,required this.outerWidth, this.backgroundColor, });
}


