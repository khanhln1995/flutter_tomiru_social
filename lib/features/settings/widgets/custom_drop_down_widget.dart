import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_color_widget.dart'
    as CustomAppColor;

class CustomDropdown extends StatefulWidget {
  CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  List<String> items = ['Tiếng việt', 'Tiếng anh'];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon:
          Icon(CupertinoIcons.chevron_down, color: CustomAppColor.iconTrailing),
      value: selectedValue,
      borderRadius: BorderRadius.circular(16),
      dropdownColor: CustomAppColor.backgroundListTile,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
      },
      underline: Container(),
      items: items.map((e) {
        return DropdownMenuItem(
          value: e,
          onTap: () {},
          child: Text(e),
        );
      }).toList(),
      selectedItemBuilder: (BuildContext context) {
        return items.map<Widget>((String value) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  value,
                  style: TextStyle(
                    color: CustomAppColor.iconTrailing,
                  ),
                ),
              ),
            ],
          );
        }).toList();
      },
    );
  }
}
