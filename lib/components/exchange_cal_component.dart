import 'dart:math';

import 'package:exchange_alarmi/components/preferential_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'country_container.dart';

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

  getData() {
    print(exchangeController.text);
    print(exchangingController.text);
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
            child: Text("환전 계산기", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
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
                // TextButton(onPressed: () {getData();}, child: Text('클릭')),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: PreferentialDropdown(width: 150, height: 50,),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 15),
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.grey, width: 2)
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CountryContainer(
                          countryCode: 'jp',
                          subTitle: '환전할 금액',
                          editingController: exchangingController,
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
                      CountryContainer(
                          countryCode: 'kr',
                          subTitle: '환전 비용',
                          editingController: exchangeController
                      ),
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
