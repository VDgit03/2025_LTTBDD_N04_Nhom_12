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
  final String username;
  const nav_homepage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 105, 166, 215),
        // border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              next_page(context, page(username: username, pageNumber: 1));
            },
            child: Icon(Icons.arrow_forward),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
          ),
        ],
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
