import 'package:flutter/material.dart';

import 'country_component.dart';
import 'exchange_data_field.dart';

// 국가 정보 + 환율 필드
class CountryContainer extends StatefulWidget {
  const CountryContainer({Key? key, required this.countryCode}) : super(key: key);
  final String countryCode;

  @override
  State<CountryContainer> createState() => _CountryContainerState();
}

class _CountryContainerState extends State<CountryContainer> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 4,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
        height: 72,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: CountryComponent(countryName: widget.countryCode, borderWidth: 1),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ExchangeDataField(countryCode: widget.countryCode),
            )
          ],
        ),
      ),
    );
  }
}
