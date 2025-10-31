import 'package:flutter/material.dart';
import 'register.dart';
import 'package:mobile_ck/Home/homepage.dart';
import 'package:mobile_ck/l10n/app_localizations.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final USController = TextEditingController();
  final PWController = TextEditingController();
  void login() {
    //kiểm tra username, password
    if (USController.text == savedUS && PWController.text == savedPW) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homepage(username: savedUS!)),
      );
    } else {
      //sai thì báo lỗi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color.fromARGB(255, 105, 166, 215),
          content: Text(
            AppLocalizations.of(context)!.login_incorrect,
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.login),
        toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 105, 166, 215),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Color.fromARGB(255, 56, 56, 56),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 100, right: 100, top: 20),
        child: Column(
          children: [
            TextField(
              controller: USController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.username,
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: PWController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.password,
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register(username: savedUS!),
                  ),
                );
              },
              child: Text(
                AppLocalizations.of(context)!.text_login,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: login,
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 17),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                AppLocalizations.of(context)!.button_login,
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
