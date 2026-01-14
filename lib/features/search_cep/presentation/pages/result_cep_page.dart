import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/core.dart';
import '../../../../ds/ds.dart';
import '../../../features.dart';

class ResultCepPage extends StatelessWidget {
  const ResultCepPage({super.key, required this.cepResultEntity});

  static const routeName = 'ResultCepPage';
  final CepResultEntity? cepResultEntity;

  String buildConsultedText() {
    final now = DateTime.now();
    final formatted = DateFormat('dd/MM/yyyy').format(now);
    return cepResultEntity?.fromCache == true ? "Exibindo informações salvas em pesquisas anteriores." : 'Dados consultados em $formatted via API ViaCEP.';
  }

  @override
  Widget build(BuildContext context) {
    AddressEntity? address = cepResultEntity?.addressEntity;
    bool? fromCache = cepResultEntity?.fromCache;

    String cep = CepFormatter.format(address?.cep ?? '');
    return Scaffold(
      appBar: DsAppBarComponent(showIconButton: false, showBackButton: true),
      bottomNavigationBar: SafeArea(child: Text(buildConsultedText(), textAlign: TextAlign.center, style: context.fontStyle.label.copyWith(fontWeight: FontWeight.w600))),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.spacing.spacing2XL.width),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: context.spacing.spacing2XL.height),
              Text('Aqui estão os detalhes do seu CEP', style: context.fontStyle.titleMedium),
              SizedBox(height: context.spacing.spacingXL.height),
              Text(fromCache == true ? 'Resultado recuperado do histórico local.' : ' Esses dados são fornecidos pela base do ViaCEP.', textAlign: TextAlign.center, style: context.fontStyle.bodyLarge),
              SizedBox(height: context.spacing.spacing5XL.height),
              Text('O CEP $cep, corresponde, a ${address?.logradouro}, bairro ${address?.bairro}, ${address?.localidade}/${address?.uf}.', textAlign: TextAlign.center, style: context.fontStyle.bodyLarge),
              SizedBox(height: context.spacing.spacing3XL.height),
              Text('Detalhes', style: context.fontStyle.titleMedium),
              Divider(thickness: 3, color: context.colors.aqua.dark),
              SizedBox(height: context.spacing.spacing2XL.height),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DsItemResultComponent(type: 'CEP', description: cep),
                  DsItemResultComponent(type: 'Cidade', description: address?.localidade),
                  DsItemResultComponent(type: 'Estado', description: address?.estado),
                  DsItemResultComponent(type: 'UF', description: address?.uf),
                  DsItemResultComponent(type: 'Região', description: address?.regiao),
                  DsItemResultComponent(type: 'Logradouro', description: address?.logradouro),
                  DsItemResultComponent(type: 'Complemento', description: address?.complemento),
                  DsItemResultComponent(type: 'DDD', description: address?.ddd),
                  DsItemResultComponent(type: 'IBGE', description: address?.ibge),
                  DsItemResultComponent(type: 'SIAFI', description: address?.siafi),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
