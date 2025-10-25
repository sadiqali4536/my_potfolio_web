


// import 'package:code_way/MVVM/model/mydata.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher.dart';

// class FooterSection extends StatelessWidget {
//   const FooterSection({super.key});

//   // ----- Open Link -----
//   Future<void> _launchURL(String url) async {
//     await Mydata.launchUrlLink(url);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       color: const Color(0xFF111111),
//       padding: const EdgeInsets.symmetric(vertical: 50),
//       child: Column(
//         children: [
//           // ---------- Brand Title ----------
//           RichText(
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: "CODEWAY ",
//                   style: GoogleFonts.poppins(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 TextSpan(
//                   text: "SOFTWARE SOLUTIONS",
//                   style: GoogleFonts.poppins(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: const Color.fromRGBO(182, 182, 182, 1),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 12),

//           // ---------- Tagline ----------
//           Text(
//             "Building the Future of Apps — Your Full-Stack Innovation Partner",
//             style: GoogleFonts.poppins(
//                 fontSize: 16, color: const Color.fromRGBO(182, 182, 182, 1)),
//             textAlign: TextAlign.center,
//           ),

//           const SizedBox(height: 28),

//           // ---------- Social Icons (Hover + Clickable) ----------
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SocialHoverIcon(
//                 iconPath: "assets/images/GitHub.png",
//                 onTap: () => _launchURL(Mydata.githubLink),
//                 innerWidth: 20,
//                 innerHeight: 20,
//                 innerBorderRadius: 17,
//                 imageWidth: 28,
//                 imageHeight: 28,
//               ),
//               const SizedBox(width: 12),
//               SocialHoverIcon(
//                 iconPath: "assets/images/linkdin_icon.png",
//                 onTap: () => _launchURL(Mydata.linkedinLink),
//                 innerWidth: 22,
//                 innerHeight: 22,
//                 innerBorderRadius: 5,
//                 imageWidth: 28,
//                 imageHeight: 28,
//               ),
//               const SizedBox(width: 12),
//               SocialHoverIcon(
//                 iconPath: "assets/images/instagram_icon.png",
//                 onTap: () => _launchURL(Mydata.instagramLink),
//                 innerWidth: 22,
//                 innerHeight: 22,
//                 innerBorderRadius: 5,
//                 imageWidth: 18,
//                 imageHeight: 18,
//               ),
//             ],
//           ),

//           const SizedBox(height: 30),

//           // ---------- Divider ----------
//           Container(
//             width: 1280,
//             height: 1,
//             color: const Color.fromRGBO(55, 65, 81, 1),
//           ),

//           const SizedBox(height: 25),

//           // ---------- Footer text ----------
//           Text(
//             "© 2025 CODEWAY SOFTWARE SOLUTIONS | Built by Sadiq Ali",
//             style: GoogleFonts.poppins(
//                 fontSize: 16, color: const Color.fromRGBO(182, 182, 182, 1)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SocialHoverIcon extends StatefulWidget {
//   final String iconPath;
//   final VoidCallback onTap;

//   // Customizable inner container
//   final double innerWidth;
//   final double innerHeight;
//   final double innerBorderRadius;

//   // Customizable icon size
//   final double imageWidth;
//   final double imageHeight;

//   const SocialHoverIcon({
//     super.key,
//     required this.iconPath,
//     required this.onTap,
//     this.innerWidth = 32,
//     this.innerHeight = 32,
//     this.innerBorderRadius = 16,
//     required this.imageWidth,
//     required this.imageHeight,
//   });

//   @override
//   State<SocialHoverIcon> createState() => _SocialHoverIconState();
// }

// class _SocialHoverIconState extends State<SocialHoverIcon> {
//   bool _isHover = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHover = true),
//       onExit: (_) => setState(() => _isHover = false),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         width: 48,
//         height: 48,
//         decoration: BoxDecoration(
//           color: _isHover
//               ? const Color.fromARGB(255, 5, 72, 143)
//               : const Color.fromRGBO(0, 123, 255, 0.10),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: InkWell(
//           onTap: widget.onTap,
//           borderRadius: BorderRadius.circular(8),
//           child: Center(
//             child: AnimatedScale(
//               scale: _isHover ? 1.2 : 1.0,
//               duration: const Duration(milliseconds: 200),
//               curve: Curves.easeOut,
//               child: Container(
//                 width: widget.innerWidth,
//                 height: widget.innerHeight,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius:
//                       BorderRadius.circular(widget.innerBorderRadius),
//                 ),
//                 child: Center(
//                   child: Image.asset(
//                     widget.iconPath,
//                     width: widget.imageWidth,
//                     height: widget.imageHeight,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////////////////////
// import 'package:code_way/MVVM/model/mydata.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// /// ---------- RESPONSIVE FOOTER ----------
// class FooterSection extends StatelessWidget {
//   const FooterSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     if (screenWidth < 600) {
//       // Mobile
//       return const MobileFooter();
//     } else if (screenWidth < 1024) {
//       // Tablet
//       return const TabletFooter();
//     } else if (screenWidth < 1440) {
//       // Desktop
//       return const DesktopFooter();
//     } else if (screenWidth >= 1440) {
//       // Large Desktop
//       return const LargeDesktopFooter();
//     } else {
//       // Fallback to Mobile
//       return const MobileFooter();
//     }
//   }
// }

// /// ---------- MOBILE FOOTER ----------
// class MobileFooter extends StatelessWidget {
//   const MobileFooter({super.key});

//   Future<void> _launchURL(String url) async {
//     await Mydata.launchUrlLink(url);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FooterBase(
//       brandFontSize: 20,
//       taglineFontSize: 14,
//       innerIconSize: 28,
//       innerIconBorderRadius: 14,
//       spacingBetweenIcons: 10,
//       dividerWidth: MediaQuery.of(context).size.width * 0.9,
//       verticalPadding: 40,
//       onLaunch: _launchURL,
//     );
//   }
// }

// /// ---------- TABLET FOOTER ----------
// class TabletFooter extends StatelessWidget {
//   const TabletFooter({super.key});

//   Future<void> _launchURL(String url) async {
//     await Mydata.launchUrlLink(url);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FooterBase(
//       brandFontSize: 22,
//       taglineFontSize: 15,
//       innerIconSize: 32,
//       innerIconBorderRadius: 16,
//       spacingBetweenIcons: 12,
//       dividerWidth: MediaQuery.of(context).size.width * 0.85,
//       verticalPadding: 45,
//       onLaunch: _launchURL,
//     );
//   }
// }

// /// ---------- DESKTOP FOOTER ----------
// class DesktopFooter extends StatelessWidget {
//   const DesktopFooter({super.key});

//   Future<void> _launchURL(String url) async {
//     await Mydata.launchUrlLink(url);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FooterBase(
//       brandFontSize: 24,
//       taglineFontSize: 16,
//       innerIconSize: 36,
//       innerIconBorderRadius: 18,
//       spacingBetweenIcons: 14,
//       dividerWidth: 1000,
//       verticalPadding: 50,
//       onLaunch: _launchURL,
//     );
//   }
// }

// /// ---------- LARGE DESKTOP FOOTER ----------
// class LargeDesktopFooter extends StatelessWidget {
//   const LargeDesktopFooter({super.key});

//   Future<void> _launchURL(String url) async {
//     await Mydata.launchUrlLink(url);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FooterBase(
//       brandFontSize: 26,
//       taglineFontSize: 18,
//       innerIconSize: 40,
//       innerIconBorderRadius: 20,
//       spacingBetweenIcons: 16,
//       dividerWidth: 1280,
//       verticalPadding: 60,
//       onLaunch: _launchURL,
//     );
//   }
// }

// /// ---------- BASE FOOTER WIDGET ----------
// class FooterBase extends StatelessWidget {
//   final double brandFontSize;
//   final double taglineFontSize;
//   final double innerIconSize;
//   final double innerIconBorderRadius;
//   final double spacingBetweenIcons;
//   final double dividerWidth;
//   final double verticalPadding;
//   final Function(String) onLaunch;

//   const FooterBase({
//     super.key,
//     required this.brandFontSize,
//     required this.taglineFontSize,
//     required this.innerIconSize,
//     required this.innerIconBorderRadius,
//     required this.spacingBetweenIcons,
//     required this.dividerWidth,
//     required this.verticalPadding,
//     required this.onLaunch,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       color: const Color(0xFF111111),
//       padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 20),
//       child: Column(
//         children: [
//           // Brand Title
//           RichText(
//             textAlign: TextAlign.center,
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: "CODEWAY ",
//                   style: GoogleFonts.poppins(
//                     fontSize: brandFontSize,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 TextSpan(
//                   text: "SOFTWARE SOLUTIONS",
//                   style: GoogleFonts.poppins(
//                     fontSize: brandFontSize * 0.6,
//                     fontWeight: FontWeight.w500,
//                     color: const Color.fromRGBO(182, 182, 182, 1),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 12),
//           // Tagline
//           Text(
//             "Building the Future of Apps — Your Full-Stack Innovation Partner",
//             textAlign: TextAlign.center,
//             style: GoogleFonts.poppins(
//                 fontSize: taglineFontSize,
//                 color: const Color.fromRGBO(182, 182, 182, 1)),
//           ),
//           SizedBox(height: verticalPadding / 2),
//           // Social Icons
//           Wrap(
//             alignment: WrapAlignment.center,
//             spacing: spacingBetweenIcons,
//             children: [
//               SocialHoverIcon(
//                 iconPath: "assets/images/GitHub.png",
//                 onTap: () => onLaunch(Mydata.githubLink),
//                 innerWidth: innerIconSize,
//                 innerHeight: innerIconSize,
//                 innerBorderRadius: innerIconBorderRadius,
//                 imageWidth: innerIconSize - 8,
//                 imageHeight: innerIconSize - 8,
//               ),
//               SocialHoverIcon(
//                 iconPath: "assets/images/linkdin_icon.png",
//                 onTap: () => onLaunch(Mydata.linkedinLink),
//                 innerWidth: innerIconSize,
//                 innerHeight: innerIconSize,
//                 innerBorderRadius: innerIconBorderRadius,
//                 imageWidth: innerIconSize - 8,
//                 imageHeight: innerIconSize - 8,
//               ),
//               SocialHoverIcon(
//                 iconPath: "assets/images/instagram_icon.png",
//                 onTap: () => onLaunch(Mydata.instagramLink),
//                 innerWidth: innerIconSize,
//                 innerHeight: innerIconSize,
//                 innerBorderRadius: innerIconBorderRadius,
//                 imageWidth: innerIconSize - 14,
//                 imageHeight: innerIconSize - 14,
//               ),
//             ],
//           ),
//           SizedBox(height: verticalPadding / 2),
//           // Divider
//           Container(
//             width: dividerWidth,
//             height: 1,
//             color: const Color.fromRGBO(55, 65, 81, 1),
//           ),
//           SizedBox(height: verticalPadding / 3),
//           // Footer Text
//           Text(
//             "© 2025 CODEWAY SOFTWARE SOLUTIONS | Built by Sadiq Ali",
//             textAlign: TextAlign.center,
//             style: GoogleFonts.poppins(
//                 fontSize: taglineFontSize,
//                 color: const Color.fromRGBO(182, 182, 182, 1)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// ---------- SOCIAL ICON ----------
// class SocialHoverIcon extends StatefulWidget {
//   final String iconPath;
//   final VoidCallback onTap;
//   final double innerWidth;
//   final double innerHeight;
//   final double innerBorderRadius;
//   final double imageWidth;
//   final double imageHeight;

//   const SocialHoverIcon({
//     super.key,
//     required this.iconPath,
//     required this.onTap,
//     this.innerWidth = 32,
//     this.innerHeight = 32,
//     this.innerBorderRadius = 16,
//     required this.imageWidth,
//     required this.imageHeight,
//   });

//   @override
//   State<SocialHoverIcon> createState() => _SocialHoverIconState();
// }

// class _SocialHoverIconState extends State<SocialHoverIcon> {
//   bool _isHover = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHover = true),
//       onExit: (_) => setState(() => _isHover = false),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         width: widget.innerWidth + 16,
//         height: widget.innerHeight + 16,
//         decoration: BoxDecoration(
//           color: _isHover
//               ? const Color.fromARGB(255, 5, 72, 143)
//               : const Color.fromRGBO(0, 123, 255, 0.10),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: InkWell(
//           onTap: widget.onTap,
//           borderRadius: BorderRadius.circular(8),
//           child: Center(
//             child: AnimatedScale(
//               scale: _isHover ? 1.2 : 1.0,
//               duration: const Duration(milliseconds: 200),
//               curve: Curves.easeOut,
//               child: Container(
//                 width: widget.innerWidth,
//                 height: widget.innerHeight,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius:
//                       BorderRadius.circular(widget.innerBorderRadius),
//                 ),
//                 child: Center(
//                   child: Image.asset(
//                     widget.iconPath,
//                     width: widget.imageWidth,
//                     height: widget.imageHeight,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:code_way/MVVM/model/mydata.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// /// ---------- RESPONSIVE FOOTER ----------
// class FooterSection extends StatelessWidget {
//   const FooterSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     if (screenWidth < 600) {
//       return const MobileFooter();
//     } else if (screenWidth < 1024) {
//       return const TabletFooter();
//     } else if (screenWidth < 1440) {
//       return const DesktopFooter();
//     } else {
//       return const LargeDesktopFooter();
//     }
//   }
// }

// /// ---------- MOBILE FOOTER ----------
// class MobileFooter extends StatelessWidget {
//   const MobileFooter({super.key});

//   Future<void> _launchURL(String url) async {
//     await Mydata.launchUrlLink(url);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FooterBase(
//       brandFontSize: 20,
//       taglineFontSize: 14,
//       innerIconSize: 28,
//       innerIconBorderRadius: 14,
//       spacingBetweenIcons: 10,
//       dividerWidth: MediaQuery.of(context).size.width * 0.9,
//       verticalPadding: 40,
//       onLaunch: _launchURL,
//     );
//   }
// }

// /// ---------- TABLET FOOTER ----------
// class TabletFooter extends StatelessWidget {
//   const TabletFooter({super.key});

//   Future<void> _launchURL(String url) async {
//     await Mydata.launchUrlLink(url);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FooterBase(
//       brandFontSize: 22,
//       taglineFontSize: 15,
//       innerIconSize: 32,
//       innerIconBorderRadius: 16,
//       spacingBetweenIcons: 12,
//       dividerWidth: MediaQuery.of(context).size.width * 0.85,
//       verticalPadding: 45,
//       onLaunch: _launchURL,
//     );
//   }
// }

// /// ---------- DESKTOP FOOTER ----------
// class DesktopFooter extends StatelessWidget {
//   const DesktopFooter({super.key});

//   Future<void> _launchURL(String url) async {
//     await Mydata.launchUrlLink(url);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FooterBase(
//       brandFontSize: 24,
//       taglineFontSize: 16,
//       innerIconSize: 36,
//       innerIconBorderRadius: 18,
//       spacingBetweenIcons: 14,
//       dividerWidth: 1000,
//       verticalPadding: 50,
//       onLaunch: _launchURL,
//     );
//   }
// }

// /// ---------- LARGE DESKTOP FOOTER ----------
// class LargeDesktopFooter extends StatelessWidget {
//   const LargeDesktopFooter({super.key});

//   Future<void> _launchURL(String url) async {
//     await Mydata.launchUrlLink(url);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FooterBase(
//       brandFontSize: 26,
//       taglineFontSize: 18,
//       innerIconSize: 40,
//       innerIconBorderRadius: 20,
//       spacingBetweenIcons: 16,
//       dividerWidth: 1280,
//       verticalPadding: 60,
//       onLaunch: _launchURL,
//     );
//   }
// }

// /// ---------- BASE FOOTER WIDGET ----------
// class FooterBase extends StatelessWidget {
//   final double brandFontSize;
//   final double taglineFontSize;
//   final double innerIconSize;
//   final double innerIconBorderRadius;
//   final double spacingBetweenIcons;
//   final double dividerWidth;
//   final double verticalPadding;
//   final Function(String) onLaunch;

//   const FooterBase({
//     super.key,
//     required this.brandFontSize,
//     required this.taglineFontSize,
//     required this.innerIconSize,
//     required this.innerIconBorderRadius,
//     required this.spacingBetweenIcons,
//     required this.dividerWidth,
//     required this.verticalPadding,
//     required this.onLaunch,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       color: const Color(0xFF111111),
//       padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 20),
//       child: Column(
//         children: [
//           // Brand Title
//           RichText(
//             textAlign: TextAlign.center,
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: "CODEWAY ",
//                   style: GoogleFonts.poppins(
//                     fontSize: brandFontSize,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 TextSpan(
//                   text: "SOFTWARE SOLUTIONS",
//                   style: GoogleFonts.poppins(
//                     fontSize: brandFontSize * 0.6,
//                     fontWeight: FontWeight.w500,
//                     color: const Color.fromRGBO(182, 182, 182, 1),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 12),
//           // Tagline
//           Text(
//             "Building the Future of Apps — Your Full-Stack Innovation Partner",
//             textAlign: TextAlign.center,
//             style: GoogleFonts.poppins(
//                 fontSize: taglineFontSize,
//                 color: const Color.fromRGBO(182, 182, 182, 1)),
//           ),
//           SizedBox(height: verticalPadding / 2),
//           // Social Icons
//           Wrap(
//             alignment: WrapAlignment.center,
//             spacing: spacingBetweenIcons,
//             children: [
//               SocialHoverIcon(
//                 iconPath: "assets/images/GitHub.png",
//                 onTap: () => onLaunch(Mydata.githubLink),
//                 innerWidth: innerIconSize,
//                 innerHeight: innerIconSize,
//                 innerBorderRadius: innerIconBorderRadius,
//                 imageWidth: innerIconSize - 8,
//                 imageHeight: innerIconSize - 8,
//               ),
//               SocialHoverIcon(
//                 iconPath: "assets/images/linkdin_icon.png",
//                 onTap: () => onLaunch(Mydata.linkedinLink),
//                 innerWidth: innerIconSize,
//                 innerHeight: innerIconSize,
//                 innerBorderRadius: innerIconBorderRadius,
//                 imageWidth: innerIconSize - 8,
//                 imageHeight: innerIconSize - 8,
//               ),
//               SocialHoverIcon(
//                 iconPath: "assets/images/instagram_icon.png",
//                 onTap: () => onLaunch(Mydata.instagramLink),
//                 innerWidth: innerIconSize,
//                 innerHeight: innerIconSize,
//                 innerBorderRadius: innerIconBorderRadius,
//                 imageWidth: innerIconSize - 14,
//                 imageHeight: innerIconSize - 14,
//               ),
//             ],
//           ),
//           SizedBox(height: verticalPadding / 2),
//           // Divider
//           Container(
//             width: dividerWidth,
//             height: 1,
//             color: const Color.fromRGBO(55, 65, 81, 1),
//           ),
//           SizedBox(height: verticalPadding / 3),
//           // Footer Text
//           Text(
//             "© 2025 CODEWAY SOFTWARE SOLUTIONS | Built by Sadiq Ali",
//             textAlign: TextAlign.center,
//             style: GoogleFonts.poppins(
//                 fontSize: taglineFontSize,
//                 color: const Color.fromRGBO(182, 182, 182, 1)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// ---------- SOCIAL ICON ----------
// class SocialHoverIcon extends StatefulWidget {
//   final String iconPath;
//   final VoidCallback onTap;
//   final double innerWidth;
//   final double innerHeight;
//   final double innerBorderRadius;
//   final double imageWidth;
//   final double imageHeight;

//   const SocialHoverIcon({
//     super.key,
//     required this.iconPath,
//     required this.onTap,
//     this.innerWidth = 32,
//     this.innerHeight = 32,
//     this.innerBorderRadius = 16,
//     required this.imageWidth,
//     required this.imageHeight,
//   });

//   @override
//   State<SocialHoverIcon> createState() => _SocialHoverIconState();
// }

// class _SocialHoverIconState extends State<SocialHoverIcon> {
//   bool _isHover = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHover = true),
//       onExit: (_) => setState(() => _isHover = false),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         width: widget.innerWidth + 16,
//         height: widget.innerHeight + 16,
//         decoration: BoxDecoration(
//           color: _isHover
//               ? const Color.fromARGB(255, 5, 72, 143)
//               : const Color.fromRGBO(0, 123, 255, 0.10),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: InkWell(
//           onTap: widget.onTap,
//           borderRadius: BorderRadius.circular(8),
//           child: Center(
//             child: AnimatedScale(
//               scale: _isHover ? 1.2 : 1.0,
//               duration: const Duration(milliseconds: 200),
//               curve: Curves.easeOut,
//               child: Container(
//                 width: widget.innerWidth,
//                 height: widget.innerHeight,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius:
//                       BorderRadius.circular(widget.innerBorderRadius),
//                 ),
//                 child: Center(
//                   child: Image.asset(
//                     widget.iconPath,
//                     width: widget.imageWidth,
//                     height: widget.imageHeight,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:code_way/MVVM/model/mydata.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ---------- RESPONSIVE FOOTER ----------
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  Future<void> _launchURL(String url) async {
    await Mydata.launchUrlLink(url);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Define responsive values
    double brandFontSize;
    double taglineFontSize;
    double innerIconSize;
    double innerIconBorderRadius;
    double spacingBetweenIcons;
    double dividerWidth;
    double verticalPadding;

    if (screenWidth < 600) {
      // Mobile
      brandFontSize = 20;
      taglineFontSize = 14;
      innerIconSize = 28;
      innerIconBorderRadius = 14;
      spacingBetweenIcons = 10;
      dividerWidth = screenWidth * 0.9;
      verticalPadding = 40;
    } else if (screenWidth < 1024) {
      // Tablet
      brandFontSize = 22;
      taglineFontSize = 15;
      innerIconSize = 32;
      innerIconBorderRadius = 16;
      spacingBetweenIcons = 12;
      dividerWidth = screenWidth * 0.85;
      verticalPadding = 45;
    } else if (screenWidth < 1440) {
      // Desktop
      brandFontSize = 24;
      taglineFontSize = 16;
      innerIconSize = 36;
      innerIconBorderRadius = 18;
      spacingBetweenIcons = 14;
      dividerWidth = 1000;
      verticalPadding = 50;
    } else {
      // Large Desktop
      brandFontSize = 26;
      taglineFontSize = 18;
      innerIconSize = 40;
      innerIconBorderRadius = 20;
      spacingBetweenIcons = 16;
      dividerWidth = 1280;
      verticalPadding = 60;
    }

    return FooterBase(
      brandFontSize: brandFontSize,
      taglineFontSize: taglineFontSize,
      innerIconSize: innerIconSize,
      innerIconBorderRadius: innerIconBorderRadius,
      spacingBetweenIcons: spacingBetweenIcons,
      dividerWidth: dividerWidth,
      verticalPadding: verticalPadding,
      onLaunch: _launchURL,
    );
  }
}

