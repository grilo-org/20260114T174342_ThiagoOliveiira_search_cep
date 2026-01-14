import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:search_cep/ds/themes/app_theme_context.dart';

class DefaultTextFieldWidget extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? formControlName;
  final Function(FormControl<dynamic>)? onTap;
  final Map<String, String Function(Object)>? validationMessages;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final String? helperText;
  final int? maxLength;

  const DefaultTextFieldWidget({
    super.key,
    required this.label,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.helperText,
    this.suffixIcon,
    this.onChanged,
    this.formControlName,
    this.validator,
    this.validationMessages,
    this.onTap,
    this.inputFormatters,
    this.focusNode,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReactiveTextField<dynamic>(
          formControlName: formControlName,
          focusNode: focusNode,
          onTap: onTap,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
            contentPadding: EdgeInsets.symmetric(horizontal: context.spacing.spacingXL.width, vertical: context.spacing.spacingXL.height),
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            helperText: helperText,
          ),
          style: context.fontStyle.titleMedium.copyWith(fontWeight: FontWeight.normal),
          validationMessages: validationMessages ?? {ValidationMessage.required: (error) => 'Este campo é obrigatório'},
          showErrors: (control) => control.invalid && control.dirty,
        ),
      ],
    );
  }
}
