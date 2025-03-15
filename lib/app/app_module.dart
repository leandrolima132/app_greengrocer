import 'package:flutter_modular/flutter_modular.dart';
import 'package:greengrocer/app/modules/base/base_module.dart';
import 'package:greengrocer/app/modules/sign-in/sign_in_module.dart';
import 'package:greengrocer/app/modules/sign-up/sign_up_module.dart';

import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // Adicione aqui binds globais, como serviços HTTP, cache, etc.
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/splash/', module: SplashModule()),
        ModuleRoute('/base/', module: BaseModule()),
        ModuleRoute('/sign-in/', module: SignInModule()),
        ModuleRoute('/sign-up/', module: SignUpModule()),
        RedirectRoute('/', to: '/splash/'),
      ];
}
