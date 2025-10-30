import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final String username;
  const Dashboard({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Xin chào, $username!', style: TextStyle(fontSize: 25)),
        ],
      ),
    );
  }
}
