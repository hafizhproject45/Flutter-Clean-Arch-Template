import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:{{project_name}}/core/utils/env.dart';
import 'package:{{project_name}}/features/auth/data/models/auth.model.dart';

import '../injection_container.dart' as service_locator;

class InitializeApp {
  InitializeApp._();

  static Future<void> init() async {
    // 1. Load env
    await Env.load();

    // 2. Service Locator
    await service_locator.initLocator();

    // 3. Date formatter
    initializeDateFormatting();

    // 4. Hive init
    await Hive.initFlutter();
    Hive.registerAdapter(AuthModelAdapter());
  }
}
