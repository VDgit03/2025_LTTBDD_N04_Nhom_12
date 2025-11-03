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
    if (USController.text.trim() == savedUS &&
        PWController.text.trim() == savedPW) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homepage(username: savedUS)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color.fromARGB(255, 105, 166, 215),
          content: Text(
            AppLocalizations.of(context)!.login_incorrect,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  //đổ bóng
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 20),
              Text(
                AppLocalizations.of(context)!.login,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 56, 56, 56),
                ),
              ),
              SizedBox(height: 30),

              //username
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

              //password
              TextField(
                controller: PWController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.password,
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 15),

              //register link
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.text_login,
                    style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //login Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 105, 166, 215),
                    textStyle: TextStyle(fontSize: 17),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.button_login,
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
