import 'package:flutter/material.dart';
import 'package:mobile_ck/ViewPage/page.dart';
import 'SaveData.dart';

class Mucluc extends StatelessWidget {
  final _data = SaveData();

  Mucluc({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = _data.getPagesWithContent();

    return Scaffold(
      appBar: AppBar(
        title: Text("Hành trình"),
        backgroundColor: Color.fromARGB(255, 105, 166, 215),
      ),
      body: pages.isEmpty
          ? Center(
              child: Text(
                "Chưa có trang nào được tạo.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: pages.length,
              itemBuilder: (context, index) {
                final pageNum = pages[index];
                return ListTile(
                  title: Text("Trang $pageNum"),
                  subtitle: Text(
                    _data.getDate(pageNum).isNotEmpty
                        ? "Ngày: ${_data.getDate(pageNum)}"
                        : "Chưa ghi ngày",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            page(username: "User", pageNumber: pageNum),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
