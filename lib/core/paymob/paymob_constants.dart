import 'package:flutter_dotenv/flutter_dotenv.dart';

class PaymobConstants {
  static String get apiKey => dotenv.env['PAYMOB_API_KEY'] ?? '';

  static String get integrationCardId =>
      dotenv.env['PAYMOB_INTEGRATION_CARD_ID'] ?? '';
  static String get integrationMobileWalletId =>
      dotenv.env['PAYMOB_INTEGRATION_MOBILE_WALLET_ID'] ?? '';
  static String get iframeId => dotenv.env['PAYMOB_IFRAME_ID'] ?? '';
}