/// ---------- BASE FOOTER WIDGET ----------
class FooterBase extends StatelessWidget {
  final double brandFontSize;
  final double taglineFontSize;
  final double innerIconSize;
  final double innerIconBorderRadius;
  final double spacingBetweenIcons;
  final double dividerWidth;
  final double verticalPadding;
  final Function(String) onLaunch;

  const FooterBase({
    super.key,
    required this.brandFontSize,
    required this.taglineFontSize,
    required this.innerIconSize,
    required this.innerIconBorderRadius,
    required this.spacingBetweenIcons,
    required this.dividerWidth,
    required this.verticalPadding,
    required this.onLaunch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF111111),
      padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 20),
      child: Column(
        children: [
          // Brand Title
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "CODEWAY ",
                  style: GoogleFonts.poppins(
                    fontSize: brandFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: "SOFTWARE SOLUTIONS",
                  style: GoogleFonts.poppins(
                    fontSize: brandFontSize * 0.6,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(182, 182, 182, 1),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Tagline
          Text(
            "Building the Future of Apps — Your Full-Stack Innovation Partner",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: taglineFontSize,
                color: const Color.fromRGBO(182, 182, 182, 1)),
          ),
          SizedBox(height: verticalPadding / 2),
          // Social Icons
          Wrap(
            alignment: WrapAlignment.center,
            spacing: spacingBetweenIcons,
            children: [
              SocialHoverIcon(
                iconPath: "assets/images/GitHub.png",
                onTap: () => onLaunch(Mydata.githubLink),
                innerWidth: innerIconSize,
                innerHeight: innerIconSize,
                innerBorderRadius: innerIconBorderRadius,
                imageWidth: innerIconSize - 8,
                imageHeight: innerIconSize - 8,
              ),
              SocialHoverIcon(
                iconPath: "assets/images/linkdin_icon.png",
                onTap: () => onLaunch(Mydata.linkedinLink),
                innerWidth: innerIconSize,
                innerHeight: innerIconSize,
                innerBorderRadius: innerIconBorderRadius,
                imageWidth: innerIconSize - 8,
                imageHeight: innerIconSize - 8,
              ),
              SocialHoverIcon(
                iconPath: "assets/images/instagram_icon.png",
                onTap: () => onLaunch(Mydata.instagramLink),
                innerWidth: innerIconSize,
                innerHeight: innerIconSize,
                innerBorderRadius: innerIconBorderRadius,
                imageWidth: innerIconSize - 14,
                imageHeight: innerIconSize - 14,
              ),
            ],
          ),
          SizedBox(height: verticalPadding / 2),
          // Divider
          Container(
            width: dividerWidth,
            height: 1,
            color: const Color.fromRGBO(55, 65, 81, 1),
          ),
          SizedBox(height: verticalPadding / 3),
          // Footer Text
          Text(
            "© 2025 CODEWAY SOFTWARE SOLUTIONS | Built by Sadiq Ali",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: taglineFontSize,
                color: const Color.fromRGBO(182, 182, 182, 1)),
          ),
        ],
      ),
    );
  }
}

