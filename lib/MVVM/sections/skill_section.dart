// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// /// ---------- DATA LIST ----------
// final List<Map<String, dynamic>> skills = [
//   {'name': 'Flutter', 'image': 'assets/images/flutter-logo.png', 'useImage': true},
//   {'name': 'Dart', 'image': 'assets/images/Dart.png', 'useImage': true},
//   {'name': 'Figma', 'image': '', 'useImage': false},
//   {'name': 'GitHub', 'image': '', 'useImage': false},
//   {'name': 'Firebase', 'image': '', 'useImage': false},
//   {'name': 'MySQL', 'image': '', 'useImage': false},
//   {'name': 'BLoC', 'image': '', 'useImage': false},
//   {'name': 'State Management', 'image': '', 'useImage': false},
//   {'name': 'HTML', 'image': '', 'useImage': false},
//   {'name': 'C', 'image': '', 'useImage': false},
//   {'name': 'Arduino IDE', 'image': '', 'useImage': false},
//   {'name': 'Authentication', 'image': '', 'useImage': false},
//   {'name': 'API', 'image': '', 'useImage': false},
// ];

// /// ---------- RESPONSIVE WRAPPER ----------
// class SkillSection extends StatelessWidget {
//   const SkillSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenwidth = MediaQuery.of(context).size.width;

//     if (screenwidth < 600) {
//       return const mobile__skill();
//     } else if (screenwidth < 1024) {
//       return const tablet_skill();
//     } else if (screenwidth < 1440) {
//       return const desktop_skill();
//     } else  if(screenwidth >= 1440){
//       return const Largedesktop_skill();
//     }else{
//       return mobile__skill();
//     }
//   }
// }

// /// ---------- MOBILE ----------
// class mobile__skill extends StatelessWidget {
//   const mobile__skill({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return Container(
//       height: height * 0.65,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFF00A8E8), Color(0xFF0085C7)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: Column(
//         children: [
//           SizedBox(height: height * 0.1),
//           _titleSection(fontSize: 30, subFont: 16),
//           SizedBox(height: height * 0.05),
//           Wrap(
//             spacing: 14,
//             runSpacing: 14,
//             alignment: WrapAlignment.center,
//             children: skills.map((s) {
//               return _SkillBadge(title: s['name']);
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// ---------- TABLET ----------
// class tablet_skill extends StatelessWidget {
//   const tablet_skill({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return Container(
//       height: height * 0.65,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFF00A8E8), Color(0xFF0085C7)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: Column(
//         children: [
//           SizedBox(height: height * 0.1),
//           _titleSection(fontSize: 34, subFont: 18),
//           SizedBox(height: height * 0.05),
//           Wrap(
//             spacing: 18,
//             runSpacing: 18,
//             alignment: WrapAlignment.center,
//             children: skills.map((s) {
//               return _SkillBadge(title: s['name']);
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// ---------- DESKTOP ----------
// class desktop_skill extends StatelessWidget {
//   const desktop_skill({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return Container(
//       height: height * 0.65,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFF00A8E8), Color(0xFF0085C7)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: Column(
//         children: [
//           SizedBox(height: height * 0.1),
//           _titleSection(fontSize: 36, subFont: 20),
//           SizedBox(height: height * 0.05),
//           Wrap(
//             spacing: 20,
//             runSpacing: 16,
//             alignment: WrapAlignment.center,
//             children: skills.map((s) {
//               return _SkillBadge(title: s['name']);
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// ---------- LARGE DESKTOP ----------
// class Largedesktop_skill extends StatelessWidget {
//   const Largedesktop_skill({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return Container(
//       height: height * 0.65,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFF00A8E8), Color(0xFF0085C7)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: Column(
//         children: [
//           SizedBox(height: height * 0.1),
//           _titleSection(fontSize: 40, subFont: 22),
//           SizedBox(height: height * 0.05),
//           Wrap(
//             spacing: 24,
//             runSpacing: 20,
//             alignment: WrapAlignment.center,
//             children: skills.map((s) {
//               return _SkillBadge(title: s['name']);
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// ---------- TITLE SECTION (COMMON) ----------
// Widget _titleSection({required double fontSize, required double subFont}) {
//   return Column(
//     children: [
//       RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: "Technical ",
//               style: GoogleFonts.poppins(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             TextSpan(
//               text: "Skills",
//               style: GoogleFonts.poppins(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xFFFFE048),
//               ),
//             ),
//           ],
//         ),
//       ),
//       const SizedBox(height: 8),
//       Text(
//         "Tools and technologies I work with",
//         style: GoogleFonts.poppins(
//           fontSize: subFont,
//           color: Colors.white,
//         ),
//       ),
//     ],
//   );
// }

