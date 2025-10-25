import 'package:code_way/MVVM/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Codeway Portfolio',
      home: HomePage(),
    );
  }
}


// class PortfolioHome extends StatefulWidget {
//   const PortfolioHome({super.key});

//   @override
//   State<PortfolioHome> createState() => _PortfolioHomeState();
// }

// class _PortfolioHomeState extends State<PortfolioHome> {
//   final ScrollController _scrollController = ScrollController();

//   // Section keys
//   final GlobalKey homeKey = GlobalKey();
//   final GlobalKey aboutKey = GlobalKey();
//   final GlobalKey servicesKey = GlobalKey();
//   final GlobalKey worksKey = GlobalKey();
//   final GlobalKey contactKey = GlobalKey();
//   final GlobalKey footerKey = GlobalKey();

//   static const maxContentWidth = 1100.0;

//   // Smooth scroll to a section
//   void scrollTo(GlobalKey key) {
//     final ctx = key.currentContext;
//     if (ctx != null) {
//       Scrollable.ensureVisible(
//         ctx,
//         duration: const Duration(milliseconds: 600),
//         curve: Curves.easeInOut,
//         alignment: 0.0,
//       );
//     }
//   }

//   // Helper nav function for both AppBar buttons and drawer
//   void _onNavTap(String label) {
//     switch (label) {
//       case 'Home':
//         scrollTo(homeKey);
//         break;
//       case 'About':
//         scrollTo(aboutKey);
//         break;
//       case 'Services':
//         scrollTo(servicesKey);
//         break;
//       case 'Works':
//         scrollTo(worksKey);
//         break;
//       case 'Contact':
//         scrollTo(contactKey);
//         break;
//       case 'Footer':
//         scrollTo(footerKey);
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // For small screens we'll use a drawer; the TopNavBar will handle opening it.
//       body: SafeArea(
//         child: LayoutBuilder(builder: (context, constraints) {
//           final isWide = constraints.maxWidth >= 900;
//           final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 900;
//           final horizontalPadding = isWide ? 24.0 : 12.0;

