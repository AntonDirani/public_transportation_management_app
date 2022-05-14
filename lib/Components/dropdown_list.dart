import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownPlaces extends StatefulWidget {
  final String text;

  const DropDownPlaces(this.text);

  @override
  _DropDownPlacesState createState() => _DropDownPlacesState();
}

class _DropDownPlacesState extends State<DropDownPlaces> {
  String? _chosenValue;
  final places = [
    'Bab Touma',
    'Abbaseen Square',
    'Bab Sharqi',
    'Baghdad Street',
    'Tahreer Square'
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(0),
        child: DropdownButton<String>(
          isDense: true,
          value: _chosenValue,
          style: TextStyle(color: Colors.black),
          items: places.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
            );
          }).toList(),
          hint: Text(
            widget.text,
            style: GoogleFonts.montserrat(
                fontSize: 18, fontWeight: FontWeight.w600),
          ),
          onChanged: (value) {
            setState(() {
              _chosenValue = value;
            });
          },
        ),
      ),
    );
  }
}
