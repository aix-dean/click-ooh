import 'package:flutter/material.dart';
import 'dart:math';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final scale = min(screenWidth / 360, screenHeight / 640);

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight,
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
            Positioned(
              left: 0,
              top: screenHeight - 82 * scale,
              child: Container(
                width: screenWidth,
                height: 82 * scale,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 12.30,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 6 * scale,
              top: 11 * scale,
              child: Container(
                width: 53.71 * scale,
                height: 18 * scale,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: SizedBox(
                        width: 54 * scale,
                        child: Text(
                          '9:41',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF1F2024),
                            fontSize: 15 * scale,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 318.50 * scale,
              top: 9 * scale,
              child: Text(
                '􀛨',
                style: TextStyle(
                  color: const Color(0xFF1F2024),
                  fontSize: 17 * scale,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              left: 278 * scale,
              top: 20.30 * scale,
              child: Container(
                width: 3 * scale,
                height: 4 * scale,
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.20),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 282.80 * scale,
              top: 18.30 * scale,
              child: Container(
                width: 3 * scale,
                height: 6 * scale,
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.20),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 287.40 * scale,
              top: 16 * scale,
              child: Container(
                width: 3 * scale,
                height: 8.30 * scale,
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.20),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 292.10 * scale,
              top: 13.60 * scale,
              child: Container(
                width: 3 * scale,
                height: 10.70 * scale,
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.20),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 298.50 * scale,
              top: 11 * scale,
              child: Text(
                '􀙇',
                style: TextStyle(
                  color: const Color(0xFF1F2024),
                  fontSize: 14 * scale,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              left: 22 * scale,
              top: 50 * scale,
              child: SizedBox(
                width: 200 * scale,
                height: 24 * scale,
                child: Text(
                  'You got Assignments!',
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 16 * scale,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 22 * scale,
              top: 77 * scale,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/assignment_details'),
                child: Container(
                  width: 316 * scale,
                  height: 82 * scale,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFE6F5FF),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2,
                        color: const Color(0xFF00D0FF),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 42 * scale,
              top: 116 * scale,
              child: SizedBox(
                width: 109 * scale,
                height: 31 * scale,
                child: Text(
                  'SA Type:  \nLogistics: ',
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 12 * scale,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 1.20,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 42 * scale,
              top: 88 * scale,
              child: SizedBox(
                width: 109 * scale,
                height: 15 * scale,
                child: Text(
                  'SA#00524',
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 16 * scale,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 1.20,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 161 * scale,
              top: 116 * scale,
              child: SizedBox(
                width: 116 * scale,
                height: 31 * scale,
                child: Text(
                  'Roll Up\nMay Tuyan (GTIS)',
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 12 * scale,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1.20,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 116 * scale,
              top: (screenHeight - 82 * scale) + 24 * scale,
              child: Opacity(
                opacity: 0.30,
                child: Icon(
                  Icons.calendar_today,
                  size: 39 * scale,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              left: 284 * scale,
              top: (screenHeight - 82 * scale) + 24 * scale,
              child: Opacity(
                opacity: 0.30,
                child: Icon(
                  Icons.build,
                  size: 39 * scale,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              left: 200 * scale,
              top: (screenHeight - 82 * scale) + 24 * scale,
              child: Opacity(
                opacity: 0.30,
                child: Icon(
                  Icons.edit,
                  size: 39 * scale,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              left: 32 * scale,
              top: (screenHeight - 82 * scale) + 24 * scale,
              child: Icon(
                Icons.home,
                size: 39 * scale,
                color: Colors.black,
              ),
            ),
            Positioned(
              left: 317 * scale,
              top: 44 * scale,
              child: Opacity(
                opacity: 0.30,
                child: Container(
                  width: 20 * scale,
                  height: 20 * scale,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/20x20"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}