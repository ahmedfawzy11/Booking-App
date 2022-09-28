import 'package:flutter/material.dart';


class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          tooltip: "back to profile",
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () => Navigator.of(context,).pop(),
        ),
        
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32,),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath:
                  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
              showEditBottom: true,
            ),
            const SizedBox(height: 24,),
            const userData(
              label: 'UserName',
              // owner username
              text: 'SarahAhmed',
            ),
            Container(height: 1, color: Colors.grey.shade800,),
            const userData(
              label: 'Email',
              // owner email
              text: 'sarah.ahmed@gmail.com',
            ),
            Container(height: 1, color: Colors.grey.shade800,),
          ],
        ),
      ),
    );
  }
}
