
import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  final void Function(String label) onNavTap;
  final String activeLabel;
  final List<String> navItems;

  const CustomNavbar({
    super.key,
    required this.onNavTap,
    required this.activeLabel,
    required this.navItems,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Define breakpoints
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;
    final isDesktop = screenWidth >= 1024 && screenWidth < 1440;
    final isLargeDesktop = screenWidth >= 1440;

    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : (isTablet ? 20 : 24),
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 90),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo + Brand name (responsive)
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo/logo_3.png",
                  width: isMobile ? 32 : 40,
                  height: isMobile ? 32 : 40,
                  errorBuilder: (context, error, stack) => Icon(
                    Icons.ac_unit,
                    color: const Color.fromRGBO(0, 122, 255, 100),
                    size: isMobile ? 32 : 45,
                  ),
                ),
                  const SizedBox(width: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'CODEWAY',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isTablet ? 20 : 24,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          height: 1.0,
                        ),
                      ),
                      if (isLargeDesktop || isDesktop) ...[
                        const SizedBox(width: 8),
                        const Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            "TechHub Pvt Ltd",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              color: Color.fromRGBO(92, 92, 92, 100),
                              height: 1.0,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                
              ],
            ),
          ),

          // Navigation section
          if (isMobile)
            // Mobile: Only drawer
            IconButton(
              icon: const Icon(Icons.menu, size: 28),
              color: const Color.fromRGBO(55, 64, 81, 100),
              onPressed: () => _showMenuDrawer(context, []),
            )
          else if (isTablet)
            // Tablet: Show first 2 items, rest in drawer
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...navItems.take(2).map((title) => NavItem(
                      title: title,
                      onTap: onNavTap,
                      isActive: activeLabel == title,
                      isCompact: true,
                    )),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.menu, size: 26),
                  color: const Color.fromRGBO(55, 64, 81, 100),
                  onPressed: () => _showMenuDrawer(context, navItems.take(2).toList()),
                ),
              ],
            )
          else if (isDesktop)
            // Desktop: Show first 4 items, rest in drawer
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...navItems.take(4).map((title) => NavItem(
                      title: title,
                      onTap: onNavTap,
                      isActive: activeLabel == title,
                      isCompact: false,
                    )),
                const SizedBox(width: 12),
                IconButton(
                  icon: const Icon(Icons.menu, size: 26),
                  color: const Color.fromRGBO(55, 64, 81, 100),
                  onPressed: () => _showMenuDrawer(context, navItems.take(4).toList()),
                ),
              ],
            )
          else
            // Large Desktop: Full navigation
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...navItems.map((title) => NavItem(
                      title: title,
                      onTap: onNavTap,
                      isActive: activeLabel == title,
                      isCompact: false,
                    )),
                const SizedBox(width: 24),
                ElevatedButton(
                  onPressed: () => onNavTap('footer'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 123, 255),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Let's Talk",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void _showMenuDrawer(BuildContext context, List<String> displayedItems) {
    // Get items that are NOT already displayed in navbar
    final drawerItems = navItems.where((item) => !displayedItems.contains(item)).toList();
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Menu',
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              constraints: const BoxConstraints(maxWidth: 350),
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(-2, 0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 123, 255)
                          .withOpacity(0.05),
                      border: const Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(230, 230, 230, 1),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Menu',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, size: 24),
                          onPressed: () => Navigator.pop(context),
                          color: const Color.fromRGBO(55, 64, 81, 100),
                        ),
                      ],
                    ),
                  ),
                  // Menu items
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      children: drawerItems.map((title) {
                        final isActive = activeLabel == title;
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              onNavTap(title);
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                color: isActive
                                    ? const Color.fromARGB(255, 0, 123, 255)
                                        .withOpacity(0.1)
                                    : Colors.transparent,
                                border: Border(
                                  left: BorderSide(
                                    color: isActive
                                        ? const Color.fromARGB(255, 0, 123, 255)
                                        : Colors.transparent,
                                    width: 4,
                                  ),
                                ),
                              ),
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                      isActive ? FontWeight.w600 : FontWeight.normal,
                                  color: isActive
                                      ? const Color.fromARGB(255, 0, 123, 255)
                                      : const Color.fromRGBO(55, 64, 81, 100),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  // Let's Talk button
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          onNavTap('footer');
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 123, 255),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.chat_bubble_outline,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Let's Talk",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          )),
          child: child,
        );
      },
    );
  }
}

