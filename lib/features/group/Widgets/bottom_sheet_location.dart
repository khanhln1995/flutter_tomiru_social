import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/group/Widgets/location_list.dart';

class BottomSheetLocation extends StatelessWidget {
  final TextEditingController locationController;
  final Function(String) onLocationSelected;

  const BottomSheetLocation({
    super.key,
    required this.locationController,
    required this.onLocationSelected,
  });

  @override
  Widget build(BuildContext context) {
    List<String> locations =
        List<String>.generate(8, (index) => 'Tô Hiệu, Hà Đông, Hà Nội');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SizedBox(
            width: 374,
            height: 38,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Nhập vị trí',
                contentPadding: const EdgeInsets.all(10),
                filled: true,
                fillColor: const Color(0x00f5f5f5),
                prefixIcon: const Icon(Icons.search),
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
