import 'package:flutter/material.dart';
import 'package:mobile_ck/ViewPage/footer.dart';
import 'package:mobile_ck/ViewPage/time.dart';
import 'package:mobile_ck/ViewPage/date.dart';
import 'package:mobile_ck/ViewPage/crossImage.dart';
import 'package:mobile_ck/ViewPage/todoList.dart';
import 'package:mobile_ck/ViewPage/diary.dart';
import 'package:mobile_ck/Home/drawer.dart';

class page extends StatefulWidget {
  final String username;
  final int pageNumber;

  const page({super.key, required this.username, required this.pageNumber});

  @override
  State<page> createState() => _pageState();
}

class _pageState extends State<page> {
  late String username;
  late int pageNumber;

  @override
  void initState() {
    super.initState();
    username = widget.username;
    pageNumber = widget.pageNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chào ngày mới, $username!',
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.vertical(
            bottom: Radius.circular(12),
          ),
        ),
      ),
      drawer: MyDrawer(username: username),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: DateInputField(pageNumber: pageNumber)),
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
                      TodoList(pageNumber: pageNumber),
                      const SizedBox(height: 10),
                      Diary(pageNumber: pageNumber),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // footer
      bottomNavigationBar: Footer(
        pageNumber: pageNumber,
        onPrevious: () {
          if (pageNumber > 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    page(username: username, pageNumber: pageNumber - 1),
              ),
            ); // Handle previous page action
          }
        },
        onNext: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  page(username: username, pageNumber: pageNumber + 1),
            ),
          ); // Handle next page action
        },
      ),
    );
  }
}
