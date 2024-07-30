import 'package:flutter/material.dart';

class LocationList extends StatelessWidget {
  final List<String> locations;
  final Function(String) onLocationSelected;

  LocationList({required this.locations, required this.onLocationSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            onLocationSelected(locations[index]);
            Navigator.pop(context); // Đóng bottom sheet
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
            ),
            title: Text(
              locations[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              locations[index],
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
        );
      },
    );
  }
}
