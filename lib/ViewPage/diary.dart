import 'package:flutter/material.dart';
import 'SaveData.dart';
import 'package:mobile_ck/l10n/app_localizations.dart';

class Diary extends StatefulWidget {
  final int pageNumber;
  const Diary({super.key, required this.pageNumber});

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  final TextEditingController _controller = TextEditingController();
  final SaveData _data = SaveData();

  final FocusNode _focusNode = FocusNode();
  bool _isSaved = true;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _controller.text = _data.getDiary(widget.pageNumber);

    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });

      if (!_focusNode.hasFocus) {
        // Khi rời khỏi ô nhập → tự lưu
        _data.saveDiary(widget.pageNumber, _controller.text);
        setState(() {
          _isSaved = true;
        });
      }
    });
  }

  void _saveEntry() {
    _data.saveDiary(widget.pageNumber, _controller.text);
    setState(() {});
  }

  void _clearDiary() {
    _data.clearDiary(widget.pageNumber);
    _controller.clear();
    setState(() {
      _isSaved = true;
    });
  }

  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
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
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 150, maxHeight: 275),

              child: Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    decoration: const InputDecoration(
                      hintText: "Write your thoughts...",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => setState(() {
                      _isSaved = false; // DANG GO THI CHUA LUU
                    }),
                    onSubmitted: (_) => _saveEntry(), // Enter cũng lưu
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Danh sách nhật ký có thể vuốt để xóa
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _isSaved
                    ? (_data.diaries.isEmpty
                          ? AppLocalizations.of(context)!.nodiary
                          : AppLocalizations.of(context)!.savediary)
                    : AppLocalizations.of(context)!.nosaveddiary,
                style: TextStyle(
                  color: _isSaved
                      ? (_data.diaries.isEmpty ? Colors.grey : Colors.green)
                      : Colors.blue,
                  fontStyle: !_isSaved ? FontStyle.italic : FontStyle.normal,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                tooltip: AppLocalizations.of(context)!.removediary,
                onPressed: _clearDiary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
