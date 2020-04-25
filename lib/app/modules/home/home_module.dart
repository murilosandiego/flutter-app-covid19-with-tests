import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'home_page.dart';
import 'repositories/covid_repository.dart';
import 'services/custom_dio_service.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => HomeController(i.get<CovidRepository>()),
        ),
        Bind((i) => CovidRepository(i.get<CustomDioService>())),
        Bind((i) => CustomDioService()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
