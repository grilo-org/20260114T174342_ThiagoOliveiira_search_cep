import 'package:reactive_forms/reactive_forms.dart';

FormGroup buildCEPForm() => fb.group({
  'cep': FormControl<String>(validators: [Validators.required, CepValidator()]),
});

class CepValidator extends Validator<dynamic> {
  const CepValidator() : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final raw = control.value;
    if (raw == null || raw.toString().trim().isEmpty) return null;

    final value = raw.toString().replaceAll(RegExp(r'[^0-9]'), '');
    if (value.length != 8) {
      return {'cep': true};
    }

    return null;
  }
}
