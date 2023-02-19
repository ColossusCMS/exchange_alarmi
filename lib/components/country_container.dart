import 'package:flutter/material.dart';

import 'country_component.dart';
import 'exchange_data_field.dart';

// 국가 정보 + 환율 필드
class CountryContainer extends StatefulWidget {
  const CountryContainer({Key? key, required this.countryCode, required this.subTitle, required this.editingController}) : super(key: key);
  final String countryCode;
  final String subTitle;
  final TextEditingController editingController;

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
        // margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: Colors.green,
          //   width: 2
          // )
        ),
        // height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.pink,
                //   width: 2
                // )
              ),
              child: Text('(${widget.subTitle})', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: CountryComponent(countryCode: widget.countryCode, borderWidth: 0),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: ExchangeDataField(countryCode: widget.countryCode, controller: widget.editingController,),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
