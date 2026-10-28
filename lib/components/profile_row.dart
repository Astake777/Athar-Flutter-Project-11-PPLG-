import 'package:flutter/material.dart';

class ProfileRow extends StatelessWidget {
  final String label;
  final String value;
  final bool valueHijau;

  const ProfileRow({
    super.key,
    required this.label,
    required this.value,
    this.valueHijau = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Row(
        children: [
          Text(label, style: TextStyle(fontSize: 17, color: Color(0xFF1F2430))),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: valueHijau ? Color(0xFF14784F) : Color(0xFF6B6F76),
              ),
            ),
          ),
          SizedBox(width: 6),
          Icon(Icons.chevron_right, color: Color(0xFF6B6F76)),
        ],
      ),
    );
  }
}