//           return Center(
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: maxContentWidth),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // Top nav — passes a callback and adapts to width
//                   TopNavBar(
//                     isWide: isWide,
//                     onNavTap: _onNavTap,
//                   ),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       controller: _scrollController,
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 18),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: [
//                             // Sections with keys
//                             Container(key: homeKey, child: const HeroSection()),
//                             const SizedBox(height: 36),
//                             Container(key: aboutKey, child: const AboutSection()),
//                             const SizedBox(height: 36),
//                             Container(key: servicesKey, child: const ServicesSection()),
//                             const SizedBox(height: 36),
//                             Container(key: worksKey, child: const RecentWorksSection()),
//                             const SizedBox(height: 36),
//                             const TrustedStatsSection(),
//                             const SizedBox(height: 36),
//                             const TechSkillsSection(),
//                             const SizedBox(height: 36),
//                             Container(key: contactKey, child: const ContactSection()),
//                             const SizedBox(height: 36),
//                             Container(key: footerKey, child: const FooterSection()),
//                             const SizedBox(height: 40),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }

// class TopNavBar extends StatelessWidget {
//   final bool isWide;
//   final void Function(String) onNavTap;
//   const TopNavBar({super.key, required this.isWide, required this.onNavTap});

//   @override
//   Widget build(BuildContext context) {
//     // For narrow screens we show a simple bar with a hamburger opening a modal bottom sheet
//     if (!isWide) {
//       return Container(
//         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//         child: Row(
//           children: [
//             // Logo
//             Row(
//               children: [
//                 Container(
//                   width: 36,
//                   height: 36,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(colors: [Color(0xFF0C8FEA), Color(0xFF6EC8FF)]),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: const Center(child: Text('SA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
//                 ),
//                 const SizedBox(width: 10),
//                 const Text('CODEWAY', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.6)),
//               ],
//             ),
//             const Spacer(),
//             IconButton(
//               onPressed: () {
//                 showModalBottomSheet(
//                   context: context,
//                   builder: (ctx) {
//                     return SafeArea(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           ListTile(title: const Text('Home'), onTap: () => _closeAndNav(ctx, 'Home')),
//                           ListTile(title: const Text('About'), onTap: () => _closeAndNav(ctx, 'About')),
//                           ListTile(title: const Text('Services'), onTap: () => _closeAndNav(ctx, 'Services')),
//                           ListTile(title: const Text('Works'), onTap: () => _closeAndNav(ctx, 'Works')),
//                           ListTile(title: const Text('Contact'), onTap: () => _closeAndNav(ctx, 'Contact')),
//                           const SizedBox(height: 8),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//               icon: const Icon(Icons.menu, color: Colors.black87),
//             ),
//           ],
//         ),
//       );
//     }

//     // Wide (desktop) top nav with inline items
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
//       child: Row(
//         children: [
//           // Logo
//           Row(
//             children: [
//               Container(
//                 width: 36,
//                 height: 36,
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(colors: [Color(0xFF0C8FEA), Color(0xFF6EC8FF)]),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: const Center(
//                   child: Text('SA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               const Text('CODEWAY', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.6)),
//             ],
//           ),
//           const Spacer(),
//           // Nav items
//           Row(
//             children: [
//               _NavItem(label: 'Home', onTap: onNavTap),
//               _NavItem(label: 'About', onTap: onNavTap),
//               _NavItem(label: 'Services', onTap: onNavTap),
//               _NavItem(label: 'Works', onTap: onNavTap),
//               _NavItem(label: 'Contact', onTap: onNavTap),
//             ],
//           ),
//           const SizedBox(width: 20),
//           ElevatedButton(
//             onPressed: () => onNavTap('Contact'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFF0C8FEA),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//               padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
//             ),
//             child: const Text('Hire Me'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _closeAndNav(BuildContext ctx, String label) {
//     Navigator.of(ctx).pop();
//     // Use a short delay so the modal can close visually before scroll action
//     Future.delayed(const Duration(milliseconds: 120), () {
//       // Use the parent's onNavTap via closure
//       onNavTap(label);
//     });
//   }
// }

// class _NavItem extends StatelessWidget {
//   final String label;
//   final void Function(String) onTap;
//   const _NavItem({required this.label, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       child: TextButton(
//         onPressed: () => onTap(label),
//         child: Text(label, style: const TextStyle(color: Colors.black87)),
//       ),
//     );
//   }
// }

// // ---------------- HERO SECTION ----------------
// class HeroSection extends StatelessWidget {
//   const HeroSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Responsive layout: stack vertically on narrow screens
//     final width = MediaQuery.of(context).size.width;
//     final isNarrow = width < 760;

//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFF0077FF), Color(0xFF5AC8FF)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(18)),
//       ),
//       padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
//       child: isNarrow
//           ? Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _heroLeft(),
//                 const SizedBox(height: 18),
//                 _heroRight(),
//               ],
//             )
//           : Row(
//               children: [
//                 Expanded(child: _heroLeft()),
//                 const SizedBox(width: 24),
//                 _heroRight(),
//               ],
//             ),
//     );
//   }

//   Widget _heroLeft() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text("Hi, I'm Sadiq Ali —", style: TextStyle(color: Colors.white70, fontSize: 18)),
//         const SizedBox(height: 8),
//         const Text('Building the Future of Apps.',
//             style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold, height: 1.05)),
//         const SizedBox(height: 16),
//         const Text(
//           'Full stack Flutter developer. I build cross-platform apps with beautiful UI & robust backend.',
//           style: TextStyle(color: Colors.white70, fontSize: 16),
//         ),
//         const SizedBox(height: 22),
//         Row(
//           children: [
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 foregroundColor: const Color(0xFF0C8FEA),
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//               ),
//               child: const Text('Get Started'),
//             ),
//             const SizedBox(width: 12),
//             OutlinedButton(
//               onPressed: () {},
//               style: OutlinedButton.styleFrom(
//                 side: const BorderSide(color: Colors.white70),
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//               ),
//               child: const Text('View Works'),
//             ),
//           ],
//         ),
//         const SizedBox(height: 18),
//         Wrap(
//           spacing: 12,
//           children: const [
//             _StatBadge(title: '150+', subtitle: 'Projects'),
//             _StatBadge(title: '98%', subtitle: 'Satisfaction'),
//             _StatBadge(title: '24/7', subtitle: 'Support'),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _heroRight() {
//     return Container(
//       width: 360,
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.95),
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 20, offset: const Offset(0, 8))],
//       ),
//       child: Column(
//         children: [
//           SizedBox(
//             height: 220,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.asset(
//                 'assets/hero_illustration.png',
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, e, s) => Container(
//                   color: const Color(0xFFEFF8FF),
//                   child: const Center(child: Icon(Icons.devices, size: 60, color: Color(0xFF0C8FEA))),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 14),
//           Row(
//             children: const [
//               CircleAvatar(radius: 18, backgroundImage: AssetImage('assets/avatar.png')),
//               SizedBox(width: 10),
//               Expanded(child: Text('Sadiq Ali\nFlutter Developer', style: TextStyle(fontWeight: FontWeight.w600))),
//               Icon(Icons.star, color: Colors.amber),
//               SizedBox(width: 6),
//               Text('4.9', style: TextStyle(fontWeight: FontWeight.bold)),
//             ],
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "I build fast, beautiful apps and dashboards using Flutter. Let's ship your idea.",
//             style: TextStyle(fontSize: 13, color: Colors.black54),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _StatBadge extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   const _StatBadge({required this.title, required this.subtitle});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       decoration: BoxDecoration(color: Colors.white.withOpacity(0.12), borderRadius: BorderRadius.circular(10)),
//       child: Row(mainAxisSize: MainAxisSize.min, children: [
//         Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//         const SizedBox(width: 8),
//         Text(subtitle, style: const TextStyle(color: Colors.white70)),
//       ]),
//     );
//   }
// }

// // ---------------- ABOUT SECTION ----------------
// class AboutSection extends StatelessWidget {
//   const AboutSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final stacked = width < 720;

//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           flex: stacked ? 1 : 3,
//           child: Container(
//             padding: const EdgeInsets.all(18),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(14),
//               boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 16)],
//             ),
//             child: Row(
//               children: [
//                 Stack(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: Image.asset(
//                         'assets/avatar.png',
//                         width: 140,
//                         height: 140,
//                         fit: BoxFit.cover,
//                         errorBuilder: (c, e, s) => Container(
//                           width: 140,
//                           height: 140,
//                           color: const Color(0xFFF0F8FF),
//                           child: const Icon(Icons.person, size: 56, color: Color(0xFF0C8FEA)),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       left: 6,
//                       bottom: 6,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                         decoration: BoxDecoration(color: const Color(0xFF0C8FEA), borderRadius: BorderRadius.circular(10)),
//                         child: const Text('10+ yrs', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(width: 18),
//                 Expanded(
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
//                     Text('About Me & CODEWAY', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                     SizedBox(height: 8),
//                     Text(
//                       "I'm a full stack Flutter developer building performant apps & web dashboards. I love clean UI, fast engineering and shipping value fast.",
//                       style: TextStyle(color: Colors.black54),
//                     ),
//                     SizedBox(height: 12),
//                     Text('• Flutter / Dart\n• Firebase / Firestore\n• REST APIs / Node.js\n• CI / CD'),
//                   ]),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(width: 20),
//         Expanded(
//           flex: 2,
//           child: Column(
//             children: const [
//               _SmallInfoCard(title: 'Contact', subtitle: 'sadiq@example.com'),
//               SizedBox(height: 12),
//               _SmallInfoCard(title: 'Location', subtitle: 'India'),
//               SizedBox(height: 12),
//               _SmallInfoCard(title: 'Availability', subtitle: 'Full-time'),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _SmallInfoCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   const _SmallInfoCard({required this.title, required this.subtitle});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 76,
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 12)],
//       ),
//       child: Row(
//         children: [
//           CircleAvatar(backgroundColor: const Color(0xFFEFF8FF), child: const Icon(Icons.info, color: Color(0xFF0C8FEA))),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
//               Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//               const SizedBox(height: 4),
//               Text(subtitle, style: const TextStyle(color: Colors.black54)),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ---------------- SERVICES SECTION ----------------
// class ServicesSection extends StatelessWidget {
//   const ServicesSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final services = [
//       {'title': 'Mobile App Development', 'subtitle': 'Flutter iOS & Android', 'icon': Icons.phone_android},
//       {'title': 'Web App Development', 'subtitle': 'Flutter Web & PWAs', 'icon': Icons.web},
//       {'title': 'UI/UX Design', 'subtitle': 'Figma to Flutter', 'icon': Icons.design_services},
//       {'title': 'Integrations', 'subtitle': 'APIs & Firebase', 'icon': Icons.cloud},
//       {'title': 'E-commerce', 'subtitle': 'Stripe / Payments', 'icon': Icons.shopping_cart},
//       {'title': 'Maintenance', 'subtitle': 'Support & Updates', 'icon': Icons.support_agent},
//     ];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text('Services', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//         const SizedBox(height: 14),
//         Wrap(
//           spacing: 16,
//           runSpacing: 16,
//           children: services.map((s) {
//             return SizedBox(
//               width: 340,
//               child: _ServiceCard(
//                 title: s['title'] as String,
//                 subtitle: s['subtitle'] as String,
//                 icon: s['icon'] as IconData,
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }

