import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:{{project_name}}/core/utils/colors.dart';
import 'package:{{project_name}}/core/utils/text_style.dart';

import 'constants.dart';

class Utility {
  //! Date Formatting

  /// Format date post API
  static String formatDatePostApi(DateTime date) {
    DateFormat formattor = DateFormat('yyyy-MM-dd HH:mm:ss', DATE_LOCALE);
    return formattor.format(date);
  }

  /// Format date post API
  static String formatDatePostApiOnlyDate(DateTime date) {
    DateFormat formattor = DateFormat('yyyy-MM-dd', DATE_LOCALE);
    return formattor.format(date);
  }

  /// Format date to `25 Apr 2024`
  static String formatDateLocale(String? dateString, {bool? withTime = false}) {
    try {
      if (dateString == null) {
        return '-';
      }
      DateTime date = DateTime.parse(dateString);

      DateFormat formatter =
          withTime != true
              ? DateFormat('dd MMM yyyy', DATE_LOCALE)
              : DateFormat('dd MMM yyyy | HH:mm', DATE_LOCALE);

      return formatter.format(date);
    } catch (e) {
      return '-';
    }
  }

  /// Format date to `2 minutes ago`
  static String formatDateTimeAgo(String rawDate) {
    DateTime date = DateTime.parse(rawDate);
    Duration difference = DateTime.now().difference(date);

    if (difference.inSeconds < 5) {
      return "Just now";
    } else if (difference.inMinutes < 1) {
      return "${difference.inSeconds} detik lalu";
    } else if (difference.inHours < 1) {
      return "${difference.inMinutes} menit lalu";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} jam lalu";
    } else {
      return Utility.formatDateLocale(rawDate);
    }
  }

  //! Number Formatting

  /// Format number to `1.000`
  static String formatNumeralMask(int number) {
    final formatter = NumberFormat('#,###');
    return formatter.format(number).replaceAll(',', '.');
  }

  /// Format int to `09:00`
  static String formatIntToMinutesAndSeconds(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  /// Format double to `0.0`
  static double formatAverage(double? number) {
    if (number == null) {
      return 0.0;
    }
    NumberFormat formatter = NumberFormat('0.0');
    String formattedString = formatter.format(number);
    return double.parse(formattedString);
  }

  //! String Formatting

  static String capitalize(String value) {
    return value.isEmpty
        ? value
        : '${value[0].toUpperCase()}${value.substring(1)}';
  }

  static Widget requiredLabel(String label) {
    return RichText(
      text: TextSpan(
        text: label,
        style: AppTextStyle.medium.copyWith(color: AppColor.textBody),
        children: [TextSpan(text: ' *', style: AppTextStyle.smallBoldRed)],
      ),
    );
  }

  // Format int → Rp xxx.xxx
  static String toLocale(int number) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(number);
  }

  static String trimLocale(String number) {
    // Hapus Rp dan spasi, tetap return String
    return number
        .replaceAll('Rp', '')
        .replaceAll('.', '')
        .replaceAll(' ', '')
        .trim();
  }

  static int parseLocale(String number) {
    // Bisa pakai trimLocale biar DRY (tidak duplikasi kode)
    final cleaned = trimLocale(number);
    return int.tryParse(cleaned) ?? 0;
  }

  /// Convert phone number to `+62` format
  static String convertPhone(String? phoneNumber) {
    if (phoneNumber == null) {
      return '-';
    }
    if (phoneNumber.startsWith("0")) {
      return "+62${phoneNumber.substring(1)}";
    } else {
      return phoneNumber;
    }
  }

  /// Remove HTML tags
  static String removeHtmlTags(String htmlText) {
    final regex = RegExp(r'<[^>]*>');
    return htmlText.replaceAll(regex, '');
  }

  /// Generate image placeholder URL
  static String imagePlaceHolder(int width, int height) {
    return 'https://via.placeholder.com/${width}x$height.png?text=No+Image';
  }

  //! Miscellaneous Utilities

  /// Encrypt data
  // static String encryption(String data) {
  //   if (data.isEmpty) {
  //     return '';
  //   }
  //   var key = encrypt.Key.fromBase64(Env.sbAnonKey);
  //   var iv = encrypt.IV.fromUtf8(getRandomString(16));
  //   var encrypter =
  //       encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
  //   var encryptedPassword = encrypter.encrypt(data, iv: iv);
  //   var hmac = Hmac(sha256, key.bytes);
  //   var mac = hmac.convert(utf8.encode(iv.base64 + encryptedPassword.base64));
  //   var output = {
  //     'iv': iv.base64,
  //     'value': encryptedPassword.base64,
  //     'mac': mac.toString(),
  //     'tag': ''
  //   };
  //   var jsonString = json.encode(output);
  //   return base64Encode(utf8.encode(jsonString));
  // }

  /// Generate random string
  static String getRandomString(int length) {
    const charset =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random.secure();
    return List.generate(length, (index) {
      final randomIndex = random.nextInt(charset.length);
      return charset[randomIndex];
    }).join();
  }

  /// Convert bytes to kilobytes
  static double convertBytesToKilobytes(int bytes) {
    return bytes / 1024;
  }

  /// Convert bytes to gigabytes
  static double convertBytesToGigabytes(int bytes) {
    return bytes / (1024 * 1024 * 1024);
  }

  /// Calculate percentage of used capacity
  static double calculatePercentageUsed(int bytes, double maxCapacityGB) {
    double totalGigabytes = convertBytesToGigabytes(bytes);
    return (totalGigabytes / maxCapacityGB) * 100;
  }
}
