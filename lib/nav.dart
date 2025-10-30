import 'package:flutter/material.dart';
import 'package:mobile_ck/ViewPage/page.dart';

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
  const nav_homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.only(top: 550, right: 20, bottom: 20),
        child: ElevatedButton(
          onPressed: () {
            next_page(context, page());
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
