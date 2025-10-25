

// import 'package:code_way/MVVM/sections/about_section.dart';
// import 'package:code_way/MVVM/sections/clients_section.dart';
// import 'package:code_way/MVVM/sections/contact_section.dart';
// import 'package:code_way/MVVM/sections/footer_section.dart';
// import 'package:code_way/MVVM/sections/home_section.dart';
// import 'package:code_way/MVVM/sections/services_section.dart';
// import 'package:code_way/MVVM/sections/skill_section.dart';
// import 'package:code_way/MVVM/sections/works_section.dart';
// import 'package:code_way/MVVM/model/mydata.dart';
// import 'package:code_way/MVVM/utils/widgets/CustomNavbar.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final ScrollController _scrollController = ScrollController();

//   final homeKey = GlobalKey();
//   final aboutKey = GlobalKey();
//   final servicesKey = GlobalKey();
//   final worksKey = GlobalKey();
//   final clientsKey = GlobalKey();
//   final skillKey = GlobalKey();
//   final contactKey = GlobalKey();
//   final footerKey = GlobalKey();

//   String activeSection = 'Home';
//   late Map<String, GlobalKey> sectionKeys;

//   bool hasWorks = false; // track if WorksSection has data
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//     _scrollController.addListener(_onScroll);
//   }

//   Future<void> _loadData() async {
//     await Mydata.fetchData(); // fetch projects
//     setState(() {
//       hasWorks = Mydata.projects.isNotEmpty; // check if there are projects

//       // build section keys after data loaded
//       sectionKeys = {
//         'Home': homeKey,
//         'About': aboutKey,
//         'Services': servicesKey,
//         if (hasWorks) 'Works': worksKey,
//         'Skills': skillKey,
//         'Contact': contactKey,
//       };

