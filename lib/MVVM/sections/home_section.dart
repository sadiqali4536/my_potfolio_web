// import 'package:code_way/MVVM/sections/skill_section.dart';
// import 'package:code_way/MVVM/sections/works_section.dart';
// import 'package:code_way/MVVM/utils/widgets/lotti_animation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomeSection extends StatefulWidget {

//    final VoidCallback onViewWorkPressed;
//    final VoidCallback LetsBuildTogether;

//   const HomeSection({
//     super.key,
//   required this.onViewWorkPressed,
//    required this.LetsBuildTogether});

//   @override
//   State<HomeSection> createState() => _HomeSectionState();
// }

// class _HomeSectionState extends State<HomeSection>
//     with SingleTickerProviderStateMixin {
//   final workskey = GlobalKey();
//   final ScrollController _scrollController = ScrollController();
//   bool _isImageLoaded = false;
//   late AnimationController _fadeController;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();

//     // Faster fade-in duration
//     _fadeController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );
//     _fadeAnimation =
//         CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut);
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();

//     // Preload images
//     Future.wait([
//       precacheImage(
//         const AssetImage(
//             "assets/background_gradient_image/home_color_image1.png"),
//         context,
//       ),
//       precacheImage(const AssetImage("assets/images/images.png"), context),
//     ]).whenComplete(() {
//       if (mounted) {
//         setState(() {
//           _isImageLoaded = true;
//         });
//         _fadeController.forward();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     _fadeController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//  if (!_isImageLoaded) {
//   return Container(
//     color: Colors.white,
//     height: screenHeight,
//     width: double.infinity,
//     child: const Center(
//       child: CodewayLoadingScreen(), // <-- Use Flutter animation here
//     ),
//   );
// }

//     // Fade in when loaded
//     return FadeTransition(
//       opacity: _fadeAnimation,
//       child: SingleChildScrollView(
//         controller: _scrollController,
//         child: Container(
//           height: screenHeight,
//           width: double.infinity,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(
//                   "assets/background_gradient_image/home_color_image1.png"),
//               fit: BoxFit.cover,
//             ),
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Color(0xFF0066FF),
//                 Color(0xFF00B4D8),
//                 Color(0xFF48CAE4),
//               ],
//             ),
//           ),
//           child: Stack(
//             children: [
//               Positioned(top: -50, left: -50, child: _circle(200, 0.1)),
//               Positioned(top: 80, left: 60, child: _circle(150, 0.08)),
//               Positioned(bottom: 100, left: 150, child: _circle(180, 0.08)),
//               Positioned(bottom: -80, left: -30, child: _circle(220, 0.1)),
//               Positioned(top: -80, right: -80, child: _circle(250, 0.08)),
//               Positioned(top: 150, right: 100, child: _circle(200, 0.06)),
//               Positioned(bottom: -100, right: -50, child: _circle(280, 0.1)),
//               Positioned(bottom: 200, right: 150, child: _circle(160, 0.07)),

//               // Right-side image
//               Positioned(
//                 left: 850,
//                 bottom: 100,
//                 child: Container(
//                   width: screenWidth * 0.50,
//                   height: screenHeight * 0.8,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: const DecorationImage(
//                       image: AssetImage("assets/images/images.png"),
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//               ),

