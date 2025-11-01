import 'package:flutter/material.dart';
import 'package:mobile_ck/Home/homepage.dart';
import 'package:mobile_ck/auth/login.dart';

import 'setting.dart';
import 'about.dart';
import 'package:mobile_ck/l10n/app_localizations.dart';

class MyDrawer extends StatelessWidget {
  final String username;
  const MyDrawer({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          //header của drawer
          DrawerHeader(
            padding: EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 105, 166, 215),
            ),
            child: Column(
              children: [
                Icon(Icons.person, size: 70, color: Colors.white),
                SizedBox(height: 10),
                Text('$username', style: TextStyle(fontSize: 25)),
              ],
            ),
          ),

          // link trang chủ
          ListTile(
            leading: Icon(Icons.home),
            title: Text(AppLocalizations.of(context)!.homepage),
            onTap: () {
              // Đóng Drawer lại
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Homepage(username: username),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color.fromARGB(255, 105, 166, 215),
                  content: Text(
                    AppLocalizations.of(context)!.text_db,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              );
            },
          ),

          //link setting
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(AppLocalizations.of(context)!.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Setting(username: username),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color.fromARGB(255, 105, 166, 215),
                  content: Text(
                    AppLocalizations.of(context)!.text_st,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              );
            },
          ),

          //link giới thiệu
          ListTile(
            leading: Icon(Icons.info),
            title: Text(AppLocalizations.of(context)!.about),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => About(username: username),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color.fromARGB(255, 105, 166, 215),
                  content: Text(
                    AppLocalizations.of(context)!.text_about,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              );
            },
          ),

          //link logout
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(AppLocalizations.of(context)!.logout),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color.fromARGB(255, 105, 166, 215),
                  content: Text(
                    AppLocalizations.of(context)!.text_logout,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
