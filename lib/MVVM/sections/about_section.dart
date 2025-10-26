import 'package:code_way/MVVM/model/mydata.dart';
import 'package:code_way/MVVM/sections/clients_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  void initState() {
    super.initState();
    Mydata.fetchData().then((_) {
      setState(() {});
    });
  }

  bool _isMobileOrTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 900;

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _makePhoneCall(BuildContext context) async {
    if (_isMobileOrTablet(context)) {
      await _launchUrl('tel:${Mydata.phoneNumber}');
    }
  }

  Future<void> _sendEmail() async {
    await _launchUrl('mailto:${Mydata.emailAddress}');
  }

  Future<void> downloadPDF(String url) async {
    await _launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      return _Mobile_About(
        sendEmail: _sendEmail,
        makePhoneCall: () => _makePhoneCall(context),
        downloadCV: downloadPDF,
      );
    } else if (screenWidth < 1024) {
      return _Tablet_About(
        sendEmail: _sendEmail,
        makePhoneCall: () => _makePhoneCall(context),
        downloadCV: downloadPDF,
      );
    } else if (screenWidth < 1440) {
      return _Desktop_About(
        sendEmail: _sendEmail,
        makePhoneCall: () => _makePhoneCall(context),
        downloadCV: downloadPDF,
      );
    } else if (screenWidth >= 1440) {
      return _LargeDesktop_About(
        sendEmail: _sendEmail,
        makePhoneCall: () => _makePhoneCall(context),
        downloadCV: downloadPDF,
      );
    } else {
      return _Mobile_About(
        sendEmail: _sendEmail,
        makePhoneCall: () => _makePhoneCall(context),
        downloadCV: downloadPDF,
      );
    }
  }
}


class _Mobile_About extends StatelessWidget {
  final Future<void> Function()? sendEmail;
  final Future<void> Function()? makePhoneCall;
  final Future<void> Function(String)? downloadCV;

  const _Mobile_About({
    super.key,
    required this.sendEmail,
    required this.makePhoneCall,
    required this.downloadCV,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.08,
              vertical: screenHeight * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Image
                Container(
                  width: screenWidth * 0.4,
                  height: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFF00B4D8), Color(0xFF007BFF)],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(Mydata.profileImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.04),

                // About Me Text
                Text(
                  "About Me & CODEWAY",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(21, 27, 37, 1),
                    fontSize: 27,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "I'm a passionate full-stack Flutter developer crafting seamless cross-platform apps "
                  "for Android, iOS, Web, and Desktop. With over 1 year of experience, I specialize in turning "
                  "complex ideas into elegant, scalable solutions.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.6,
                    color: Color.fromRGBO(93, 105, 122, 1),
                  ),
                ),

                SizedBox(height: screenHeight * 0.04),

