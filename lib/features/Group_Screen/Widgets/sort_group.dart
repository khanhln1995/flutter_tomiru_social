import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

class SortGroup extends StatefulWidget {
  const SortGroup({Key? key}) : super(key: key);

  @override
  State<SortGroup> createState() => _SortGroupState();
}

class _SortGroupState extends State<SortGroup> {
  int? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = 0;
  }

  Widget TitleModel(IconData icon, String title) {
    double iconSize = MediaQuery.of(context).size.width * 0.065;
    double sizedBoxWidth = MediaQuery.of(context).size.width * 0.032;
    double fontSize = MediaQuery.of(context).size.width * 0.039;

    return Row(
      children: [
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(width: sizedBoxWidth),
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          value: 1,
          groupValue: selectedValue,
          title: TitleModel(Icons.share, "Truy cập thường xuyên nhất"),
          onChanged: (int? val) {
            setState(() {
              selectedValue = val;
            });
          },
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.trailing,
          fillColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.yellowAccent[700]!;
            }
            return Colors.grey[300]!;
          }),
           // Color.fromARGB(1, 29, 155, 240)
        ),
        RadioListTile(
          value: 2,
          groupValue: selectedValue,
          title: TitleModel(
              FontAwesome.sort_alpha_asc, "Nhóm A - Z"),
          onChanged: (int? val) {
            setState(() {
              selectedValue = val;
            });
          },
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.trailing,
          fillColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.yellowAccent[700]!;
            }
            return Colors.grey[300]!;
          }),
        ),
        RadioListTile(
          value: 3,
          groupValue: selectedValue,
          title: TitleModel(
              FontAwesome.clock_o, "Tham gia gần đây nhất"),
          onChanged: (int? val) {
            setState(() {
              selectedValue = val;
            });
          },
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.trailing,
          fillColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.yellowAccent[700]!;
            }
            return Colors.grey[300]!;
          }),
        ),
      ],
    );
  }
}
