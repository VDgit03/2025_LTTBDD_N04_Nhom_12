import 'package:flutter/material.dart';
import 'nav.dart';
import 'dashboard.dart';
import 'drawer.dart';

class Homepage extends StatelessWidget {
  final String username;
  const Homepage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 105, 166, 215),
        elevation: 6,
        toolbarHeight: 100,
        title: Text('To Do List'),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Color.fromARGB(255, 56, 56, 56),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.language)),
          Padding(padding: EdgeInsets.only(right: 10)),
        ],
      ),
      drawer: MyDrawer(username: username),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Dashboard(username: username),
            nav_homepage(username: username),
          ],
        ),
      ),
    );
  }
}
