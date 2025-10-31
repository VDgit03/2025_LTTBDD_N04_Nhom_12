import 'package:flutter/material.dart';
import 'package:mobile_ck/ViewPage/page.dart';
import 'package:mobile_ck/auth/register.dart';

void next_page(BuildContext context, Widget man_hinh) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return man_hinh;
      },
    ),
  );
}

class nav_homepage extends StatelessWidget {
  final String username;
  const nav_homepage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.only(top: 480, right: 20, bottom: 20),
        child: ElevatedButton(
          onPressed: () {
            next_page(context, page(username: savedUS));
          },
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}

class nav_register extends StatelessWidget {
  const nav_register({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
