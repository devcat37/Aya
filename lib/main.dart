import 'package:aya/internal/application.dart';
import 'package:aya/internal/services/service_locator.dart';
import 'package:aya/internal/services/settings.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Settings.
  final settings = Settings();
  service.registerSingleton<Settings>(settings);

  runApp(const Application());
}
