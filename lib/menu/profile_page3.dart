import 'package:flutter/material.dart';
import 'package:fluttertest1/components/profile_row.dart';

class ProfilePage3 extends StatelessWidget {
  const ProfilePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 82,
            backgroundColor: Color(0xFFD0D3DA),
            child: Icon(Icons.person, size: 90, color: Colors.white),
          ),
          SizedBox(height: 16),
          Text(
            "Edit photo",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF14784F),
            ),
          ),
          SizedBox(height: 36),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                ProfileRow(label: "Name", value: "Athar Absen 7"),
                Divider(height: 1, color: Color(0xFFE5E5E5)),
                ProfileRow(
                  label: "About",
                  value: "Express yourself in emoji!",
                  valueHijau: true,
                ),
                Divider(height: 1, color: Color(0xFFE5E5E5)),
                ProfileRow(label: "Username", value: "Athar"),
                Divider(height: 1, color: Color(0xFFE5E5E5)),
                ProfileRow(label: "Phone number", value: "+6277 7777 7777"),
                Divider(height: 1, color: Color(0xFFE5E5E5)),
                ProfileRow(label: "Links", value: "Add links", valueHijau: true),
              ],
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
