import 'package:flutter_modular/flutter_modular.dart';

import '../shared/helpers/api_dio_helper.dart';
import 'home_controller.dart';
import 'home_page.dart';
import 'repositories/covid_repository.dart';
import 'repositories/covid_repository_interface.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<ICovidRepository>())),
        Bind<ICovidRepository>((i) => CovidRepository(i.get<APIDioHelper>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
