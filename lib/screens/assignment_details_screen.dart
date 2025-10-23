import 'package:flutter/material.dart';
import 'dart:math';

class AssignmentDetailsScreen extends StatefulWidget {
  const AssignmentDetailsScreen({super.key});

  @override
  State<AssignmentDetailsScreen> createState() => _AssignmentDetailsScreenState();
}

class _AssignmentDetailsScreenState extends State<AssignmentDetailsScreen> {
  bool _isExpanded = true;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
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
              top: 0,
              child: Container(
                width: screenWidth,
                height: 658 * scale,
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
            Positioned(
              left: 22 * scale,
              top: 50 * scale,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SizedBox(
                  width: 200 * scale,
                  height: 24 * scale,
                  child: Text(
                    '← Service Assignment',
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
            ),
            Positioned(
              left: 22 * scale,
              top: 77 * scale,
              child: Container(
                width: 316 * scale,
                height: _isExpanded ? 346 * scale : 40 * scale,
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
            Positioned(
              left: (22 + 316 - 20) * scale,
              top: (77 + (_isExpanded ? 346 : 40) - 20) * scale,
              child: GestureDetector(
                onTap: _toggleExpanded,
                child: Container(
                  width: 20 * scale,
                  height: 20 * scale,
                  color: Colors.grey[300],
                  child: Center(child: Text('🔔')),
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
            if (_isExpanded) ...[
              Positioned(
                left: 42 * scale,
                top: 116 * scale,
                child: SizedBox(
                  width: 109 * scale,
                  height: 90 * scale,
                  child: Text(
                    'Date Issued: \nSite: \nSA Type: \nCampaign Name: \nMaterial Spec: \nLogistics: ',
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
                top: 227 * scale,
                child: SizedBox(
                  width: 75 * scale,
                  height: 22 * scale,
                  child: Text(
                    'Oct 15',
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 20 * scale,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 1.20,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 161 * scale,
                top: 227 * scale,
                child: SizedBox(
                  width: 75 * scale,
                  height: 22 * scale,
                  child: Text(
                    'Oct 18',
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 20 * scale,
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
                  height: 90 * scale,
                  child: Text(
                    'Oct 4, 2025\nPetplans Tower NB\nRoll Up\nTron Ares\nBuilding Wrap\nMay Tuyan (GTIS)',
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
                left: 42 * scale,
                top: 213 * scale,
                child: SizedBox(
                  width: 64 * scale,
                  height: 14 * scale,
                  child: Text(
                    'Start Date',
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
                left: 42 * scale,
                top: 263 * scale,
                child: SizedBox(
                  width: 89 * scale,
                  height: 14 * scale,
                  child: Text(
                    'Attachment:',
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 12 * scale,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 1.20,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 161 * scale,
                top: 213 * scale,
                child: SizedBox(
                  width: 64 * scale,
                  height: 14 * scale,
                  child: Text(
                    'End Date',
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
                left: 42 * scale,
                top: 282 * scale,
                child: Container(
                  width: 119 * scale,
                  height: 119 * scale,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFF8E8E93),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 42 * scale,
                top: 282 * scale,
                child: Container(
                  width: 201.23 * scale,
                  height: 119 * scale,
                  color: Colors.grey[300],
                  child: Center(child: Text('Attachment')),
                ),
              ),
            ],
            Positioned(
              left: 22 * scale,
              top: _isExpanded ? 437 * scale : (77 + 40 + 20) * scale,
              child: SizedBox(
                width: 231 * scale,
                height: 15 * scale,
                child: Text(
                  'Missions',
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
              left: 62 * scale,
              top: _isExpanded ? 464 * scale : (77 + 40 + 47) * scale,
              child: SizedBox(
                width: 106 * scale,
                height: 69 * scale,
                child: Text(
                  'Content Receive\nSite Arrival\nStart of Roll-Up\nFinish of Roll-Up',
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 12 * scale,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1.32,
                  ),
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
                'B',
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
                'W',
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
              top: screenHeight - 60 * scale,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 156 * scale,
                  height: 34 * scale,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFFC4C4C4),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Reject',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 16 * scale,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 185 * scale,
              top: screenHeight - 60 * scale,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/congratulations'),
                child: Container(
                  width: 156 * scale,
                  height: 34 * scale,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1D0BEB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Accept',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16 * scale,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
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