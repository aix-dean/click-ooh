import 'package:flutter/material.dart';
import 'dart:math';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

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
              top: 581 * scale,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/dashboard'),
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
                  ),
                  child: Center(
                    child: Text(
                      'Home',
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
              top: 581 * scale,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 156 * scale,
                  height: 34 * scale,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1D0BEB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Start',
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
            Positioned(
              left: 49 * scale,
              top: 75 * scale,
              child: Container(
                width: 262 * scale,
                height: 262 * scale,
                decoration: BoxDecoration(color: const Color(0xFFD9D9D9)),
              ),
            ),
            Positioned(
              left: 38 * scale,
              top: 12 * scale,
              child: Container(
                width: 295 * scale,
                height: 417 * scale,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/295x417"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 55 * scale,
              top: 365 * scale,
              child: SizedBox(
                width: 250 * scale,
                height: 24 * scale,
                child: Text(
                  'Congratulations!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 30 * scale,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 49 * scale,
              top: 404 * scale,
              child: SizedBox(
                width: 262 * scale,
                height: 69 * scale,
                child: Text(
                  'You have successfully accepted an assignment!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 16 * scale,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1,
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