import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'app_assets.dart';
import 'res.dart';

class Loader {
  /// Show App Loader
  void showAppLoader({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return Material(
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: SizedBox(
              height: sizes!.height * 0.35,
              width: sizes!.width * 0.35,
              child: Lottie.asset(Assets.apiLoading),
            ),
          ),
        );
      },
    );
  }

  /// Hide App Loader
  void hideAppLoader({required BuildContext context}) {
    Navigator.of(context).pop();
  }
}