// class _ServiceCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final IconData icon;
//   const _ServiceCard({required this.title, required this.subtitle, required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 0,
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: const Color(0xFFE7F3FF)),
//         ),
//         child: Row(
//           children: [
//             CircleAvatar(radius: 26, backgroundColor: const Color(0xFFEFF8FF), child: Icon(icon, color: const Color(0xFF0C8FEA))),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 6),
//                 Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 13)),
//               ]),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ---------------- RECENT WORKS ----------------
// class RecentWorksSection extends StatelessWidget {
//   const RecentWorksSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final works = ['assets/work1.png', 'assets/work2.png', 'assets/work3.png'];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text('Recent Works', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//         const SizedBox(height: 12),
//         SizedBox(
//           height: 180,
//           child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemCount: works.length,
//             separatorBuilder: (_, __) => const SizedBox(width: 14),
//             itemBuilder: (context, i) {
//               final path = works[i];
//               return Container(
//                 width: 300,
//                 decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: ClipRRect(
//                         borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//                         child: Image.asset(
//                           path,
//                           width: 300,
//                           fit: BoxFit.cover,
//                           errorBuilder: (c, e, s) => Container(
//                             color: const Color(0xFFF3FBFF),
//                             child: const Center(child: Icon(Icons.image, size: 60, color: Color(0xFF0C8FEA))),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(12),
//                       child: Row(
//                         children: [
//                           const Expanded(child: Text('Project title', style: TextStyle(fontWeight: FontWeight.bold))),
//                           ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0C8FEA)), child: const Text('View')),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         )
//       ],
//     );
//   }
// }