// /// ---------- BADGE WIDGET ----------
// class _SkillBadge extends StatelessWidget {
//   final String title;
//   const _SkillBadge({required this.title});

//   @override
//   Widget build(BuildContext context) {
//     final icon = _getSkillIcon(title);

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.15),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon.$1, color: icon.$2, size: 22),
//           const SizedBox(width: 8),
//           Text(
//             title,
//             style: GoogleFonts.poppins(
//               fontSize: 16,
//               color: Colors.black87,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// ---------- ICON LOGIC ----------
//   (IconData, Color) _getSkillIcon(String title) {
//     switch (title.toLowerCase()) {
//       case 'flutter':
//         return (Icons.flutter_dash, const Color(0xFF02569B));
//       case 'dart':
//         return (Icons.code, const Color(0xFF0175C2));
//       case 'figma':
//         return (Icons.design_services, const Color(0xFFF24E1E));
//       case 'github':
//         return (Icons.code_outlined, const Color(0xFF181717));
//       case 'firebase':
//         return (Icons.local_fire_department, const Color(0xFFFFCA28));
//       case 'mysql':
//         return (Icons.storage, const Color(0xFF4479A1));
//       case 'bloc':
//         return (Icons.view_module, const Color(0xFF00D0FF));
//       case 'state management':
//         return (Icons.settings_suggest, const Color(0xFF6200EA));
//       case 'html':
//         return (Icons.html, const Color(0xFFE34F26));
//       case 'c':
//         return (Icons.memory, const Color(0xFF00599C));
//       case 'arduino ide':
//         return (Icons.settings_input_component, const Color(0xFF00979D));
//       case 'authentication':
//         return (Icons.verified_user, const Color(0xFF4CAF50));
//       case 'api':
//         return (Icons.api, const Color(0xFFFF6F00));
//       default:
//         return (Icons.star, Colors.blueAccent);
//     }
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// /// ---------- DATA LIST ----------
// final List<Map<String, dynamic>> skills = [
//   {'name': 'Flutter', 'image': 'assets/images/flutter-logo.png', 'useImage': true},
//   {'name': 'Dart', 'image': 'assets/images/Dart.png', 'useImage': true},
//   {'name': 'Figma', 'image': 'assets/images/figma.png', 'useImage': true},
//   {'name': 'GitHub', 'image': 'assets/images/Git_icon.png', 'useImage': true},
//   {'name': 'Firebase', 'image': 'assets/images/Firebase.png', 'useImage': true},
//   {'name': 'MySQL', 'image': '', 'useImage': false},
//   {'name': 'BLoC', 'image': 'assets/images/bloc.png', 'useImage': true},
//   {'name': 'State Management', 'image': '', 'useImage': false},
//   {'name': 'HTML', 'image': 'assets/images/html-5.png', 'useImage': true},
//   {'name': 'C', 'image': 'assets/images/c-.png', 'useImage': true},
//   {'name': 'Arduino IDE', 'image': 'assets/images/arduino.png', 'useImage': true},
//   {'name': 'Authentication', 'image': '', 'useImage': false},
//   {'name': 'API', 'image': 'assets/images/Api.png', 'useImage': true},
// ];

// /// ---------- RESPONSIVE WRAPPER ----------
// class SkillSection extends StatelessWidget {
//   const SkillSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     if (screenWidth < 600) {
//       return const MobileSkill();
//     } else if (screenWidth < 1024) {
//       return const TabletSkill();
//     } else if (screenWidth < 1440) {
//       return const DesktopSkill();
//     } else {
//       return const LargeDesktopSkill();
//     }
//   }
// }

