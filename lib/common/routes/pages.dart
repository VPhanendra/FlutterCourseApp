import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fultter_courseapp/common/routes/names.dart';
import 'package:fultter_courseapp/global.dart';
import 'package:fultter_courseapp/pages/application/application_page.dart';
import 'package:fultter_courseapp/pages/application/bloc/app_blocs.dart';
import 'package:fultter_courseapp/pages/home/bloc/home_page_blocs.dart';
import 'package:fultter_courseapp/pages/home/home_page.dart';
import 'package:fultter_courseapp/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:fultter_courseapp/pages/profile/settings/settings_page.dart';
import 'package:fultter_courseapp/pages/register/bloc/register_blocs.dart';
import 'package:fultter_courseapp/pages/register/register.dart';
import 'package:fultter_courseapp/pages/sign_in/bloc/sign_in_bolcs.dart';
import 'package:fultter_courseapp/pages/sign_in/sign_in.dart';
import 'package:fultter_courseapp/pages/welcome/blocs/welcome_blocs.dart';
import 'package:fultter_courseapp/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return  [
      PageEntity(route: AppRoutes.INITIAL,
          page: Welcome(),
          bloc: BlocProvider(create: (_) => WelcomeBloc(),)
      ),
      PageEntity(route: AppRoutes.SIGN_IN,
          page: SignIn(),
          bloc: BlocProvider(create: (_) => SignInBloc(),)
      ),
      PageEntity(route: AppRoutes.REGISTER,
          page: Register(),
          bloc: BlocProvider(create: (_) => RegisterBlocs(),)
      ),
      PageEntity(route: AppRoutes.APPLICATION,
        page: ApplicationPage(),
        bloc: BlocProvider(create: (_)=>AppBlocs(),)
      ),
      PageEntity(route: AppRoutes.HOME_PAGE,
          page: HomePage(),
          bloc: BlocProvider(create: (_)=>HomePageBlocs(),)
      ),
      PageEntity(route: AppRoutes.SETTINGS,
          page: SettingsPage(),
          bloc: BlocProvider(create: (_)=>SettingsBlocs(),)
      ),

    ];
  }
//return all allBlocProviders
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()){
      blocProviders.add(bloc.bloc);

    }
    return blocProviders;
  }
  // a model that covers entire screen as we click navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings){
    if(settings.name!=null){
      // check for route name matching when navigator when triggered.
      var result = routes().where((element) => element.route==settings.name);
      if(result.isNotEmpty){
        // print("valid route name ${settings.name}");
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if(result.first.route == AppRoutes.INITIAL&& deviceFirstOpen){
          print("second");
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if(isLoggedIn){
            return MaterialPageRoute(builder: (_)=> ApplicationPage(),settings: settings);
          }
          return MaterialPageRoute(builder: (_)=>SignIn(),settings: settings);
        }
        return MaterialPageRoute(builder: (_)=>result.first.page,settings: settings);
      }
    }
    print("invalid route name ${settings.name}");
    return MaterialPageRoute(builder: (_)=>SignIn(),settings: settings);
  }
}
//unify BlocProvider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({ required this.route,required this.page, this.bloc});
}
