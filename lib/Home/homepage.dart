import 'package:flutter/material.dart';
import 'package:mobile_ck/Home/list.dart';
import 'nav.dart';
import 'dashboard.dart';
import 'drawer.dart';
import 'package:mobile_ck/l10n/app_localizations.dart';
import 'package:mobile_ck/ViewPage/SaveData.dart';

class Homepage extends StatefulWidget {
  final String username;
  const Homepage({super.key, required this.username});
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _data = SaveData();
  late List<int> pages;
  @override
  void initState() {
    super.initState();
    pages = _data.getPagesWithContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 105, 166, 215),
        elevation: 6,
        toolbarHeight: 100,
        title: Text(
          AppLocalizations.of(context)!.homepage,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color.fromARGB(255, 56, 56, 56),
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
        ),
      ),

      drawer: MyDrawer(username: widget.username),

      body: Column(
        children: [
          SizedBox(height: 10),
          Dashboard(username: widget.username),
          My_List(username: widget.username),
          nav_homepage(username: widget.username),
        ],
      ),
    );
  }
}