// /// ---------- MOBILE ----------
// class MobileSkill extends StatelessWidget {
//   const MobileSkill({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: height * 0.65,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF00A8E8), Color(0xFF0085C7)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           children: [
//             SizedBox(height: height * 0.1),
//             _titleSection(fontSize: 30, subFont: 16),
//             SizedBox(height: height * 0.05),
//             Wrap(
//               spacing: 14,
//               runSpacing: 14,
//               alignment: WrapAlignment.center,
//               children: skills.map((s) {
//                 return _SkillBadge(
//                   title: s['name'],
//                   imagePath: s['image'],
//                   useImage: s['useImage'],
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// ---------- TABLET ----------
// class TabletSkill extends StatelessWidget {
//   const TabletSkill({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: height * 0.65,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF00A8E8), Color(0xFF0085C7)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           children: [
//             SizedBox(height: height * 0.1),
//             _titleSection(fontSize: 34, subFont: 18),
//             SizedBox(height: height * 0.05),
//             Wrap(
//               spacing: 18,
//               runSpacing: 18,
//               alignment: WrapAlignment.center,
//               children: skills.map((s) {
//                 return _SkillBadge(
//                   title: s['name'],
//                   imagePath: s['image'],
//                   useImage: s['useImage'],
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// ---------- DESKTOP ----------
// class DesktopSkill extends StatelessWidget {
//   const DesktopSkill({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return Container(
//       height: height * 0.60,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFF00A8E8), Color(0xFF0085C7)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: Column(
//         children: [
//           SizedBox(height: height * 0.5),
//           _titleSection(fontSize: 36, subFont: 20),
//           SizedBox(height: height * 0.05),
//           Wrap(
//             spacing: 20,
//             runSpacing: 16,
//             alignment: WrapAlignment.center,
//             children: skills.map((s) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: _SkillBadge(
//                   title: s['name'],
//                   imagePath: s['image'],
//                   useImage: s['useImage'],
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// ---------- LARGE DESKTOP ----------
// class LargeDesktopSkill extends StatelessWidget {
//   const LargeDesktopSkill({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: height * 0.65,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF00A8E8), Color(0xFF0085C7)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           children: [
//             SizedBox(height: height * 0.1),
//             _titleSection(fontSize: 40, subFont: 22),
//             SizedBox(height: height * 0.05),
//             Wrap(
//               spacing: 24,
//               runSpacing: 20,
//               alignment: WrapAlignment.center,
//               children: skills.map((s) {
//                 return _SkillBadge(
//                   title: s['name'],
//                   imagePath: s['image'],
//                   useImage: s['useImage'],
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// ---------- TITLE SECTION ----------
// Widget _titleSection({required double fontSize, required double subFont}) {
//   return Column(
//     children: [
//       RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: "Technical ",
//               style: GoogleFonts.poppins(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             TextSpan(
//               text: "Skills",
//               style: GoogleFonts.poppins(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xFFFFE048),
//               ),
//             ),
//           ],
//         ),
//       ),
//       const SizedBox(height: 8),
//       Text(
//         "Tools and technologies I work with",
//         style: GoogleFonts.poppins(
//           fontSize: subFont,
//           color: Colors.white,
//         ),
//       ),
//     ],
//   );
// }

// /// ---------- BADGE WIDGET ----------
// class _SkillBadge extends StatelessWidget {
//   final String title;
//   final String? imagePath;
//   final bool useImage;

//   const _SkillBadge({
//     required this.title,
//     this.imagePath,
//     this.useImage = false,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Widget leading;
//     if (useImage && imagePath != null && imagePath!.isNotEmpty) {
//       leading = Image.asset(
//         imagePath!,
//         width: 22,
//         height: 22,
//         errorBuilder: (context, error, stackTrace) =>
//             const Icon(Icons.error, color: Colors.red, size: 22),
//       );
//     } else {
//       final icon = _getSkillIcon(title);
//       leading = Icon(icon.$1, color: icon.$2, size: 22);
//     }

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.15),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           leading,
//           const SizedBox(width: 8),
//           Text(
//             title,
//             style: GoogleFonts.poppins(
//               fontSize: 16,
//               color: Colors.black87,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// ---------- ICON LOGIC ----------
//   (IconData, Color) _getSkillIcon(String title) {
//     switch (title.toLowerCase()) {
//       case 'flutter':
//         return (Icons.flutter_dash, const Color(0xFF02569B));
//       case 'dart':
//         return (Icons.code, const Color(0xFF0175C2));
//       case 'figma':
//         return (Icons.design_services, const Color(0xFFF24E1E));
//       case 'github':
//         return (Icons.code_outlined, const Color(0xFF181717));
//       case 'firebase':
//         return (Icons.local_fire_department, const Color(0xFFFFCA28));
//       case 'mysql':
//         return (Icons.storage, const Color(0xFF4479A1));
//       case 'bloc':
//         return (Icons.view_module, const Color(0xFF00D0FF));
//       case 'state management':
//         return (Icons.settings_suggest, const Color(0xFF6200EA));
//       case 'html':
//         return (Icons.html, const Color(0xFFE34F26));
//       case 'c':
//         return (Icons.memory, const Color(0xFF00599C));
//       case 'arduino ide':
//         return (Icons.settings_input_component, const Color(0xFF00979D));
//       case 'authentication':
//         return (Icons.verified_user, const Color(0xFF4CAF50));
//       case 'api':
//         return (Icons.api, const Color(0xFFFF6F00));
//       default:
//         return (Icons.star, Colors.blueAccent);
//     }
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'dart:math';