                // CODEWAY Info
                Row(
                  children: [
                    Container(
                      height: 75,
                      width: 5,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 200, 150, 100),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.04),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '"At CODEWAY SOFTWARE SOLUTIONS, ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              height: 1.3,
                              color: Color.fromRGBO(0, 123, 255, 1),
                            ),
                          ),
                          Text(
                            "we help businesses turn ideas into ",
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.3,
                              color: Color.fromRGBO(0, 123, 255, 1),
                            ),
                          ),
                          Text(
                            "digital products.\"",
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.3,
                              color: Color.fromRGBO(0, 123, 255, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.28),
              ],
            ),
          ),

          // Top circular icon overlay - positioned relative to profile image
          Positioned(
            top: screenHeight * 0.04,
            left:
                (screenWidth * 0.5) -
                (screenWidth * 0.2) -
                10, // Center minus half image width minus offset
            child: Container(
              width: 49,
              height: 49,
              decoration: const BoxDecoration(
                color: Color(0xFF007BFF),
                shape: BoxShape.circle,
              ),
              child: Image.asset("assets/images/code_icon.png", scale: 1.3),
            ),
          ),

          // Experience Card - positioned relative to profile image
          Positioned(
            top:
                screenHeight * 0.04 +
                (screenWidth * 0.4) -
                30, // Top padding + image height - offset
            right: screenWidth * 0.08, // Align with right padding
            child: Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF007BFF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${Mydata.years}+",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Years Experience",
                    style: TextStyle(fontSize: 9, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),

          // Email Section
          Positioned(
            bottom: screenHeight * 0.22,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => sendEmail?.call(),
                    child: Container(
                      width: 50,
                      height: 55,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(33, 0, 123, 255),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        "assets/decoration_items/email.png",
                        scale: 20,
                        color: const Color.fromRGBO(0, 123, 255, 1),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color.fromRGBO(22, 22, 22, 1),
                          ),
                        ),
                        Text(
                          Mydata.emailAddress,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(78, 77, 77, 1),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Phone Section
          Positioned(
            bottom: screenHeight * 0.13,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => makePhoneCall?.call(),
                    child: Container(
                      width: 50,
                      height: 55,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(1, 205, 154, 0.144),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        "assets/decoration_items/call.png",
                        scale: 20,
                        color: const Color.fromRGBO(1, 205, 154, 1),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Phone",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color.fromRGBO(22, 22, 22, 1),
                          ),
                        ),
                        Text(
                          "+91 ${Mydata.phoneNumber}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(78, 77, 77, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Download CV Button - centered horizontally
          Positioned(
            bottom: screenHeight * 0.04,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () => downloadCV?.call(Mydata.resumeLink),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007BFF),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  'Download CV',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Tablet_About extends StatelessWidget {
  final Future<void> Function()? sendEmail;
  final Future<void> Function()? makePhoneCall;
  final Future<void> Function(String)? downloadCV;

  const _Tablet_About({
    super.key,
    this.sendEmail,
    this.makePhoneCall,
    this.downloadCV,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // 🔹 Responsive scaling for tablets
    final scale = (screenWidth.clamp(600, 1024) - 600) / 424;
    final imageWidth = screenWidth * 0.32;
    final horizontalPadding = screenWidth * 0.08;
    final verticalPadding = screenHeight * 0.06;

    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🔹 Image + Icon + Experience box grouped together
            Container(
              width: imageWidth,
              height: 380 + (scale * 30),
              alignment: Alignment.center,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFF007BFF),
                        width: 4,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final imgWidth = constraints.maxWidth;
                          final imgHeight = constraints.maxHeight;

                          return Image.asset(
                            Mydata.profileImage,
                            width: imgWidth,
                            height: imgHeight,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              // fallback placeholder if image fails
                              return Container(
                                color: Colors.grey[300],
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),

                  // 🔹 Top-left Code Icon
                  Positioned(
                    top: -20,
                    left: -20,
                    child: Container(
                      width: 55 + (scale * 6),
                      height: 55 + (scale * 6),
                      decoration: const BoxDecoration(
                        color: Color(0xFF007BFF),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/code_icon.png",
                          width: 28,
                          height: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  // 🔹 Bottom-right "Years Experience" Box
                  Positioned(
                    bottom: -15,
                    right: -35, // ✅ Moved a bit left from -15 → 10
                    child: Container(
                      width: 120 + (scale * 10),
                      height: 60 + (scale * 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF007BFF),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "1+",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Years Experience",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: screenWidth * 0.07),

            // 🔹 About Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "About Me & CODEWAY",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(21, 27, 37, 1),
                      fontSize: 20 + (scale * 5),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "I'm a passionate full-stack Flutter developer crafting seamless cross-platform apps "
                    "for Android, iOS, Web, and Desktop. With over 1 year of experience, I specialize in turning "
                    "complex ideas into elegant, scalable solutions.",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14 + (scale * 2),
                      color: const Color.fromRGBO(93, 105, 122, 1),
                      height: 1.6,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // 🔹 CODEWAY Quote
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 4,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 200, 150, 100),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '"At CODEWAY SOFTWARE SOLUTIONS,',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.6,
                                color: Color.fromRGBO(0, 123, 255, 1),
                              ),
                            ),
                            Text(
                              ' we help businesses',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.6,
                                color: Color.fromRGBO(0, 123, 255, 1),
                              ),
                            ),
                            Text(
                              " turn ideas into scalable digital products.",
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.6,
                                color: Color.fromRGBO(0, 123, 255, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // 🔹 Contact Info — Email
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => sendEmail?.call(),
                        child: Container(
                          width: 48,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(33, 0, 123, 255),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            "assets/decoration_items/email.png",
                            scale: 20,
                            color: const Color.fromRGBO(0, 123, 255, 1),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Color.fromRGBO(22, 22, 22, 1),
                            ),
                          ),
                          Text(
                            Mydata.emailAddress,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(78, 77, 77, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.025),

                  // 🔹 Contact Info — Phone
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => makePhoneCall?.call(),
                        child: Container(
                          width: 48,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(1, 205, 154, 0.144),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            "assets/decoration_items/call.png",
                            scale: 20,
                            color: const Color.fromRGBO(1, 205, 154, 1),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Phone",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Color.fromRGBO(22, 22, 22, 1),
                            ),
                          ),
                          Text(
                            "+91 ${Mydata.phoneNumber}",
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(78, 77, 77, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  ElevatedButton(
                    onPressed: () => downloadCV?.call(Mydata.resumeLink),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF007BFF),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      'Download CV',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Desktop_About extends StatelessWidget {
  final Future<void> Function()? sendEmail;
  final Future<void> Function()? makePhoneCall;
  final Future<void> Function(String)? downloadCV;

  const _Desktop_About({
    super.key,
    this.sendEmail,
    this.makePhoneCall,
    this.downloadCV,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Scale factor for responsive sizes
    final scale = (screenWidth / 1440).clamp(0.8, 1.0);

    final imageWidth = screenWidth * 0.25;
    final imageHeight = 360 * scale;

    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.1,
          vertical: screenHeight * 0.08,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Column for Image + Button + Experience
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Profile Image
                    Container(
                      width: imageWidth,
                      height: imageHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Color(0xFF00B4D8), Color(0xFF007BFF)],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(Mydata.profileImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Top-left Code Icon
                    Positioned(
                      top: -20,
                      left: -20,
                      child: Container(
                        width: 70 * scale,
                        height: 70 * scale,
                        decoration: const BoxDecoration(
                          color: Color(0xFF007BFF),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset("assets/images/code_icon.png"),
                      ),
                    ),

                    // Bottom-right Years Experience Box
                    Positioned(
                      bottom: -40,
                      left: 190,
                      child: Container(
                        width: 145 * scale,
                        height: 80 * scale,
                        decoration: BoxDecoration(
                          color: const Color(0xFF007BFF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${Mydata.years}+",
                              style: TextStyle(
                                fontSize: 24 * scale,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Years Experience",
                              style: TextStyle(
                                fontSize: 14 * scale,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 50,
                ), // Fixed spacing between image and button
                // Download CV Button
                ElevatedButton(
                  onPressed: () => downloadCV?.call(Mydata.resumeLink),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF007BFF),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 28 * scale,
                      vertical: 22 * scale,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    'Download CV',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16 * scale,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(width: screenWidth * 0.08),

            // About Text Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Me & CODEWAY",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 36 * scale,
                      color: const Color.fromRGBO(21, 27, 37, 1),
                    ),
                    softWrap: true,
                  ),
                  SizedBox(height: 16 * scale),
                  Text(
                    "I'm a passionate full-stack Flutter developer crafting seamless cross-platform apps "
                    "for Android, iOS, Web, and Desktop. With over 1 year of experience, I specialize in turning "
                    "complex ideas into elegant, scalable solutions.",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 18 * scale,
                      color: const Color.fromRGBO(93, 105, 122, 1),
                      height: 1.6,
                    ),
                    softWrap: true,
                  ),
                  SizedBox(height: 24 * scale),
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 70,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 200, 150, 100),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      SizedBox(width: 12 * scale),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '"At CODEWAY SOFTWARE SOLUTIONS, we help businesses',
                              style: TextStyle(
                                fontSize: 20,
                                height: 1.6,
                                color: Color.fromRGBO(0, 123, 255, 1),
                              ),
                            ),
                            Text(
                              "turn ideas into scalable digital products.",
                              style: TextStyle(
                                fontSize: 20,
                                height: 1.6,
                                color: Color.fromRGBO(0, 123, 255, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24 * scale),
                  // Contact Info - Email & Phone
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => sendEmail?.call(),
                        child: Container(
                          width: 50 * scale,
                          height: 56 * scale,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(33, 0, 123, 255),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            "assets/decoration_items/email.png",
                            scale: 20,
                            color: const Color.fromRGBO(0, 123, 255, 1),
                          ),
                        ),
                      ),
                      SizedBox(width: 12 * scale),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 16 * scale,
                              fontWeight: FontWeight.w800,
                              color: const Color.fromRGBO(22, 22, 22, 1),
                            ),
                          ),
                          Text(
                            Mydata.emailAddress,
                            style: TextStyle(
                              fontSize: 16 * scale,
                              color: const Color.fromRGBO(78, 77, 77, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16 * scale),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => makePhoneCall?.call(),
                        child: Container(
                          width: 50 * scale,
                          height: 56 * scale,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(1, 205, 154, 0.144),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            "assets/decoration_items/call.png",
                            scale: 20,
                            color: const Color.fromRGBO(1, 205, 154, 1),
                          ),
                        ),
                      ),
                      SizedBox(width: 12 * scale),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Phone",
                            style: TextStyle(
                              fontSize: 16 * scale,
                              fontWeight: FontWeight.w800,
                              color: const Color.fromRGBO(22, 22, 22, 1),
                            ),
                          ),
                          Text(
                            "+91 ${Mydata.phoneNumber}",
                            style: TextStyle(
                              fontSize: 16 * scale,
                              color: const Color.fromRGBO(78, 77, 77, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//large desktop about section
class _LargeDesktop_About extends StatelessWidget {
  final Future<void> Function()? sendEmail;
  final Future<void> Function()? makePhoneCall;
  final Future<void> Function(String)? downloadCV;

  const _LargeDesktop_About({
    super.key,
    this.sendEmail,
    this.makePhoneCall,
    this.downloadCV,
  });

  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1,
              vertical: screenHeight * 0.08,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth * 0.25,
                  height: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFF00B4D8), Color(0xFF007BFF)],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            Mydata.profileImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: screenWidth * 0.12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.04),
                      Text(
                        "About Me & CODEWAY",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(21, 27, 37, 1),
                          fontSize: 36,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "I'm a passionate full-stack Flutter developer crafting seamless cross-platform apps "
                        "for Android, iOS, Web, and Desktop. With over 1 year of experience, I specialize in turning "
                        "complex ideas into elegant, scalable solutions.",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: const Color.fromRGBO(93, 105, 122, 1),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 5,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(0, 200, 150, 100),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                ' "At CODEWAY SOFTWARE SOLUTIONS, we help businesses',
                                style: TextStyle(
                                  fontSize: 20,
                                  height: 1.6,
                                  color: Color.fromRGBO(0, 123, 255, 1),
                                ),
                              ),
                              Text(
                                "turn ideas into scalable digital products.",
                                style: TextStyle(
                                  fontSize: 20,
                                  height: 1.6,
                                  color: Color.fromRGBO(0, 123, 255, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => sendEmail?.call(),
                            child: Container(
                              width: 50,
                              height: 56,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(33, 0, 123, 255),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset(
                                "assets/decoration_items/email.png",
                                scale: 20,
                                color: const Color.fromRGBO(0, 123, 255, 1),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1.6,
                                  fontWeight: FontWeight.w800,
                                  color: Color.fromRGBO(22, 22, 22, 1),
                                ),
                              ),
                              Text(
                                Mydata.emailAddress,
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.6,
                                  color: Color.fromRGBO(78, 77, 77, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => makePhoneCall?.call(),
                            child: Container(
                              width: 50,
                              height: 56,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(1, 205, 154, 0.144),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset(
                                "assets/decoration_items/call.png",
                                scale: 20,
                                color: const Color.fromRGBO(1, 205, 154, 1),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Phone",
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1.6,
                                  fontWeight: FontWeight.w800,
                                  color: Color.fromRGBO(22, 22, 22, 1),
                                ),
                              ),
                              Text(
                                "+91 ${Mydata.phoneNumber}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.6,
                                  color: Color.fromRGBO(78, 77, 77, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.11,
            right: screenWidth * 0.86,
            child: Container(
              width: 75,
              height: 75,
              decoration: const BoxDecoration(
                color: Color(0xFF007BFF),
                shape: BoxShape.circle,
              ),
              child: Image.asset("assets/images/code_icon.png"),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.05,
            left: screenWidth * 0.16,
            child: ElevatedButton(
              onPressed: () {
                downloadCV?.call(Mydata.resumeLink);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 102, 255),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 5,
              ),
              child: Text(
                'Download CV',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.56,
            right: screenWidth * 0.62,
            child: Container(
              width: 145,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFF007BFF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "${Mydata.years}+",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Years Experience",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(255, 255, 255, 100),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
