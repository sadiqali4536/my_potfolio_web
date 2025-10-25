// import 'package:flutter/material.dart';
// import 'package:code_way/MVVM/model/mydata.dart';

// class WorksSection extends StatefulWidget {
//   const WorksSection({super.key});

//   static bool get hasRecentWork => Mydata.projects.isEmpty;

//   @override
//   State<WorksSection> createState() => _WorksSectionState();
// }

// class _WorksSectionState extends State<WorksSection> {
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     Mydata.fetchData().then((_) {
//       setState(() => isLoading = false);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final isMobile = size.width < 600;

//     if (Mydata.projects.isEmpty) {
//       return SizedBox.shrink();
//     }

//     return Container(
//       color: Colors.white,
//       child: Column(
//         children: [
//           const SizedBox(height: 20),
//           const Text(
//             'Recent Works',
//             style: TextStyle(
//               fontSize: 36,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF1A1A2E),
//             ),
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             'Recent work showcasing our expertise',
//             style: TextStyle(fontSize: 20, color: Color(0xFF6B7280)),
//           ),
//           const SizedBox(height: 40),
//           // ---------------- Loading / Projects ----------------
//           Center(
//             child: Wrap(
//               spacing: 24,
//               runSpacing: 24,
//               alignment: WrapAlignment.center,
//               children: Mydata.projects.map((project) {
//                 return WorksCard(
//                   project: project,
//                   width: isMobile ? size.width * 0.9 : 280,
//                 );
//               }).toList(),
//             ),
//           ),
//           SizedBox(height: size.height * 0.08),
//         ],
//       ),
//     );
//   }
// }

// // ---------------- WORKS CARD ----------------
// class WorksCard extends StatefulWidget {
//   final Map<String, dynamic> project;
//   final double width;

//   const WorksCard({super.key, required this.project, required this.width});

//   @override
//   State<WorksCard> createState() => _WorksCardState();
// }

// class _WorksCardState extends State<WorksCard>
//     with SingleTickerProviderStateMixin {
//   bool isHovered = false;
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _elevationAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 200),
//     );
//     _scaleAnimation = Tween<double>(
//       begin: 1.0,
//       end: 1.02,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
//     _elevationAnimation = Tween<double>(
//       begin: 4.0,
//       end: 12.0,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _onHover(bool hover) {
//     setState(() {
//       isHovered = hover;
//       if (hover) {
//         _controller.forward();
//       } else {
//         _controller.reverse();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => _onHover(true),
//       onExit: (_) => _onHover(false),
//       child: GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => ProjectDetailsPage(project: widget.project),
//             ),
//           );
//         },
//         child: AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             return Transform.scale(
//               scale: _scaleAnimation.value,
//               child: Container(
//                 width: widget.width,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.08),
//                       blurRadius: _elevationAnimation.value,
//                       offset: Offset(0, _elevationAnimation.value / 3),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     // Image header
//                     Container(
//                       height: 140,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: NetworkImage(
//                             widget.project["image"] ??
//                                 'https://via.placeholder.com/280x140',
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                         borderRadius: const BorderRadius.vertical(
//                           top: Radius.circular(20),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.project['title'] ?? '',
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF1A1A2E),
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             widget.project['description'] ?? '',
//                             style: const TextStyle(
//                               fontSize: 14,
//                               color: Color(0xFF6B7280),
//                               height: 1.4,
//                             ),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           const SizedBox(height: 16),
//                           // Safe tech list
//                           Wrap(
//                             spacing: 6,
//                             runSpacing: 6,
//                             children: List<Widget>.from(
//                               ((widget.project['tech'] ?? []) as List<dynamic>)
//                                   .map((tech) {
//                                     final techStr = tech.toString();
//                                     return Container(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 12,
//                                         vertical: 6,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color: _getTechColor(techStr),
//                                         borderRadius: BorderRadius.circular(
//                                           99999,
//                                         ),
//                                       ),
//                                       child: Text(
//                                         techStr,
//                                         style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w500,
//                                           color: _getTechTextColor(techStr),
//                                         ),
//                                       ),
//                                     );
//                                   })
//                                   .toList(),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Color _getTechColor(String tech) {
//     switch (tech.toLowerCase()) {
//       case 'flutter':
//         return const Color(0xFFE3F2FD);
//       case 'firebase':
//         return const Color(0xFFFFF3E0);
//       case 'node.js':
//         return const Color(0xFFE8F5E9);
//       case 'sqlite':
//         return const Color(0xFFFCE4EC);
//       case 'rest api':
//         return const Color(0xFFE1F5FE);
//       default:
//         return const Color(0xFFF3E5F5);
//     }
//   }

//   Color _getTechTextColor(String tech) {
//     switch (tech.toLowerCase()) {
//       case 'flutter':
//         return const Color(0xFF1976D2);
//       case 'firebase':
//         return const Color(0xFFE65100);
//       case 'node.js':
//         return const Color(0xFF2E7D32);
//       case 'sqlite':
//         return const Color(0xFFC2185B);
//       case 'rest api':
//         return const Color(0xFF0277BD);
//       default:
//         return const Color(0xFF6A1B9A);
//     }
//   }
// }

// // ---------------- PROJECT DETAILS PAGE ----------------
// class ProjectDetailsPage extends StatelessWidget {
//   final Map<String, dynamic> project;

//   const ProjectDetailsPage({super.key, required this.project});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final isMobile = size.width < 600;

//     final features = ((project['features'] ?? []) as List<dynamic>)
//         .map((f) => f.toString())
//         .toList();
//     final gallery = ((project['gallery'] ?? []) as List<dynamic>)
//         .map((g) => g.toString())
//         .toList();

//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: isMobile ? 250 : 400,
//             pinned: true,
//             backgroundColor: Colors.white,
//             foregroundColor: const Color(0xFF1A1A2E),
//             flexibleSpace: FlexibleSpaceBar(
//               background: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       project['color'] ?? Colors.blue,
//                       (project['color'] ?? Colors.blue).withOpacity(0.7),
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       right: -50,
//                       top: 50,
//                       child: Container(
//                         width: 200,
//                         height: 200,
//                         decoration: BoxDecoration(
//                           color: (project['accentColor'] ?? Colors.blueAccent)
//                               .withOpacity(0.2),
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       left: -30,
//                       bottom: -30,
//                       child: Container(
//                         width: 150,
//                         height: 150,
//                         decoration: BoxDecoration(
//                           color: (project['accentColor'] ?? Colors.blueAccent)
//                               .withOpacity(0.3),
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                     ),
//                     Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(16),
//                           child: Image.network(
//                             project['image'] ?? '', 
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) {
//                               return Image.asset(
//                                 'assets/background_gradient_image/home_color_image1.png', 
//                                 fit: BoxFit.cover,
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Container(
//               color: const Color(0xFFF8F9FD),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 30),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: isMobile ? 20 : 60,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Title & Description
//                         Container(
//                           padding: const EdgeInsets.all(30),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.05),
//                                 blurRadius: 10,
//                                 offset: const Offset(0, 4),
//                               ),
//                             ],
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 project['title'] ?? '',
//                                 style: const TextStyle(
//                                   fontSize: 32,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xFF1A1A2E),
//                                 ),
//                               ),
//                               const SizedBox(height: 12),
//                               Text(
//                                 project['description'] ?? '',
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   color: Color(0xFF6B7280),
//                                   height: 1.6,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 30),
//                         _buildTechStackSection(),
//                         const SizedBox(height: 30),
//                         if (features.isNotEmpty)
//                           _buildFeaturesSection(features),
//                         const SizedBox(height: 30),
//                         if (gallery.isNotEmpty) _buildGallerySection(gallery),
//                         const SizedBox(height: 40),
//                         Center(
//                           child: ElevatedButton.icon(
//                             onPressed: () => Navigator.pop(context),
//                             icon: const Icon(Icons.arrow_back),
//                             label: const Text('Back to Projects'),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: project['color'] ?? Colors.blue,
//                               foregroundColor: Colors.white,
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 32,
//                                 vertical: 16,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               elevation: 2,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 50),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTechStackSection() {
//     return Container(
//       padding: const EdgeInsets.all(30),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Row(
//             children: [
//               Icon(Icons.code, color: Color(0xFF5B9FFF), size: 24),
//               SizedBox(width: 10),
//               Text(
//                 'Tech Stack',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF1A1A2E),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           Wrap(
//             spacing: 6,
//             runSpacing: 6,
//             children: List<Widget>.from(
//               ((project['tech'] ?? []) as List<dynamic>).map((tech) {
//                 final techStr = tech.toString();
//                 return Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 6,
//                   ),
//                   decoration: BoxDecoration(
//                     color: _getTechColor(techStr),
//                     borderRadius: BorderRadius.circular(99999),
//                   ),
//                   child: Text(
//                     techStr,
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                       color: _getTechTextColor(techStr),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFeaturesSection(List<String> features) {
//     return Container(
//       padding: const EdgeInsets.all(30),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Row(
//             children: [
//               Icon(Icons.stars, color: Color(0xFFFFB800), size: 24),
//               SizedBox(width: 10),
//               Text(
//                 'Key Features',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF1A1A2E),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           Column(children: features.map((f) => _buildFeatureItem(f)).toList()),
//         ],
//       ),
//     );
//   }

//   Widget _buildGallerySection(List<String> gallery) {
//     return Container(
//       padding: const EdgeInsets.all(30),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Row(
//             children: [
//               Icon(Icons.photo_library, color: Color(0xFFFF6B6B), size: 24),
//               SizedBox(width: 10),
//               Text(
//                 'Project Gallery',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF1A1A2E),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           SizedBox(
//             height: 220,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: gallery.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: const EdgeInsets.only(right: 16),
//                   width: 320,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         blurRadius: 8,
//                         offset: const Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(16),
//                     child: (gallery[index].isNotEmpty)
//                         ? Image.network(
//                             gallery[index],
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) {
//                               // Show local asset placeholder if network image fails
//                               return Image.asset(
//                                 'assets/background_gradient_image/skill_backround.png',
//                                 fit: BoxFit.cover,
//                               );
//                             },
//                           )
//                         : Image.asset(
//                             // Fallback when URL is empty
//                             'assets/background_gradient_image/skill_backround.png',
//                             fit: BoxFit.cover,
//                           ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFeatureItem(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             margin: const EdgeInsets.only(top: 4),
//             width: 6,
//             height: 6,
//             decoration: BoxDecoration(
//               color: project['color'] ?? Colors.blue,
//               shape: BoxShape.circle,
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Color(0xFF4B5563),
//                 height: 1.5,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Color _getTechColor(String tech) {
//     switch (tech.toLowerCase()) {
//       case 'flutter':
//         return const Color(0xFFE3F2FD);
//       case 'firebase':
//         return const Color(0xFFFFF3E0);
//       case 'node.js':
//         return const Color(0xFFE8F5E9);
//       case 'sqlite':
//         return const Color(0xFFFCE4EC);
//       case 'rest api':
//         return const Color(0xFFE1F5FE);
//       default:
//         return const Color(0xFFF3E5F5);
//     }
//   }

//   Color _getTechTextColor(String tech) {
//     switch (tech.toLowerCase()) {
//       case 'flutter':
//         return const Color(0xFF1976D2);
//       case 'firebase':
//         return const Color(0xFFE65100);
//       case 'node.js':
//         return const Color(0xFF2E7D32);
//       case 'sqlite':
//         return const Color(0xFFC2185B);
//       case 'rest api':
//         return const Color(0xFF0277BD);
//       default:
//         return const Color(0xFF6A1B9A);
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:code_way/MVVM/model/mydata.dart';

// class WorksSection extends StatefulWidget {
//   const WorksSection({super.key});

//   @override
//   State<WorksSection> createState() => _WorksSectionState();
// }

// class _WorksSectionState extends State<WorksSection> {
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     Mydata.fetchData().then((_) {
//       if (mounted) setState(() => isLoading = false);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading || Mydata.projects.isEmpty) {
//       return const SizedBox.shrink();
//     }

//     final size = MediaQuery.of(context).size;
//     final width = size.width;

//     // Decide layout based on screen width
//     int crossAxisCount;
//     double cardWidth;

//     if (width < 600) {
//       crossAxisCount = 1;
//       cardWidth = width * 0.9;
//     } else if (width < 1024) {
//       crossAxisCount = 2;
//       cardWidth = (width - 72) / 2; // 24 spacing * 2 + 24 padding
//     } else if (width < 1440) {
//       crossAxisCount = 3;
//       cardWidth = (width - 96) / 3; // 24 spacing * 2 + 24 padding
//     } else {
//       crossAxisCount = 4;
//       cardWidth = (width - 120) / 4; // 24 spacing * 3 + 24 padding
//     }

//     return Container(
//       color: Colors.white,
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(vertical: 40),
//       child: Column(
//         children: [
//           const Text(
//             'Recent Works',
//             style: TextStyle(
//               fontSize: 36,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF1A1A2E),
//             ),
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             'Recent work showcasing our expertise',
//             style: TextStyle(fontSize: 20, color: Color(0xFF6B7280)),
//           ),
//           const SizedBox(height: 40),
//           Center(
//             child: Wrap(
//               spacing: 24,
//               runSpacing: 24,
//               alignment: WrapAlignment.center,
//               children: Mydata.projects
//                   .map((project) => WorksCard(
//                         project: project,
//                         width: cardWidth,
//                       ))
//                   .toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class WorksCard extends StatefulWidget {
//   final Map<String, dynamic> project;
//   final double width;

//   const WorksCard({super.key, required this.project, required this.width});

//   @override
//   State<WorksCard> createState() => _WorksCardState();
// }

// class _WorksCardState extends State<WorksCard>
//     with SingleTickerProviderStateMixin {
//   bool isHovered = false;
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _elevationAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 200),
//     );
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02)
//         .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
//     _elevationAnimation = Tween<double>(begin: 4.0, end: 12.0)
//         .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _onHover(bool hover) {
//     setState(() {
//       isHovered = hover;
//       if (hover) {
//         _controller.forward();
//       } else {
//         _controller.reverse();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => _onHover(true),
//       onExit: (_) => _onHover(false),
//       child: GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => ProjectDetailsPage(project: widget.project),
//             ),
//           );
//         },
//         child: AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             return Transform.scale(
//               scale: _scaleAnimation.value,
//               child: Container(
//                 width: widget.width,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.08),
//                       blurRadius: _elevationAnimation.value,
//                       offset: Offset(0, _elevationAnimation.value / 3),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     // Image header
//                     Container(
//                       height: 140,
//                       decoration: BoxDecoration(
//                         borderRadius: const BorderRadius.vertical(
//                           top: Radius.circular(20),
//                         ),
//                         image: DecorationImage(
//                           image: NetworkImage(
//                             widget.project["image"] ??
//                                 'https://via.placeholder.com/280x140',
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.project['title'] ?? '',
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF1A1A2E),
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             widget.project['description'] ?? '',
//                             style: const TextStyle(
//                               fontSize: 14,
//                               color: Color(0xFF6B7280),
//                               height: 1.4,
//                             ),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           const SizedBox(height: 16),
//                           Wrap(
//                             spacing: 6,
//                             runSpacing: 6,
//                             children: List<Widget>.from(
//                               ((widget.project['tech'] ?? []) as List<dynamic>)
//                                   .map((tech) {
//                                 final techStr = tech.toString();
//                                 return Container(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 12, vertical: 6),
//                                   decoration: BoxDecoration(
//                                     color: _getTechColor(techStr),
//                                     borderRadius: BorderRadius.circular(9999),
//                                   ),
//                                   child: Text(
//                                     techStr,
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w500,
//                                       color: _getTechTextColor(techStr),
//                                     ),
//                                   ),
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Color _getTechColor(String tech) {
//     switch (tech.toLowerCase()) {
//       case 'flutter':
//         return const Color(0xFFE3F2FD);
//       case 'firebase':
//         return const Color(0xFFFFF3E0);
//       case 'node.js':
//         return const Color(0xFFE8F5E9);
//       case 'sqlite':
//         return const Color(0xFFFCE4EC);
//       case 'rest api':
//         return const Color(0xFFE1F5FE);
//       default:
//         return const Color(0xFFF3E5F5);
//     }
//   }

//   Color _getTechTextColor(String tech) {
//     switch (tech.toLowerCase()) {
//       case 'flutter':
//         return const Color(0xFF1976D2);
//       case 'firebase':
//         return const Color(0xFFE65100);
//       case 'node.js':
//         return const Color(0xFF2E7D32);
//       case 'sqlite':
//         return const Color(0xFFC2185B);
//       case 'rest api':
//         return const Color(0xFF0277BD);
//       default:
//         return const Color(0xFF6A1B9A);
//     }
//   }
  
// }


// class ProjectDetailsPage extends StatelessWidget {
//   final Map<String, dynamic> project;

//   const ProjectDetailsPage({super.key, required this.project});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;

//     if (width < 600) return _buildMobileLayout(context);
//     if (width < 1024) return _buildTabletLayout(context);
//     if (width < 1440) return _buildDesktopLayout(context);
//     return _buildLargeDesktopLayout(context);
//   }

//   // ---------------- Layout Builders ----------------
//   Widget _buildMobileLayout(BuildContext context) {
//     return _buildBaseLayout(context, isMobile: true);
//   }

//   Widget _buildTabletLayout(BuildContext context) {
//     return _buildBaseLayout(context, isMobile: false, horizontalPadding: 40);
//   }

//   Widget _buildDesktopLayout(BuildContext context) {
//     return _buildBaseLayout(context, isMobile: false, horizontalPadding: 60);
//   }

//   Widget _buildLargeDesktopLayout(BuildContext context) {
//     return _buildBaseLayout(context, isMobile: false, horizontalPadding: 120);
//   }

//   // ---------------- Base Layout ----------------
//   Widget _buildBaseLayout(BuildContext context,
//       {required bool isMobile, double horizontalPadding = 20}) {
//     final features = ((project['features'] ?? []) as List<dynamic>)
//         .map((f) => f.toString())
//         .toList();
//     final gallery = ((project['gallery'] ?? []) as List<dynamic>)
//         .map((g) => g.toString())
//         .toList();

//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: isMobile ? 250 : 400,
//             pinned: true,
//             backgroundColor: Colors.white,
//             foregroundColor: const Color(0xFF1A1A2E),
//             flexibleSpace: FlexibleSpaceBar(
//               background: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       project['color'] ?? Colors.blue,
//                       (project['color'] ?? Colors.blue).withOpacity(0.7),
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       right: -50,
//                       top: 50,
//                       child: Container(
//                         width: 200,
//                         height: 200,
//                         decoration: BoxDecoration(
//                           color: (project['accentColor'] ?? Colors.blueAccent)
//                               .withOpacity(0.2),
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       left: -30,
//                       bottom: -30,
//                       child: Container(
//                         width: 150,
//                         height: 150,
//                         decoration: BoxDecoration(
//                           color: (project['accentColor'] ?? Colors.blueAccent)
//                               .withOpacity(0.3),
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                     ),
//                     Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(16),
//                           child: Image.network(
//                             project['image'] ?? '',
//                             fit: BoxFit.contain,
//                             errorBuilder: (context, error, stackTrace) {
//                               return Image.asset(
//                                 'assets/background_gradient_image/home_color_image1.png',
//                                 fit: BoxFit.contain,
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Container(
//               color: const Color(0xFFF8F9FD),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 30),
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: horizontalPadding),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Title & Description
//                         _buildTitleDescription(),
//                         const SizedBox(height: 30),
//                         _buildTechStackSection(),
//                         const SizedBox(height: 30),
//                         if (features.isNotEmpty) _buildFeaturesSection(features),
//                         const SizedBox(height: 30),
//                         if (gallery.isNotEmpty) _buildGallerySection(gallery),
//                         const SizedBox(height: 40),
//                         Center(
//                           child: ElevatedButton.icon(
//                             onPressed: () => Navigator.pop(context),
//                             icon: const Icon(Icons.arrow_back),
//                             label: const Text('Back to Projects'),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: project['color'] ?? Colors.blue,
//                               foregroundColor: Colors.white,
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 32,
//                                 vertical: 16,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               elevation: 2,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 50),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ---------------- Sub Widgets ----------------
//   Widget _buildTitleDescription() {
//     return Container(
//       padding: const EdgeInsets.all(30),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             project['title'] ?? '',
//             style: const TextStyle(
//               fontSize: 32,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF1A1A2E),
//             ),
//           ),
//           const SizedBox(height: 12),
//           Text(
//             project['description'] ?? '',
//             style: const TextStyle(
//               fontSize: 18,
//               color: Color(0xFF6B7280),
//               height: 1.6,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTechStackSection() {
//     return Container(
//       padding: const EdgeInsets.all(30),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Row(
//             children: [
//               Icon(Icons.code, color: Color(0xFF5B9FFF), size: 24),
//               SizedBox(width: 10),
//               Text(
//                 'Tech Stack',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF1A1A2E),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           Wrap(
//             spacing: 6,
//             runSpacing: 6,
//             children: List<Widget>.from(
//               ((project['tech'] ?? []) as List<dynamic>).map((tech) {
//                 final techStr = tech.toString();
//                 return Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 6,
//                   ),
//                   decoration: BoxDecoration(
//                     color: _getTechColor(techStr),
//                     borderRadius: BorderRadius.circular(99999),
//                   ),
//                   child: Text(
//                     techStr,
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                       color: _getTechTextColor(techStr),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFeaturesSection(List<String> features) {
//     return Container(
//       padding: const EdgeInsets.all(30),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Row(
//             children: [
//               Icon(Icons.stars, color: Color(0xFFFFB800), size: 24),
//               SizedBox(width: 10),
//               Text(
//                 'Key Features',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF1A1A2E),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           Column(children: features.map((f) => _buildFeatureItem(f)).toList()),
//         ],
//       ),
//     );
//   }

//   Widget _buildGallerySection(List<String> gallery) {
//     return Container(
//       padding: const EdgeInsets.all(30),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Row(
//             children: [
//               Icon(Icons.photo_library, color: Color(0xFFFF6B6B), size: 24),
//               SizedBox(width: 10),
//               Text(
//                 'Project Gallery',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF1A1A2E),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           SizedBox(
//             height: 220,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: gallery.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: const EdgeInsets.only(right: 16),
//                   width: 320,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         blurRadius: 8,
//                         offset: const Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(16),
//                     child: (gallery[index].isNotEmpty)
//                         ? Image.network(
//                             gallery[index],
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) {
//                               return Image.asset(
//                                 'assets/background_gradient_image/skill_backround.png',
//                                 fit: BoxFit.cover,
//                               );
//                             },
//                           )
//                         : Image.asset(
//                             'assets/background_gradient_image/skill_backround.png',
//                             fit: BoxFit.cover,
//                           ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFeatureItem(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             margin: const EdgeInsets.only(top: 4),
//             width: 6,
//             height: 6,
//             decoration: BoxDecoration(
//               color: project['color'] ?? Colors.blue,
//               shape: BoxShape.circle,
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Color(0xFF4B5563),
//                 height: 1.5,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ---------------- Tech Colors ----------------
//   Color _getTechColor(String tech) {
//     switch (tech.toLowerCase()) {
//       case 'flutter':
//         return const Color(0xFFE3F2FD);
//       case 'firebase':
//         return const Color(0xFFFFF3E0);
//       case 'node.js':
//         return const Color(0xFFE8F5E9);
//       case 'sqlite':
//         return const Color(0xFFFCE4EC);
//       case 'rest api':
//         return const Color(0xFFE1F5FE);
//       default:
//         return const Color(0xFFF3E5F5);
//     }
//   }

//   Color _getTechTextColor(String tech) {
//     switch (tech.toLowerCase()) {
//       case 'flutter':
//         return const Color(0xFF1976D2);
//       case 'firebase':
//         return const Color(0xFFE65100);
//       case 'node.js':
//         return const Color(0xFF2E7D32);
//       case 'sqlite':
//         return const Color(0xFFC2185B);
//       case 'rest api':
//         return const Color(0xFF0277BD);
//       default:
//         return const Color(0xFF6A1B9A);
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:code_way/MVVM/model/mydata.dart';

/// ---------------- Responsive Image Widget ----------------
class ResponsiveImage extends StatelessWidget {
  final String imageUrl;
  final double aspectRatio; // width / height
  final double? maxHeight; // optional max height

  const ResponsiveImage({
    super.key,
    required this.imageUrl,
    this.aspectRatio = 16 / 9,
    this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust container width based on screen size
    double containerWidth = screenWidth * 0.9;
    if (screenWidth >= 600 && screenWidth < 1024) containerWidth = 400;
    if (screenWidth >= 1024 && screenWidth < 1440) containerWidth = 500;
    if (screenWidth >= 1440) containerWidth = 600;

    double containerHeight = containerWidth / aspectRatio;
    if (maxHeight != null && containerHeight > maxHeight!) {
      containerHeight = maxHeight!;
    }

    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(255, 255, 255, 255),
        image: DecorationImage(
          image: imageUrl.isNotEmpty
              ? NetworkImage(imageUrl)
              : const AssetImage('assets/background_gradient_image/skill_backround.png') as ImageProvider,
          fit: BoxFit.contain, // keeps image fully visible
        ),
      ),
    );
  }
}

/// ---------------- Works Section ----------------
class WorksSection extends StatefulWidget {
  const WorksSection({super.key});

  @override
  State<WorksSection> createState() => _WorksSectionState();
}

class _WorksSectionState extends State<WorksSection> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Mydata.fetchData().then((_) {
      if (mounted) setState(() => isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading || Mydata.projects.isEmpty) {
      return const SizedBox.shrink();
    }

    final size = MediaQuery.of(context).size;
    final width = size.width;

    // Decide layout based on screen width
    int crossAxisCount;
    double cardWidth;

    if (width < 600) {
      crossAxisCount = 1;
      cardWidth = width * 0.9;
    } else if (width < 1024) {
      crossAxisCount = 2;
      cardWidth = (width - 72) / 2; // spacing & padding
    } else if (width < 1440) {
      crossAxisCount = 3;
      cardWidth = (width - 96) / 3;
    } else {
      crossAxisCount = 4;
      cardWidth = (width - 120) / 4;
    }

    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          const Text(
            'Recent Works',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Recent work showcasing our expertise',
            style: TextStyle(fontSize: 20, color: Color(0xFF6B7280)),
          ),
          const SizedBox(height: 40),
          Center(
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: Mydata.projects
                  .map((project) => WorksCard(
                        project: project,
                        width: cardWidth,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/// ---------------- Works Card ----------------
class WorksCard extends StatefulWidget {
  final Map<String, dynamic> project;
  final double width;

  const WorksCard({super.key, required this.project, required this.width});

  @override
  State<WorksCard> createState() => _WorksCardState();
}

class _WorksCardState extends State<WorksCard>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _elevationAnimation = Tween<double>(begin: 4.0, end: 12.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool hover) {
    setState(() {
      isHovered = hover;
      if (hover) _controller.forward();
      else _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProjectDetailsPage(project: widget.project),
            ),
          );
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                width: widget.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: _elevationAnimation.value,
                      offset: Offset(0, _elevationAnimation.value / 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Responsive header image
                    Container(
                      child: ResponsiveImage(
                        imageUrl: widget.project["image"] ?? '',
                        aspectRatio: 280 / 140,
                        maxHeight: 140,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.project['title'] ?? '',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A2E),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.project['description'] ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                              height: 1.4,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: List<Widget>.from(
                              ((widget.project['tech'] ?? []) as List<dynamic>)
                                  .map((tech) {
                                final techStr = tech.toString();
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: _getTechColor(techStr),
                                    borderRadius: BorderRadius.circular(9999),
                                  ),
                                  child: Text(
                                    techStr,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: _getTechTextColor(techStr),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Color _getTechColor(String tech) {
    switch (tech.toLowerCase()) {
      case 'flutter':
        return const Color(0xFFE3F2FD);
      case 'firebase':
        return const Color(0xFFFFF3E0);
      case 'node.js':
        return const Color(0xFFE8F5E9);
      case 'sqlite':
        return const Color(0xFFFCE4EC);
      case 'rest api':
        return const Color(0xFFE1F5FE);
      default:
        return const Color(0xFFF3E5F5);
    }
  }

  Color _getTechTextColor(String tech) {
    switch (tech.toLowerCase()) {
      case 'flutter':
        return const Color(0xFF1976D2);
      case 'firebase':
        return const Color(0xFFE65100);
      case 'node.js':
        return const Color(0xFF2E7D32);
      case 'sqlite':
        return const Color(0xFFC2185B);
      case 'rest api':
        return const Color(0xFF0277BD);
      default:
        return const Color(0xFF6A1B9A);
    }
  }
}

/// ---------------- Project Details Page ----------------
class ProjectDetailsPage extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectDetailsPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) return _buildBaseLayout(context, isMobile: true);
    if (width < 1024) return _buildBaseLayout(context, horizontalPadding: 40);
    if (width < 1440) return _buildBaseLayout(context, horizontalPadding: 60);
    return _buildBaseLayout(context, horizontalPadding: 120);
  }

  Widget _buildBaseLayout(BuildContext context,
      {bool isMobile = false, double horizontalPadding = 20}) {
    final features = ((project['features'] ?? []) as List<dynamic>)
        .map((f) => f.toString())
        .toList();
    final gallery = ((project['gallery'] ?? []) as List<dynamic>)
        .map((g) => g.toString())
        .toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: isMobile ? 250 : 400,
            pinned: true,
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF1A1A2E),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      project['color'] ?? Colors.blue,
                      (project['color'] ?? Colors.blue).withOpacity(0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: ResponsiveImage(
                    imageUrl: project['image'] ?? '',
                    aspectRatio: 16 / 9,
                    maxHeight: isMobile ? 250 : 400,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: const Color(0xFFF8F9FD),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTitleDescription(),
                        const SizedBox(height: 30),
                        _buildTechStackSection(),
                        const SizedBox(height: 30),
                        if (features.isNotEmpty) _buildFeaturesSection(features),
                        const SizedBox(height: 30),
                        if (gallery.isNotEmpty) _buildGallerySection(gallery),
                        const SizedBox(height: 40),
                        Center(
                          child: ElevatedButton.icon(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back),
                            label: const Text('Back to Projects'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:  Colors.blue,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
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

  Widget _buildTitleDescription() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project['title'] ?? '',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            project['description'] ?? '',
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF6B7280),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechStackSection() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.code, color: Color(0xFF5B9FFF), size: 24),
              SizedBox(width: 10),
              Text(
                'Tech Stack',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A2E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: List<Widget>.from(
              ((project['tech'] ?? []) as List<dynamic>).map((tech) {
                final techStr = tech.toString();
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _getTechColor(techStr),
                    borderRadius: BorderRadius.circular(99999),
                  ),
                  child: Text(
                    techStr,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: _getTechTextColor(techStr),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection(List<String> features) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.stars, color: Color(0xFFFFB800), size: 24),
              SizedBox(width: 10),
              Text(
                'Key Features',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A2E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(children: features.map((f) => _buildFeatureItem(f)).toList()),
        ],
      ),
    );
  }

  Widget _buildGallerySection(List<String> gallery) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.photo_library, color: Color(0xFFFF6B6B), size: 24),
              SizedBox(width: 10),
              Text(
                'Project Gallery',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A2E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: gallery.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: ResponsiveImage(
                    imageUrl: gallery[index],
                    aspectRatio: 16 / 9,
                    maxHeight: 220,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: project['color'] ?? Colors.blue,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF4B5563),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- Tech Colors ----------------
  Color _getTechColor(String tech) {
    switch (tech.toLowerCase()) {
      case 'flutter':
        return const Color(0xFFE3F2FD);
      case 'firebase':
        return const Color(0xFFFFF3E0);
      case 'node.js':
        return const Color(0xFFE8F5E9);
      case 'sqlite':
        return const Color(0xFFFCE4EC);
      case 'rest api':
        return const Color(0xFFE1F5FE);
      default:
        return const Color(0xFFF3E5F5);
    }
  }

  Color _getTechTextColor(String tech) {
    switch (tech.toLowerCase()) {
      case 'flutter':
        return const Color(0xFF1976D2);
      case 'firebase':
        return const Color(0xFFE65100);
      case 'node.js':
        return const Color(0xFF2E7D32);
      case 'sqlite':
        return const Color(0xFFC2185B);
      case 'rest api':
        return const Color(0xFF0277BD);
      default:
        return const Color(0xFF6A1B9A);
    }
  }
}
