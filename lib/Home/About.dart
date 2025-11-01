import 'package:flutter/material.dart';
import 'package:mobile_ck/l10n/app_localizations.dart';
import 'drawer.dart';

class About extends StatelessWidget {
  final String username;
  const About({super.key, this.username = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 105, 166, 215),
        elevation: 6,
        toolbarHeight: 100,
        title: Text(AppLocalizations.of(context)!.about),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Color.fromARGB(255, 56, 56, 56),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(username: username),
      body: SingleChildScrollView(
        child: Row(children: [Image.asset(''), Text(' ')]),
      ),
    );
  }
}
