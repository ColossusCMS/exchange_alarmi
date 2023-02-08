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
    bool isChecked = false;
    Color getColor(Set<MaterialState> states) {
      Set<MaterialState> interactiveStates = {
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if(states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text("환율정보", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),
                      Text(
                        getNow(),
                        style: ComponentsStyles.dateTextStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.refresh), label: Text('새로고침'))
                )
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
                  child: Row(
                    children: [
                      Checkbox(
                          value: isChecked,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          }),
                      Text('선택한 국가만 보기'),
                      SizedBox(width: 20,),
                      ElevatedButton(onPressed: () {}, child: Text('국가선택'))
                    ],
                  )
                ),
                RefreshIndicator(
                  onRefresh: () async {

                  },
                  child: SizedBox(
                    height: 300,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Text('Content Number : $index');
                      },
                      itemCount: 50,
                    ),
                  )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
