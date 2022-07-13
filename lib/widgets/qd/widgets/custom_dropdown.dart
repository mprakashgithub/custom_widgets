import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropDown extends StatefulWidget {
  List<String>? listItems = [];
  Widget? hintText;
  String? selectedOption;
  CustomDropDown({this.listItems, this.hintText, this.selectedOption});
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? _dropDownValue;

  TextEditingController teachernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        // padding: EdgeInsets.only(left: 20, right: 20),
        width: _width,
        height: 50,
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              hint: widget.hintText!, // Not necessary for Option 1
              value: _dropDownValue,
              onChanged: (newValue) {
                setState(() {
                  _dropDownValue = newValue.toString();
                  widget.selectedOption = _dropDownValue;
                });
              },
              items: widget.listItems!.map((item) {
                return DropdownMenuItem(
                  child: new Text(item),
                  value: item,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
