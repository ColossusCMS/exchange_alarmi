import 'package:flutter/material.dart';

// 환율 정보 박스
class ExchangeRateInfoBox extends StatefulWidget {
  const ExchangeRateInfoBox({Key? key}) : super(key: key);

  @override
  State<ExchangeRateInfoBox> createState() => _ExchangeRateInfoBoxState();
}

class _ExchangeRateInfoBoxState extends State<ExchangeRateInfoBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset('icons/flags/png/kr.png', package: 'country_icons',fit: BoxFit.cover, height: 30, width: 30,),
              ),
            ),
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.lightBlueAccent,
                    width: 2
                  )
                ),
                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Text('대한민국 (KRW)', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
              ),
            ),
            Flexible(
              flex: 8,
              fit: FlexFit.tight,
              child: Container(   // 국가명
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.lightBlueAccent,
                        width: 2
                    )
                ),
                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Text('9880.00원', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ),
            ),
          ],
        ),
        trailing: Text('알림설정'),
      ),
    );
  }
}
