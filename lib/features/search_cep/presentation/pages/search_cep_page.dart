import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:search_cep/core/formatters/input_formatters.dart';

import '../../../../ds/ds.dart';
import '../../../features.dart';

class SearchCepPage extends StatelessWidget {
  const SearchCepPage({super.key});

  static const routeName = 'SearchCepPage';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCepCubit, SearchCepState>(
      listener: (context, state) {
        var address = state.addressEntity;

        if (state.status == SearchCepStatus.success && state.navigateTo == ResultCepPage.routeName) {
          context.pushNamed(state.navigateTo!, extra: address);
        }

        if (state.status == SearchCepStatus.error && state.error != null) {
          showGenericDialog(
            context: context,
            icon: Icons.error_outline,
            title: 'Ops!',
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(state.error?.userMessage ?? 'N/I', textAlign: TextAlign.center, style: context.fontStyle.titleMedium),
                SizedBox(height: 8),
                Text(state.error?.message ?? 'Verifique se digitou corretamente.', textAlign: TextAlign.center, style: context.fontStyle.bodyLarge),
              ],
            ),
            buttonText: 'Fechar',
          );
        }
      },
      builder: (context, state) {
        return switch (state.status) {
          SearchCepStatus.loading => DsLoadinComponent(),
          _ => _CepSearchPage(),
        };
      },
    );
  }
}

class _CepSearchPage extends StatefulWidget {
  const _CepSearchPage();

  @override
  State<_CepSearchPage> createState() => _CepSearchPageState();
}

class _CepSearchPageState extends State<_CepSearchPage> {
  final FocusNode cepFocusNode = FocusNode();

  @override
  void dispose() {
    cepFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCepCubit>();
    return Scaffold(
      appBar: DsAppBarComponent(),
      bottomNavigationBar: DsSearchCorreiosFooter(),

      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.spacing.spacing2XL.width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: context.spacing.spacing2XL.height),
                Text('Search CEP', style: context.fontStyle.displayLarge.copyWith(color: context.colors.aqua.primary)),
                SizedBox(height: context.spacing.spacing2XL.height),
                Text(
                  'Descubra o endereço completo digitando apenas 8 números. '
                  'Economize tempo em cadastros e formulários.',
                  textAlign: TextAlign.center,
                  style: context.fontStyle.bodyLarge,
                ),
                SizedBox(height: context.spacing.spacing3XL.height),
                Container(
                  padding: EdgeInsets.all(context.spacing.spacingLG.width),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: context.colors.neutral.lighterGray),
                  child: Row(
                    children: [
                      Icon(Icons.lightbulb_outline, size: context.spacing.spacing4XL.height, color: context.colors.aqua.primary),
                      SizedBox(width: context.spacing.spacingMD.width),
                      Flexible(child: Text('Dica: você pode digitar só números - o hífen é aplicado automaticamente.', textAlign: TextAlign.justify, style: context.fontStyle.bodyMedium)),
                    ],
                  ),
                ),
                SizedBox(height: context.spacing.spacing7XL.height),
                ReactiveForm(
                  formGroup: cubit.cepForm,
                  child: Column(
                    children: [
                      DefaultTextFieldWidget(
                        formControlName: 'cep',
                        label: "CEP",
                        hintText: "Digite o CEP",
                        keyboardType: TextInputType.number,
                        prefixIcon: Icons.map,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly, CepInputFormatter()],
                        validationMessages: {ValidationMessage.required: (error) => 'Campo obrigatório', 'cep': (error) => 'CEP inválido'},
                        focusNode: cepFocusNode,
                        onTap: (_) => cepFocusNode.requestFocus(),
                      ),
                      SizedBox(height: context.spacing.spacing2XL.height),
                      ReactiveFormConsumer(
                        builder: (context, formGroup, child) {
                          return DsButtonComponent(text: 'Pesquisar', onPressed: () async => await cubit.searchCEP(), enabled: formGroup.valid);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
