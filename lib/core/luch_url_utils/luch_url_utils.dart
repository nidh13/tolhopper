import 'package:url_launcher/url_launcher.dart';

class URLUtils {
  static Future<void> launchURL(String? url, LaunchMode launchMode) async {
    if (url != null) {
      final Uri _url = Uri.parse(url);
      if (await canLaunchUrl(_url)) {
        await launchUrl(_url,
            mode: launchMode,
            webViewConfiguration:
                const WebViewConfiguration(enableDomStorage: false));
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
