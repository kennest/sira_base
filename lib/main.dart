import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sira_base/pages/auth/login_page.dart';
import 'package:sira_base/pages/dashboard/dashboard_page.dart';
import 'package:get_it/get_it.dart';
import 'package:sira_base/services/auth_service.dart';
import 'package:sira_base/services/data_service.dart';
import 'package:sira_base/utilities/dio_instance.dart';

final getIt = GetIt.instance;

setup() {
  getIt.registerSingleton<DataService>(DataService());
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<DioInstance>(DioInstance());
}

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget? _getPageWidget(RouteSettings settings) {
    if (settings.name == null) {
      return null;
    }
    final uri = Uri.parse(settings.name!);
    switch (uri.path) {
      case '/':
        return const LoginPage();
      case '/dashboard':
        return const DashBoardPage();
      case '/secondLevelItem2':
        return DashBoardPage();
      case '/thirdLevelItem1':
        return DashBoardPage();
      case '/thirdLevelItem2':
        return DashBoardPage();
    }
    return null;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SIRA BASE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // useMaterial3: true,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.macOS: ZoomPageTransitionsBuilder(),
        }),
      ),
      onGenerateRoute: (settings) {
        final page = _getPageWidget(settings);
        if (page != null) {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => page,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(
                  opacity: anim,
                  child: child,
                );
              });
        }
        return null;
      },
    );
  }
}
