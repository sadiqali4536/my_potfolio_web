import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:code_way/MVVM/model/mydata.dart';

class ClientsSection extends StatefulWidget {
  const ClientsSection({super.key});

  @override
  State<ClientsSection> createState() => _ClientsSectionState();
}

class _ClientsSectionState extends State<ClientsSection> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;
  bool _isHovering = false;
  List<Map<String, dynamic>> clients = [];

  final LinearGradient gradient = const LinearGradient(
    colors: [Color(0xFF3B82F6), Color(0xFFFBBF24)],
  );

  @override
  void initState() {
    super.initState();
    _loadClients();
  }

  Future<void> _loadClients() async {
    await Mydata.fetchData();
    if (mounted) {
      setState(() => clients = Mydata.clients);
      _startAutoScroll();
    }
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (_scrollController.hasClients && !_isHovering) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        double newOffset = _scrollController.offset + 1;
        if (newOffset >= maxScroll) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.jumpTo(newOffset);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (clients.isEmpty) return const SizedBox.shrink();

    final width = MediaQuery.of(context).size.width;
    final totalProjects = clients.first['total projects count'];
    final satisfaction = clients.first['satisfaction points'];
    final support = clients.first['support'];

    // Dynamically scale based on screen size
    double titleFontSize;
    double statFontSize;
    double statLabelFontSize;
    double wrapSpacing;

    if (width < 600) {
      titleFontSize = 28;
      statFontSize = 26;
      statLabelFontSize = 14;
      wrapSpacing = 80;
    } else if (width < 1024) {
      titleFontSize = 36;
      statFontSize = 34;
      statLabelFontSize = 16;
      wrapSpacing = 180;
    } else if (width < 1440) {
      titleFontSize = 42;
      statFontSize = 40;
      statLabelFontSize = 18;
      wrapSpacing = 280;
    } else {
      titleFontSize = 48;
      statFontSize = 46;
      statLabelFontSize = 20;
      wrapSpacing = 360;
    }

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
      child: Column(
        children: [
          // ---- Gradient Title ----
          ShaderMask(
            shaderCallback: (bounds) =>
                gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
            child: Text(
              'Trusted by the Builders of Tomorrow',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 60),

          // ---- Stats Section ----
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            spacing: wrapSpacing,
            runSpacing: 30,
            children: [
              _buildStat('$totalProjects+', 'Products', const Color(0xFFFBBF24),
                  statFontSize, statLabelFontSize),
              _buildStat('$satisfaction%', 'Satisfaction', const Color(0xFF3B82F6),
                  statFontSize, statLabelFontSize),
              _buildStat('$support', 'Support', const Color(0xFF10B981),
                  statFontSize, statLabelFontSize),
            ],
          ),
          const SizedBox(height: 50),

          // ---- Clients Logo Section ----
          MouseRegion(
            onEnter: (_) => setState(() => _isHovering = true),
            onExit: (_) => setState(() => _isHovering = false),
            child: SizedBox(
              height: 80,
              child: clients.length <= 10
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: clients.map(_buildClientLogo).toList(),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: clients.length * 2,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          _buildClientLogo(clients[index % clients.length]),
                    ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ===================== Widgets =====================

  Widget _buildStat(
      String value, String label, Color color, double valueSize, double labelSize) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: valueSize,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: labelSize,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF9CA3AF),
          ),
        ),
      ],
    );
  }

  Widget _buildClientLogo(Map<String, dynamic> client) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: 150,
        height: 80,
        child: client['logo'] != ''
            ? Image.network(
                client['logo'],
                fit: BoxFit.contain,
                errorBuilder: (context, error, stack) =>
                    const Icon(Icons.business, color: Colors.grey),
              )
            : const Icon(Icons.business, color: Colors.grey),
      ),
    );
  }
}



// import 'dart:async';

