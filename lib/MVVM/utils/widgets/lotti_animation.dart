

// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// class CodewayLoadingScreen extends StatefulWidget {
//   const CodewayLoadingScreen({Key? key}) : super(key: key);

//   @override
//   State<CodewayLoadingScreen> createState() => _CodewayLoadingScreenState();
// }

// class _CodewayLoadingScreenState extends State<CodewayLoadingScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _floatController;
//   late AnimationController _logoController;
//   late AnimationController _progressController;
//   late AnimationController _pulseController;
//   late AnimationController _gradientController;
//   late AnimationController _rotateController;

//   @override
//   void initState() {
//     super.initState();
    
//     _floatController = AnimationController(
//       duration: const Duration(seconds: 4),
//       vsync: this,
//     )..repeat();

//     _logoController = AnimationController(
//       duration: const Duration(seconds: 4),
//       vsync: this,
//     )..repeat();

//     _progressController = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..repeat();

//     _pulseController = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..repeat();

//     _gradientController = AnimationController(
//       duration: const Duration(seconds: 15),
//       vsync: this,
//     )..repeat();

//     _rotateController = AnimationController(
//       duration: const Duration(seconds: 25),
//       vsync: this,
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _floatController.dispose();
//     _logoController.dispose();
//     _progressController.dispose();
//     _pulseController.dispose();
//     _gradientController.dispose();
//     _rotateController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedBuilder(
//         animation: _gradientController,
//         builder: (context, child) {
//           return Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: const [
//                   Color(0xFFFFFFFF),
//                   Color(0xFFE8F4FF),
//                   Color(0xFFF0E6FF),
//                   Color(0xFFE6F7FF),
//                   Color(0xFFF5F8FF),
//                   Color(0xFFFFFFFF),
//                 ],
//                 stops: [
//                   0.0 + _gradientController.value * 0.1,
//                   0.2 + _gradientController.value * 0.1,
//                   0.4 + _gradientController.value * 0.1,
//                   0.6 + _gradientController.value * 0.1,
//                   0.8 + _gradientController.value * 0.1,
//                   1.0,
//                 ],
//               ),
//             ),
//             child: Stack(
//               children: [
//                 // Background decorations
//                 _buildBackgroundDecorations(),
                
//                 // Main content
//                 Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _buildLogoContainer(),
//                       const SizedBox(height: 40),
//                       _buildLoadingText(),
//                       const SizedBox(height: 30),
//                       _buildProgressBar(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildBackgroundDecorations() {
//     return Stack(
//       children: [
//         // Floating circles
//         _buildFloatingCircle(0.1, 0.1, 150, Colors.amber.withOpacity(0.15), 25),
//         _buildFloatingCircle(0.7, 0.8, 100, Colors.purple.withOpacity(0.15), 20),
//         _buildFloatingCircle(0.6, 0.15, 200, Colors.cyan.withOpacity(0.15), 30),
        
//         // Flowing lines
//         _buildFlowingLine(0.2, 0),
//         _buildFlowingLine(0.5, 5),
//         _buildFlowingLine(0.8, 10),
        
//         // Geometric shapes
//         _buildRotatingSquare(0.15, 0.85, 0),
//         _buildRotatingSquare(0.2, 0.2, 5),
//         _buildRotatingTriangle(0.5, 0.9, 0),
//         _buildRotatingTriangle(0.25, 0.75, 3),
//         _buildRotatingHexagon(0.4, 0.75, 0),
//         _buildRotatingHexagon(0.7, 0.3, 7),
//         _buildTwinklingStar(0.1, 0.7, 0),
//         _buildTwinklingStar(0.85, 0.15, 1.5),
//         _buildTwinklingStar(0.7, 0.6, 2.5),
//       ],
//     );
//   }

