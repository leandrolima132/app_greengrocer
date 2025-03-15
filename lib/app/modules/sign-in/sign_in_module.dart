import 'package:flutter_modular/flutter_modular.dart';
import 'package:greengrocer/app/modules/sign-in/sign_in_page.dart';

class SignInModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const SignInPage()),
      ];
}
