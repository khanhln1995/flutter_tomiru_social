import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Widgets/location_list.dart';


class BottomSheetLocation extends StatelessWidget {
  final TextEditingController locationController;
  final Function(String) onLocationSelected;

  BottomSheetLocation({
    required this.locationController,
    required this.onLocationSelected,
  });

  @override
  Widget build(BuildContext context) {
    List<String> locations = List<String>.generate(8, (index) => 'Tô Hiệu, Hà Đông, Hà Nội');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SizedBox(
            width: 374,
            height: 38,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Nhập vị trí',
                contentPadding: EdgeInsets.all(10),
                filled: true,
                fillColor: const Color(0xF5F5F5),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: LocationList(
            locations: locations,
            onLocationSelected: (selectedLocation) {
              locationController.text = selectedLocation;
              onLocationSelected(selectedLocation);
            },
          ),
        ),
      ],
    );
  }
}