//               // Main content
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: screenWidth * 0.08,
//                   right: screenWidth * 0.05,
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       flex: 38,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           SizedBox(height: screenWidth * 0.11),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               _headerText("Hi, I'm ", Colors.white,60,1.1),
//                               _headerText("Sadiq Ali", const Color(0xFFFFD700),60,1.1),
//                               _headerText(" —", Colors.white,60,1.1),
//                             ],
//                           ),
//                           _headerText("Building the Future", Colors.white,60,1.1),
//                           _headerText("of Apps.", Colors.white,60,1.1),
//                           const SizedBox(height: 20),
//                           Text(
//                             "Full-Stack Flutter Developer & Founder at CODEWAY",
//                             style: GoogleFonts.poppins(
//                               fontSize: 17,
//                               color: Colors.white.withOpacity(0.85),
//                               height: 1.6,
//                             ),
//                           ),
//                           Text(
//                             "SOFTWARE SOLUTIONS.",
//                             style: GoogleFonts.poppins(
//                               fontSize: 17,
//                               color: Colors.white.withOpacity(0.85),
//                               height: 1.6,
//                             ),
//                           ),
//                           const SizedBox(height: 35),
//                           Row(
//                             children: [
//                               ElevatedButton(
//                                 onPressed: widget.onViewWorkPressed,
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.white,
//                                   foregroundColor: const Color(0xFF0066FF),
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 35,
//                                     vertical: 24,
//                                   ),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(28),
//                                   ),
//                                   elevation: 0,
//                                 ),
//                                 child: Text(
//                                   "View My Work",
//                                   style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 18),
//                               OutlinedButton(
//                                 onPressed: widget.LetsBuildTogether,
//                                 style: OutlinedButton.styleFrom(
//                                   side: const BorderSide(
//                                     color: Colors.white,
//                                     width: 2,
//                                   ),
//                                   foregroundColor: Colors.white,
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 38,
//                                     vertical: 24,
//                                   ),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(28),
//                                   ),
//                                 ),
//                                 child: Text(
//                                   "Let's Build Together",
//                                   style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(width: screenWidth * 0.09),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _circle(double size, double opacity) {
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.white.withOpacity(opacity),
//       ),
//     );
//   }

//   Widget _headerText(String text, Color color,double fontsize, double height) {
//     return Text(
//       text,
//       style: GoogleFonts.poppins(
//         fontSize: fontsize,//60
//         fontWeight: FontWeight.bold,
//         color: color,
//         height: height,//1.1,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:code_way/MVVM/utils/widgets/lotti_animation.dart';

class HomeSection extends StatefulWidget {
  final VoidCallback onViewWorkPressed;
  final VoidCallback LetsBuildTogether;

  const HomeSection({
    super.key,
    required this.onViewWorkPressed,
    required this.LetsBuildTogether,
  });

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  bool _isImageLoaded = false;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.wait([
      precacheImage(
        const AssetImage(
          "assets/background_gradient_image/home_color_image1.png",
        ),
        context,
      ),
      precacheImage(const AssetImage("assets/images/images.png"), context),
    ]).whenComplete(() {
      if (mounted) {
        setState(() {
          _isImageLoaded = true;
        });
        _fadeController.forward();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      // Mobile
      return _HomeMobile(
        fadeAnimation: _fadeAnimation,
        isImageLoaded: _isImageLoaded,
        scrollController: _scrollController,
        onViewWorkPressed: widget.onViewWorkPressed,
        letsBuildTogether: widget.LetsBuildTogether,
      );
    } else if (screenWidth < 1024) {
      // Tablet
      return _HomeTablet(
        fadeAnimation: _fadeAnimation,
        isImageLoaded: _isImageLoaded,
        scrollController: _scrollController,
        onViewWorkPressed: widget.onViewWorkPressed,
        letsBuildTogether: widget.LetsBuildTogether,
      );
    } else if (screenWidth < 1440) {
      // Desktop
      return _HomeDesktop(
        fadeAnimation: _fadeAnimation,
        isImageLoaded: _isImageLoaded,
        scrollController: _scrollController,
        onViewWorkPressed: widget.onViewWorkPressed,
        letsBuildTogether: widget.LetsBuildTogether,
      );
    } else if (screenWidth >= 1440) {
      // Fallback to mobile
      return _HomelargeDesktop(
        fadeAnimation: _fadeAnimation,
        isImageLoaded: _isImageLoaded,
        scrollController: _scrollController,
        onViewWorkPressed: widget.onViewWorkPressed,
        letsBuildTogether: widget.LetsBuildTogether,
      );
    } else {
      // Fallback to mobile
      return _HomeMobile(
        fadeAnimation: _fadeAnimation,
        isImageLoaded: _isImageLoaded,
        scrollController: _scrollController,
        onViewWorkPressed: widget.onViewWorkPressed,
        letsBuildTogether: widget.LetsBuildTogether,
      );
    }
  }
}

// ---------------- MOBILE ----------------
class _HomeMobile extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final bool isImageLoaded;
  final ScrollController scrollController;
  final VoidCallback? onViewWorkPressed;
  final VoidCallback letsBuildTogether;