// /// ---------- DATA LIST ----------
// final List<Map<String, dynamic>> skills = [
//   {'name': 'Flutter', 'image': 'assets/images/flutter-logo.png', 'useImage': true},
//   {'name': 'Dart', 'image': 'assets/images/Dart.png', 'useImage': true},
//   {'name': 'Figma', 'image': 'assets/images/figma.png', 'useImage': true},
//   {'name': 'GitHub', 'image': 'assets/images/Git_icon.png', 'useImage': true},
//   {'name': 'Firebase', 'image': 'assets/images/Firebase.png', 'useImage': true},
//   {'name': 'MySQL', 'image': '', 'useImage': false},
//   {'name': 'BLoC', 'image': 'assets/images/bloc.png', 'useImage': true},
//   {'name': 'State Management', 'image': '', 'useImage': false},
//   {'name': 'HTML', 'image': 'assets/images/html-5.png', 'useImage': true},
//   {'name': 'C', 'image': 'assets/images/c-.png', 'useImage': true},
//   {'name': 'Arduino IDE', 'image': 'assets/images/arduino.png', 'useImage': true},
//   {'name': 'Authentication', 'image': '', 'useImage': false},
//   {'name': 'API', 'image': 'assets/images/Api.png', 'useImage': true},
// ];

// /// ---------- RESPONSIVE WRAPPER ----------
// class SkillSection extends StatelessWidget {
//   const SkillSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     if (screenWidth < 600) {
//       return const MobileSkill();
//     } else if (screenWidth < 1024) {
//       return const TabletSkill();
//     } else if (screenWidth < 1440) {
//       return const DesktopSkill();
//     } else {
//       return const LargeDesktopSkill();
//     }
//   }
// }