// // ---------------- TRUSTED STATS ----------------
// class TrustedStatsSection extends StatelessWidget {
//   const TrustedStatsSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         gradient: const LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFF6FBFF)]),
//         border: Border.all(color: const Color(0xFFE9F5FF)),
//       ),
//       child: Row(
//         children: [
//           const Icon(Icons.thumb_up, color: Color(0xFF0C8FEA)),
//           const SizedBox(width: 12),
//           const Expanded(
//             child: Text(
//               'Trusted by the Builders of Tomorrow — 150+ Projects • 98% Satisfaction • 24/7 Support',
//               style: TextStyle(fontWeight: FontWeight.w600),
//             ),
//           ),
//           Wrap(spacing: 12, children: const [
//             _BrandPill(name: 'Shopify'),
//             _BrandPill(name: 'Codly'),
//             _BrandPill(name: 'Axio'),
//           ]),
//         ],
//       ),
//     );
//   }
// }

// class _BrandPill extends StatelessWidget {
//   final String name;
//   const _BrandPill({required this.name});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), boxShadow: [
//         BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8),
//       ]),
//       child: Text(name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
//     );
//   }
// }

// // ---------------- TECH SKILLS ----------------
// class TechSkillsSection extends StatelessWidget {
//   const TechSkillsSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final skills = ['Flutter', 'Dart', 'Firebase', 'Node', 'Figma', 'Git'];

