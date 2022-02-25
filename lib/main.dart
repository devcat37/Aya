// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aya/internal/application.dart';
import 'package:aya/internal/services/service_locator.dart';
import 'package:aya/internal/services/settings.dart';
import 'package:aya/internal/states/user_state/user_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Settings.
  final settings = Settings();
  service.registerSingleton<Settings>(settings);

  // States.
  service.registerLazySingleton<UserState>(() => UserState());

  runApp(const Application());
}
