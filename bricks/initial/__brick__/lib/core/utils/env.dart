import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static late final String accessToken;

  static Future<void> load() async {
    await dotenv.load(fileName: '.env');
    accessToken = dotenv.env['ACCESS_TOKEN'] ?? '';
    if (accessToken.isEmpty) {
      throw Exception('ACCESS_TOKEN tidak ditemukan di .env');
    }
  }
}
