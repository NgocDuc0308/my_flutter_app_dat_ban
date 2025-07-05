import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_dat_ban/lib/intro.dart';
// import 'package:app_dat_ban/lib/login.dart';
// import 'package:app_dat_ban/lib/home.dart';
// import 'package:app_dat_ban/lib/intro.dart';
// import 'package:app_dat_ban/lib/account.dart';
// import 'package:app_dat_ban/lib/nearyou.dart';
// import 'package:app_dat_ban/lib/detailchinhanh.dart';
// import 'package:app_dat_ban/lib/order.dart';
// import 'package:app_dat_ban/lib/detail/allchinhanh.dart';
// import 'package:app_dat_ban/lib/payment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('is_logged_in', false); // reset trạng thái

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App đặt bàn',
      debugShowCheckedModeBanner: false,

      // Thêm hỗ trợ tiếng Việt
      locale: const Locale('vi'),
      supportedLocales: const [Locale('vi'), Locale('en')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto', // font Unicode
      ),
      home: const IntroPage(),
    );
  }
}
