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

void return_page(BuildContext context) {
  Navigator.pop(context);
}

class navigation_dashboard extends StatelessWidget {
  const navigation_dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.all(16),
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