//       isLoading = false;
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_onScroll);
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _scrollToSection(String label) {
//     final key = sectionKeys[label];
//     if (key != null && key.currentContext != null) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         try {
//           Scrollable.ensureVisible(
//             key.currentContext!,
//             duration: const Duration(milliseconds: 500),
//             curve: Curves.easeInOut,
//           );
//           setState(() => activeSection = label);
//         } catch (e) {
//           debugPrint("Scroll error: $e");
//         }
//       });
//     }
//   }

//   void _onScroll() {
//     for (var entry in sectionKeys.entries) {
//       final key = entry.value;
//       final context = key.currentContext;
//       if (context != null) {
//         final box = context.findRenderObject() as RenderBox;
//         final position = box.localToGlobal(Offset.zero).dy;

//         if (position <= 150 && position + box.size.height > 150) {
//           if (activeSection != entry.key) {
//             setState(() {
//               activeSection = entry.key;
//             });
//           }
//           break;
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             CustomNavbar(
//               onNavTap: _scrollToSection,
//               activeLabel: activeSection,
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 controller: _scrollController,
//                 physics: const ClampingScrollPhysics(),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(key: homeKey, child:  HomeSection()),
//                     Container(
//                       key: aboutKey,
//                       color: const Color.fromARGB(255, 255, 255, 255),
//                       child: const AboutSection(),
//                     ),
//                     Container(
//                       key: servicesKey,
//                       color: const Color.fromARGB(156, 252, 252, 252),
//                       child: const ServicesSection(),
//                     ),
//                     if (hasWorks)
//                       Container(
//                         key: worksKey,
//                         color: const Color.fromARGB(255, 255, 255, 255),
//                         child: const WorksSection(),
//                       ),
//                     Container(
//                       key: clientsKey,
//                       color: const Color.fromARGB(255, 255, 255, 255),
//                       child:  ClientsSection(),
//                     ),
//                     Container(
//                       key: skillKey,
//                       child: const SkillSection(),
//                     ),
//                     Container(
//                       key: contactKey,
//                       child: const ContactSection(),
//                     ),
//                     Container(
//                       key: footerKey,
//                       color: const Color(0xFF1F1F1F),
//                       child: const FooterSection(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:code_way/MVVM/sections/about_section.dart';
// import 'package:code_way/MVVM/sections/clients_section.dart';
// import 'package:code_way/MVVM/sections/contact_section.dart';
// import 'package:code_way/MVVM/sections/footer_section.dart';
// import 'package:code_way/MVVM/sections/home_section.dart';
// import 'package:code_way/MVVM/sections/services_section.dart';
// import 'package:code_way/MVVM/sections/skill_section.dart';
// import 'package:code_way/MVVM/sections/works_section.dart';
// import 'package:code_way/MVVM/model/mydata.dart';
// import 'package:code_way/MVVM/utils/widgets/CustomNavbar.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final ScrollController _scrollController = ScrollController();

//   final homeKey = GlobalKey();
//   final aboutKey = GlobalKey();
//   final servicesKey = GlobalKey();
//   final worksKey = GlobalKey();
//   final clientsKey = GlobalKey();
//   final skillKey = GlobalKey();
//   final contactKey = GlobalKey();
//   final footerKey = GlobalKey();

//   String activeSection = 'Home';
//   late Map<String, GlobalKey> sectionKeys;

//   bool hasWorks = false; // track if WorksSection has data
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//     _scrollController.addListener(_onScroll);
//   }

//   Future<void> _loadData() async {
//     await Mydata.fetchData(); // fetch projects
//     setState(() {
//       hasWorks = Mydata.projects.isNotEmpty; // check if there are projects

//       // build section keys after data loaded
//       sectionKeys = {
//         'Home': homeKey,
//         'About': aboutKey,
//         'Services': servicesKey,
//         if (hasWorks) 'Works': worksKey,
//         'Skills': skillKey,
//         'Contact': contactKey,
//         'footer':footerKey,
//       };

//       isLoading = false;
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_onScroll);
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _scrollToSection(String label) {
//     final key = sectionKeys[label];
//     if (key != null && key.currentContext != null) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         try {
//           Scrollable.ensureVisible(
//             key.currentContext!,
//             duration: const Duration(milliseconds: 500),
//             curve: Curves.easeInOut,
//           );
//           setState(() => activeSection = label);
//         } catch (e) {
//           debugPrint("Scroll error: $e");
//         }
//       });
//     }
//   }

//   void _onScroll() {
//     for (var entry in sectionKeys.entries) {
//       final key = entry.value;
//       final context = key.currentContext;
//       if (context != null) {
//         final box = context.findRenderObject() as RenderBox;
//         final position = box.localToGlobal(Offset.zero).dy;

//         if (position <= 150 && position + box.size.height > 150) {
//           if (activeSection != entry.key) {
//             setState(() {
//               activeSection = entry.key;
//             });
//           }
//           break;
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             CustomNavbar(
//               onNavTap: _scrollToSection,
//               activeLabel: activeSection,
//               navItems: [
//                 'Home',
//                 'About',
//                 'Services',
//                 if (hasWorks) 'Works', // only show if there is data
//                 'Skills',
//                 'Contact',
//               ],
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 controller: _scrollController,
//                 physics: const ClampingScrollPhysics(),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(key: homeKey, child:  HomeSection()),
//                     Container(
//                       key: aboutKey,
//                       color: const Color.fromARGB(255, 255, 255, 255),
//                       child: const AboutSection(),
//                     ),
//                     Container(
//                       key: servicesKey,
//                       color: const Color.fromARGB(156, 252, 252, 252),
//                       child: const ServicesSection(),
//                     ),
//                     if (hasWorks)
//                       Container(
//                         key: worksKey,
//                         color: const Color.fromARGB(255, 255, 255, 255),
//                         child: const WorksSection(),
//                       ),
//                     Container(
//                       key: clientsKey,
//                       color: const Color.fromARGB(255, 255, 255, 255),
//                       child:  ClientsSection(),
//                     ),
//                     Container(
//                       key: skillKey,
//                       child: const SkillSection(),
//                     ),
//                     Container(
//                       key: contactKey,
//                       child: const ContactSection(),
//                     ),
//                     Container(
//                       key: footerKey,
//                       color: const Color(0xFF1F1F1F),
//                       child: const FooterSection(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:code_way/MVVM/sections/about_section.dart';
import 'package:code_way/MVVM/sections/clients_section.dart';
import 'package:code_way/MVVM/sections/contact_section.dart';
import 'package:code_way/MVVM/sections/footer_section.dart';
import 'package:code_way/MVVM/sections/home_section.dart';
import 'package:code_way/MVVM/sections/services_section.dart';
import 'package:code_way/MVVM/sections/skill_section.dart';
import 'package:code_way/MVVM/sections/works_section.dart';
import 'package:code_way/MVVM/model/mydata.dart';
import 'package:code_way/MVVM/utils/widgets/CustomNavbar.dart';
import 'package:code_way/MVVM/utils/widgets/lotti_animation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final servicesKey = GlobalKey();
  final worksKey = GlobalKey();
  final clientsKey = GlobalKey();
  final skillKey = GlobalKey();
  final contactKey = GlobalKey();
  final footerKey = GlobalKey();

  String activeSection = 'Home';
  late Map<String, GlobalKey> sectionKeys;

  bool hasWorks = false; 
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
    _scrollController.addListener(_onScroll);
  }

  Future<void> _loadData() async {
    await Mydata.fetchData();
    setState(() {
      hasWorks = Mydata.projects.isNotEmpty;

      sectionKeys = {
        'Home': homeKey,
        'About': aboutKey,
        'Services': servicesKey,
        if (hasWorks) 'Works': worksKey,
        'Skills': skillKey,
        'Contact': contactKey,
        'footer': footerKey,
      };

      isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String label) {
    final key = sectionKeys[label];
    if (key != null && key.currentContext != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        try {
          Scrollable.ensureVisible(
            key.currentContext!,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          setState(() => activeSection = label);
        } catch (e) {
          debugPrint("Scroll error: $e");
        }
      });
    }
  }

  void _onScroll() {
    for (var entry in sectionKeys.entries) {
      final key = entry.value;
      final context = key.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;

        if (position <= 150 && position + box.size.height > 150) {
          if (activeSection != entry.key) {
            setState(() {
              activeSection = entry.key;
            });
          }
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (isLoading) {
    //   return const Scaffold(
    //     body: Center(child: ),
    //   );
    // }

    if (isLoading) {
  return Scaffold(
    body: Container(
      color: Colors.white, // white background while loading
      width: double.infinity,
      height: double.infinity,
      child: const Center(
        child: CodewayLoadingScreen(), // <-- your custom Flutter loader widget
      ),
    ),
  );
}

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomNavbar(
              onNavTap: _scrollToSection,
              activeLabel: activeSection,
              navItems: [
                'Home',
                'About',
                'Services',
                if (hasWorks) 'Works',
                'Skills',
                'Contact',
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      key: homeKey, 
                      child: HomeSection(
                        LetsBuildTogether: () => _scrollToSection("Contact"),
                        onViewWorkPressed:() => _scrollToSection('Works')
                      )),
                    Container(
                      key: aboutKey,
                      color: Colors.white,
                      child: const AboutSection(),
                    ),
                    Container(
                      key: servicesKey,
                      color: const Color.fromARGB(156, 252, 252, 252),
                      child: const ServicesSection(),
                    ),
                    if (hasWorks)
                      Container(
                        key: worksKey,
                        color: Colors.white,
                        child: const WorksSection(),
                      ),
                    Container(
                      key: clientsKey,
                      color: Colors.white,
                      child:  ClientsSection(),
                    ),
                    Container(
                      key: skillKey,
                      child: const SkillSection(),
                    ),
                    Container(
                      key: contactKey,
                      child: const ContactSection(),
                    ),
                    Container(
                      key: footerKey,
                      color: const Color(0xFF1F1F1F),
                      child: const FooterSection(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
