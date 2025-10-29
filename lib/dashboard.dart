import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final String username;
  const Dashboard({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 600,
      child: Row(children: [Text('Xin chào, $username!')]),
    );
  }
}