class NavItem extends StatefulWidget {
  final String title;
  final void Function(String) onTap;
  final bool isActive;
  final bool isCompact;

  const NavItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.isActive,
    this.isCompact = false,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.isActive || _isHovering
        ? const Color.fromARGB(255, 0, 123, 255)
        : const Color.fromRGBO(55, 64, 81, 100);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: InkWell(
        onTap: () => widget.onTap(widget.title),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widget.isCompact ? 8 : 16,
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: widget.isCompact ? 14 : 16,
              color: color,
              fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.normal,
            ),
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';

// class CustomNavbar extends StatelessWidget {
//   final void Function(String label) onNavTap;
//   final String activeLabel;
//   final List<String> navItems;

//   const CustomNavbar({
//     super.key,
//     required this.onNavTap,
//     required this.activeLabel,
//     required this.navItems,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
    
//     // Define breakpoints
//     final isMobile = screenWidth < 768;
//     final isTablet = screenWidth >= 768 && screenWidth < 1024;
//     final isDesktop = screenWidth >= 1024 && screenWidth < 1440;
//     final isLargeDesktop = screenWidth >= 1440;

//     return Container(
//       height: 60,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 16 : (isTablet ? 20 : 24),
//       ),
//       decoration: BoxDecoration(
//         color: const Color.fromRGBO(255, 255, 255, 90),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Logo + Brand name (responsive)
//           Flexible(
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset(
//                   "assets/logo/logo_3.png",
//                   width: isMobile ? 32 : 40,
//                   height: isMobile ? 32 : 40,
//                   errorBuilder: (context, error, stack) => Icon(
//                     Icons.ac_unit,
//                     color: const Color.fromRGBO(0, 122, 255, 100),
//                     size: isMobile ? 32 : 40,
//                   ),
//                 ),
//                 if (!isMobile) ...[
//                   const SizedBox(width: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'CODEWAY',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: isTablet ? 20 : 24,
//                           color: const Color.fromRGBO(0, 0, 0, 1),
//                           height: 1.2,
//                         ),
//                       ),
//                       if (isLargeDesktop)
//                       SizedBox(width: 2,),
//                         const Text(
//                           "SOFTWARE SOLUTIONS",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 12,
//                             color: Color.fromRGBO(92, 92, 92, 100),
//                             height: 1.2,
//                           ),
//                         ),
//                     ],
//                   ),
//                 ],
//               ],
//             ),
//           ),

//           // Navigation section
//           if (isMobile)
//             // Mobile: Only drawer
//             IconButton(
//               icon: const Icon(Icons.menu, size: 28),
//               color: const Color.fromRGBO(55, 64, 81, 100),
//               onPressed: () => _showMenuDrawer(context, []),
//             )
//           else if (isTablet)
//             // Tablet: Show first 2 items, rest in drawer
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ...navItems.take(2).map((title) => NavItem(
//                       title: title,
//                       onTap: onNavTap,
//                       isActive: activeLabel == title,
//                       isCompact: true,
//                     )),
//                 const SizedBox(width: 8),
//                 IconButton(
//                   icon: const Icon(Icons.menu, size: 26),
//                   color: const Color.fromRGBO(55, 64, 81, 100),
//                   onPressed: () => _showMenuDrawer(context, navItems.take(2).toList()),
//                 ),
//               ],
//             )
//           else if (isDesktop)
//             // Desktop: Show first 4 items, rest in drawer
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ...navItems.take(4).map((title) => NavItem(
//                       title: title,
//                       onTap: onNavTap,
//                       isActive: activeLabel == title,
//                       isCompact: false,
//                     )),
//                 const SizedBox(width: 12),
//                 IconButton(
//                   icon: const Icon(Icons.menu, size: 26),
//                   color: const Color.fromRGBO(55, 64, 81, 100),
//                   onPressed: () => _showMenuDrawer(context, navItems.take(4).toList()),
//                 ),
//               ],
//             )
//           else
//             // Large Desktop: Full navigation
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ...navItems.map((title) => NavItem(
//                       title: title,
//                       onTap: onNavTap,
//                       isActive: activeLabel == title,
//                       isCompact: false,
//                     )),
//                 const SizedBox(width: 24),
//                 ElevatedButton(
//                   onPressed: () => onNavTap('footer'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 0, 123, 255),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 40,
//                       vertical: 16,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const Text(
//                     "Let's Talk",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w300,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//         ],
//       ),
//     );
//   }

//   void _showMenuDrawer(BuildContext context, List<String> displayedItems) {
//     // Get items that are NOT already displayed in navbar
//     final drawerItems = navItems.where((item) => !displayedItems.contains(item)).toList();
//     showGeneralDialog(
//       context: context,
//       barrierDismissible: true,
//       barrierLabel: 'Menu',
//       barrierColor: Colors.black.withOpacity(0.5),
//       transitionDuration: const Duration(milliseconds: 300),
//       pageBuilder: (context, animation, secondaryAnimation) {
//         return Align(
//           alignment: Alignment.centerRight,
//           child: Material(
//             color: Colors.transparent,
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.75,
//               constraints: const BoxConstraints(maxWidth: 350),
//               height: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   bottomLeft: Radius.circular(20),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 10,
//                     offset: Offset(-2, 0),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Header
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 20,
//                     ),
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 0, 123, 255)
//                           .withOpacity(0.05),
//                       border: const Border(
//                         bottom: BorderSide(
//                           color: Color.fromRGBO(230, 230, 230, 1),
//                           width: 1,
//                         ),
//                       ),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Menu',
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromRGBO(0, 0, 0, 1),
//                           ),
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.close, size: 24),
//                           onPressed: () => Navigator.pop(context),
//                           color: const Color.fromRGBO(55, 64, 81, 100),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Menu items
//                   Expanded(
//                     child: ListView(
//                       padding: const EdgeInsets.symmetric(vertical: 8),
//                       children: drawerItems.map((title) {
//                         final isActive = activeLabel == title;
//                         return Material(
//                           color: Colors.transparent,
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.pop(context);
//                               onNavTap(title);
//                             },
//                             child: Container(
//                               width: double.infinity,
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 16,
//                               ),
//                               decoration: BoxDecoration(
//                                 color: isActive
//                                     ? const Color.fromARGB(255, 0, 123, 255)
//                                         .withOpacity(0.1)
//                                     : Colors.transparent,
//                                 border: Border(
//                                   left: BorderSide(
//                                     color: isActive
//                                         ? const Color.fromARGB(255, 0, 123, 255)
//                                         : Colors.transparent,
//                                     width: 4,
//                                   ),
//                                 ),
//                               ),
//                               child: Text(
//                                 title,
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight:
//                                       isActive ? FontWeight.w600 : FontWeight.normal,
//                                   color: isActive
//                                       ? const Color.fromARGB(255, 0, 123, 255)
//                                       : const Color.fromRGBO(55, 64, 81, 100),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                   // Let's Talk button
//                   Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                           onNavTap('footer');
//                         },
//                         borderRadius: BorderRadius.circular(12),
//                         child: Container(
//                           width: double.infinity,
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 0, 123, 255),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: const Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.chat_bubble_outline,
//                                 size: 20,
//                                 color: Colors.white,
//                               ),
//                               SizedBox(width: 8),
//                               Text(
//                                 "Let's Talk",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//       transitionBuilder: (context, animation, secondaryAnimation, child) {
//         return SlideTransition(
//           position: Tween<Offset>(
//             begin: const Offset(1, 0),
//             end: Offset.zero,
//           ).animate(CurvedAnimation(
//             parent: animation,
//             curve: Curves.easeInOut,
//           )),
//           child: child,
//         );
//       },
//     );
//   }
// }

// class NavItem extends StatefulWidget {
//   final String title;
//   final void Function(String) onTap;
//   final bool isActive;
//   final bool isCompact;

//   const NavItem({
//     super.key,
//     required this.title,
//     required this.onTap,
//     required this.isActive,
//     this.isCompact = false,
//   });

//   @override
//   State<NavItem> createState() => _NavItemState();
// }

// class _NavItemState extends State<NavItem> {
//   bool _isHovering = false;

//   @override
//   Widget build(BuildContext context) {
//     final color = widget.isActive || _isHovering
//         ? const Color.fromARGB(255, 0, 123, 255)
//         : const Color.fromRGBO(55, 64, 81, 100);

//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovering = true),
//       onExit: (_) => setState(() => _isHovering = false),
//       child: InkWell(
//         onTap: () => widget.onTap(widget.title),
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: widget.isCompact ? 8 : 16,
//           ),
//           child: AnimatedDefaultTextStyle(
//             duration: const Duration(milliseconds: 200),
//             style: TextStyle(
//               fontSize: widget.isCompact ? 14 : 16,
//               color: color,
//               fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.normal,
//             ),
//             child: Text(widget.title),
//           ),
//         ),
//       ),
//     );
//   }
// }