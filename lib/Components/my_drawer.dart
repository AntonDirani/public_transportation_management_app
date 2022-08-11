import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_transport_01/Screens/complaint.dart';
import 'package:pub_transport_01/Screens/news.dart';
import 'package:pub_transport_01/Screens/sign_in.dart';
import 'package:pub_transport_01/Screens/trips.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
            subtitle: Text('Show all trips'),
            leading: SvgPicture.asset(
              'assets/route_icon1.svg',
              width: mediaSize.width / 11,
              height: mediaSize.width / 11,
            ),
            title: Text(
              'Trips',
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, Trips.id);
            },
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
            leading: Icon(
              Icons.feedback,
              size: mediaSize.width / 11,
              color: mainColor,
            ),
            subtitle: Text('File a complaint'),
            title: Text('Complaints',
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.w500)),
            onTap: () {
              Navigator.pushNamed(context, ComplaintScreen.id);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/newsIcon.svg',
              width: mediaSize.width / 11,
              height: mediaSize.width / 11,
              color: mainColor,
            ),
            subtitle: Text('View latest news'),
            title: Text('News',
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.w500)),
            onTap: () {
              Navigator.pushReplacementNamed(context, NewsScreen.id);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              size: mediaSize.width / 11,
              color: mainColor,
            ),
            subtitle: Text('Sign in with different account'),
            title: Text('Log out',
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.w500)),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              Navigator.pushReplacementNamed(context, SignIn.id);
            },
          ),
        ],
      ),
    );
  }
}
