import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screens/my_google_map.dart';
import 'constants.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(
              height: mediaSize.height / 4,
              width: mediaSize.width / 2,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/Logo.png'))),
            ),
          ),
          ListTile(
            subtitle: Text('Open Google Maps'),
            leading: Icon(
              Icons.map,
              size: mediaSize.width / 11,
              color: mainColor,
            ),
            title: Text(
              'Map',
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pushNamed(context, MyMap.id);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
