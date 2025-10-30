import 'package:flutter/material.dart';
import 'package:mobile_ck/ViewPage/time.dart';
import 'package:mobile_ck/ViewPage/date.dart';
import 'package:mobile_ck/ViewPage/crossImage.dart';
import 'package:mobile_ck/ViewPage/todoList.dart';
import 'package:mobile_ck/ViewPage/diary.dart';
import 'package:mobile_ck/drawer.dart';

class page extends StatelessWidget {
  const page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Page 1',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 56, 56, 56),
            ),
          ),
          toolbarHeight: 100,
          backgroundColor: const Color.fromARGB(255, 105, 166, 215),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: DateInputField()),
              SizedBox(height: 10),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Time(),
                        const SizedBox(height: 10),
                        const CrossImage(),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TodoList(),
                        const SizedBox(height: 10),
                        Diary(),
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
