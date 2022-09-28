import 'package:booking_app/Presentation/Modules/profile/Widgets/passfieldWidget.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(
            context,
          ).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: ListView(
          children: [
            const Text(
              'Change Password',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Enter your new password and confirm your password',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PassField(
                label: 'New Password',
                text: 'enter new password',
                onChanged: (
                  pass,
                ) {}),
            const SizedBox(
              height: 20,
            ),
            PassField(
                label: 'Confirm Password',
                text: 'enter confirm password',
                onChanged: (
                  confPass,
                ) {}),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.teal,
                  side: BorderSide.none,
                ),
                onPressed: () {},
                child: const Text(
                  'Apply',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
