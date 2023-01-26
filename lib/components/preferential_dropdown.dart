import 'package:flutter/material.dart';

class PreferentialDropdown extends StatefulWidget {
  const PreferentialDropdown({Key? key}) : super(key: key);

  @override
  State<PreferentialDropdown> createState() => _PreferentialDropdownState();
}

class _PreferentialDropdownState extends State<PreferentialDropdown> {
  final preferentialList = ['환율우대 없음', '환율우대 90%', '환율우대 80%', '환율우대 70%', '환율우대 60%', '환율우대 50%', '환율우대 40%', '환율우대 30%','환율우대 20%', '환율우대 10%'];
  var selectedList = '환율우대 없음';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedList,
      items: preferentialList.map(
            (value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
      onChanged: (value) {
        setState(() {
          selectedList = value!;
        });
      },
    );
  }
}
