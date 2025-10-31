import 'package:flutter/material.dart';
import 'package:mobile_ck/l10n/app_localizations.dart';
import 'drawer.dart';

class About extends StatelessWidget {
  final String username;
  const About({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.about)),
      drawer: MyDrawer(username: username),
      body: Center(child: Text("About Page: $username")),
    );
  }
}
