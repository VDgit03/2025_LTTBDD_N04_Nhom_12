import 'package:flutter/material.dart';
import 'nav.dart';
import 'dashboard.dart';
import 'drawer.dart';
import 'package:mobile_ck/l10n/app_localizations.dart';
import 'package:mobile_ck/ViewPage/SaveData.dart';
import 'package:mobile_ck/ViewPage/page.dart';

class Homepage extends StatefulWidget {
  final String username;
  const Homepage({super.key, required this.username});
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _data = SaveData();
  late List<int> pages;
  @override
  void initState() {
    super.initState();
    pages = _data.getPagesWithContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 105, 166, 215),
        elevation: 6,
        toolbarHeight: 100,
        title: Text(
          AppLocalizations.of(context)!.homepage,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color.fromARGB(255, 56, 56, 56),
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
        ),
      ),

      drawer: MyDrawer(username: widget.username),

      body: Column(
        children: [
          SizedBox(height: 10),
          Dashboard(username: widget.username),

          Expanded(
            child: pages.isEmpty
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
                      return Container(
                        padding: EdgeInsets.only(
                          left: 30,
                          right: 30,
                          bottom: 10,
                        ),
                        width: 10,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 105, 166, 215),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => page(
                                  username: widget.username,
                                  pageNumber: pageNum,
                                ),
                              ),
                            );

                            //load lại page
                            setState(() {
                              pages = _data.getPagesWithContent();
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.page(pageNum),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                _data.getDate(pageNum).isNotEmpty
                                    ? "Ngày: ${_data.getDate(pageNum)}"
                                    : " ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),

          nav_homepage(username: widget.username),
        ],
      ),
    );
  }
}
