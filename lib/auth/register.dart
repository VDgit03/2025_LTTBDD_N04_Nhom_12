import 'package:flutter/material.dart';
import 'login.dart';
import 'package:mobile_ck/l10n/app_localizations.dart';

//biến toàn cục để lưu username, password
String savedUS = '';
String savedPW = '';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //lấy dữ liệu
  final USController = TextEditingController();
  final PWController = TextEditingController();

  //thực hiện khi ấn đăng kí
  void register() {
    setState(() {
      savedUS = USController.text;
      savedPW = PWController.text;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Color.fromARGB(255, 105, 166, 215),
        content: Text(
          AppLocalizations.of(context)!.register_successful,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );

    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register),
        toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 105, 166, 215),
        elevation: 6,
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 56, 56, 56),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text(
                AppLocalizations.of(context)!.text_register,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: register,
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 17),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                AppLocalizations.of(context)!.button_register,
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
