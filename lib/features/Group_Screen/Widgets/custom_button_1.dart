import 'package:flutter/material.dart';

class CustomButtonTime extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButtonTime({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Padding(padding: EdgeInsets.only(left: 20, right: 20),
    child:SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
          backgroundColor: Colors.grey[300],
          foregroundColor: Colors.black,
          // minimumSize: const Size(165, 31),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: Colors.black,
          ),
        ),
      ),
    ) ,
    );
    
  }
}