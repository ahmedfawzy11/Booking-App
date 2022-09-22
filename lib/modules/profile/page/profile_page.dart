import 'package:booking_app/modules/profile/page/change_pass_page.dart';
import 'package:booking_app/modules/profile/widget/option_widget.dart';
import 'package:flutter/material.dart';

import '../widget/profile_widget.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  final AnimationController animationController;

  const ProfilePage({Key? key, required this.animationController})
      : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        // Name of the profile owner
                        'Sarah Ahmed',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'view and Edit profile',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ],
                  ),
                  ProfileWidget(
                    // Pic of the profile owner
                    imagePath:
                        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',

                    showEditBottom: false,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OptionWidget(
              text: 'Change Password',
              icon: const Icon(Icons.lock, color: Colors.grey),
              onClicked: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => changePassword()),
                );
              },
            ),
            Container(height: 1, color: Colors.grey.shade800),
           OptionWidget(
                text: 'Invite Friends',
                icon: const Icon(Icons.person_add_alt_1, color: Colors.grey),
                onClicked: (){}),
            Container(height: 1, color: Colors.grey.shade800),
             OptionWidget(
                text: 'Credit & Coupons',
                icon: const Icon(Icons.card_giftcard, color: Colors.grey),
                onClicked: (){}),
            Container(height: 1, color: Colors.grey.shade800),
             OptionWidget(
                text: 'Help Center',
                icon: const Icon(Icons.help_center, color: Colors.grey),
                onClicked: (){}),
            Container(height: 1, color: Colors.grey.shade800),
             OptionWidget(
                text: 'Payment', icon: Icon(Icons.payment, color: Colors.grey),
                onClicked: (){}),
            Container(height: 1, color: Colors.grey.shade800),
             OptionWidget(
                text: 'Setting',
                icon: const Icon(Icons.settings, color: Colors.grey),
                onClicked: (){}),
            Container(height: 1, color: Colors.grey.shade800),
          ],
        ),
      ),
    );
  }
}