// import 'package:code_way/MVVM/model/client_data.dart';
// import 'package:code_way/MVVM/model/mydata.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ClientsSection extends StatelessWidget {
//   ClientsSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     if (screenWidth < 600) {
//       return _Mobile_clients();
//     } else if (screenWidth < 1024) {
//       return _Tablet_clients();
//     } else if (screenWidth < 1440 ) {
//       return Desktop_clients();
//     } else if(screenWidth >= 1440){
//       // Fallback to tablet for smaller screens
//       return LargeDesktop_clients();
//     }else{
//       return _Mobile_clients();
//     }
//   }
// }

// // ============== m SCAFFOLD (600px - 900px) ==============
// class _Mobile_clients extends StatefulWidget {
//   const _Mobile_clients({super.key, });

//   @override
//   State<_Mobile_clients> createState() =>
//       _Mobile_clientsState();
// }

// class _Mobile_clientsState
//     extends State<_Mobile_clients> {
//   final ScrollController _scrollController = ScrollController();
//   Timer? _timer;
//   bool _isHovering = false;

//   List<Map<String, dynamic>> clients = [];

//   final LinearGradient gradient = const LinearGradient(
//     colors: [Color(0xFF3B82F6), Color(0xFFFBBF24)],
//   );

//   @override
//   void initState() {
//     super.initState();
//     Mydata.fetchData().then((_) {
//       setState(() {
//         clients = Mydata.clients;
//       });
//       _startAutoScroll();
//     });
//   }

//   void _startAutoScroll() {
//     _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
//       if (_scrollController.hasClients && !_isHovering) {
//         double maxScroll = _scrollController.position.maxScrollExtent;
//         double newOffset = _scrollController.offset + 1;
//         if (newOffset >= maxScroll) {
//           _scrollController.jumpTo(0);
//         } else {
//           _scrollController.jumpTo(newOffset);
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (clients.isEmpty) return const SizedBox.shrink();

//     final totalProjects = clients.first['total projects count'];
//     final satisfaction = clients.first['satisfaction points'];
//     final support = clients.first['support'];

//     return Container(
//       width: double.infinity,
//       color: Colors.white,
//       padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
//       child: Column(
//         children: [
//           ShaderMask(
//             shaderCallback: (bounds) =>
//                 gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
//             child: RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 style: GoogleFonts.poppins(
//                   fontSize: 42,
//                   fontWeight: FontWeight.w600,
//                   height: 1.4,
//                   color: Colors.white,
//                 ),
//                 children: const [
//                   TextSpan(text: 'Trusted by the '),
//                   TextSpan(text: 'Builders of '),
//                   TextSpan(text: 'Tomorrow'),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 60),
//           Wrap(
//             alignment: WrapAlignment.spaceEvenly,
//             spacing: 380,
//             runSpacing: 30,
//             children: [
//               _statColumn('$totalProjects+', 'Products', const Color(0xFFFBBF24)),
//               _statColumn('$satisfaction%', 'Satisfaction', const Color(0xFF3B82F6)),
//               _statColumn('$support', 'Support', const Color(0xFF10B981)),
//             ],
//           ),
//           const SizedBox(height: 50),
//           SizedBox(
//             height: 80,
//             child: clients.length <= 10
//                 ? Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: clients.map(_clientLogo).toList(),
//                   )
//                 : ListView.builder(
//                     controller: _scrollController,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: clients.length * 2,
//                     physics: const ClampingScrollPhysics(),
//                     itemBuilder: (context, index) =>
//                         _clientLogo(clients[index % clients.length]),
//                   ),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }

//   Widget _statColumn(String value, String label, Color color) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: GoogleFonts.poppins(
//             fontSize: 42,
//             fontWeight: FontWeight.bold,
//             color: color,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           label,
//           style: GoogleFonts.poppins(
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//             color: const Color(0xFF9CA3AF),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _clientLogo(Map<String, dynamic> client) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       child: Container(
//         width: 150,
//         height: 89,
//         decoration: BoxDecoration(
//           // color: (client['color'] as Color).withOpacity(0.15),
//         ),
//         child: client['logo'] != ''
//             ? Image.network(
//                 client['logo'],
//                 fit: BoxFit.contain,
//                 errorBuilder: (context, error, stackTrace) =>
//                     const Icon(Icons.business, color: Colors.grey),
//               )
//             : const Icon(Icons.business, color: Colors.grey),
//       ),
//     );
//   }
// }

