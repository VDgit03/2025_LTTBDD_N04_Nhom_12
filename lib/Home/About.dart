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
              opacity: 0.1,
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
    'Chào mừng bạn đến với To-Do List – người bạn đồng hành nhỏ gọn nhưng siêu hữu ích, giúp bạn sắp xếp mỗi ngày thật gọn gàng và tràn đầy năng lượng. Dù bạn là học sinh, sinh viên hay đang đi làm, To-Do List sẽ giúp bạn ghi nhớ mọi thứ quan trọng trong cuộc sống — từ bài tập, lịch họp, việc nhà cho đến những kế hoạch thú vị cuối tuần.\n\n'
    'Với giao diện đơn giản, dễ dùng và cực kỳ thân thiện, bạn chỉ cần vài giây để tạo nhiệm vụ, đánh dấu hoàn thành và sắp xếp công việc theo thứ tự ưu tiên. Tính năng nhắc nhở thông minh giúp bạn không bỏ lỡ deadline, còn phần danh sách hoàn thành sẽ mang đến cảm giác “wow, hôm nay mình siêu năng suất luôn!”\n\n'
    'To-Do List không chỉ là ứng dụng ghi chú — nó còn là động lực nhỏ giúp bạn xây dựng thói quen tốt, quản lý thời gian hiệu quả và cảm thấy tự tin khi chủ động điều khiển cuộc sống của mình.\n\n'
    'Bắt đầu mỗi ngày với danh sách rõ ràng, hoàn thành từng nhiệm vụ và tận hưởng cảm giác tuyệt vời khi nhìn mọi mục tiêu dần trở thành hiện thực.\n\n'
    'Hãy để To-Do List đồng hành cùng bạn – nhẹ nhàng, đơn giản, nhưng đầy hiệu quả! 💪✨',
    textAlign: TextAlign.justify,
    style: TextStyle(fontSize: 16, height: 1.5),
  );
}