/// ---------- SOCIAL ICON ----------
class SocialHoverIcon extends StatefulWidget {
  final String iconPath;
  final VoidCallback onTap;
  final double innerWidth;
  final double innerHeight;
  final double innerBorderRadius;
  final double imageWidth;
  final double imageHeight;

  const SocialHoverIcon({
    super.key,
    required this.iconPath,
    required this.onTap,
    this.innerWidth = 32,
    this.innerHeight = 32,
    this.innerBorderRadius = 16,
    required this.imageWidth,
    required this.imageHeight,
  });

  @override
  State<SocialHoverIcon> createState() => _SocialHoverIconState();
}

class _SocialHoverIconState extends State<SocialHoverIcon> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHover = true),
      onExit: (_) => setState(() => _isHover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.innerWidth + 16,
        height: widget.innerHeight + 16,
        decoration: BoxDecoration(
          color: _isHover
              ? const Color.fromARGB(255, 5, 72, 143)
              : const Color.fromRGBO(0, 123, 255, 0.10),
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: AnimatedScale(
              scale: _isHover ? 1.2 : 1.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              child: Container(
                width: widget.innerWidth,
                height: widget.innerHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(widget.innerBorderRadius),
                ),
                child: Center(
                  child: Image.asset(
                    widget.iconPath,
                    width: widget.imageWidth,
                    height: widget.imageHeight,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