// // ============== Tablet SCAFFOLD (900px - 1400px) ==============
// class _Tablet_clients extends StatefulWidget {
//   const _Tablet_clients({super.key, });

//   @override
//   State<_Tablet_clients> createState() =>
//       _Tablet_clientsState();
// }

// class _Tablet_clientsState
//     extends State<_Tablet_clients> {
//   final ScrollController _scrollController = ScrollController();
//   Timer? _timer;
//   bool _isHovering = false;

//   List<Map<String, dynamic>> clients = [];

//   final LinearGradient gradient = const LinearGradient(
//     colors: [Color(0xFF3B82F6), Color(0xFFFBBF24)],
//   );

//   @override
//   void initState() {
//     super.initState();
//     Mydata.fetchData().then((_) {
//       setState(() {
//         clients = Mydata.clients;
//       });
//       _startAutoScroll();
//     });
//   }

//   void _startAutoScroll() {
//     _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
//       if (_scrollController.hasClients && !_isHovering) {
//         double maxScroll = _scrollController.position.maxScrollExtent;
//         double newOffset = _scrollController.offset + 1;
//         if (newOffset >= maxScroll) {
//           _scrollController.jumpTo(0);
//         } else {
//           _scrollController.jumpTo(newOffset);
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (clients.isEmpty) return const SizedBox.shrink();

//     final totalProjects = clients.first['total projects count'];
//     final satisfaction = clients.first['satisfaction points'];
//     final support = clients.first['support'];

//     return Container(
//       width: double.infinity,
//       color: Colors.white,
//       padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
//       child: Column(
//         children: [
//           ShaderMask(
//             shaderCallback: (bounds) =>
//                 gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
//             child: RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 style: GoogleFonts.poppins(
//                   fontSize: 42,
//                   fontWeight: FontWeight.w600,
//                   height: 1.4,
//                   color: Colors.white,
//                 ),
//                 children: const [
//                   TextSpan(text: 'Trusted by the '),
//                   TextSpan(text: 'Builders of '),
//                   TextSpan(text: 'Tomorrow'),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 60),
//           Wrap(
//             alignment: WrapAlignment.spaceEvenly,
//             spacing: 380,
//             runSpacing: 30,
//             children: [
//               _statColumn('$totalProjects+', 'Products', const Color(0xFFFBBF24)),
//               _statColumn('$satisfaction%', 'Satisfaction', const Color(0xFF3B82F6)),
//               _statColumn('$support', 'Support', const Color(0xFF10B981)),
//             ],
//           ),
//           const SizedBox(height: 50),
//           SizedBox(
//             height: 80,
//             child: clients.length <= 10
//                 ? Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: clients.map(_clientLogo).toList(),
//                   )
//                 : ListView.builder(
//                     controller: _scrollController,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: clients.length * 2,
//                     physics: const ClampingScrollPhysics(),
//                     itemBuilder: (context, index) =>
//                         _clientLogo(clients[index % clients.length]),
//                   ),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }

//   Widget _statColumn(String value, String label, Color color) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: GoogleFonts.poppins(
//             fontSize: 42,
//             fontWeight: FontWeight.bold,
//             color: color,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           label,
//           style: GoogleFonts.poppins(
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//             color: const Color(0xFF9CA3AF),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _clientLogo(Map<String, dynamic> client) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       child: Container(
//         width: 150,
//         height: 89,
//         decoration: BoxDecoration(
//           // color: (client['color'] as Color).withOpacity(0.15),
//         ),
//         child: client['logo'] != ''
//             ? Image.network(
//                 client['logo'],
//                 fit: BoxFit.contain,
//                 errorBuilder: (context, error, stackTrace) =>
//                     const Icon(Icons.business, color: Colors.grey),
//               )
//             : const Icon(Icons.business, color: Colors.grey),
//       ),
//     );
//   }
// }



