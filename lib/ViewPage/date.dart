import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart'; // để format ngày
import 'SaveData.dart';

class DateInputField extends StatefulWidget {
  const DateInputField({super.key});

  @override
  State<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  final _data = SaveData();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      // hiển thị hộp thoại chọn ngày
      context: context,
      initialDate: DateTime.now(), // ngày mặc định
      firstDate: DateTime(2000), // ngày nhỏ nhất
      lastDate: DateTime(5100), // ngày lớn nhất
    );

    if (picked != null) {
      final formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      setState(() {
        _data.selectedDate.text = formattedDate; // tự điền vào ô nhập
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.redAccent),
      ),
      width: 170,
      child: Row(
        children: [
          // Ô nhập ngày
          Expanded(
            child: TextField(
              controller: _data.selectedDate,
              keyboardType: TextInputType.number,
              maxLength: 10,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                _DateInputFormatter(),
              ],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintText: '_ _/_ _/_ _ _ _',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),

          // Nút lịch để chọn ngày
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Colors.white),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),
    );
  }
}

/// Bộ định dạng thêm dấu "/" khi nhập
class _DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (text.isEmpty) {
      return newValue; // Cho phép xóa hết
    }

    if (text.length > 2 && text.length <= 4) {
      text = '${text.substring(0, 2)}/${text.substring(2)}';
    } else if (text.length > 4) {
      text =
          '${text.substring(0, 2)}/${text.substring(2, 4)}/${text.substring(4)}';
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
