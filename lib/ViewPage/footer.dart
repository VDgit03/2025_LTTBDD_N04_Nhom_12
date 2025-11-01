import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  final int pageNumber;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  const Footer({
    super.key,
    required this.pageNumber,
    this.onPrevious,
    this.onNext,
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
        color: Colors.grey[200],
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: (_previousPage),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Quay lại'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
          ),
          Text("  Trang ${_pageNumber}", style: TextStyle(fontSize: 16)),

          ElevatedButton.icon(
            onPressed: (_nextPage),
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Trang kế'),
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