// /// ---------- MOBILE ----------
// class MobileSkill extends StatelessWidget {
//   const MobileSkill({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final containerHeight = min(height * 0.5, 400).toDouble();

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: containerHeight,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF00A8E8), Color(0xFF0085C7)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           children: [
//             SizedBox(height: containerHeight * 0.1),
//             _titleSection(fontSize: 28, subFont: 14),
//             SizedBox(height: containerHeight * 0.05),
//             Wrap(
//               spacing: 12,
//               runSpacing: 12,
//               alignment: WrapAlignment.center,
//               children: skills.map((s) {
//                 return _SkillBadge(
//                   title: s['name'],
//                   imagePath: s['image'],
//                   useImage: s['useImage'],
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// ---------- TABLET ----------
// class TabletSkill extends StatelessWidget {
//   const TabletSkill({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final containerHeight = min(height * 0.55, 450).toDouble();

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: containerHeight,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF00A8E8), Color(0xFF0085C7)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           children: [
//             SizedBox(height: containerHeight * 0.1),
//             _titleSection(fontSize: 32, subFont: 16),
//             SizedBox(height: containerHeight * 0.05),
//             Wrap(
//               spacing: 16,
//               runSpacing: 16,
//               alignment: WrapAlignment.center,
//               children: skills.map((s) {
//                 return _SkillBadge(
//                   title: s['name'],
//                   imagePath: s['image'],
//                   useImage: s['useImage'],
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// ---------- DESKTOP ----------
// class DesktopSkill extends StatelessWidget {
//   const DesktopSkill({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final containerHeight = min(height * 0.5, 500).toDouble();

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: containerHeight,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF00A8E8), Color(0xFF0085C7)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           children: [
//             SizedBox(height: containerHeight * 0.1),
//             _titleSection(fontSize: 36, subFont: 18),
//             SizedBox(height: containerHeight * 0.05),
//             Wrap(
//               spacing: 20,
//               runSpacing: 16,
//               alignment: WrapAlignment.center,
//               children: skills.map((s) {
//                 return _SkillBadge(
//                   title: s['name'],
//                   imagePath: s['image'],
//                   useImage: s['useImage'],
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// ---------- LARGE DESKTOP ----------
// class LargeDesktopSkill extends StatelessWidget {
//   const LargeDesktopSkill({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final containerHeight = min(height * 0.55, 550).toDouble();

//     return Container(
//       height: containerHeight,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFF00A8E8), Color(0xFF0085C7)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: Column(
//         children: [
//           SizedBox(height: containerHeight * 0.2),
//           _titleSection(fontSize: 40, subFont: 20),
//           SizedBox(height: containerHeight * 0.05),
//           Wrap(
//             spacing: 24,
//             runSpacing: 20,
//             alignment: WrapAlignment.center,
//             children: skills.map((s) {
//               return _SkillBadge(
//                 title: s['name'],
//                 imagePath: s['image'],
//                 useImage: s['useImage'],
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// ---------- TITLE SECTION ----------
// Widget _titleSection({required double fontSize, required double subFont}) {
//   return Column(
//     children: [
//       RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: "Technical ",
//               style: GoogleFonts.poppins(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             TextSpan(
//               text: "Skills",
//               style: GoogleFonts.poppins(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xFFFFE048),
//               ),
//             ),
//           ],
//         ),
//       ),
//       const SizedBox(height: 8),
//       Text(
//         "Tools and technologies I work with",
//         style: GoogleFonts.poppins(
//           fontSize: subFont,
//           color: Colors.white,
//         ),
//       ),
//     ],
//   );
// }

// /// ---------- BADGE WIDGET ----------
// class _SkillBadge extends StatelessWidget {
//   final String title;
//   final String? imagePath;
//   final bool useImage;

//   const _SkillBadge({
//     required this.title,
//     this.imagePath,
//     this.useImage = false,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Widget leading;
//     if (useImage && imagePath != null && imagePath!.isNotEmpty) {
//       leading = Image.asset(
//         imagePath!,
//         width: 22,
//         height: 22,
//         errorBuilder: (context, error, stackTrace) =>
//             const Icon(Icons.error, color: Colors.red, size: 22),
//       );
//     } else {
//       final icon = _getSkillIcon(title);
//       leading = Icon(icon.$1, color: icon.$2, size: 22);
//     }

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.15),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           leading,
//           const SizedBox(width: 8),
//           Text(
//             title,
//             style: GoogleFonts.poppins(
//               fontSize: 16,
//               color: Colors.black87,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// ---------- ICON LOGIC ----------
//   (IconData, Color) _getSkillIcon(String title) {
//     switch (title.toLowerCase()) {
//       case 'flutter':
//         return (Icons.flutter_dash, const Color(0xFF02569B));
//       case 'dart':
//         return (Icons.code, const Color(0xFF0175C2));
//       case 'figma':
//         return (Icons.design_services, const Color(0xFFF24E1E));
//       case 'github':
//         return (Icons.code_outlined, const Color(0xFF181717));
//       case 'firebase':
//         return (Icons.local_fire_department, const Color(0xFFFFCA28));
//       case 'mysql':
//         return (Icons.storage, const Color(0xFF4479A1));
//       case 'bloc':
//         return (Icons.view_module, const Color(0xFF00D0FF));
//       case 'state management':
//         return (Icons.settings_suggest, const Color(0xFF6200EA));
//       case 'html':
//         return (Icons.html, const Color(0xFFE34F26));
//       case 'c':
//         return (Icons.memory, const Color(0xFF00599C));
//       case 'arduino ide':
//         return (Icons.settings_input_component, const Color(0xFF00979D));
//       case 'authentication':
//         return (Icons.verified_user, const Color(0xFF4CAF50));
//       case 'api':
//         return (Icons.api, const Color(0xFFFF6F00));
//       default:
//         return (Icons.star, Colors.blueAccent);
//     }
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'dart:math';

