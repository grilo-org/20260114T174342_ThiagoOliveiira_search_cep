import 'package:flutter/material.dart';
import 'package:search_cep/ds/ds.dart';

class DsLoadinComponent extends StatelessWidget {
  const DsLoadinComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).brightness == Brightness.dark ? context.colors.neutral.lightGray : context.colors.neutral.frostWhite,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator(color: context.colors.aqua.dark), SizedBox(height: context.spacing.spacingLG.height), Text('Aguarde...', style: context.fontStyle.bodyLarge)],
        ),
      ),
    );
  }
}
