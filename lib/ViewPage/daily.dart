import 'package:flutter/material.dart';

class Daily extends StatefulWidget {
  const Daily({super.key});

  @override
  State<Daily> createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16), // cách lề trong
      decoration: BoxDecoration(
        color: Colors.white, // nền trắng (tùy chỉnh)
        borderRadius: BorderRadius.circular(12), // bo góc
        border: Border.all(
          color: const Color.fromARGB(255, 126, 153, 200), // màu viền
          width: 2, // độ dày viền
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // tieu de
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "Daily",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // noi dung chinh
          const SizedBox(height: 10),
          const Text("Nội dung Daily sẽ được hiển thị ở đây."),
        ],
      ),
    );
  }
}
