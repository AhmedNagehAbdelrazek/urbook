import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/routes/app_router.dart';
import 'package:urbook/core/routes/page_route_name.dart';
import 'package:urbook/core/services/loading_service.dart';
import 'package:urbook/core/themes/application_theme_manager.dart';
import 'core/constants/constants.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('fr'),
        Locale('ru'),
      ],
      fallbackLocale: const Locale('en'),
      path: Constants.translationPath,
      child: const MyApp(),
    ),
  );
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (context, child) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'ur book',
            initialRoute: PageRouteName.initial,
            onGenerateRoute: AppRouter.onGenerateRoute,
            theme: ApplicationThemeManager.lightThemeData,
            builder: EasyLoading.init(
              builder: BotToastInit(),
            ),
          );
        });
  }
}
