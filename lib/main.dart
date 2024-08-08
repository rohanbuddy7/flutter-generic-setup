import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/route/routes.dart';
import 'package:flutter_boilerplate/ui/home/home_screen.dart';
import 'package:flutter_boilerplate/utils/enviroment.dart';
import 'package:flutter_boilerplate/utils/nav_key.dart';
import 'package:flutter_boilerplate/utils/state_notifiers.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import 'di/di_module.dart';

void main() {

  Environment().init(Flavour.staging);
  diSetup();

  runApp(ChangeNotifierProvider(
    create: (_) => CustomStateNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      /*overlayWidget: const Center(
          //child: Lottie.asset('assets/lottie/lf30_editor_u3eg2usa.json', height: 100),
          ),*/
      child: MaterialApp(
        //themeMode: ThemeMode.system, // Use system theme mode
        theme: ThemeData.light().copyWith(
          textTheme: Theme.of(context).textTheme.apply(
            //fontFamily: 'poppins',
          ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          textTheme: Theme.of(context).textTheme.apply(
            //fontFamily: 'poppins',
          ),
        ),
        debugShowCheckedModeBanner: Environment().config?.envFlavour == Flavour.staging,
        onGenerateRoute: Routes.generateRoute,
        initialRoute: Routes.home,
        navigatorKey: NavKey.navKey,
        onGenerateInitialRoutes: (String initialRoute) {
          return [
            MaterialPageRoute(
              settings: RouteSettings(name: initialRoute),
              builder: (BuildContext context) {
                return HomePage();
              },
            ),
          ];
        },
      ),
    );
  }
}
