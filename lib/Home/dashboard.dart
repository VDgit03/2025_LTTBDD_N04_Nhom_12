import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final String username;
  const Dashboard({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Xin chào, $username', style: TextStyle(fontSize: 25)),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsetsGeometry.only(left: 15, top: 20),
              child: Text(
                'My List',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
