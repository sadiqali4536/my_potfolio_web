import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillBadge extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool useImage;
  final double horizontalPadding;
  final double verticalPadding;

  const SkillBadge({
    super.key,
    required this.title,
    this.imagePath = '',
    this.useImage = false,
    this.horizontalPadding = 30,
    this.verticalPadding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Use image if provided, else fallback icon
          (useImage && imagePath.isNotEmpty)
              ? Image.asset(imagePath, height: 24, width: 24)
              : _getSkillIcon(title),
          SizedBox(width: 8),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- Fallback Skill Icons ----------------
  Widget _getSkillIcon(String title) {
    IconData iconData;
    Color iconColor;

    switch (title.toLowerCase()) {
      case 'flutter':
        iconData = Icons.flutter_dash;
        iconColor = Color(0xFF02569B);
        break;
      case 'dart':
        iconData = Icons.code;
        iconColor = Color(0xFF0175C2);
        break;
      case 'figma':
        iconData = Icons.design_services;
        iconColor = Color(0xFFF24E1E);
        break;
      case 'github':
        iconData = Icons.code_outlined;
        iconColor = Color(0xFF181717);
        break;
      case 'firebase':
        iconData = Icons.local_fire_department;
        iconColor = Color(0xFFFFCA28);
        break;
      case 'mysql':
        iconData = Icons.storage;
        iconColor = Color(0xFF4479A1);
        break;
      case 'bloc':
        iconData = Icons.view_module;
        iconColor = Color(0xFF00D0FF);
        break;
      case 'state management':
        iconData = Icons.settings_suggest;
        iconColor = Color(0xFF6200EA);
        break;
      case 'html':
        iconData = Icons.html;
        iconColor = Color(0xFFE34F26);
        break;
      case 'c':
        iconData = Icons.memory;
        iconColor = Color(0xFF00599C);
        break;
      case 'arduino ide':
        iconData = Icons.settings_input_component;
        iconColor = Color(0xFF00979D);
        break;
      case 'authentication':
        iconData = Icons.verified_user;
        iconColor = Color(0xFF4CAF50);
        break;
      case 'api':
        iconData = Icons.api;
        iconColor = Color(0xFFFF6F00);
        break;
      default:
        iconData = Icons.star;
        iconColor = Colors.blue;
    }

    return Icon(iconData, size: 24, color: iconColor);
  }
}
