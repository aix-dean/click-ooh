import 'package:flutter/material.dart';
import 'dart:math';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
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
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              left: 57 * scale,
              top: 113 * scale,
              child: Container(
                width: 247 * scale,
                height: 209 * scale,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/247x209"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 56 * scale,
              top: 387 * scale,
              child: Container(
                width: 248 * scale,
                height: 33 * scale,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.50,
                      color: const Color(0xFFC4C4C4),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 9 * scale, top: 8 * scale),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 65 * scale,
              top: 395 * scale,
              child: SizedBox(
                width: 93 * scale,
                height: 17 * scale,
                child: Text(
                  'Username',
                  style: TextStyle(
                    color: const Color(0xFFA0A0A0),
                    fontSize: 16 * scale,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    height: 1,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 56 * scale,
              top: 427 * scale,
              child: Container(
                width: 248 * scale,
                height: 33 * scale,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.50,
                      color: const Color(0xFFC4C4C4),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 9 * scale, top: 8 * scale),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 65 * scale,
              top: 435 * scale,
              child: SizedBox(
                width: 93 * scale,
                height: 17 * scale,
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: const Color(0xFFA0A0A0),
                    fontSize: 16 * scale,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    height: 1,
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
              left: 57 * scale,
              top: 494 * scale,
              child: GestureDetector(
                onTap: () {
                  // Add login logic here
                  Navigator.pushNamed(context, '/dashboard');
                },
                child: Container(
                  width: 247 * scale,
                  height: 34 * scale,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1D0BEB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
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