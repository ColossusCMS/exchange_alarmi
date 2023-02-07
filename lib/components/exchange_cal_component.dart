import 'dart:math';

import 'package:exchange_alarmi/components/preferential_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'country_component.dart';

// 환율 계산기 컴포넌트
class ExchangeCalComponent extends StatefulWidget {
  const ExchangeCalComponent({Key? key}) : super(key: key);

  @override
  State<ExchangeCalComponent> createState() => _ExchangeCalComponentState();
}

class _ExchangeCalComponentState extends State<ExchangeCalComponent> {
  TextEditingController exchangingController = TextEditingController();
  TextEditingController exchangeController = TextEditingController();

  convertText(String inParam) {
    var format = NumberFormat('###,###,###.##');
    return format.format(int.parse(inParam));
  }

  @override
  void dispose() {
    exchangingController.dispose();
    exchangeController.dispose();
    super.dispose();
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
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2)
                  ),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 2)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 10, 0, 5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.pink, width: 2)
                              ),
                              child: Text('환전할 금액', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 120,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red, width: 2)
                                  ),
                                  alignment: Alignment.center,
                                  child: Text('환전할 금액', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                  // color: Colors.greenAccent,
                                ),
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: CountryComponent(countryName: 'kr', borderWidth: 1),
                                ),
                                Flexible(
                                  flex: 2,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue, width: 2)
                                    ),
                                    child: TextField(
                                      controller: exchangingController,
                                      onEditingComplete: () {
                                        setState(() {
                                          exchangingController.text = convertText(exchangingController.text);
                                        });
                                      },
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                                      textAlign: TextAlign.end,
                                      keyboardType: TextInputType.number,
                                    ),
                                    // color: Colors.blueGrey,
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.orange, width: 2)
                                  ),
                                  alignment: Alignment.center,
                                  child: Text('달러', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
                                  // color: Colors.cyanAccent,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 72,
                          child: Transform.rotate(
                            angle: 90 * pi/180,
                            child: Icon(Icons.arrow_circle_right_rounded, size: 50, color: Color(0xFF405AA9)),
                          )
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 2)
                        ),
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
