import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '환율 알라미',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const[
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const[
        Locale('ko', 'KR')
      ],
      locale: const Locale('ko'),
      home: const MyHomePage(title: '환율 알라미'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, this.pageIndex = 0});
  final int pageIndex;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? currentBackPressTime;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _selectedPageName = ['환율 정보', '', '설정'];
  int _selectedIndex = 0;
  var _controller;
  final _valueList = ['환율우대 없음', '환율우대 90%', '환율우대 80%', '환율우대 70%', '환율우대 60%', '환율우대 50%', '환율우대 40%', '환율우대 30%','환율우대 20%', '환율우대 10%'];
  var _selectedValue = '환율우대 없음';

  @override
  initState() {
    super.initState();
    _selectedIndex = widget.pageIndex;
    _controller = PageController(initialPage: _selectedIndex);
  }

  onItemTapped(index) {
    _controller.jumpToPage(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  getNow() {
    DateTime now = DateTime.now();
    DateFormat dateFormat = DateFormat('yyyy-MM-dd (E)', 'ko');
    var strToday = dateFormat.format(now);
    return strToday;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(getNow()),
              ),
              SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('매매기준율'),
                          SizedBox(),
                          Text('100엔')
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Container(
                              child: Text('일본(JPY)'),
                              color: Colors.redAccent,
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            fit: FlexFit.tight,
                            child: Container(
                              child: Text('9XX.XX원'),
                              color: Colors.lightBlueAccent,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              DropdownButton(
                value: _selectedValue,
                items: _valueList.map(
                    (value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    },
                ).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
              Column(
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Container(
                            child: Text('환전할 금액'),
                            color: Colors.greenAccent,
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          fit: FlexFit.tight,
                          child: Container(
                            child: TextFormField(

                            ),
                            color: Colors.blueGrey,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            child: Text('엔'),
                            color: Colors.cyanAccent,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Container(
                            child: Text('환전 비용'),
                            color: Colors.greenAccent,
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          fit: FlexFit.tight,
                          child: Container(
                            child: TextField(),
                            color: Colors.blueGrey,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            child: Text('원'),
                            color: Colors.cyanAccent,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.currency_exchange),
              label: '환율 정보',
              backgroundColor: Color(0xFFB3E5FC)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.playlist_add),
              label: '',
              backgroundColor: Color(0xFFFFECB3)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '설정',
              backgroundColor: Color(0xFFF8BBD0)
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: onItemTapped,
      ),
    );
  }
}
