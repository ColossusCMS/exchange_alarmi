import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 환율 데이터 필드
class ExchangeDataField extends StatefulWidget {
  const ExchangeDataField({Key? key, required this.countryCode}) : super(key: key);
  final String countryCode;

  @override
  State<ExchangeDataField> createState() => _ExchangeDataFieldState();
}

class _ExchangeDataFieldState extends State<ExchangeDataField> {
  @override
  Widget build(BuildContext context) {
    return Container( // 금액 입력창 + 변환 텍스트
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.blue,
              width: 2
          ),
          color: context.theme.colorScheme.surfaceVariant,
          boxShadow: [
            BoxShadow(
                color: Color(0xB3D7D7D7),
                blurRadius: 5.0,
                spreadRadius: 0.0,
                offset: Offset(5, 10)
            ),
          ]
      ),
      child: TextField(
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        textAlign: TextAlign.end,
        decoration: InputDecoration(
          counter: Text('100엔'),
          contentPadding: EdgeInsets.fromLTRB(0, 5, 5, 0),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
