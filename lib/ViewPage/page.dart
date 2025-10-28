import 'package:flutter/material.dart';
import 'package:mobile_ck/ViewPage/time.dart';
import 'package:mobile_ck/ViewPage/date.dart';
import 'package:mobile_ck/ViewPage/crossImage.dart';

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
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DateInputField(),
              SizedBox(height: 20),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Time(),
                          const SizedBox(height: 20),
                          const CrossImage(),
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
            ],
          ),
        ),
      ),
    );
  }
}
