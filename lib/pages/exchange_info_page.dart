import 'package:exchange_alarmi/components/exchange_cal_component.dart';
import 'package:exchange_alarmi/components/exchange_info_box.dart';
import 'package:flutter/material.dart';

class ExchangeInfoPage extends StatefulWidget {
  const ExchangeInfoPage({Key? key}) : super(key: key);

  @override
  State<ExchangeInfoPage> createState() => _ExchangeInfoPageState();
}

class _ExchangeInfoPageState extends State<ExchangeInfoPage> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30,),
          ExchangeInfoBox(),
          ExchangeCalComponent(),
        ],
      ),
    );
  }
}