  const _HomeMobile({
    required this.fadeAnimation,
    required this.isImageLoaded,
    required this.scrollController,
    this.onViewWorkPressed,
    required this.letsBuildTogether,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    if (!isImageLoaded) {
      return Container(
        color: Colors.white,
        height: screenHeight,
        width: double.infinity,
        child: const Center(child: CodewayLoadingScreen()),
      );
    }

    return FadeTransition(
  opacity: fadeAnimation,
  child: SingleChildScrollView(
    controller: scrollController,
    child: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/background_gradient_image/home_color_image1.png",
          ),
          fit: BoxFit.cover,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0066FF), Color(0xFF00B4D8), Color(0xFF48CAE4)],
        ),
      ),
      child: Stack(
        children: [
          // Circles
          Positioned(top: -30, left: -30, child: _circle(120, 0.1)),
          Positioned(top: 50, left: 20, child: _circle(100, 0.08)),
          Positioned(bottom: 50, left: 30, child: _circle(140, 0.08)),
          Positioned(bottom: -50, right: -30, child: _circle(160, 0.1)),

          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 35,),
              // Header
              Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 5,
                children: [
                  _headerText("Hi, I'm ", Colors.white, 35, 1.2),
                  _headerText("Sadiq Ali", const Color(0xFFFFD700), 36, 1.2),
                ],
              ),
              const SizedBox(height: 10),
              _headerText("Building the Future", Colors.white, 36, 1.2),
              _headerText("of Apps.", Colors.white, 35, 1.2),
              const SizedBox(height: 18),
              Text(
                "Full Stack Flutter Developer | Founder @ CODEWAY",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.85),
                  height: 1.5,
                ),
              ),
              Text(
                "SOFTWARE SOLUTIONS.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.85),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),
          
              // Button
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: letsBuildTogether,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 18,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Let's Talk",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 123, 255),
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
          
              // Image
              Padding(
                padding:  EdgeInsets.only(left: screenWidth * 0.1),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: screenWidth * 0.8,
                    maxHeight: 380, // limit max height
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/images.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              
            ],
          ),
        ],
      ),
    ),
  ),
);

  }

  Widget _circle(double size, double opacity) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(opacity),
      ),
    );
  }

  Widget _headerText(String text, Color color, double size, double height) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
        height: height,
      ),
    );
  }
}

// ---------------- TABLET ----------------


