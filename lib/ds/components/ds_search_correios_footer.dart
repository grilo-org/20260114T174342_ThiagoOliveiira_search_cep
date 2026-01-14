import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:search_cep/ds/ds.dart';
import 'package:url_launcher/url_launcher.dart';

class DsSearchCorreiosFooter extends StatelessWidget {
  const DsSearchCorreiosFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: context.spacing.spacingSM.width,
        children: [
          Icon(Icons.help_outline, size: context.spacing.spacing3XL.height, color: context.colors.neutral.utilityGray),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Não sabe seu CEP? '),
                TextSpan(
                  text: 'Consulte os Correios',
                  style: context.fontStyle.bodyMedium.copyWith(color: context.colors.aqua.dark, fontWeight: FontWeight.w600),
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap = () async {
                          final url = Uri.parse('https://buscacepinter.correios.com.br/app/endereco/index.php');
                          if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                ),
              ],
            ),
            style: context.fontStyle.bodyMedium.copyWith(color: context.colors.neutral.utilityGray),
          ),
        ],
      ),
    );
  }
}
