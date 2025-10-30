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
        backgroundColor: const Color.fromARGB(255, 105, 166, 215),
        toolbarHeight: 60,
        title: Text('To Do List'),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),

        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.language)),
          Padding(padding: EdgeInsets.only(right: 10)),
        ],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Dashboard(username: username),
            nav_homepage(),
          ],
        ),
      ),
    );
  }
}