// class Desktop_clients extends StatefulWidget {
//   const Desktop_clients({super.key, });

//   @override
//   State<Desktop_clients> createState() =>
//       Desktop_clientsState();
// }

// class Desktop_clientsState
//     extends State<Desktop_clients> {
//   final ScrollController _scrollController = ScrollController();
//   Timer? _timer;
//   bool _isHovering = false;

//   List<Map<String, dynamic>> clients = [];

//   final LinearGradient gradient = const LinearGradient(
//     colors: [Color(0xFF3B82F6), Color(0xFFFBBF24)],
//   );

//   @override
//   void initState() {
//     super.initState();
//     Mydata.fetchData().then((_) {
//       setState(() {
//         clients = Mydata.clients;
//       });
//       _startAutoScroll();
//     });
//   }

//   void _startAutoScroll() {
//     _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
//       if (_scrollController.hasClients && !_isHovering) {
//         double maxScroll = _scrollController.position.maxScrollExtent;
//         double newOffset = _scrollController.offset + 1;
//         if (newOffset >= maxScroll) {
//           _scrollController.jumpTo(0);
//         } else {
//           _scrollController.jumpTo(newOffset);
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (clients.isEmpty) return const SizedBox.shrink();

//     final totalProjects = clients.first['total projects count'];
//     final satisfaction = clients.first['satisfaction points'];
//     final support = clients.first['support'];

//     return Container(
//       width: double.infinity,
//       color: Colors.white,
//       padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
//       child: Column(
//         children: [
//           ShaderMask(
//             shaderCallback: (bounds) =>
//                 gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
//             child: RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 style: GoogleFonts.poppins(
//                   fontSize: 42,
//                   fontWeight: FontWeight.w600,
//                   height: 1.4,
//                   color: Colors.white,
//                 ),
//                 children: const [
//                   TextSpan(text: 'Trusted by the '),
//                   TextSpan(text: 'Builders of '),
//                   TextSpan(text: 'Tomorrow'),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 60),
//           Wrap(
//             alignment: WrapAlignment.spaceEvenly,
//             spacing: 380,
//             runSpacing: 30,
//             children: [
//               _statColumn('$totalProjects+', 'Products', const Color(0xFFFBBF24)),
//               _statColumn('$satisfaction%', 'Satisfaction', const Color(0xFF3B82F6)),
//               _statColumn('$support', 'Support', const Color(0xFF10B981)),
//             ],
//           ),
//           const SizedBox(height: 50),
//           SizedBox(
//             height: 80,
//             child: clients.length <= 10
//                 ? Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: clients.map(_clientLogo).toList(),
//                   )
//                 : ListView.builder(
//                     controller: _scrollController,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: clients.length * 2,
//                     physics: const ClampingScrollPhysics(),
//                     itemBuilder: (context, index) =>
//                         _clientLogo(clients[index % clients.length]),
//                   ),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }

//   Widget _statColumn(String value, String label, Color color) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: GoogleFonts.poppins(
//             fontSize: 42,
//             fontWeight: FontWeight.bold,
//             color: color,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           label,
//           style: GoogleFonts.poppins(
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//             color: const Color(0xFF9CA3AF),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _clientLogo(Map<String, dynamic> client) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       child: Container(
//         width: 150,
//         height: 89,
//         decoration: BoxDecoration(
//           // color: (client['color'] as Color).withOpacity(0.15),
//         ),
//         child: client['logo'] != ''
//             ? Image.network(
//                 client['logo'],
//                 fit: BoxFit.contain,
//                 errorBuilder: (context, error, stackTrace) =>
//                     const Icon(Icons.business, color: Colors.grey),
//               )
//             : const Icon(Icons.business, color: Colors.grey),
//       ),
//     );
//   }
// }

