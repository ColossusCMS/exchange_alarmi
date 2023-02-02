import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:math';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                        margin: EdgeInsets.fromLTRB(10, 10, 0, 5),
                        child: Text('(매매기준율)'),
                      ),
                      SizedBox(
                        height: 82,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible( // 국외환
                              fit: FlexFit.tight,
                              flex: 4,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                height: 72,
                                child: Row( // 드롭다운으로 바꿔서
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible( // 국기 + 국가명
                                      fit: FlexFit.tight,
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(30.0),
                                            child: Image.asset('icons/flags/png/jp.png', package: 'country_icons',fit: BoxFit.cover, height: 30, width: 30,),
                                          ),
                                          Container(   // 국가명
                                            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                            child: Text('일본 (JPY)', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible( // 금액 입력창 + 변환 텍스트
                                      fit: FlexFit.tight,
                                      flex: 1,
                                      child: Container(
                                        color: Color(0x55EEEEEE),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: TextField(

                                              )
                                            ),
                                            Container(
                                              alignment: Alignment.centerRight,
                                              child: Text('100엔')
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                            Flexible( // 국외환
                              fit: FlexFit.tight,
                              flex: 4,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                height: 72,
                                child: Row( // 드롭다운으로 바꿔서
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible( // 국기 + 국가명
                                      fit: FlexFit.tight,
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(30.0),
                                            child: Image.asset('icons/flags/png/kr.png', package: 'country_icons',fit: BoxFit.cover, height: 30, width: 30,),
                                          ),
                                          Container(   // 국가명
                                              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                              child: Text('대한민국 (KRW)', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible( // 금액 입력창 + 변환 텍스트
                                      fit: FlexFit.tight,
                                      flex: 1,
                                      child: Container(
                                        color: Color(0x55EEEEEE),
                                        child: Column(
                                          children: [
                                            Container(
                                                child: TextField(

                                                )
                                            ),
                                            Container(
                                                alignment: Alignment.centerRight,
                                                child: Text('1000원')
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
                        // color: Colors.greenAccent,
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Container(
                        child: TextFormField(

                        ),
                        // color: Colors.blueGrey,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        child: Text('엔'),
                        // color: Colors.cyanAccent,
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
                        // color: Colors.greenAccent,
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Container(
                        child: TextField(),
                        // color: Colors.blueGrey,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        child: Text('원'),
                        // color: Colors.cyanAccent,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