//     return Container(
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [
//         BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 14),
//       ]),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         const Text('Technical Skills', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         const SizedBox(height: 12),
//         Wrap(spacing: 12, runSpacing: 12, children: skills.map((s) => Chip(label: Text(s))).toList()),
//       ]),
//     );
//   }
// }

// // ---------------- CONTACT SECTION ----------------
// class ContactSection extends StatefulWidget {
//   const ContactSection({super.key});

//   @override
//   State<ContactSection> createState() => _ContactSectionState();
// }

// class _ContactSectionState extends State<ContactSection> {
//   final _formKey = GlobalKey<FormState>();
//   final _name = TextEditingController();
//   final _email = TextEditingController();
//   final _message = TextEditingController();

//   @override
//   void dispose() {
//     _name.dispose();
//     _email.dispose();
//     _message.dispose();
//     super.dispose();
//   }

//   void _submit() {
//     if (_formKey.currentState?.validate() ?? false) {
//       // Replace with your backend/email logic
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Message sent — thank you!')));
//       _name.clear();
//       _email.clear();
//       _message.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final stacked = width < 860;

//     return Container(
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
//       child: stacked
//           ? Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text("Let's Build Something Together", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 8),
//                 const Text("Have a project? I'm available for freelance and full-time roles."),
//                 const SizedBox(height: 16),
//                 FormSection(formKey: _formKey, name: _name, email: _email, message: _message, submit: _submit),
//               ],
//             )
//           : Row(
//               children: [
//                 Expanded(
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
//                     Text("Let's Build Something Together", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                     SizedBox(height: 8),
//                     Text("Have a project? I'm available for freelance and full-time roles."),
//                     SizedBox(height: 16),
//                   ]),
//                 ),
//                 const SizedBox(width: 18),
//                 Expanded(child: FormSection(formKey: _formKey, name: _name, email: _email, message: _message, submit: _submit)),
//               ],
//             ),
//     );
//   }
// }

// class FormSection extends StatelessWidget {
//   final GlobalKey<FormState> formKey;
//   final TextEditingController name;
//   final TextEditingController email;
//   final TextEditingController message;
//   final VoidCallback submit;

//   const FormSection({required this.formKey, required this.name, required this.email, required this.message, required this.submit});

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: Container(
//         padding: const EdgeInsets.all(14),
//         decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [
//           BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 12),
//         ]),
//         child: Column(
//           children: [
//             TextFormField(controller: name, decoration: const InputDecoration(labelText: 'Name'), validator: (v) => (v == null || v.isEmpty) ? 'Enter name' : null),
//             const SizedBox(height: 8),
//             TextFormField(
//               controller: email,
//               decoration: const InputDecoration(labelText: 'Email'),
//               validator: (v) {
//                 if (v == null || v.isEmpty) return 'Enter email';
//                 final re = RegExp(r'^[^@]+@[^@]+\.[^@]+');
//                 if (!re.hasMatch(v)) return 'Enter valid email';
//                 return null;
//               },
//             ),
//             const SizedBox(height: 8),
//             TextFormField(controller: message, decoration: const InputDecoration(labelText: 'Message'), maxLines: 4, validator: (v) => (v == null || v.isEmpty) ? 'Enter a message' : null),
//             const SizedBox(height: 12),
//             Align(alignment: Alignment.centerRight, child: ElevatedButton(onPressed: submit, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0C8FEA)), child: const Padding(padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12), child: Text('Send Message')))),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ---------------- FOOTER ----------------
// class FooterSection extends StatelessWidget {
//   const FooterSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       Container(
//         padding: const EdgeInsets.symmetric(vertical: 22),
//         child: Row(
//           children: [
//             const Text('© 2025 CODEWAY — Built by Sadiq Ali'),
//             const Spacer(),
//             TextButton(onPressed: () {}, child: const Text('Privacy')),
//             TextButton(onPressed: () {}, child: const Text('Terms')),
//           ],
//         ),
//       ),
//     ]);
//   }
// }
