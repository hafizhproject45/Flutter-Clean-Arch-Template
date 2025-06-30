import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static late final String tmdbAccessToken;

  static Future<void> load() async {
    await dotenv.load(fileName: '.env');
    tmdbAccessToken = dotenv.env['ACCESS_TOKEN'] ?? '';
    if (tmdbAccessToken.isEmpty) {
      throw Exception('ACCESS_TOKEN tidak ditemukan di .env');
    }
  }
}
