import 'dart:async';

import 'package:default_project/domain/core/constants/app_language.dart';
import 'package:default_project/infrastructure/dependency_injection/di.dart';
import 'package:default_project/presentation/bloc/app_cubit/app_cubit.dart';
import 'package:default_project/presentation/common/localization/messages.i18n.dart';
import 'package:default_project/presentation/common/localization/messages_pl.i18n.dart';
import 'package:default_project/presentation/navigation/router.dart';
import 'package:default_project/presentation/theme/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:device_preview/device_preview.dart';

Messages messages;
main(List<String> args) {
  initApp();
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  DI.initializeDependencies();

  messages = getMessagesInstance(AppLanguage.Polish);

  // This captures errors reported by the Flutter framework.
  FlutterError.onError = (FlutterErrorDetails details) {
    if (!kReleaseMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      // Report to the application zone. After Sentry will catch it
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  runApp(
    DevicePreview(
      builder: (context) => CanaryApp(),
      enabled: !kReleaseMode,
    ),
  );
}

class CanaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AppCubit>()),
      ],
      child: Phoenix(
        child: MaterialApp(
          title: messages.application.title,
          initialRoute: AppRouter.initRoute(),
          onGenerateRoute: AppRouter.generateRoute(),
          theme: AppTheme.light(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

Messages getMessagesInstance(AppLanguage appLanguage) {
  switch (appLanguage) {
    case AppLanguage.Polish:
      return Messages_pl();
    default:
      return Messages();
  }
}
