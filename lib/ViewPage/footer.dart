import 'package:flutter/material.dart';
import 'package:mobile_ck/Home/homepage.dart';
import 'package:mobile_ck/l10n/app_localizations.dart';

class Footer extends StatefulWidget {
  final String username;
  final int pageNumber;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  const Footer({
    super.key,
    required this.pageNumber,
    this.onPrevious,
    this.onNext,
    required this.username,
  });

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  late int _pageNumber;

  @override
  void initState() {
    super.initState();
    _pageNumber = widget.pageNumber;
  }

  void _nextPage() {
    setState(() {
      _pageNumber++;
    });
    if (widget.onNext != null) {
      widget.onNext!();
    }
  }

  void _previousPage() {
    setState(() {
      if (_pageNumber > 1) {
        _pageNumber--;
      } else if (_pageNumber == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(username: widget.username),
          ),
        );
      }
    });
    if (widget.onPrevious != null) {
      widget.onPrevious!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 105, 166, 215),
        // border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: (_previousPage),
            child: Icon(Icons.arrow_back),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.page(_pageNumber),
            style: TextStyle(fontSize: 16),
          ),

          ElevatedButton(
            onPressed: (_nextPage),
            child: Icon(Icons.arrow_forward),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
