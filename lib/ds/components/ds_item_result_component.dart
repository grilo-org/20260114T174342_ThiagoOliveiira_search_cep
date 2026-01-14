import 'package:flutter/material.dart';
import 'package:search_cep/ds/ds.dart';

class DsItemResultComponent extends StatelessWidget {
  const DsItemResultComponent({super.key, required this.type, required this.description});

  final String type;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final desc = description != null && description?.isNotEmpty == true ? description : 'N/I';
    return Padding(
      padding: EdgeInsets.only(bottom: context.spacing.spacingXS.height),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("$type:", style: context.fontStyle.bodyLarge), Text(desc!, style: context.fontStyle.bodyLarge)]),
    );
  }
}