//   Widget _buildFloatingCircle(double top, double left, double size, Color color, int duration) {
//     return AnimatedBuilder(
//       animation: _rotateController,
//       builder: (context, child) {
//         return Positioned(
//           top: MediaQuery.of(context).size.height * top,
//           left: MediaQuery.of(context).size.width * left,
//           child: Transform.translate(
//             offset: Offset(0, -20 * math.sin(_rotateController.value * 2 * math.pi)),
//             child: Container(
//               width: size,
//               height: size,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: RadialGradient(
//                   colors: [color, Colors.transparent],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildFlowingLine(double top, double delay) {
//     return AnimatedBuilder(
//       animation: _progressController,
//       builder: (context, child) {
//         return Positioned(
//           top: MediaQuery.of(context).size.height * top,
//           left: MediaQuery.of(context).size.width * (_progressController.value - 0.2),
//           child: Container(
//             width: 180,
//             height: 2,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.transparent,
//                   Colors.blue.withOpacity(0.4),
//                   Colors.transparent,
//                 ],
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.blue.withOpacity(0.3),
//                   blurRadius: 8,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildRotatingSquare(double top, double left, double delay) {
//     return AnimatedBuilder(
//       animation: _rotateController,
//       builder: (context, child) {
//         return Positioned(
//           top: MediaQuery.of(context).size.height * top,
//           left: MediaQuery.of(context).size.width * left,
//           child: Transform.rotate(
//             angle: _rotateController.value * 2 * math.pi,
//             child: Transform.translate(
//               offset: Offset(0, -30 * math.sin(_rotateController.value * 2 * math.pi)),
//               child: Container(
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.blue.withOpacity(0.15), width: 2),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildRotatingTriangle(double top, double left, double delay) {
//     return AnimatedBuilder(
//       animation: _rotateController,
//       builder: (context, child) {
//         return Positioned(
//           top: MediaQuery.of(context).size.height * top,
//           left: MediaQuery.of(context).size.width * left,
//           child: Transform.rotate(
//             angle: -_rotateController.value * 2 * math.pi,
//             child: Transform.translate(
//               offset: Offset(0, -30 * math.sin(_rotateController.value * 2 * math.pi)),
//               child: CustomPaint(
//                 size: const Size(80, 70),
//                 painter: TrianglePainter(Colors.amber.withOpacity(0.12)),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildRotatingHexagon(double top, double left, double delay) {
//     return AnimatedBuilder(
//       animation: _rotateController,
//       builder: (context, child) {
//         return Positioned(
//           top: MediaQuery.of(context).size.height * top,
//           left: MediaQuery.of(context).size.width * left,
//           child: Transform.rotate(
//             angle: _rotateController.value * 2 * math.pi,
//             child: Transform.translate(
//               offset: Offset(0, -30 * math.sin(_rotateController.value * 2 * math.pi)),
//               child: CustomPaint(
//                 size: const Size(50, 50),
//                 painter: HexagonPainter(Colors.purple.withOpacity(0.1)),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildTwinklingStar(double top, double left, double delay) {
//     return AnimatedBuilder(
//       animation: _pulseController,
//       builder: (context, child) {
//         double scale = 0.8 + 0.4 * _pulseController.value;
//         double opacity = 0.3 + 0.5 * _pulseController.value;
//         return Positioned(
//           top: MediaQuery.of(context).size.height * top,
//           left: MediaQuery.of(context).size.width * left,
//           child: Transform.scale(
//             scale: scale,
//             child: Transform.rotate(
//               angle: _pulseController.value * math.pi,
//               child: Opacity(
//                 opacity: opacity,
//                 child: CustomPaint(
//                   size: const Size(30, 30),
//                   painter: StarPainter(Colors.amber.withOpacity(0.2)),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildLogoContainer() {
//     return AnimatedBuilder(
//       animation: Listenable.merge([_floatController, _logoController, _pulseController]),
//       builder: (context, child) {
//         double floatOffset = -10 * math.sin(_floatController.value * 2 * math.pi);
//         double scale = 1.0 + 0.02 * math.sin(_floatController.value * 2 * math.pi);

//         return Transform.translate(
//           offset: Offset(0, floatOffset),
//           child: Transform.scale(
//             scale: scale,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 // Glow effect
//                 Container(
//                   width: 240,
//                   height: 240,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(65),
//                     gradient: RadialGradient(
//                       colors: [
//                         Colors.amber.withOpacity(0.1 + 0.4 * _pulseController.value),
//                         Colors.transparent,
//                       ],
//                     ),
//                   ),
//                 ),
                
//                 // Pulse effects
//                 _buildPulseEffect(230, _pulseController.value),
//                 _buildPulseEffect(230, (_pulseController.value + 0.5) % 1.0),
                
//                 // Progress rings
//                 _buildProgressRing(220, _logoController.value, Colors.amber, 0.0),
//                 _buildProgressRing(220, _logoController.value, Colors.amber.withOpacity(0.5), 0.2),
//                 _buildProgressRing(220, _logoController.value, Colors.amber.withOpacity(0.3), 0.4),
                
//                 // Main logo container
//                 Container(
//                   width: 200,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF0052FF),
//                     borderRadius: BorderRadius.circular(45),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.3 + 0.1 * math.sin(_floatController.value * 2 * math.pi)),
//                         blurRadius: 60,
//                         offset: const Offset(0, 20),
//                       ),
//                     ],
//                   ),
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       _buildParticles(),
//                       _buildLogoContent(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildPulseEffect(double size, double progress) {
//     double scale = 1.0 + 0.15 * progress;
//     double opacity = 1.0 - progress;
    
//     return Transform.scale(
//       scale: scale,
//       child: Opacity(
//         opacity: opacity * 0.7,
//         child: Container(
//           width: size,
//           height: size,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(60),
//             border: Border.all(color: Colors.amber.withOpacity(0.3), width: 2),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildProgressRing(double size, double progress, Color color, double delay) {
//     double adjustedProgress = (progress + delay) % 1.0;
    
//     return CustomPaint(
//       size: Size(size, size),
//       painter: CircularProgressPainter(
//         progress: adjustedProgress,
//         color: color,
//       ),
//     );
//   }

//   Widget _buildParticles() {
//     return Stack(
//       children: [
//         _buildParticle(0.2, 0.2, 0),
//         _buildParticle(0.7, 0.8, 1),
//         _buildParticle(0.4, 0.1, 2),
//         _buildParticle(0.8, 0.3, 3),
//         _buildParticle(0.1, 0.7, 4),
//       ],
//     );
//   }

//   Widget _buildParticle(double top, double left, int delay) {
//     return AnimatedBuilder(
//       animation: _logoController,
//       builder: (context, child) {
//         double progress = (_logoController.value * 6 + delay) % 6 / 6;
//         double opacity = progress < 0.5 ? progress * 2 * 0.7 : (1 - progress) * 2 * 0.7;
//         double offset = -20 * math.sin(progress * math.pi);
        
//         return Positioned(
//           top: 200 * top + offset,
//           left: 200 * left,
//           child: Opacity(
//             opacity: opacity,
//             child: Container(
//               width: 4,
//               height: 4,
//               decoration: const BoxDecoration(
//                 color: Color(0xFFFFD700),
//                 shape: BoxShape.circle,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildLogoContent() {
//     return AnimatedBuilder(
//       animation: _logoController,
//       builder: (context, child) {
//         // C letter animation (0-0.2: fade in, 0.2-0.8: visible, 0.8-1.0: fade out)
//         double cOpacity = 0.0;
//         double cTranslateX = -40.0;
//         double cRotate = -math.pi / 2;
        
//         if (_logoController.value < 0.2) {
//           double t = _logoController.value / 0.2;
//           cOpacity = t;
//           cTranslateX = -40 * (1 - t);
//           cRotate = -math.pi / 2 * (1 - t);
//         } else if (_logoController.value < 0.8) {
//           cOpacity = 1.0;
//           cTranslateX = 0;
//           cRotate = 0;
//         } else {
//           double t = (_logoController.value - 0.8) / 0.2;
//           cOpacity = 1 - t;
//           cTranslateX = -40 * t;
//           cRotate = -math.pi / 2 * t;
//         }

//         // Lambda animation (0-0.25: fade in, 0.25-0.75: visible, 0.75-1.0: fade out)
//         double lambdaOpacity = 0.0;
//         double lambdaTranslateX = -40.0;
//         double lambdaRotate = -math.pi / 2;
        
//         if (_logoController.value < 0.25) {
//           double t = _logoController.value / 0.25;
//           lambdaOpacity = t;
//           lambdaTranslateX = -40 * (1 - t);
//           lambdaRotate = -math.pi / 2 * (1 - t);
//         } else if (_logoController.value < 0.75) {
//           lambdaOpacity = 1.0;
//           lambdaTranslateX = 0;
//           lambdaRotate = 0;
//         } else {
//           double t = (_logoController.value - 0.75) / 0.25;
//           lambdaOpacity = 1 - t;
//           lambdaTranslateX = -40 * t;
//           lambdaRotate = -math.pi / 2 * t;
//         }

//         // Golden dot animation
//         double dotOpacity = 0.0;
//         double dotScale = 0.0;
        
//         if (_logoController.value >= 0.2 && _logoController.value < 0.3) {
//           dotOpacity = (_logoController.value - 0.2) / 0.1;
//           dotScale = (_logoController.value - 0.2) / 0.1;
//         } else if (_logoController.value >= 0.3 && _logoController.value < 0.7) {
//           dotOpacity = 1.0;
//           if (_logoController.value < 0.4 || (_logoController.value >= 0.5 && _logoController.value < 0.6)) {
//             dotScale = 1.5;
//           } else {
//             dotScale = 1.0;
//           }
//         } else if (_logoController.value >= 0.7 && _logoController.value < 0.8) {
//           dotOpacity = 1 - (_logoController.value - 0.7) / 0.1;
//           dotScale = 1 - (_logoController.value - 0.7) / 0.1;
//         }

//         return Stack(
//           alignment: Alignment.center,
//           children: [
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Transform.translate(
//                   offset: Offset(cTranslateX, 0),
//                   child: Transform.rotate(
//                     angle: cRotate,
//                     child: Opacity(
//                       opacity: cOpacity,
//                       child: const Text(
//                         'C',
//                         style: TextStyle(
//                           fontSize: 85,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                           letterSpacing: -8,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 4),
//                 Transform.translate(
//                   offset: Offset(lambdaTranslateX, 0),
//                   child: Transform.rotate(
//                     angle: math.pi + lambdaRotate,
//                     child: Opacity(
//                       opacity: lambdaOpacity,
//                       child: const Text(
//                         'V',
//                         style: TextStyle(
//                           fontSize: 85,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFFB8C5D6),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Opacity(
//               opacity: dotOpacity,
//               child: Transform.scale(
//                 scale: dotScale,
//                 child: Container(
//                   width: 14,
//                   height: 14,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFFFA500),
//                     shape: BoxShape.circle,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.orange.withOpacity(0.8),
//                         blurRadius: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildLoadingText() {
//     return AnimatedBuilder(
//       animation: _logoController,
//       builder: (context, child) {
//         double opacity = 0.6 + 0.4 * math.sin(_logoController.value * 2 * math.pi);
//         return Opacity(
//           opacity: opacity,
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 'LOADING',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w700,
//                   color: Color(0xFF2C3E50),
//                   letterSpacing: 3,
//                 ),
//               ),
//               _buildDots(),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildDots() {
//     return Row(
//       children: [
//         _buildDot(0),
//         _buildDot(0.2),
//         _buildDot(0.4),
//       ],
//     );
//   }

//   Widget _buildDot(double delay) {
//     return AnimatedBuilder(
//       animation: _progressController,
//       builder: (context, child) {
//         double progress = (_progressController.value + delay) % 1.0;
//         double opacity = progress < 0.3 ? 1.0 : 0.3;
//         return Opacity(
//           opacity: opacity,
//           child: const Text(
//             '.',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//               color: Color(0xFF2C3E50),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildProgressBar() {
//     return SizedBox(
//       width: 250,
//       height: 6,
//       child: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: const Color(0xFF0052FF).withOpacity(0.2),
//               borderRadius: BorderRadius.circular(3),
//             ),
//           ),
//           AnimatedBuilder(
//             animation: _progressController,
//             builder: (context, child) {
//               return Positioned(
//                 left: 250 * _progressController.value - 75,
//                 child: Container(
//                   width: 75,
//                   height: 6,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [Color(0xFF0052FF), Color(0xFFFFD700)],
//                     ),
//                     borderRadius: BorderRadius.circular(3),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Custom Painters
// class CircularProgressPainter extends CustomPainter {
//   final double progress;
//   final Color color;

//   CircularProgressPainter({required this.progress, required this.color});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..strokeWidth = 3
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = size.width / 2;

//     double startAngle = -math.pi / 2;
//     double sweepAngle;
    
//     if (progress < 0.5) {
//       sweepAngle = progress * 4 * math.pi;
//     } else {
//       sweepAngle = (1 - progress) * 4 * math.pi;
//     }

//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       startAngle,
//       sweepAngle,
//       false,
//       paint,
//     );
//   }

//   @override
//   bool shouldRepaint(CircularProgressPainter oldDelegate) => true;
// }

// class TrianglePainter extends CustomPainter {
//   final Color color;

//   TrianglePainter(this.color);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill;

//     final path = Path()
//       ..moveTo(size.width / 2, 0)
//       ..lineTo(0, size.height)
//       ..lineTo(size.width, size.height)
//       ..close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(TrianglePainter oldDelegate) => false;
// }

// class HexagonPainter extends CustomPainter {
//   final Color color;

//   HexagonPainter(this.color);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill;

//     final path = Path();
//     final centerX = size.width / 2;
//     final centerY = size.height / 2;
//     final radius = size.width / 2;

//     for (int i = 0; i < 6; i++) {
//       final angle = (math.pi / 3) * i;
//       final x = centerX + radius * math.cos(angle);
//       final y = centerY + radius * math.sin(angle);
//       if (i == 0) {
//         path.moveTo(x, y);
//       } else {
//         path.lineTo(x, y);
//       }
//     }
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(HexagonPainter oldDelegate) => false;
// }

// class StarPainter extends CustomPainter {
//   final Color color;

//   StarPainter(this.color);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill;

//     final path = Path();
//     final centerX = size.width / 2;
//     final centerY = size.height / 2;
//     final outerRadius = size.width / 2;
//     final innerRadius = outerRadius / 2.5;

//     for (int i = 0; i < 10; i++) {
//       final radius = i.isEven ? outerRadius : innerRadius;
//       final angle = (math.pi / 5) * i - math.pi / 2;
//       final x = centerX + radius * math.cos(angle);
//       final y = centerY + radius * math.sin(angle);
      
//       if (i == 0) {
//         path.moveTo(x, y);
//       } else {
//         path.lineTo(x, y);
//       }
//     }
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(StarPainter oldDelegate) => false;
// }


import 'package:flutter/material.dart';
import 'dart:math' as math;

class CodewayLoadingScreen extends StatefulWidget {
  const CodewayLoadingScreen({Key? key}) : super(key: key);

  @override
  State<CodewayLoadingScreen> createState() => _CodewayLoadingScreenState();
}

class _CodewayLoadingScreenState extends State<CodewayLoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _logoController;
  late AnimationController _progressController;
  late AnimationController _pulseController;
  late AnimationController _gradientController;
  late AnimationController _rotateController;

  @override
  void initState() {
    super.initState();
    
    _floatController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    _logoController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    _progressController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _gradientController = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    )..repeat();

    _rotateController = AnimationController(
      duration: const Duration(seconds: 25),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _floatController.dispose();
    _logoController.dispose();
    _progressController.dispose();
    _pulseController.dispose();
    _gradientController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _gradientController,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: const [
                  Color(0xFFFFFFFF),
                  Color(0xFFE8F4FF),
                  Color(0xFFF0E6FF),
                  Color(0xFFE6F7FF),
                  Color(0xFFF5F8FF),
                  Color(0xFFFFFFFF),
                ],
                stops: [
                  0.0 + _gradientController.value * 0.1,
                  0.2 + _gradientController.value * 0.1,
                  0.4 + _gradientController.value * 0.1,
                  0.6 + _gradientController.value * 0.1,
                  0.8 + _gradientController.value * 0.1,
                  1.0,
                ],
              ),
            ),
            child: Stack(
              children: [
                // Background decorations
                _buildBackgroundDecorations(),
                
                // Main content
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildLogoContainer(),
                      const SizedBox(height: 40),
                      _buildLoadingText(),
                      const SizedBox(height: 30),
                      _buildProgressBar(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBackgroundDecorations() {
    return Stack(
      children: [
        // Floating circles
        _buildFloatingCircle(0.1, 0.1, 150, Colors.amber.withOpacity(0.15), 25),
        _buildFloatingCircle(0.7, 0.8, 100, Colors.purple.withOpacity(0.15), 20),
        _buildFloatingCircle(0.6, 0.15, 200, Colors.cyan.withOpacity(0.15), 30),
        
        // Flowing lines
        _buildFlowingLine(0.2, 0),
        _buildFlowingLine(0.5, 5),
        _buildFlowingLine(0.8, 10),
        
        // Geometric shapes
        _buildRotatingSquare(0.15, 0.85, 0),
        _buildRotatingSquare(0.2, 0.2, 5),
        _buildRotatingTriangle(0.5, 0.9, 0),
        _buildRotatingTriangle(0.25, 0.75, 3),
        _buildRotatingHexagon(0.4, 0.75, 0),
        _buildRotatingHexagon(0.7, 0.3, 7),
        _buildTwinklingStar(0.1, 0.7, 0),
        _buildTwinklingStar(0.85, 0.15, 1.5),
        _buildTwinklingStar(0.7, 0.6, 2.5),
      ],
    );
  }

  Widget _buildFloatingCircle(double top, double left, double size, Color color, int duration) {
    return AnimatedBuilder(
      animation: _rotateController,
      builder: (context, child) {
        return Positioned(
          top: MediaQuery.of(context).size.height * top,
          left: MediaQuery.of(context).size.width * left,
          child: Transform.translate(
            offset: Offset(0, -20 * math.sin(_rotateController.value * 2 * math.pi)),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [color, Colors.transparent],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFlowingLine(double top, double delay) {
    return AnimatedBuilder(
      animation: _progressController,
      builder: (context, child) {
        return Positioned(
          top: MediaQuery.of(context).size.height * top,
          left: MediaQuery.of(context).size.width * (_progressController.value - 0.2),
          child: Container(
            width: 180,
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.blue.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 8,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRotatingSquare(double top, double left, double delay) {
    return AnimatedBuilder(
      animation: _rotateController,
      builder: (context, child) {
        return Positioned(
          top: MediaQuery.of(context).size.height * top,
          left: MediaQuery.of(context).size.width * left,
          child: Transform.rotate(
            angle: _rotateController.value * 2 * math.pi,
            child: Transform.translate(
              offset: Offset(0, -30 * math.sin(_rotateController.value * 2 * math.pi)),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue.withOpacity(0.15), width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRotatingTriangle(double top, double left, double delay) {
    return AnimatedBuilder(
      animation: _rotateController,
      builder: (context, child) {
        return Positioned(
          top: MediaQuery.of(context).size.height * top,
          left: MediaQuery.of(context).size.width * left,
          child: Transform.rotate(
            angle: -_rotateController.value * 2 * math.pi,
            child: Transform.translate(
              offset: Offset(0, -30 * math.sin(_rotateController.value * 2 * math.pi)),
              child: CustomPaint(
                size: const Size(80, 70),
                painter: TrianglePainter(Colors.amber.withOpacity(0.12)),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRotatingHexagon(double top, double left, double delay) {
    return AnimatedBuilder(
      animation: _rotateController,
      builder: (context, child) {
        return Positioned(
          top: MediaQuery.of(context).size.height * top,
          left: MediaQuery.of(context).size.width * left,
          child: Transform.rotate(
            angle: _rotateController.value * 2 * math.pi,
            child: Transform.translate(
              offset: Offset(0, -30 * math.sin(_rotateController.value * 2 * math.pi)),
              child: CustomPaint(
                size: const Size(50, 50),
                painter: HexagonPainter(Colors.purple.withOpacity(0.1)),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTwinklingStar(double top, double left, double delay) {
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, child) {
        double scale = 0.8 + 0.4 * _pulseController.value;
        double opacity = 0.3 + 0.5 * _pulseController.value;
        return Positioned(
          top: MediaQuery.of(context).size.height * top,
          left: MediaQuery.of(context).size.width * left,
          child: Transform.scale(
            scale: scale,
            child: Transform.rotate(
              angle: _pulseController.value * math.pi,
              child: Opacity(
                opacity: opacity,
                child: CustomPaint(
                  size: const Size(30, 30),
                  painter: StarPainter(Colors.amber.withOpacity(0.2)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLogoContainer() {
    return AnimatedBuilder(
      animation: Listenable.merge([_floatController, _logoController, _pulseController]),
      builder: (context, child) {
        double floatOffset = -10 * math.sin(_floatController.value * 2 * math.pi);
        double scale = 1.0 + 0.02 * math.sin(_floatController.value * 2 * math.pi);

        return Transform.translate(
          offset: Offset(0, floatOffset),
          child: Transform.scale(
            scale: scale,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Glow effect
                Container(
                  width: 240,
                  height: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(65),
                    gradient: RadialGradient(
                      colors: [
                        Colors.amber.withOpacity(0.1 + 0.4 * _pulseController.value),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                
                // Pulse effects
                _buildPulseEffect(230, _pulseController.value),
                _buildPulseEffect(230, (_pulseController.value + 0.5) % 1.0),
                
                // Progress rings
                _buildProgressRing(220, _logoController.value, Colors.amber, 0.0),
                _buildProgressRing(220, _logoController.value, Colors.amber.withOpacity(0.5), 0.2),
                _buildProgressRing(220, _logoController.value, Colors.amber.withOpacity(0.3), 0.4),
                
                // Main logo container
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0052FF),
                    borderRadius: BorderRadius.circular(45),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3 + 0.1 * math.sin(_floatController.value * 2 * math.pi)),
                        blurRadius: 60,
                        offset: const Offset(0, 20),
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _buildParticles(),
                      _buildLogoContent(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPulseEffect(double size, double progress) {
    double scale = 1.0 + 0.15 * progress;
    double opacity = 1.0 - progress;
    
    return Transform.scale(
      scale: scale,
      child: Opacity(
        opacity: opacity * 0.7,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            border: Border.all(color: Colors.amber.withOpacity(0.3), width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressRing(double size, double progress, Color color, double delay) {
    double adjustedProgress = (progress + delay) % 1.0;
    
    return CustomPaint(
      size: Size(size, size),
      painter: CircularProgressPainter(
        progress: adjustedProgress,
        color: color,
      ),
    );
  }

  Widget _buildParticles() {
    return Stack(
      children: [
        _buildParticle(0.2, 0.2, 0),
        _buildParticle(0.7, 0.8, 1),
        _buildParticle(0.4, 0.1, 2),
        _buildParticle(0.8, 0.3, 3),
        _buildParticle(0.1, 0.7, 4),
      ],
    );
  }

  Widget _buildParticle(double top, double left, int delay) {
    return AnimatedBuilder(
      animation: _logoController,
      builder: (context, child) {
        double progress = (_logoController.value * 6 + delay) % 6 / 6;
        double opacity = progress < 0.5 ? progress * 2 * 0.7 : (1 - progress) * 2 * 0.7;
        double offset = -20 * math.sin(progress * math.pi);
        
        return Positioned(
          top: 200 * top + offset,
          left: 200 * left,
          child: Opacity(
            opacity: opacity,
            child: Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: Color(0xFFFFD700),
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLogoContent() {
    return AnimatedBuilder(
      animation: _logoController,
      builder: (context, child) {
        // C letter animation (0-0.2: fade in, 0.2-0.8: visible, 0.8-1.0: fade out)
        double cOpacity = 0.0;
        double cTranslateX = -40.0;
        double cRotate = -math.pi / 2;
        
        if (_logoController.value < 0.2) {
          double t = _logoController.value / 0.2;
          cOpacity = t;
          cTranslateX = -40 * (1 - t);
          cRotate = -math.pi / 2 * (1 - t);
        } else if (_logoController.value < 0.8) {
          cOpacity = 1.0;
          cTranslateX = 0;
          cRotate = 0;
        } else {
          double t = (_logoController.value - 0.8) / 0.2;
          cOpacity = 1 - t;
          cTranslateX = -40 * t;
          cRotate = -math.pi / 2 * t;
        }

        // Lambda animation (0-0.25: fade in, 0.25-0.75: visible, 0.75-1.0: fade out)
        double lambdaOpacity = 0.0;
        double lambdaTranslateX = -40.0;
        double lambdaRotate = -math.pi / 2;
        
        if (_logoController.value < 0.25) {
          double t = _logoController.value / 0.25;
          lambdaOpacity = t;
          lambdaTranslateX = -40 * (1 - t);
          lambdaRotate = -math.pi / 2 * (1 - t);
        } else if (_logoController.value < 0.75) {
          lambdaOpacity = 1.0;
          lambdaTranslateX = 0;
          lambdaRotate = 0;
        } else {
          double t = (_logoController.value - 0.75) / 0.25;
          lambdaOpacity = 1 - t;
          lambdaTranslateX = -40 * t;
          lambdaRotate = -math.pi / 2 * t;
        }

        // Golden dot animation
        double dotOpacity = 0.0;
        double dotScale = 0.0;
        
        if (_logoController.value >= 0.2 && _logoController.value < 0.3) {
          dotOpacity = (_logoController.value - 0.2) / 0.1;
          dotScale = (_logoController.value - 0.2) / 0.1;
        } else if (_logoController.value >= 0.3 && _logoController.value < 0.7) {
          dotOpacity = 1.0;
          if (_logoController.value < 0.4 || (_logoController.value >= 0.5 && _logoController.value < 0.6)) {
            dotScale = 1.5;
          } else {
            dotScale = 1.0;
          }
        } else if (_logoController.value >= 0.7 && _logoController.value < 0.8) {
          dotOpacity = 1 - (_logoController.value - 0.7) / 0.1;
          dotScale = 1 - (_logoController.value - 0.7) / 0.1;
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.translate(
                  offset: Offset(cTranslateX, 0),
                  child: Transform.rotate(
                    angle: cRotate,
                    child: Opacity(
                      opacity: cOpacity,
                      child: Text(
                        'C',
                        style: TextStyle(
                          fontSize: 85,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: -8,
                          fontFamily: 'Arial Black',
                          shadows: [
                            Shadow(
                              color: Colors.white.withOpacity(0.5),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Transform.translate(
                  offset: Offset(lambdaTranslateX, 0),
                  child: Transform.rotate(
                    angle: math.pi + lambdaRotate,
                    child: Opacity(
                      opacity: lambdaOpacity,
                      child: const Text(
                        'V',
                        style: TextStyle(
                          fontSize: 85,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFB8C5D6),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Opacity(
              opacity: dotOpacity,
              child: Transform.scale(
                scale: dotScale,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFA500),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.8),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLoadingText() {
    return AnimatedBuilder(
      animation: _logoController,
      builder: (context, child) {
        double opacity = 0.6 + 0.4 * math.sin(_logoController.value * 2 * math.pi);
        return Opacity(
          opacity: opacity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'LOADING',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2C3E50),
                  letterSpacing: 3,
                ),
              ),
              _buildDots(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDots() {
    return Row(
      children: [
        _buildDot(0),
        _buildDot(0.2),
        _buildDot(0.4),
      ],
    );
  }

  Widget _buildDot(double delay) {
    return AnimatedBuilder(
      animation: _progressController,
      builder: (context, child) {
        double progress = (_progressController.value + delay) % 1.0;
        double opacity = progress < 0.3 ? 1.0 : 0.3;
        return Opacity(
          opacity: opacity,
          child: const Text(
            '.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C3E50),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProgressBar() {
    return SizedBox(
      width: 250,
      height: 6,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF0052FF).withOpacity(0.2),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          AnimatedBuilder(
            animation: _progressController,
            builder: (context, child) {
              return Positioned(
                left: 250 * _progressController.value - 75,
                child: Container(
                  width: 75,
                  height: 6,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF0052FF), Color(0xFFFFD700)],
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Custom Painters
class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color color;

  CircularProgressPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    double startAngle = -math.pi / 2;
    double sweepAngle;
    
    if (progress < 0.5) {
      sweepAngle = progress * 4 * math.pi;
    } else {
      sweepAngle = (1 - progress) * 4 * math.pi;
    }

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CircularProgressPainter oldDelegate) => true;
}

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) => false;
}

class HexagonPainter extends CustomPainter {
  final Color color;

  HexagonPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width / 2;

    for (int i = 0; i < 6; i++) {
      final angle = (math.pi / 3) * i;
      final x = centerX + radius * math.cos(angle);
      final y = centerY + radius * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(HexagonPainter oldDelegate) => false;
}

class StarPainter extends CustomPainter {
  final Color color;

  StarPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final outerRadius = size.width / 2;
    final innerRadius = outerRadius / 2.5;

    for (int i = 0; i < 10; i++) {
      final radius = i.isEven ? outerRadius : innerRadius;
      final angle = (math.pi / 5) * i - math.pi / 2;
      final x = centerX + radius * math.cos(angle);
      final y = centerY + radius * math.sin(angle);
      
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(StarPainter oldDelegate) => false;
}