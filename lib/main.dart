import 'dart:async';

import 'package:exchange_alarmi/pages/main_branch_page.dart';
import 'package:exchange_alarmi/stores/exchange_store.dart';
import 'package:exchange_alarmi/themes/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    // 세로모드 고정
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => ExchangeStore()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme
        ),
        themeMode: ThemeMode.system,
        localizationsDelegates: const[
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const[
          Locale('ko', 'KR')
        ],
        locale: const Locale('ko'),
        home: MyApp(),
      ),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1500), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MainBranchPage()
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
