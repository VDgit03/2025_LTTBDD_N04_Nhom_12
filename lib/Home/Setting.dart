import 'package:flutter/material.dart';
import 'drawer.dart';
import '../main.dart';
import 'package:mobile_ck/l10n/app_localizations.dart';

class Setting extends StatefulWidget {
  final String username;
  const Setting({super.key, required this.username});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String selectedTheme = "Light";
  String selectedLanguage = "Vietnamese";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 105, 166, 215),
        elevation: 6,
        toolbarHeight: 100,
        title: Text(AppLocalizations.of(context)!.settings),
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
      drawer: MyDrawer(username: widget.username),
      body: ListView(
        children: [
          const SizedBox(height: 20),

          // Ngôn ngữ
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(AppLocalizations.of(context)!.language),
            trailing: DropdownButton<String>(
              underline: SizedBox(),
              borderRadius: BorderRadius.all(Radius.circular(12)),
              value: selectedLanguage,
              items: const [
                DropdownMenuItem(
                  value: "Vietnamese",
                  child: Text("Tiếng Việt"),
                ),
                DropdownMenuItem(value: "English", child: Text("English")),
              ],
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;

                  if (value == "English") {
                    MyApp.setLocale(context, const Locale('en'));
                  } else {
                    MyApp.setLocale(context, const Locale('vi'));
                  }
                });
              },
            ),
          ),

          const SizedBox(height: 20),

          // Giao diện
          ListTile(
            leading: const Icon(Icons.contrast),
            title: Text(AppLocalizations.of(context)!.theme),
            trailing: DropdownButton<String>(
              underline: SizedBox(),
              borderRadius: BorderRadius.all(Radius.circular(12)),
              value: selectedTheme,
              items: const [
                DropdownMenuItem(value: "Light", child: Text("Sáng")),
                DropdownMenuItem(value: "Dark", child: Text("Tối")),
              ],
              onChanged: (value) {
                setState(() => selectedTheme = value!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
