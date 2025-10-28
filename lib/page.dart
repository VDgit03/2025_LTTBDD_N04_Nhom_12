import 'package:flutter/material.dart';

class page extends StatelessWidget {
  const page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Page 1', textAlign: TextAlign.center),
          toolbarHeight: 100,
          backgroundColor: Colors.blueGrey,
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(height: 200, color: Colors.red),

                  const SizedBox(height: 20),
                  Container(height: 200, color: Colors.green),
                ],
              ),
            ),
            const SizedBox(width: 20),

            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 150, color: Colors.blue),
                  const SizedBox(height: 20),
                  Container(height: 150, color: Colors.yellow),
                  const SizedBox(height: 20),
                  Container(height: 150, color: Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
