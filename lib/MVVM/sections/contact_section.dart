
// import 'dart:convert';
// import 'package:code_way/MVVM/model/mydata.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';

// class ContactSection extends StatefulWidget {
//   const ContactSection({super.key});

//   @override
//   State<ContactSection> createState() => _ContactSectionState();
// }

// class _ContactSectionState extends State<ContactSection> {
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _projectController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     Mydata.fetchData().then((_) => setState(() {}));
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _projectController.dispose();
//     super.dispose();
//   }

//   Future<void> _sendMessage() async {
//     final name = _nameController.text.trim();
//     final email = _emailController.text.trim();
//     final project = _projectController.text.trim();

//     if (name.isEmpty || email.isEmpty || project.isEmpty) {
//       setState(() {
//         _nameController.clear();
//         _emailController.clear();
//         _projectController.clear();
//       });
//       return;
//     }

//     setState(() => _isLoading = true);

//     try {
//       final url = Uri.parse(Mydata.apiUrl);
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: json.encode({
//           'name': name,
//           'email': email,
//           'project': project,
//         }),
//       );
//       final result = json.decode(response.body);
//       print("Response: $result");
//     } catch (e) {
//       print("Error sending message: $e");
//     } finally {
//       setState(() {
//         _isLoading = false;
//         _nameController.clear();
//         _emailController.clear();
//         _projectController.clear();
//       });
//     }
//   }

//   void _launchURL(String url) async {
//     if (url.isNotEmpty && await canLaunch(url)) {
//       await launch(url);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;

//     if (width < 600) {
//       return _buildLayout(context, isMobile: true);
//     } else if (width < 1024) {
//       return _buildLayout(context, isTablet: true);
//     } else if (width < 1440) {
//       return _buildLayout(context, isDesktop: true);
//     } else {
//       return _buildLayout(context, isLargeDesktop: true);
//     }
//   }

//   Widget _buildLayout(
//     BuildContext context, {
//     bool isMobile = false,
//     bool isTablet = false,
//     bool isDesktop = false,
//     bool isLargeDesktop = false,
//   }) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final horizontalPadding = screenWidth > 900 ? 100.0 : 24.0;
//     final verticalPadding = 80.0;

//     // Determine if layout should be row (desktop/large desktop) or column (mobile/tablet)
//     final useRowLayout = isDesktop || isLargeDesktop;

//     return Container(
//       width: double.infinity,
//       color: Colors.white,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
//         child: useRowLayout
//             ? Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(flex: 1, child: _buildLeftSection()),
//                   const SizedBox(width: 40),
//                   Expanded(flex: 1, child: _buildFormSection()),
//                 ],
//               )
//             : Column(
//                 children: [
//                   _buildLeftSection(),
//                   const SizedBox(height: 40),
//                   _buildFormSection(),
//                 ],
//               ),
//       ),
//     );
//   }

//   Widget _buildLeftSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Let's Build Something Together",
//           style: GoogleFonts.poppins(
//             fontSize: 36,
//             fontWeight: FontWeight.bold,
//             color: Colors.black87,
//             height: 1.3,
//           ),
//         ),
//         const SizedBox(height: 20),
//         Text(
//           "I'd love to hear your idea — let's create a product that scales\nand makes a real impact in your industry.",
//           style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54, height: 1.6),
//         ),
//         const SizedBox(height: 30),
//         Wrap(
//           spacing: 16,
//           runSpacing: 12,
//           children: [
//             ElevatedButton(
//               onPressed: () => _launchURL(Mydata.whatsappLink),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF25D366),
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Image.asset("assets/images/whatsapp.png", height: 28, width: 20),
//                   const SizedBox(width: 8),
//                   Text("WhatsApp", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500)),
//                 ],
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () => _launchURL('mailto:${Mydata.emailAddress}'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF0EA5E9),
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Image.asset("assets/images/Email.png"),
//                   const SizedBox(width: 8),
//                   Text("Email", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildFormSection() {
//     return Container(
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: const Offset(0, 6))],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildTextField(label: "Name", hint: "Your name", controller: _nameController),
//           const SizedBox(height: 20),
//           _buildTextField(label: "Email", hint: "your@email.com", controller: _emailController),
//           const SizedBox(height: 20),
//           _buildTextField(
//             label: "Project Details",
//             hint: "Tell me about your project...",
//             controller: _projectController,
//             maxLines: 5,
//           ),
//           const SizedBox(height: 24),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: _isLoading ? null : _sendMessage,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF0EA5E9),
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(vertical: 18),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//               ),
//               child: _isLoading
//                   ? const CircularProgressIndicator(color: Colors.white)
//                   : Text(
//                       "Send Message",
//                       style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
//                     ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required String label,
//     required String hint,
//     required TextEditingController controller,
//     int maxLines = 1,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500)),
//         const SizedBox(height: 8),
//         TextField(
//           controller: controller,
//           maxLines: maxLines,
//           decoration: InputDecoration(
//             hintText: hint,
//             hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.black38),
//             filled: true,
//             fillColor: Colors.white,
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.grey.shade300),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(color: Color(0xFF0EA5E9), width: 2),
//             ),
//             contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:convert';
import 'package:code_way/MVVM/model/mydata.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

