import 'package:flutter/material.dart';

// 국기 및 국가명 컴포넌트
// 드롭다운으로 업그레이드
class CountryComponent extends StatefulWidget {
  const CountryComponent({Key? key, required this.countryName, required this.borderWidth}) : super(key: key);
  final String countryName;
  final double borderWidth;

  @override
  State<CountryComponent> createState() => _CountryComponentState();
}

class _CountryComponentState extends State<CountryComponent> {
  @override
  Widget build(BuildContext context) {
    return Container( // 국기 + 국가명
      decoration: BoxDecoration(
        border: Border.all(
          width: widget.borderWidth,
          color: Colors.red
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.asset('icons/flags/png/${widget.countryName}.png', package: 'country_icons',fit: BoxFit.cover, height: 30, width: 30,),
          ),
          Container(   // 국가명
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Text('대한민국 (KRW)', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
          ),
        ],
      ),
    );
  }
}
