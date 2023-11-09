import 'package:cloud_walk_test/app/app_navigations.dart';
import 'package:cloud_walk_test/generated/l10n.dart';
import 'package:cloud_walk_test/navigation/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

class CloudWalkApplication extends StatelessWidget {
  const CloudWalkApplication({super.key});
  static final GoRouter goRouter = GoRouter(
    initialLocation: AppRouter.location.path,
    routes: AppNavigations.listOfNavigation,
    debugLogDiagnostics: true,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => CloudS.of(context).title,
      routerConfig: goRouter,
      localizationsDelegates: const [
        CloudS.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: CloudS.delegate.supportedLocales,
    );
  }
}
