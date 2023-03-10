import 'package:exchange_alarmi/pages/setting_page.dart';
import 'package:exchange_alarmi/themes/components_styles.dart';
import 'package:flutter/material.dart';

import 'exchange_info_page.dart';

class MainBranchPage extends StatefulWidget {
  const MainBranchPage({Key? key, this.pageIndex = 0}) : super(key: key);
  final pageIndex;

  @override
  State<MainBranchPage> createState() => _MainBranchPageState();
}

class _MainBranchPageState extends State<MainBranchPage> {
  DateTime? currentBackPressTime;
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _selectedPageName = ['환율 알라미', '설정'];
  int _selectedIndex = 0;
  var _controller;

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

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() {
      DateTime now = DateTime.now();
      if(currentBackPressTime == null || now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
        currentBackPressTime = now;
        // CustomSnackbar.snackbar(context, '뒤로 버튼을 한 번 더 누르시면 종료됩니다.', 'normal');
        return Future.value(false);
      }
      return Future.value(true);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: (_selectedIndex == 0) ? Color(0xFFE1DFFF) : Color(0xFFFFDAD6),
        title: Row(
          children: [
            Icon(Icons.currency_exchange, color: Color(0xFF22CCCC)),
            SizedBox(width: 10,),
            Text(
              _selectedPageName[_selectedIndex],
              style: ComponentsStyles.pageTitleStyle,
            ),
          ],
        ),

      ),
      body:
      WillPopScope(
        onWillPop: onWillPop,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [
            ExchangeInfoPage(),
            SettingPage(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          onItemTapped(index);
        },
        backgroundColor: (_selectedIndex == 0) ? Color(0xFFE1DFFF) : Color(0xFFFFDAD6),
        selectedIndex: _selectedIndex,
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.currency_exchange),
              label: '환율 알라미',
          ),
          NavigationDestination(
              icon: Icon(Icons.settings),
              label: '설정',
          ),
        ],
      )
    );
  }
}
