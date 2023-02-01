import 'package:flutter/material.dart';

class PreferentialDropdown extends StatefulWidget {
  const PreferentialDropdown({Key? key, required this.width, required this.height}) : super(key: key);
  final double width;
  final double height;

  @override
  State<PreferentialDropdown> createState() => _PreferentialDropdownState();
}

class _PreferentialDropdownState extends State<PreferentialDropdown> {
  // 이거 나중에 DB로 읽어오기
  final preferentialList = ['환율우대 없음', '환율우대 90%', '환율우대 80%', '환율우대 70%', '환율우대 60%', '환율우대 50%', '환율우대 40%', '환율우대 30%','환율우대 20%', '환율우대 10%'];
  var dropdownValue = '환율우대 없음';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF7340C2),
              width: 2
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF7340C2),
              width: 2
            ),
          )
        ),
        value: dropdownValue,
        onChanged: (value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        items: preferentialList.map((value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
      ),
    );
  }
}
