import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/app/logic/app_cubit.dart';
import 'package:safety_frist/app/logic/app_state.dart';
import 'package:safety_frist/core/routes/app_router.dart';
import 'package:safety_frist/core/routes/routes.dart';
import 'package:safety_frist/core/theme/light_theme.dart';
import 'package:safety_frist/generated/l10n.dart';

class SafetyFirstApp extends StatelessWidget {
  const SafetyFirstApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: MediaQuery.sizeOf(context),
            minTextAdapt: true,
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: Routes.splashScreen,
                onGenerateRoute: appRouter.generateRoute,
                theme: lightTheme,
                darkTheme: lightTheme,
                themeMode: AppCubit.get(context).getThemeMode(),
                locale: Locale('ar'),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
              );
            },
          );
        },
      ),
    );
  }
}