class _HomeTablet extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final bool isImageLoaded;
  final ScrollController scrollController;
  final VoidCallback onViewWorkPressed;
  final VoidCallback letsBuildTogether;

  const _HomeTablet({
    super.key,
    required this.fadeAnimation,
    required this.isImageLoaded,
    required this.scrollController,
    required this.onViewWorkPressed,
    required this.letsBuildTogether,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (!isImageLoaded) {
      return Container(
        color: Colors.white,
        height: screenHeight,
        width: double.infinity,
        child: const Center(child: CodewayLoadingScreen()),
      );
    }

    // Determine device type
    bool isMobile = screenWidth < 700;
    bool isTablet = screenWidth >= 700 && screenWidth < 1100;
    bool isDesktop = screenWidth >= 1100;

    // Scale factor for text, image, buttons
    double scale = 1;
    if (isMobile) scale = 0.7;
    if (isTablet) scale = 0.85;

    return FadeTransition(
      opacity: fadeAnimation,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.05,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/background_gradient_image/home_color_image1.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: isMobile
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildTextSection(screenWidth, scale),
                    SizedBox(width: 50),
                    _buildImage(screenWidth * 1, screenHeight, scale, isMobile: false),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: _buildTextSection(screenWidth, scale),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      flex: 4,
                      child: _buildImage(screenWidth, screenHeight, scale),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildTextSection(double screenWidth, double scale) {
    double fontSize = 36 * scale;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _headerText("Hi, I'm ", Colors.white, fontSize, 1.2),
            _headerText("Sadiq Ali", const Color(0xFFFFD700), fontSize, 1.2),
            _headerText(" —", Colors.white, fontSize, 1.2),
          ],
        ),
        _headerText("Building the Future", Colors.white, fontSize, 1.2),
        _headerText("of Apps.", Colors.white, fontSize, 1.1),
        SizedBox(height: 12),
        Text(
          "Full-Stack Flutter Developer & Founder at CODEWAY\nSOFTWARE SOLUTIONS.",
          style: GoogleFonts.poppins(
            fontSize: 14 * scale,
            color: Colors.white.withOpacity(0.9),
            height: 1.6,
          ),
        ),
        SizedBox(height: 24),
        _buildButtons(screenWidth, scale),
      ],
    );
  }

  Widget _buildButtons(double screenWidth, double scale,
      {bool isMobile = false}) {
    return 
        
         Row(
            children: [
              ElevatedButton(
                onPressed: onViewWorkPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF0066FF),
                  padding: EdgeInsets.symmetric(
                    horizontal: 28 * scale,
                    vertical: 14 * scale,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "View My Work",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 13 * scale,
                  ),
                ),
              ),
              SizedBox(width: 12),
              OutlinedButton(
                onPressed: letsBuildTogether,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white, width: 2),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 28 * scale,
                    vertical: 14 * scale,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  "Let's Build Together",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 13 * scale,
                  ),
                ),
              ),
            ],
          );
  }

  Widget _buildImage(double screenWidth, double screenHeight, double scale,
      {bool isMobile = false}) {
    double imgWidth = screenWidth * (isMobile ? 0.7 : 0.38);
    double imgHeight = screenHeight * (isMobile ? 0.35 : 0.52);

    return Center(
      child: Container(
        width: imgWidth,
        height: imgHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage("assets/images/images.png"),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _headerText(String text, Color color, double size, double height) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
        height: height,
      ),
    );
  }
}




// ---------------- DESKTOP ----------------
class _HomeDesktop extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final bool isImageLoaded;
  final ScrollController scrollController;
  final VoidCallback onViewWorkPressed;
  final VoidCallback letsBuildTogether;

  const _HomeDesktop({
    required this.fadeAnimation,
    required this.isImageLoaded,
    required this.scrollController,
    required this.onViewWorkPressed,
    required this.letsBuildTogether,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    if (!isImageLoaded) {
      return Container(
        color: Colors.white,
        height: screenHeight,
        width: double.infinity,
        child: const Center(child: CodewayLoadingScreen()),
      );
    }

    // Responsive scaling for text and images
    double scale = screenWidth / 1600; // base desktop width
    if (scale > 1) scale = 1;
    if (scale < 0.8) scale = 0.8;

    return FadeTransition(
      opacity: fadeAnimation,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          width: double.infinity,
          height: screenHeight * 0.9, // slightly reduced height for better centering
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/background_gradient_image/home_color_image1.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // Decorative circles
              Positioned(top: -50, left: -50, child: _circle(200, 0.1)),
              Positioned(top: 80, left: 60, child: _circle(150, 0.08)),
              Positioned(bottom: 100, left: 150, child: _circle(180, 0.08)),
              Positioned(bottom: -80, left: -30, child: _circle(220, 0.1)),
              Positioned(top: -80, right: -80, child: _circle(250, 0.08)),
              Positioned(top: 150, right: 100, child: _circle(200, 0.06)),
              Positioned(bottom: -100, right: -50, child: _circle(280, 0.1)),
              Positioned(bottom: 200, right: 150, child: _circle(160, 0.07)),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // LEFT CONTENT
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              _headerText(
                                  "Hi, I'm ", Colors.white, 70 * scale, 1.1),
                              _headerText(
                                  "Sadiq Ali", const Color(0xFFFFD700), 70 * scale, 1.1),
                              _headerText(" —", Colors.white, 70 * scale, 1.1),
                            ],
                          ),
                          _headerText("Building the Future", Colors.white, 70 * scale, 1.1),
                          _headerText("of Apps.", Colors.white, 70 * scale, 1.1),
                          const SizedBox(height: 20),
                          Text(
                            "Full-Stack Flutter Developer & Founder at CODEWAY\nSOFTWARE SOLUTIONS.",
                            style: GoogleFonts.poppins(
                              fontSize: 18 * scale,
                              color: Colors.white.withOpacity(0.85),
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 30),

                          // Buttons
                          Wrap(
                            spacing: 20,
                            children: [
                              ElevatedButton(
                                onPressed: onViewWorkPressed,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFF0066FF),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 40 * scale,
                                    vertical: 24 * scale,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  "View My Work",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16 * scale,
                                  ),
                                ),
                              ),
                              OutlinedButton(
                                onPressed: letsBuildTogether,
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 40 * scale,
                                    vertical: 24 * scale,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                ),
                                child: Text(
                                  "Let's Build Together",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16 * scale,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: screenWidth * 0.05),

                    // RIGHT IMAGE
                    Expanded(
                      flex: 5,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: screenWidth * 0.45 * scale,
                          height: screenHeight * 0.65 * scale,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/images.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circle(double size, double opacity) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(opacity),
      ),
    );
  }

  Widget _headerText(String text, Color color, double size, double height) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
        height: height,
      ),
    );
  }
}


