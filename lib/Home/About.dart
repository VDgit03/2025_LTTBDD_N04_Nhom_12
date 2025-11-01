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
        backgroundColor: const Color.fromARGB(255, 105, 166, 215),
        elevation: 6,
        toolbarHeight: 100,
        title: Text(AppLocalizations.of(context)!.about),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Color.fromARGB(255, 56, 56, 56),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
        ),
        centerTitle: true,
      ),

      drawer: MyDrawer(username: username),

      body: Stack(
        children: [
          // background logo
          Positioned.fill(
            child: Opacity(
              opacity: 0.1, //làm mờ
              child: Image.asset('assets/images/logo.jpg', fit: BoxFit.cover),
            ),
          ),

          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _text(),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Be a better version of yourself than yesterday.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _text() {
  return Text(
    'Welcome to To-Do List – your compact yet powerful everyday companion that helps you stay organized, focused, and full of energy! Whether you are a student, an office worker, or simply someone who loves planning, To-Do List helps you capture every important task — from school assignments and meetings to house chores and exciting weekend plans.\n\n'
    'With a clean and friendly interface, you can quickly create tasks, mark them as completed, and prioritize your work with just a few taps. Smart reminders ensure you never miss a deadline, while the completed tasks list gives you that satisfying “Wow, I was so productive today!” feeling.\n\n'
    'To-Do List is more than just a note-taking app — it’s a gentle motivator that helps you build good habits, manage your time effectively, and gain confidence by being in control of your day.\n\n'
    'Start each morning with a clear plan, complete every task one by one, and enjoy the amazing feeling of watching your goals come to life.\n\n'
    'Let To-Do List accompany you — simple, light, but incredibly effective! 💪✨',
    textAlign: TextAlign.justify,
    style: TextStyle(fontSize: 16, height: 1.5),
  );
}
