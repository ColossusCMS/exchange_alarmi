import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/preferential_dropdown.dart';
import '../themes/components_styles.dart';

class ExchangeInfoPage extends StatefulWidget {
  const ExchangeInfoPage({Key? key}) : super(key: key);

  @override
  State<ExchangeInfoPage> createState() => _ExchangeInfoPageState();
}

class _ExchangeInfoPageState extends State<ExchangeInfoPage> {
  getNow() {
    DateTime now = DateTime.now();
    DateFormat dateFormat = DateFormat('yyyy년 M월 d일 (E)', 'ko');
    var strToday = dateFormat.format(now);
    return strToday;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
              height: 50,
              child: Text(
                  getNow(),
                  style: ComponentsStyles.dateTextStyle
              )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0XFF8080ff),
                  width: 3,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text('(매매기준율)'),
                        ),
                        SizedBox(),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Text('(단위 : 원)')
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 72,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Container(
                            height: 72,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Color(0XFF8080ff),
                                  width: 3
                                ),
                                right: BorderSide(
                                  color: Color(0XFF8080ff),
                                  width: 3
                                )
                              )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1
                                    )
                                  ),
                                  child: Image.asset('icons/flags/png/jp.png', package: 'country_icons', width: 30, ),
                                ),
                                Text('일본(JPY)', style: ComponentsStyles.bodyTextStyle1,),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Color(0XFF8080ff),
                                        width: 3
                                    ),
                                )
                            ),
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Text('9XX.XX', style: ComponentsStyles.exchangeTextStyle,),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("환율 계산기", style: ComponentsStyles.bodyTextStyle2),
                  PreferentialDropdown(width: 150, height: 50,),
                ],
              ),
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
    );
  }
}