// /// ---------- DATA LIST ----------
// final List<Map<String, dynamic>> skills = [
//   {'name': 'Flutter', 'image': 'assets/images/flutter-logo.png', 'useImage': true},
//   {'name': 'Dart', 'image': 'assets/images/Dart.png', 'useImage': true},
//   {'name': 'Figma', 'image': 'assets/images/figma.png', 'useImage': true},
//   {'name': 'GitHub', 'image': 'assets/images/Git_icon.png', 'useImage': true},
//   {'name': 'Firebase', 'image': 'assets/images/Firebase.png', 'useImage': true},
//   {'name': 'MySQL', 'image': '', 'useImage': false},
//   {'name': 'BLoC', 'image': 'assets/images/bloc.png', 'useImage': true},
//   {'name': 'State Management', 'image': '', 'useImage': false},
//   {'name': 'HTML', 'image': 'assets/images/html-5.png', 'useImage': true},
//   {'name': 'C', 'image': 'assets/images/c-.png', 'useImage': true},
//   {'name': 'Arduino IDE', 'image': 'assets/images/arduino.png', 'useImage': true},
//   {'name': 'Authentication', 'image': '', 'useImage': false},
//   {'name': 'API', 'image': 'assets/images/Api.png', 'useImage': true},
// ];

// /// ---------- RESPONSIVE WRAPPER ----------
// class SkillSection extends StatelessWidget {
//   const SkillSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     if (screenWidth < 600) {
//       return const MobileSkill();
//     } else if (screenWidth < 1024) {
//       return const TabletSkill();
//     } else if (screenWidth < 1440) {
//       return const DesktopSkill();
//     } else {
//       return const LargeDesktopSkill();
//     }
//   }
// }



// class MobileSkill extends StatelessWidget {
//   const MobileSkill({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final containerHeight = min(height * 0.55, 400.0);

//     return Container(
//       constraints: const BoxConstraints(minHeight: 350),
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFF00A8E8), Color(0xFF0085C7)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(height: containerHeight * 0.1),
//             _titleSection(fontSize: 36, subFont: 14),
//             SizedBox(height: containerHeight * 0.05),
//             Wrap(
//               spacing: 12,
//               runSpacing: 12,
//               alignment: WrapAlignment.center,
//               children: skills.map((s) {
//                 return _SkillBadge(
//                   title: s['name'],
//                   imagePath: s['image'],
//                   useImage: s['useImage'],
//                    horizontal: 14,
//                     vertical: 8,
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: containerHeight * 0.09),
//           ],
//         ),
//       ),
//     );
//   }
// }


// /// ---------- TABLET ----------
// class TabletSkill extends StatelessWidget {
//   const TabletSkill({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final containerHeight = min(height * 0.60, 450).toDouble();

//     return Container(
//       height: containerHeight,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFF00A8E8), Color(0xFF0085C7)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: containerHeight * 0.2),
//             _titleSection(fontSize: 36, subFont: 16),
//             SizedBox(height: containerHeight * 0.05),
//             Wrap(
//               spacing: 16,
//               runSpacing: 16,
//               alignment: WrapAlignment.center,
//               children: skills.map((s) {
//                 return _SkillBadge(
//                   title: s['name'],
//                   imagePath: s['image'],
//                   useImage: s['useImage'],
//                    horizontal: 18,
//                     vertical: 12,
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: containerHeight * 0.05),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// ---------- DESKTOP ----------
// class DesktopSkill extends StatelessWidget {
//   const DesktopSkill({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final containerHeight = min(height * 0.55, 550).toDouble();

//     return Container(
//       height: containerHeight,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFF00A8E8), Color(0xFF0085C7)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: Column(
//         children: [
//           SizedBox(height: containerHeight * 0.2),
//           _titleSection(fontSize: 40, subFont: 20),
//           SizedBox(height: containerHeight * 0.05),
//           Wrap(
//             spacing: 24,
//             runSpacing: 20,
//             alignment: WrapAlignment.center,
//             children: skills.map((s) {
//               return _SkillBadge(
//                 title: s['name'],
//                 imagePath: s['image'],
//                 useImage: s['useImage'],
//                  horizontal: 24,
//                   vertical: 12,
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// ---------- LARGE DESKTOP ----------
// class LargeDesktopSkill extends StatelessWidget {
//   const LargeDesktopSkill({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final containerHeight = min(height * 0.55, 550).toDouble();

