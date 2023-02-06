import 'package:exchange_alarmi/components/preferential_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 환율 계산기 컴포넌트
class ExchangeCalComponent extends StatefulWidget {
  const ExchangeCalComponent({Key? key}) : super(key: key);

  @override
  State<ExchangeCalComponent> createState() => _ExchangeCalComponentState();
}

class _ExchangeCalComponentState extends State<ExchangeCalComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 5),
            child: Text("환전 계산기", style: TextStyle(fontSize: 24),),
          ),
          Container(
            // height: 200,
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
                  child: PreferentialDropdown(width: 150, height: 50,),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 15),
                  child:  Column(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
