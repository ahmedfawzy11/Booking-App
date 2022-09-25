import 'package:flutter/material.dart';

class InviteScreen extends StatelessWidget {
  const InviteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(
              'assets/images/inviteImage.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 400,
            ),
            const SizedBox(height: 10),
            const Text(
              'Invite Your Friend',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'are you one of those who makes everything ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const Text(
              'at the last moment',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 100),
            Container(
              width: 100,
              child: MaterialButton(
                onPressed: () {},
                color: Colors.green,
                child: Row(
                  children: const [
                    Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Share',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
