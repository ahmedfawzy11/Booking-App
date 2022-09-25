import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Setting',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            //Notifications
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Icon(Icons.notifications),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 10),
            //Theme Mode
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Theme Mode',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                FaIcon(FontAwesomeIcons.circleHalfStroke),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 10),
            //Fonts
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Fonts',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                FaIcon(FontAwesomeIcons.font),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 10),
            //Color
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Color',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Icon(Icons.color_lens),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 10),
            //Language
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Icon(Icons.translate),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 10),
            //Country
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Country',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text('Australia'),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 10),
            //Currency
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Currency',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.dollarSign,
                      size: 15,
                    ),
                    Text('AUD'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 10),
            //Terms of Services
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Terms of Services',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 10),
            //Privacy Policy
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 10),
            //Give Us Feedbacks
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Give Us Feedbacks',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 10),
            //Log out
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Log out',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
