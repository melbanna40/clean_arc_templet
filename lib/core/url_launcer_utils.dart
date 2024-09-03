import 'dart:io';

import 'package:posts_app/core/log.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtils {
  UrlLauncherUtils();

  UrlLauncherUtils._();

  Future<void> launchInWebView(
    String url, {
    LaunchMode? launchMode,
  }) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: launchMode ?? LaunchMode.inAppWebView,
    )) {
      Log.error('Could not launch $url');
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> emailTo(String email) async {
    final launchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    await launchUrl(launchUri);
  }

  Future<void> whatsappMessage(
    String phone,
    String message,
  ) async {
    final launchUri = Uri.parse(
      Platform.isIOS
          ? 'whatsapp://wa.me/$phone/?text=${Uri.parse(message)}'
          : 'whatsapp://send?phone=$phone&text=${Uri.parse(message)}',
    );
    await launchUrl(launchUri);
  }

  Future<void> openMap(double latitude, double longitude) async {
    await launchUrl(
      Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
      ),
    );
  }
}
