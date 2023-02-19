import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../stores/exchange_store.dart';

// 국기 및 국가명 컴포넌트
// 드롭다운으로 업그레이드
class CountryComponent extends StatefulWidget {
  const CountryComponent({Key? key, required this.countryCode, required this.borderWidth}) : super(key: key);
  final String countryCode;
  final double borderWidth;

  @override
  State<CountryComponent> createState() => _CountryComponentState();
}

class _CountryComponentState extends State<CountryComponent> {
  var _countryName = '';
  var _countryInitial = '';

  getCountryData() async {
    await context.read<ExchangeStore>().getCountryCode(widget.countryCode);
    setState(() {
      _countryName = context.read<ExchangeStore>().countryData[0];
      _countryInitial = context.read<ExchangeStore>().countryData[1];
    });
    print('component check');
  }

  @override
  Widget build(BuildContext context) {
    return Container( // 국기 + 국가명
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     width: widget.borderWidth,
      //     color: Colors.red
      //   )
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.asset('icons/flags/png/${widget.countryCode}.png', package: 'country_icons',fit: BoxFit.cover, height: 30, width: 30,),
          ),
          Container(   // 국가명
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: FutureBuilder(
                future: getCountryData(),
                builder: (context, snapshot) {
                  return Text('$_countryName ($_countryInitial)', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),);
                }
              ),
          ),
        ],
      ),
    );
  }
}
