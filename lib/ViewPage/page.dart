import 'package:flutter/material.dart';
import 'package:mobile_ck/ViewPage/time.dart';
import 'package:mobile_ck/ViewPage/date.dart';
import 'package:mobile_ck/ViewPage/crossImage.dart';
import 'package:mobile_ck/ViewPage/todoList.dart';
import 'package:mobile_ck/ViewPage/daily.dart';
import 'package:mobile_ck/Home/drawer.dart';

class page extends StatelessWidget {
  final String username;
  const page({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Page 1',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          toolbarHeight: 100,
          backgroundColor: const Color.fromARGB(255, 105, 166, 215),
          centerTitle: true,
        ),
        drawer: MyDrawer(username: username),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: DateInputField()),
              SizedBox(height: 20),

              Row(
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
                        TodoList(),
                        const SizedBox(height: 40),
                        Daily(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
