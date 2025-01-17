import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(
        0.95,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login Your Account",
                style: GoogleFonts.getFont(
                  "Lato",
                  color: Color(0xff0d120E),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                  fontSize: 23,
                ),
              ),
              Text(
                "Explore the world Exclusives",
                style: GoogleFonts.getFont(
                  "Lato",
                  color: Color(
                    0xff0d120E,
                  ),
                  fontSize: 14,
                  letterSpacing: 0.2,
                ),
              ),
              Image.asset(
                "assets/images/Illustration.png",
                width: 200,
                height: 200,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Email",
                  style: GoogleFonts.getFont(
                    "Lato",
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  labelText: "enter your email",
                  labelStyle: GoogleFonts.getFont(
                    "Nunito Sans",
                    fontSize: 14,
                    letterSpacing: 0.1,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/icons/email.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  labelText: "enter your email",
                  labelStyle: GoogleFonts.getFont(
                    "Nunito Sans",
                    fontSize: 14,
                    letterSpacing: 0.1,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/icons/password.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 319,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    colors: [
                      Color(
                        0xFF102DE1,
                      ),
                      Color(
                        0xcc0d6EfF,
                      ),
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    "Sign in ",
                    style: GoogleFonts.getFont("Lato",
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
