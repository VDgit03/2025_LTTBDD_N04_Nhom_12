// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get username => 'Tên đăng nhập';

  @override
  String get password => 'Mật khẩu';

  @override
  String get register => 'Đăng kí';

  @override
  String get text_register => 'Đã có tài khoản? Đăng nhập ngay';

  @override
  String get button_register => 'Đăng kí';

  @override
  String get register_successful => 'Đăng kí thành công';

  @override
  String get login => 'Đăng nhập';

  @override
  String get text_login => 'Chưa có tài khoản? Đăng kí ngay';

  @override
  String get button_login => 'Đăng nhập';

  @override
  String get login_successful => 'Đăng nhập thành công';

  @override
  String get login_incorrect => 'Sai tên đăng nhập hoặc mật khẩu! Vui lòng thử lại';

  @override
  String get homepage => 'Trang chủ';

  @override
  String get text_db => 'Đã tới trang chủ';

  @override
  String hello(String username) {
    return 'Xin chào, $username';
  }

  @override
  String get list => 'Danh sách công việc';

  @override
  String get settings => 'Cài đặt';

  @override
  String get text_st => 'Đã tới cài đặt';

  @override
  String get about => 'Giới thiệu';

  @override
  String get text_about => 'Giới thiệu về app';

  @override
  String get logout => 'Đăng xuất';

  @override
  String get text_logout => 'Đăng xuất thành công';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get theme => 'Giao diện';

  @override
  String page(int _pageNumber) {
    return 'Trang $_pageNumber';
  }
}