//     return Container(
//       height: containerHeight,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFF00A8E8), Color(0xFF0085C7)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: Column(
//         children: [
//           SizedBox(height: containerHeight * 0.2),
//           _titleSection(fontSize: 40, subFont: 20),
//           SizedBox(height: containerHeight * 0.05),
//           Wrap(
//             spacing: 24,
//             runSpacing: 20,
//             alignment: WrapAlignment.center,
//             children: skills.map((s) {
//               return _SkillBadge(
//                 title: s['name'],
//                 imagePath: s['image'],
//                 useImage: s['useImage'],
//                  horizontal: 24,
//                   vertical: 12,
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// ---------- TITLE SECTION ----------
// Widget _titleSection({required double fontSize, required double subFont}) {
//   return Column(
//     children: [
//       RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: "Technical ",
//               style: GoogleFonts.poppins(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             TextSpan(
//               text: "Skills",
//               style: GoogleFonts.poppins(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xFFFFE048),
//               ),
//             ),
//           ],
//         ),
//       ),
//       const SizedBox(height: 8),
//       Text(
//         "Tools and technologies I work with",
//         style: GoogleFonts.poppins(
//           fontSize: subFont,
//           color: Colors.white,
//         ),
//       ),
//     ],
//   );
// }

// /// ---------- BADGE WIDGET ----------
// class _SkillBadge extends StatelessWidget {
//   final String title;
//   final String? imagePath;
//   final bool useImage;
//   final double horizontal;
//   final double vertical;

//   const _SkillBadge({
//     required this.title,
//     this.imagePath,
//     this.useImage = false,
//     super.key,
//     required this.horizontal,
//     required this.vertical,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Widget leading;

//     // ✅ Choose between image or icon
//     if (useImage && imagePath != null && imagePath!.isNotEmpty) {
//       leading = Image.asset(
//         imagePath!,
//         width: 22,
//         height: 22,
//         errorBuilder: (context, error, stackTrace) =>
//             const Icon(Icons.error, color: Colors.red, size: 22),
//       );
//     } else {
//       final icon = _getSkillIcon(title);
//       leading = Icon(icon.key, color: icon.value, size: 22);
//     }

//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.15),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           leading,
//           const SizedBox(width: 8),
//           Text(
//             title,
//             style: GoogleFonts.poppins(
//               fontSize: 16,
//               color: Colors.black87,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// ---------- ICON LOGIC ----------
//   MapEntry<IconData, Color> _getSkillIcon(String title) {
//     switch (title.toLowerCase()) {
//       case 'flutter':
//         return MapEntry(Icons.flutter_dash, const Color(0xFF02569B));
//       case 'dart':
//         return MapEntry(Icons.code, const Color(0xFF0175C2));
//       case 'figma':
//         return MapEntry(Icons.design_services, const Color(0xFFF24E1E));
//       case 'github':
//         return MapEntry(Icons.code_outlined, const Color(0xFF181717));
//       case 'firebase':
//         return MapEntry(Icons.local_fire_department, const Color(0xFFFFCA28));
//       case 'mysql':
//         return MapEntry(Icons.storage, const Color(0xFF4479A1));
//       case 'bloc':
//         return MapEntry(Icons.view_module, const Color(0xFF00D0FF));
//       case 'state management':
//         return MapEntry(Icons.settings_suggest, const Color(0xFF6200EA));
//       case 'html':
//         return MapEntry(Icons.html, const Color(0xFFE34F26));
//       case 'c':
//         return MapEntry(Icons.memory, const Color(0xFF00599C));
//       case 'arduino ide':
//         return MapEntry(Icons.settings_input_component, const Color(0xFF00979D));
//       case 'authentication':
//         return MapEntry(Icons.verified_user, const Color(0xFF4CAF50));
//       case 'api':
//         return MapEntry(Icons.api, const Color(0xFFFF6F00));
//       default:
//         return MapEntry(Icons.star, Colors.blueAccent);
//     }
//   }
// }


import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ---------- DATA LIST ----------
final List<Map<String, dynamic>> skills = [
  {'name': 'Flutter', 'image': 'assets/images/flutter-logo.png', 'useImage': true},
  {'name': 'Dart', 'image': 'assets/images/Dart.png', 'useImage': true},
  {'name': 'Figma', 'image': 'assets/images/figma.png', 'useImage': true},
  {'name': 'GitHub', 'image': 'assets/images/Git_icon.png', 'useImage': true},
  {'name': 'Firebase', 'image': 'assets/images/Firebase.png', 'useImage': true},
  {'name': 'MySQL', 'image': '', 'useImage': false},
  {'name': 'BLoC', 'image': 'assets/images/bloc.png', 'useImage': true},
  {'name': 'State Management', 'image': '', 'useImage': false},
  {'name': 'HTML', 'image': 'assets/images/html-5.png', 'useImage': true},
  {'name': 'C', 'image': 'assets/images/c-.png', 'useImage': true},
  {'name': 'Arduino IDE', 'image': 'assets/images/arduino.png', 'useImage': true},
  {'name': 'Authentication', 'image': '', 'useImage': false},
  {'name': 'API', 'image': 'assets/images/Api.png', 'useImage': true},
];

