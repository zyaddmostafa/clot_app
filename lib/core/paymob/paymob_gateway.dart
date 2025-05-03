import 'package:clot_app/core/paymob/paymob_constants.dart';
import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

class PaymobGateway {
  static void init() {
    final User? user = FirebaseAuth.instance.currentUser;
    // Initialize the Paymob SDK or any required configurations here
    PaymentData.initialize(
      apiKey:
          PaymobConstants
              .apiKey, // Required: Found under Dashboard -> Settings -> Account Info -> API Key
      iframeId:
          PaymobConstants
              .iframeId, // Required: Found under Developers -> iframes
      integrationCardId:
          PaymobConstants
              .integrationCardId, // Required: Found under Developers -> Payment Integrations -> Online Card ID
      integrationMobileWalletId:
          PaymobConstants
              .integrationMobileWalletId, // Required: Found under Developers -> Payment Integrations -> Mobile Wallet ID
      // Optional User Data
      userData: UserData(
        email: "${user!.email}", // Optional: Defaults to 'NA'
        // Optional: Defaults to 'NA'
        name: (user.displayName)!.split(' ')[0], // Optional: Defaults to 'NA'
        lastName:
            (user.displayName)!.split(' ')[1], // Optional: Defaults to 'NA'
      ),

      // Optional Style Customizations
      style: Style(
        primaryColor: AppColors.primaryColor, // Default: Colors.blue
        scaffoldColor: AppColors.darkModeBackground, // Default: Colors.white
        appBarBackgroundColor: AppColors.primaryColor, // Default: Colors.blue
        textStyle: AppTextStyles.font16Bold,
        buttonStyle: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
        ), // Default: ElevatedButton.styleFrom()
        circleProgressColor: AppColors.primaryColor, // Default: Colors.blue
        unselectedColor: Colors.grey, // Default: Colors.grey
      ),
    );
  }
}