enum LayoutType { mobile, tablet, desktop, largeDesktop }

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _projectController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    Mydata.fetchData().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _projectController.dispose();
    super.dispose();
  }

  // ✅ FIXED: Properly send data as form-urlencoded so Apps Script can read it
  Future<void> _sendMessage() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final project = _projectController.text.trim();

    if (name.isEmpty || email.isEmpty || project.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("⚠️ Please fill in all fields.")),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final url = Uri.parse(Mydata.apiUrl);

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {
          "name": name,
          "email": email,
          "project": project,
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✅ Message sent successfully!")),
        );
        print("Response: ${response.body}");
      } else {
        print("❌ Failed: ${response.statusCode}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("❌ Failed to send: ${response.statusCode}")),
        );
      }
    } catch (e) {
      print("⚠️ Error sending message: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("⚠️ Error: $e")),
      );
    } finally {
      setState(() {
        _isLoading = false;
        _nameController.clear();
        _emailController.clear();
        _projectController.clear();
      });
    }
  }

  void _launchURL(String url) async {
    if (url.isNotEmpty && await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    LayoutType layout;
    if (width < 600) {
      layout = LayoutType.mobile;
    } else if (width < 1024) {
      layout = LayoutType.tablet;
    } else if (width < 1440) {
      layout = LayoutType.desktop;
    } else {
      layout = LayoutType.largeDesktop;
    }

    return _buildLayout(context, layout: layout);
  }

  Widget _buildLayout(BuildContext context, {required LayoutType layout}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = layout == LayoutType.largeDesktop
        ? 120.0
        : layout == LayoutType.desktop
            ? 80.0
            : layout == LayoutType.tablet
                ? 40.0
                : 24.0;
    final verticalPadding = 40.0;
    final useRowLayout =
        layout == LayoutType.desktop || layout == LayoutType.largeDesktop;

    return Container(
      width: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        child: useRowLayout
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(flex: 1, child: _LeftSection(launchURL: _launchURL)),
                  SizedBox(width: screenWidth * 0.03),
                  Flexible(
                    flex: 1,
                    child: _FormSection(
                      nameController: _nameController,
                      emailController: _emailController,
                      projectController: _projectController,
                      isLoading: _isLoading,
                      onSubmit: _sendMessage,
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _LeftSection(launchURL: _launchURL),
                  const SizedBox(height: 24),
                  _FormSection(
                    nameController: _nameController,
                    emailController: _emailController,
                    projectController: _projectController,
                    isLoading: _isLoading,
                    onSubmit: _sendMessage,
                  ),
                ],
              ),
      ),
    );
  }
}

// ---------------- Left Section ----------------
class _LeftSection extends StatelessWidget {
  final Function(String url)? launchURL;

  const _LeftSection({this.launchURL});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       SizedBox(height: 100,),
        Text(
          "Let's Build Something Together",
          style: GoogleFonts.poppins(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "I'd love to hear your idea — let's create a product that scales\nand makes a real impact in your industry.",
          style: GoogleFonts.poppins(
              fontSize: 16, color: Colors.black54, height: 1.6),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: () => launchURL?.call(Mydata.whatsappLink),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF25D366),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/whatsapp.png",
                      height: 28, width: 20),
                  const SizedBox(width: 8),
                  Text("WhatsApp",
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => launchURL?.call('mailto:${Mydata.emailAddress}'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0EA5E9),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/Email.png"),
                  const SizedBox(width: 8),
                  Text("Email",
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ---------------- Form Section ----------------
class _FormSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController projectController;
  final bool isLoading;
  final VoidCallback onSubmit;

  const _FormSection({
    required this.nameController,
    required this.emailController,
    required this.projectController,
    required this.isLoading,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 6))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
              label: "Name", hint: "Your name", controller: nameController),
          const SizedBox(height: 20),
          _buildTextField(
              label: "Email", hint: "your@email.com", controller: emailController),
          const SizedBox(height: 20),
          _buildTextField(
            label: "Project Details",
            hint: "Tell me about your project...",
            controller: projectController,
            maxLines: 5,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isLoading ? null : onSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0EA5E9),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(
                      "Send Message",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                GoogleFonts.poppins(fontSize: 14, color: Colors.black38),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: Color(0xFF0EA5E9), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }
}