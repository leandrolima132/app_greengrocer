import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

abstract class MasksConstants {
  // CPF: 123.456.789-10
  static final MaskTextInputFormatter cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  // Telefone: (99) 99999-9999
  static final MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  // CEP: 12345-678
  static final MaskTextInputFormatter cepFormatter = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {'#': RegExp(r'[0-9]')},
  );

  // Data: 31/12/2023
  static final MaskTextInputFormatter dateFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {'#': RegExp(r'[0-9]')},
  );
}
