import 'dart:math';

import 'package:exchange_alarmi/components/country_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../themes/components_styles.dart';

// 환율정보 박스
class ExchangeInfoBox extends StatefulWidget {
  const ExchangeInfoBox({Key? key}) : super(key: key);

  @override
  State<ExchangeInfoBox> createState() => _ExchangeInfoBoxState();
}

class _ExchangeInfoBoxState extends State<ExchangeInfoBox> {
  getNow() {
    DateTime now = DateTime.now();
    DateFormat dateFormat = DateFormat('yyyy년 M월 d일 (E)', 'ko');
    var strToday = dateFormat.format(now);
    return strToday;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 5),
            child: Row(
              children: [
                Text("환율정보", style: TextStyle(fontSize: 24),),
                SizedBox(width: 10,),
                Text(
                  getNow(),
                  style: ComponentsStyles.dateTextStyle,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
                color: context.theme.colorScheme.surfaceVariant,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text('(매매기준율)'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 15),
                  // height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CountryContainer(countryCode: 'jp',),
                      Flexible( // =
                        fit: FlexFit.tight,
                        flex: 1,
                        child: SizedBox(
                            height: 72,
                            child: Transform.rotate(
                              angle: 90 * pi/180,
                              child: Icon(Icons.pause_circle, size: 50, color: Color(0xFF405AA9)),
                            )
                        ),
                      ),
                      CountryContainer(countryCode: 'kr',),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
