import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class WidgetUtils {
  static buildInfoText({
    required String text,
    required BuildContext context,
    required Size size,
    TextAlign? textAlign,
    Color? color,
    int? maxLines,
  }) {
    return AutoSizeText(
      text,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(
            fontSize: size.width / 15,
            color: color,
          ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }

  static buildIndicatorText(
    String text,
    BuildContext context,
    Size size,
  ) {
    return AutoSizeText(
      text,
      style: Theme.of(context).textTheme.subtitle2?.copyWith(
            fontSize: size.width / 14,
          ),
    );
  }

  static buildCircularProgressIndicator(BuildContext context) {
    return CircularProgressIndicator(
      color: Theme.of(context).colorScheme.secondary,
      strokeWidth: 8,
    );
  }
}