// class LargeDesktop_clients extends StatefulWidget {
//   const LargeDesktop_clients({super.key, });

//   @override
//   State<LargeDesktop_clients> createState() =>
//       LargeDesktop_clientsState();
// }

// class LargeDesktop_clientsState
//     extends State<LargeDesktop_clients> {
//   final ScrollController _scrollController = ScrollController();
//   Timer? _timer;
//   bool _isHovering = false;

//   List<Map<String, dynamic>> clients = [];

//   final LinearGradient gradient = const LinearGradient(
//     colors: [Color(0xFF3B82F6), Color(0xFFFBBF24)],
//   );

//   @override
//   void initState() {
//     super.initState();
//     Mydata.fetchData().then((_) {
//       setState(() {
//         clients = Mydata.clients;
//       });
//       _startAutoScroll();
//     });
//   }

//   void _startAutoScroll() {
//     _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
//       if (_scrollController.hasClients && !_isHovering) {
//         double maxScroll = _scrollController.position.maxScrollExtent;
//         double newOffset = _scrollController.offset + 1;
//         if (newOffset >= maxScroll) {
//           _scrollController.jumpTo(0);
//         } else {
//           _scrollController.jumpTo(newOffset);
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (clients.isEmpty) return const SizedBox.shrink();

//     final totalProjects = clients.first['total projects count'];
//     final satisfaction = clients.first['satisfaction points'];
//     final support = clients.first['support'];

//     return Container(
//       width: double.infinity,
//       color: Colors.white,
//       padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
//       child: Column(
//         children: [
//           ShaderMask(
//             shaderCallback: (bounds) =>
//                 gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
//             child: RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 style: GoogleFonts.poppins(
//                   fontSize: 42,
//                   fontWeight: FontWeight.w600,
//                   height: 1.4,
//                   color: Colors.white,
//                 ),
//                 children: const [
//                   TextSpan(text: 'Trusted by the '),
//                   TextSpan(text: 'Builders of '),
//                   TextSpan(text: 'Tomorrow'),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 60),
//           Wrap(
//             alignment: WrapAlignment.spaceEvenly,
//             spacing: 380,
//             runSpacing: 30,
//             children: [
//               _statColumn('$totalProjects+', 'Products', const Color(0xFFFBBF24)),
//               _statColumn('$satisfaction%', 'Satisfaction', const Color(0xFF3B82F6)),
//               _statColumn('$support', 'Support', const Color(0xFF10B981)),
//             ],
//           ),
//           const SizedBox(height: 50),
//           SizedBox(
//             height: 80,
//             child: clients.length <= 10
//                 ? Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: clients.map(_clientLogo).toList(),
//                   )
//                 : ListView.builder(
//                     controller: _scrollController,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: clients.length * 2,
//                     physics: const ClampingScrollPhysics(),
//                     itemBuilder: (context, index) =>
//                         _clientLogo(clients[index % clients.length]),
//                   ),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }

//   Widget _statColumn(String value, String label, Color color) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: GoogleFonts.poppins(
//             fontSize: 42,
//             fontWeight: FontWeight.bold,
//             color: color,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           label,
//           style: GoogleFonts.poppins(
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//             color: const Color(0xFF9CA3AF),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _clientLogo(Map<String, dynamic> client) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       child: Container(
//         width: 150,
//         height: 89,
//         decoration: BoxDecoration(
//           // color: (client['color'] as Color).withOpacity(0.15),
//         ),
//         child: client['logo'] != ''
//             ? Image.network(
//                 client['logo'],
//                 fit: BoxFit.contain,
//                 errorBuilder: (context, error, stackTrace) =>
//                     const Icon(Icons.business, color: Colors.grey),
//               )
//             : const Icon(Icons.business, color: Colors.grey),
//       ),
//     );
//   }
// }
