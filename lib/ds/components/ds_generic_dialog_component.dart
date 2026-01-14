import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:search_cep/ds/ds.dart';

Future<T?> showGenericDialog<T>({required BuildContext context, required String title, required Widget content, String? buttonText, VoidCallback? onCancel, IconData? icon}) {
  return showDialog<T>(context: context, barrierDismissible: false, builder: (_) => DsGenericDialogComponent(title: title, content: content, buttonText: buttonText, icon: icon));
}

class DsGenericDialogComponent extends StatelessWidget {
  final String title;
  final Widget content;
  final String? buttonText;
  final VoidCallback? onConfirm;
  final IconData? icon;

  const DsGenericDialogComponent({super.key, required this.title, required this.content, this.buttonText, this.onConfirm, this.icon});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.spacing.spacingXL.height)),
      child: Padding(
        padding: EdgeInsets.all(context.spacing.spacing3XL.height),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: context.spacing.spacing6XL.height, color: context.colors.feedback.error),
            SizedBox(height: context.spacing.spacingLG.height),
            Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.spacing.spacing2XL.height),
            content,
            SizedBox(height: context.spacing.spacing4XL.height),
            DsButtonComponent(text: buttonText ?? 'Ok', onPressed: context.pop),
            SizedBox(height: context.spacing.spacingMD.height),
          ],
        ),
      ),
    );
  }
}
