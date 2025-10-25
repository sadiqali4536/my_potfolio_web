import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Mydata {
  // ---------- Basic Info ----------
  static String phoneNumber = '';
  static String emailAddress = '';
  static int years = 0;
  static String resumeLink = '';
  static String profileImage = "assets/images/Sadiq_Ali_Business_Profile.png";

  // ---------- Projects ----------
  static List<Map<String, dynamic>> projects = [];

  // ---------- Clients ----------
  static List<Map<String, dynamic>> clients = [];

  // ---------- Admin Links ----------
  static String whatsappLink = '';
  static String githubLink = '';
  static String linkedinLink = '';
  static String instagramLink = '';

  // ---------- API URL ----------
  static const String apiUrl =
      'https://script.google.com/macros/s/AKfycbxVMk_XUkLxQhR2IL-hO3ecHoZVAHyVtZyFPmTpLMvI7_5BTboBOlmh57SqInn098kmug/exec';

  // ---------- Random UI Colors ----------
  static Color _getRandomColor() {
    final colors = [
      const Color(0xFF5B9FFF),
      const Color(0xFF5DD9D9),
      const Color(0xFFFF8FA3),
      const Color(0xFF9B6BFF),
      const Color(0xFFFFC107),
      const Color(0xFF00BCD4),
    ];
    return colors[Random().nextInt(colors.length)];
  }

  static Color _getRandomAccentColor() {
    final colors = [
      const Color(0xFFFFE566),
      const Color(0xFFFF6B6B),
      const Color(0xFF87E7AC),
      const Color(0xFFFFD93D),
      const Color(0xFF4FC3F7),
      const Color(0xFFFFA726),
    ];
    return colors[Random().nextInt(colors.length)];
  }

  // ---------- Fetch Data ----------
  static Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // ---------- MyData ----------
        final myData = data['mydata'] ?? {};
        phoneNumber = myData['PhoneNumber']?.toString() ?? '';
        emailAddress = myData['emailAddress']?.toString() ?? '';
        years =
            int.tryParse(myData['experience_years']?.toString() ?? '0') ?? 0;
        resumeLink = myData['resume link (github)']?.toString() ?? '';

        // ---------- Projects ----------
        final List<dynamic> projectList = data['my project list'] ?? [];

        List<String> parseArray(dynamic value) {
          if (value == null) return [];
          if (value is List) return List<String>.from(value);
          if (value is String) {
            try {
              return List<String>.from(jsonDecode(value));
            } catch (_) {
              return value
                  .replaceAll('[', '')
                  .replaceAll(']', '')
                  .split(',')
                  .map((e) => e.trim().replaceAll('"', ''))
                  .toList();
            }
          }
          return [];
        }

        projects = projectList.map<Map<String, dynamic>>((project) {
          return {
            'title': project['title'] ?? '',
            'description': project['description'] ?? '',
            'image': (project['image'] ?? '').toString(),
            'tech': parseArray(project['tech']),
            'features': parseArray(project['features']),
            'gallery': parseArray(project['gallery']),
            'color': _getRandomColor(),
            'accentColor': _getRandomAccentColor(),
          };
        }).toList();

        // ---------- Clients ----------
final clientData = data['clients'] ?? {};
final logosList = (clientData['logos'] is List)
    ? List<String>.from(clientData['logos'])
    : [];

// Safely parse other client info
final totalProjects = clientData['totalProjects']?.toString() ?? '0';
final satisfactionPoints = clientData['satisfactionPoints']?.toString() ?? '0';
final support = clientData['support']?.toString() ?? '';

clients = logosList.isNotEmpty
    ? logosList.map<Map<String, dynamic>>((logo) {
        return {
          'logo': logo.isNotEmpty ? logo : '',
          'total projects count': totalProjects,
          'satisfaction points': satisfactionPoints,
          'support': support,
          'color': _getRandomColor(),
        };
      }).toList()
    : [
        // Add a placeholder entry if logosList is empty
        {
          'logo': '',
          'total projects count': totalProjects,
          'satisfaction points': satisfactionPoints,
          'support': support,
          'color': _getRandomColor(),
        }
      ];


        // ---------- Admin Links ----------
        final links = data['links'] ?? {};
        whatsappLink = links['whatsapp'] ?? '';
        githubLink = links['github'] ?? '';
        linkedinLink = links['linkedin'] ?? '';
        instagramLink = links['instagram'] ?? '';

        debugPrint('✅ Data fetched successfully');
        print(apiUrl);
      } else {
        debugPrint('❌ Failed: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('⚠️ Error: $e');
    }
  }

  // ---------- Launch URL ----------
  static Future<void> launchUrlLink(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Could not launch $url');
    }
  }
}
