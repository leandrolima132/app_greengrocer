import 'package:flutter_modular/flutter_modular.dart';
import 'package:greengrocer/app/modules/sign-up/sign_up_page.dart';

class SignUpModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => SignUpPage()),
      ];
}
