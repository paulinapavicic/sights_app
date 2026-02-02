import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sights_app/presentation/common/presentation/utility/show_custom_alert_dialog.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(
      BuildContext context,
      double latitude,
      double longitude,
      ) async {
    final urlString =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    final uri = Uri.parse(urlString);

    debugPrint('Trying to open maps URL: $urlString');

    final can = await canLaunchUrl(uri);
    debugPrint('canLaunchUrl = $can');

    if (!can) {
      if (context.mounted) {
        showCustomAlertDialog(context, 'Cannot launch URL:\n$urlString');
      }
      return;
    }

    final ok = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    debugPrint('launchUrl result = $ok');

    if (!ok && context.mounted) {
      showCustomAlertDialog(context, 'Could not open map:\n$urlString');
    }
  }
}