class _HomelargeDesktop extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final bool isImageLoaded;
  final ScrollController scrollController;
  final VoidCallback onViewWorkPressed;
  final VoidCallback letsBuildTogether;

  const _HomelargeDesktop({
    required this.fadeAnimation,
    required this.isImageLoaded,
    required this.scrollController,
    required this.onViewWorkPressed,
    required this.letsBuildTogether,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    if (!isImageLoaded) {
      return Container(
        color: Colors.white,
        height: screenHeight,
        width: double.infinity,
        child: const Center(child: CodewayLoadingScreen()),
      );
    }

    return FadeTransition(
      opacity: fadeAnimation,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          height: screenHeight,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/background_gradient_image/home_color_image1.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(top: -50, left: -50, child: _circle(200, 0.1)),
              Positioned(top: 80, left: 60, child: _circle(150, 0.08)),
              Positioned(bottom: 100, left: 150, child: _circle(180, 0.08)),
              Positioned(bottom: -80, left: -30, child: _circle(220, 0.1)),
              Positioned(top: -80, right: -80, child: _circle(250, 0.08)),
              Positioned(top: 150, right: 100, child: _circle(200, 0.06)),
              Positioned(bottom: -100, right: -50, child: _circle(280, 0.1)),
              Positioned(bottom: 200, right: 150, child: _circle(160, 0.07)),

              // Right-side image
              Positioned(
                left: 850,
                bottom: 100,
                child: Container(
                  width: screenWidth * 0.50,
                  height: screenHeight * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/images.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.08,
                  right: screenWidth * 0.05,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 38,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenWidth * 0.11),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _headerText("Hi, I'm ", Colors.white, 60, 1.1),
                              _headerText(
                                "Sadiq Ali",
                                const Color(0xFFFFD700),
                                60,
                                1.1,
                              ),
                              _headerText(" —", Colors.white, 60, 1.1),
                            ],
                          ),
                          _headerText(
                            "Building the Future",
                            Colors.white,
                            60,
                            1.1,
                          ),
                          _headerText("of Apps.", Colors.white, 60, 1.1),
                          const SizedBox(height: 20),
                          Text(
                            "Full-Stack Flutter Developer & Founder at CODEWAY",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: Colors.white.withOpacity(0.85),
                              height: 1.6,
                            ),
                          ),
                          Text(
                            "SOFTWARE SOLUTIONS.",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: Colors.white.withOpacity(0.85),
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 35),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: onViewWorkPressed,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFF0066FF),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 35,
                                    vertical: 24,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  "View My Work",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 18),
                              OutlinedButton(
                                onPressed: letsBuildTogether,
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 38,
                                    vertical: 24,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                ),
                                child: Text(
                                  "Let's Build Together",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.09),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circle(double size, double opacity) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(opacity),
      ),
    );
  }

  Widget _headerText(String text, Color color, double size, double height) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
        height: height,
      ),
    );
  }
}
