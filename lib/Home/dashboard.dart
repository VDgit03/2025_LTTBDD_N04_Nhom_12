import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mobile_ck/l10n/app_localizations.dart';
import 'quote.dart';

class Dashboard extends StatefulWidget {
  final String username;
  const Dashboard({super.key, required this.username});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String currentQuote = My_Quote[0];

  void changeQuote() {
    setState(() {
      currentQuote = My_Quote[Random().nextInt(My_Quote.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.hello(widget.username),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 56, 56, 56),
            ),
          ),

          SizedBox(height: 30),

          Text(
            AppLocalizations.of(context)!.list,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
          //đổi quote
          GestureDetector(
            onTap: changeQuote,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SizedBox(height: 8),
                  Text(
                    currentQuote,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
