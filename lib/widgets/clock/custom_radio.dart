import 'package:flutter/material.dart';

// class MyRadioOption<T> extends StatelessWidget {
//   final T value;
//   final T? groupValue;
//   final String label;
//   final String text;
//   final ValueChanged<T?> onChanged;

//   const MyRadioOption({
//     required this.value,
//     required this.groupValue,
//     required this.label,
//     required this.text,
//     required this.onChanged,
//   });

//   Widget _buildLabel() {
//     final bool isSelected = value == groupValue;

//     return Container(
//       width: 30,
//       height: 30,
//       decoration: ShapeDecoration(
//         shape: CircleBorder(
//           side: BorderSide(
//             color: Colors.black,
//           ),
//         ),
//         color: isSelected ? Colors.cyan : Colors.white,
//       ),
//       child: Center(
//         child: Text(
//           value.toString(),
//           style: TextStyle(
//             color: isSelected ? Colors.white : Colors.cyan,
//             fontSize: 20,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildText() {
//     return Text(
//       text,
//       style: const TextStyle(color: Colors.black, fontSize: 24),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(8),
//       child: InkWell(
//         onTap: () => onChanged(value),
//         splashColor: Colors.cyan.withOpacity(0.5),
//         child: Padding(
//           padding: EdgeInsets.all(5),
//           child: Row(
//             children: [
//               _buildLabel(),
//               const SizedBox(width: 10),
//               _buildText(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomRadioWidget<T> extends StatelessWidget {
  final T? value;
  final T? groupValue;
  final ValueChanged<T>? onChanged;
  final double width;
  final double height;

  CustomRadioWidget(
      {this.value,
      this.groupValue,
      this.onChanged,
      this.width = 32,
      this.height = 32});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onChanged!(value!);
        },
        child: Container(
          height: this.height,
          width: this.width,
          decoration: ShapeDecoration(
            shape: CircleBorder(),
            gradient: LinearGradient(
              colors: [
                Color(0xFF49EF3E),
                Color(0xFF06D89A),
              ],
            ),
          ),
          child: Center(
            child: Container(
              height: this.height - 8,
              width: this.width - 8,
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                gradient: LinearGradient(
                  colors: value == groupValue
                      ? [
                          Color(0xFFE13684),
                          Color(0xFFFF6EEC),
                        ]
                      : [
                          Theme.of(context).scaffoldBackgroundColor,
                          Theme.of(context).scaffoldBackgroundColor,
                        ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
