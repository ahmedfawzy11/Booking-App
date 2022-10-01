import 'package:booking_app/part1/features/home/presentation/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/part1/features/home/presentation/widgets/home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body:  HomeWidget(),
    );
  }
}
