import 'package:flutter/material.dart';
import 'package:search_cep/ds/ds.dart';

class DsButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool enabled;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final IconData? icon;

  const DsButtonComponent({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = isLoading || !enabled;
    final Color activeColor = context.colors.teal.dark;
    final Color inactiveColor = context.colors.neutral.lighterGray;
    final Color fgColor = textColor ?? context.colors.neutral.white.withValues(alpha: isDisabled ? 0.2 : null);

    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: activeColor,
          foregroundColor: fgColor,
          disabledBackgroundColor: inactiveColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.spacing.spacingLG.height)),
          padding: EdgeInsets.symmetric(horizontal: context.spacing.spacingXL.width, vertical: context.spacing.spacingXL.height),
        ),
        onPressed: isDisabled ? null : onPressed,
        child:
            isLoading
                ? SizedBox(width: context.spacing.spacing2XL.width, height: context.spacing.spacing2XL.height, child: CircularProgressIndicator(strokeWidth: 2, color: fgColor))
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[Icon(icon, size: context.spacing.spacingXL.height, color: fgColor), SizedBox(width: 8)],
                    Text(text, style: context.fontStyle.titleMedium),
                  ],
                ),
      ),
    );
  }
}
