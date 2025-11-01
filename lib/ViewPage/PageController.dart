import 'package:flutter/material.dart';
import 'package:mobile_ck/ViewPage/footer.dart';
import 'package:mobile_ck/ViewPage/page.dart';

class Pagecontroller extends StatefulWidget {
  const Pagecontroller({super.key});

  @override
  State<Pagecontroller> createState() => _PagecontrollerState();
}

class _PagecontrollerState extends State<Pagecontroller> {
  int _currentPage = 0;
  final List<Widget> _pages = [page(username: 'User', pageNumber: 1)];

  void _nextPage() {
    setState(() {
      _currentPage++;
      if (_currentPage >= _pages.length) {
        _pages.add(page(username: 'User', pageNumber: _currentPage + 1));
      }
    });
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        if (_currentPage > 0) {
          _currentPage--;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPage],
      bottomNavigationBar: Footer(
        pageNumber: _currentPage + 1,
        onNext: _nextPage,
        onPrevious: _previousPage,
      ),
    );
  }
}