/// ---------- MAIN RESPONSIVE WIDGET ----------
class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // ---- Responsive Adjustments ----
    double fontSize;
    double subFont;
    double horizontal;
    double vertical;
    double spacing;
    double runSpacing;

    if (width < 600) {
      fontSize = 36;
      subFont = 14;
      horizontal = 14;
      vertical = 8;
      spacing = 12;
      runSpacing = 12;
    } else if (width < 1024) {
      fontSize = 36;
      subFont = 16;
      horizontal = 18;
      vertical = 12;
      spacing = 16;
      runSpacing = 16;
    } else {
      fontSize = 40;
      subFont = 20;
      horizontal = 24;
      vertical = 12;
      spacing = 24;
      runSpacing = 20;
    }

    final containerHeight = min(height * 0.55, 550.0);

    return Container(
      constraints: const BoxConstraints(minHeight: 350),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF00A8E8), Color(0xFF0085C7)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: containerHeight * 0.15),
            _titleSection(fontSize: fontSize, subFont: subFont),
            SizedBox(height: containerHeight * 0.05),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: spacing,
              runSpacing: runSpacing,
              children: skills.map((s) {
                return _SkillBadge(
                  title: s['name'],
                  imagePath: s['image'],
                  useImage: s['useImage'],
                  horizontal: horizontal,
                  vertical: vertical,
                );
              }).toList(),
            ),
            SizedBox(height: containerHeight * 0.1),
          ],
        ),
      ),
    );
  }
}

/// ---------- TITLE SECTION ----------
Widget _titleSection({required double fontSize, required double subFont}) {
  return Column(
    children: [
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Technical ",
              style: GoogleFonts.poppins(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: "Skills",
              style: GoogleFonts.poppins(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFFE048),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 8),
      Text(
        "Tools and technologies I work with",
        style: GoogleFonts.poppins(
          fontSize: subFont,
          color: Colors.white,
        ),
      ),
    ],
  );
}

/// ---------- BADGE WIDGET ----------
class _SkillBadge extends StatelessWidget {
  final String title;
  final String? imagePath;
  final bool useImage;
  final double horizontal;
  final double vertical;

  const _SkillBadge({
    required this.title,
    this.imagePath,
    this.useImage = false,
    super.key,
    required this.horizontal,
    required this.vertical,
  });

  @override
  Widget build(BuildContext context) {
    Widget leading;

    if (useImage && imagePath != null && imagePath!.isNotEmpty) {
      leading = Image.asset(
        imagePath!,
        width: 22,
        height: 22,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.error, color: Colors.red, size: 22),
      );
    } else {
      final icon = _getSkillIcon(title);
      leading = Icon(icon.key, color: icon.value, size: 22);
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          leading,
          const SizedBox(width: 8),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  /// ---------- ICON LOGIC ----------
  MapEntry<IconData, Color> _getSkillIcon(String title) {
    switch (title.toLowerCase()) {
      case 'flutter':
        return MapEntry(Icons.flutter_dash, const Color(0xFF02569B));
      case 'dart':
        return MapEntry(Icons.code, const Color(0xFF0175C2));
      case 'figma':
        return MapEntry(Icons.design_services, const Color(0xFFF24E1E));
      case 'github':
        return MapEntry(Icons.code_outlined, const Color(0xFF181717));
      case 'firebase':
        return MapEntry(Icons.local_fire_department, const Color(0xFFFFCA28));
      case 'mysql':
        return MapEntry(Icons.storage, const Color(0xFF4479A1));
      case 'bloc':
        return MapEntry(Icons.view_module, const Color(0xFF00D0FF));
      case 'state management':
        return MapEntry(Icons.settings_suggest, const Color(0xFF6200EA));
      case 'html':
        return MapEntry(Icons.html, const Color(0xFFE34F26));
      case 'c':
        return MapEntry(Icons.memory, const Color(0xFF00599C));
      case 'arduino ide':
        return MapEntry(Icons.settings_input_component, const Color(0xFF00979D));
      case 'authentication':
        return MapEntry(Icons.verified_user, const Color(0xFF4CAF50));
      case 'api':
        return MapEntry(Icons.api, const Color(0xFFFF6F00));
      default:
        return MapEntry(Icons.star, Colors.blueAccent);
    }
  }
}
