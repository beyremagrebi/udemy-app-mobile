import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppLaunch {
  static Future<void> preExecution() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await dotenv.load(fileName: ".env");
    } catch (err, stackTrace) {
      debugPrintStack(label: err.toString(), stackTrace: stackTrace);
    }
  }
}
