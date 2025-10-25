
// import 'package:code_way/MVVM/model/services_data.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ServicesSection extends StatelessWidget {
//   const ServicesSection({super.key});

//   @override
//   Widget build(BuildContext context) {
    

//     return Container(
//       width: double.infinity,
//       color: const Color(0xFFF8F9FB),
//       padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             'Services',
//             style: GoogleFonts.poppins(
//               fontSize: 36,
//               fontWeight: FontWeight.w700,
//               color: const Color(0xFF1A1A1A),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Comprehensive software solutions to transform your',
//             style: GoogleFonts.poppins(fontSize: 18, color: Colors.black87),
//           ),
//           Text(
//             'business ideas into reality',
//             style: GoogleFonts.poppins(fontSize: 18, color: Colors.black87),
//           ),
//           const SizedBox(height: 50),

          
//           LayoutBuilder(
//             builder: (context, constraints) {
//               int crossAxisCount = constraints.maxWidth > 1000
//                   ? 3
//                   : constraints.maxWidth > 600
//                       ? 2
//                       : 1;

//               return Wrap(
//                 spacing: 24,
//                 runSpacing: 24,
//                 alignment: WrapAlignment.center,
//                 children: servicesData.map((service) {
//                   return SizedBox(
//                     width: constraints.maxWidth / crossAxisCount - 32,
//                     child: AnimatedServiceCard(
//                       icon: service['icon'],
//                       title: service['title'],
//                       description: service['description'],
//                       bgColor: service['bgColor'],
//                       iconColor: service['iconColor'],
//                     ),
//                   );
//                 }).toList(),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }



// class AnimatedServiceCard extends StatefulWidget {
//   final IconData icon;
//   final String title;
//   final String description;
//   final Color bgColor;
//   final Color iconColor;

//   const AnimatedServiceCard({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.description,
//     required this.bgColor,
//     required this.iconColor,
//   });

//   @override
//   State<AnimatedServiceCard> createState() => _AnimatedServiceCardState();
// }

// class _AnimatedServiceCardState extends State<AnimatedServiceCard> {
//   bool isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => isHovered = true),
//       onExit: (_) => setState(() => isHovered = false),
//       child: AnimatedScale(
//         duration: const Duration(milliseconds: 200),
//         scale: isHovered ? 1.05 : 1.0,
//         curve: Curves.easeOut,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           curve: Curves.easeOut,
//           padding: const EdgeInsets.all(24),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: isHovered
//                     ? Colors.black.withOpacity(0.15)
//                     : Colors.black.withOpacity(0.05),
//                 blurRadius: isHovered ? 16 : 8,
//                 offset: const Offset(2, 3),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: 56,
//                 height: 56,
//                 decoration: BoxDecoration(
//                   color: widget.bgColor,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Icon(widget.icon, color: widget.iconColor, size: 28),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 widget.title,
//                 style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 18,
//                   color: const Color(0xFF1A1A1A),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 widget.description,
//                 style: GoogleFonts.poppins(
//                   fontSize: 14,
//                   color: Colors.black54,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     'Learn more',
//                     style: GoogleFonts.poppins(
//                       color: const Color(0xFF007BFF),
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(width: 6),
//                   const Icon(Icons.arrow_right_alt, color: Color(0xFF007BFF)),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:code_way/MVVM/model/services_data.dart';

class ServicesSection extends StatelessWidget {
  
  const ServicesSection({super.key, });

  @override
Widget build(BuildContext context) {
  final width = MediaQuery.of(context).size.width;

  if (width < 600) {
    // Mobile
    return _buildLayout(
      context,
      32,
      15, // title font size
      crossAxisCount: 1,
      horizontalPadding: 16,
    );
  } else if (width < 1024) {
    // Tablet
    return _buildLayout(
      context,
      32,
      18,
      crossAxisCount: 2,
      horizontalPadding: 24,
    );
  } else if (width < 1440) {
    // Desktop
    return _buildLayout(
      context,
      36,
      18,
      crossAxisCount: 3,
      horizontalPadding: 32,
    );
  } else {
    // Large Desktop
    return _buildLayout(
      context,
      40,
      18,
      crossAxisCount: 4,
      horizontalPadding: 40,
    );
  }
}


  Widget _buildLayout(BuildContext context,double titleFontSize, double subFontSize,
      {required int crossAxisCount, required double horizontalPadding}) {
    final width = MediaQuery.of(context).size.width;
    final cardWidth = (width - horizontalPadding * 2 - (crossAxisCount - 1) * 24) / crossAxisCount;
    

    return Container(
      width: double.infinity,
      color: const Color(0xFFF8F9FB),
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Services',
            style: GoogleFonts.poppins(
              fontSize: titleFontSize,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Comprehensive software solutions to transform your',
            style: GoogleFonts.poppins(fontSize: subFontSize, color: Colors.black87),
          ),
          Text(
            'business ideas into reality',
            style: GoogleFonts.poppins(fontSize: subFontSize, color: Colors.black87),
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: servicesData.map((service) {
              return SizedBox(
                width: cardWidth,
                child: AnimatedServiceCard(
                  icon: service['icon'],
                  title: service['title'],
                  description: service['description'],
                  bgColor: service['bgColor'],
                  iconColor: service['iconColor'],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class AnimatedServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color bgColor;
  final Color iconColor;

  const AnimatedServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.bgColor,
    required this.iconColor,
  });

  @override
  State<AnimatedServiceCard> createState() => _AnimatedServiceCardState();
}

class _AnimatedServiceCardState extends State<AnimatedServiceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: isHovered ? 1.05 : 1.0,
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: isHovered
                    ? Colors.black.withOpacity(0.15)
                    : Colors.black.withOpacity(0.05),
                blurRadius: isHovered ? 16 : 8,
                offset: const Offset(2, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon with responsive container
              LayoutBuilder(
                builder: (context, constraints) {
                  final iconSize = constraints.maxWidth * 0.15;
                  return Container(
                    width: iconSize.clamp(40, 64),
                    height: iconSize.clamp(40, 64),
                    decoration: BoxDecoration(
                      color: widget.bgColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(widget.icon, color: widget.iconColor, size: iconSize * 0.5),
                  );
                },
              ),
              const SizedBox(height: 20),
              Text(
                widget.title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: const Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.description,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Learn more',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF007BFF),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.arrow_right_alt, color: Color(0xFF007BFF)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
