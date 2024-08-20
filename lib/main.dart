import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/firebase_options.dart';
import 'package:to_do_app/providers/cache_current_user_provider.dart';
import 'package:to_do_app/providers/theme_mode_provider.dart';
import 'package:to_do_app/screens/edit_task_screen.dart';
import 'package:to_do_app/screens/home_screen.dart';
import 'package:to_do_app/screens/login_screen.dart';
import 'package:to_do_app/screens/sign_up_screen.dart';
import 'package:to_do_app/screens/splash_screen.dart';
import 'package:to_do_app/theme_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeModeProvider()..getBoolValuesSF(),
          ),
          ChangeNotifierProvider(
            create: (context) => CacheCurrentUserProvider()..getuser(),
          ),
        ],
        child: EasyLocalization(
            path: 'assets/trianslations',
            supportedLocales: [Locale('en'), Locale('ar')],
            fallbackLocale: Locale('en'),
            child: const MyApp())),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var providerMode = Provider.of<ThemeModeProvider>(context);
    var provCache = Provider.of<CacheCurrentUserProvider>(context);
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      themeMode: providerMode.currentMode,
      theme: MyThemData.lightTheme,
      darkTheme: MyThemData.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: provCache.currentUser != null
          ? HomeScreen.routeName
          : SplashScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        EditTaskScreen.routeName: (context) => EditTaskScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
      },
      home: SplashScreen(),
    );
  }
}
