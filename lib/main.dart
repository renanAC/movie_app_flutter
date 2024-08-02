import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/features/home/presentation/home.dart';
import 'package:my_flutter_app/features/movies/presentation/providers/movies_provider.dart';
import 'package:my_flutter_app/infrastructure/provider/infra_provider.dart';
import 'package:my_flutter_app/infrastructure/services/secrets/secrets.dart';
import 'package:my_flutter_app/infrastructure/services/secrets/secrets_impl.dart';
import 'package:my_flutter_app/design_system/tokens/tokens_provider.dart';

void main() {
  final Secrets secrets = SecretsImpl();

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await secrets.init();
    runApp(MyApp(secrets: secrets));
  }, (_, __) {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.secrets});
  final Secrets secrets;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CinePhills',
      scrollBehavior: MyCustomScrollBehavior(),
      home: TokensProvider(
        child: InfraProvider(
          secrets: secrets,
          child: const MoviesProvider(
            child: Home(),
          ),
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
