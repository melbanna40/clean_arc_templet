import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_app/core/easy_loading_config.dart';
import 'package:posts_app/core/notifications_helper.dart';
import 'package:posts_app/layers/presentation/base/app_routes/app_router.dart';
import 'package:posts_app/layers/presentation/base/theme.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  ThemeMode themeMode = ThemeMode.light;
  final NotificationsHelper mNotificationSettings = NotificationsHelper();

  @override
  void initState() {
    EasyLoadingConfig.configLoading();
    mNotificationSettings.registerNotification(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const theme = CustomTheme();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp.router(
        builder: EasyLoading.init(
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
        ),
        themeMode: themeMode,
        theme: theme.toThemeData(),
        darkTheme: theme.toThemeDataDark(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: AppRouterSingleton().appRouter.config(),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // _Helpers
  // ---------------------------------------------------------------------------
  bool get useLightMode {
    switch (themeMode) {
      case ThemeMode.system:
        return View.of(context).platformDispatcher.platformBrightness ==
            Brightness.light;
      case ThemeMode.light:
        return true;
      case ThemeMode.dark:
        return false;
    }
  }

  void handleBrightnessChange({bool? useLightMode = false}) {
    setState(() {
      themeMode = useLightMode! ? ThemeMode.light : ThemeMode.dark;
    });
  }
}
