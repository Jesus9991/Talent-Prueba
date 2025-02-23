import 'package:url_launcher/url_launcher.dart';

class OpenUrlSocialServices {
  /*abre instagram */
  openUrlInstagram(String instagram) async {
    final Uri appUri = Uri.parse('instagram://user?username=$instagram');
    final Uri webUri = Uri.parse('https://www.instagram.com/$instagram');
    if (await canLaunchUrl(appUri)) {
      await launchUrl(appUri);
    } else {
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
    }
  }

  /*abre facebook*/
  openUrlFacebook(String facebook) async {
    final Uri appUri = Uri.parse('fb://profile/$facebook');
    final Uri webUri = Uri.parse('https://www.facebook.com/$facebook');
    if (await canLaunchUrl(appUri)) {
      await launchUrl(appUri);
    } else {
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
    }
  }
}
