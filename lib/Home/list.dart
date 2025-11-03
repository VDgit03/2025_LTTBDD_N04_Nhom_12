import 'package:flutter/material.dart';
import 'package:mobile_ck/ViewPage/SaveData.dart';
import 'package:mobile_ck/ViewPage/page.dart';
import 'package:mobile_ck/l10n/app_localizations.dart';

class My_List extends StatefulWidget {
  final String username;
  const My_List({super.key, required this.username});

  @override
  State<My_List> createState() => _My_ListState();
}

class _My_ListState extends State<My_List> {
  final _data = SaveData();
  late List<int> pages;
  @override
  void initState() {
    super.initState();
    pages = _data.getPagesWithContent();
  }

  Future<void> refreshPages() async {
    setState(() {
      pages = _data.getPagesWithContent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: pages.isEmpty
          ? Center(
              child: Text(
                AppLocalizations.of(context)!.nopages,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: pages.length,
              itemBuilder: (context, index) {
                final pageNum = pages[index];
                return Container(
                  padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  width: 10,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 161, 203, 238),
                    ),
                    onPressed: () async {
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
                      await refreshPages();
                    },
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.page(pageNum),
                          style: TextStyle(
                            color: const Color.fromARGB(255, 38, 38, 38),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          _data.getDate(pageNum).isNotEmpty
                              ? " ${AppLocalizations.of(context)!.date}: ${_data.getDate(pageNum)}"
                              : " ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.7,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
