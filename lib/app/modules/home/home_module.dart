import 'package:covid_19/app/modules/home/repositories/covid_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'home_page.dart';
import 'repositories/covid_repository.dart';
import 'services/custom_dio_service.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<ICovidRepository>())),
        Bind<ICovidRepository>((i) => CovidRepository(i.get())),
        Bind((i) => CustomDioService()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
