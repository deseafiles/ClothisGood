import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  static const String privacyPolicy = '''
Privacy Policy & Permissions

ClothisGood

Last updated: October 19, 2026

1. Information We Access

ClothisGood may access or process the following information:

• Location Information: Your device location, if you grant location permission, to display local weather information. You can also select a location manually.

• Weather Information: Current weather conditions and forecasts retrieved from third-party weather services based on your selected location.

• App Preferences: Preferences such as your last selected city may be stored locally on your device.

• Online Images: Outfit images retrieved from Unsplash to provide outfit inspiration and recommendations.

2. How We Use Information

The information accessed by ClothisGood is used to:
• Display current weather conditions and forecasts.
• Provide outfit recommendations based on weather conditions.
• Retrieve outfit images from online services.
• Remember selected app preferences where applicable.

3. App Permissions

Location Permission

Location access helps ClothisGood identify your current location and retrieve relevant local weather information.

Your location may be transmitted to a weather service to retrieve weather data. Location permission is optional, and you can deny or revoke it through your device settings. Where supported, you can select a location manually instead.

Internet Access

Internet access is required to retrieve weather information and load outfit images from online services, including Unsplash.

4. Third-Party Services

ClothisGood may use third-party services, including weather data providers and Unsplash. These services may process requests according to their own privacy policies and terms.

5. Data Storage and Sharing

Certain app preferences may be stored locally on your device. Information sent to third-party services is subject to the services involved and the requests made by the application.

ClothisGood does not intentionally sell your personal information.

6. Your Privacy Choices

You can manage location permission through your device settings. You may also choose a location manually where supported.

7. Data Security

We take reasonable steps to minimize the information accessed and used by the application. However, no electronic storage or transmission method can be guaranteed to be completely secure.

8. Children's Privacy

ClothisGood is not specifically designed to collect personal information from children.

9. Changes to This Policy

This policy may be updated when application features or data practices change.

10. Contact Us

If you have questions about this Privacy Policy or the permissions used by ClothisGood, please contact the development team through the application's designated contact channel.
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: const Text(
          privacyPolicy,
          style: TextStyle(
            fontSize: 14,
            height: 1.7,
          ),
        ),
      ),
    );
  }
}

