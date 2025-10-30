import 'package:flutter/material.dart';
import 'SaveData.dart';

class Diary extends StatefulWidget {
  const Diary({super.key});

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  final TextEditingController _controller = TextEditingController();
  final SaveData _data = SaveData();

  @override
  void initState() {
    super.initState();
    _controller.text = _data.diary;
  }

  void _saveEntry() {
    _data.saveDiary(_controller.text);
    setState(() {});
  }

  void _clearDiary() {
    _data.clearDiary();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(16),
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
            children: [
              const Text(
                "Diary & Journal",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Ô nhập nhật ký
          Focus(
            onFocusChange: (hasFocus) {
              if (!hasFocus) {
                // Khi rời khỏi ô nhập → tự lưu
                _saveEntry();
              }
            },
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 150, maxHeight: 275),

              child: Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: TextField(
                    controller: _controller,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: "Write your thoughts...",
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _saveEntry(), // Enter cũng lưu
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Danh sách nhật ký có thể vuốt để xóa
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                _data.diary.isEmpty ? "No diary saved yet." : "Diary saved!",
                style: TextStyle(
                  color: _data.diary.isEmpty ? Colors.grey : Colors.green,
                  fontStyle: _data.diary.isEmpty
                      ? FontStyle.italic
                      : FontStyle.normal,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                tooltip: "Clear diary",
                onPressed: _clearDiary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
