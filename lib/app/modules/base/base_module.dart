import 'package:flutter_modular/flutter_modular.dart';
import 'package:greengrocer/app/modules/base/base_controller.dart';
import 'package:greengrocer/app/modules/base/base_page.dart';

class BaseModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => BaseController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => BasePage()),
      ];
}
