import 'package:flutter/material.dart';

// Define the Tropical Indigo color
const darkGray = Color(0xFF1E1E1E);
const redColor = Color(0xFFFA607D);
const lightGray = Color(0xFFA9A9A9);
const tropicalIndigo = Color(0xFF9479F3);

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isElevated; // Use this to determine button style

  CustomButton({
    required this.text,
    required this.onPressed,
    this.isElevated = true,
  });

  @override
  Widget build(BuildContext context) {
    return isElevated
        ? ElevatedButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white, // Text color set to white
                fontSize: 20, // Font size set to 20
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 60),
              backgroundColor:
                  tropicalIndigo, // Background color set to Tropical Indigo
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Border radius
              ),
            ),
          )
        : OutlinedButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                color:
                    tropicalIndigo, // Text color set to Tropical Indigo for outlined button
                fontSize: 20, // Font size set to 20
              ),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor:
                  tropicalIndigo, // Text color set to Tropical Indigo
              minimumSize: Size(double.infinity, 60),
              side: BorderSide(
                  color: tropicalIndigo, width: 2), // Border color and width
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Border radius
              ),
            ),
          );
  }
}

class CustomButtonRed extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isElevated; // Use this to determine button style

  CustomButtonRed({
    required this.text,
    required this.onPressed,
    this.isElevated = true,
  });

  @override
  Widget build(BuildContext context) {
    return isElevated
        ? ElevatedButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white, // Text color set to white
                fontSize: 20, // Font size set to 20
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 60),
              backgroundColor:
                  redColor, // Background color set to Tropical Indigo
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Border radius
              ),
            ),
          )
        : OutlinedButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                color:
                    tropicalIndigo, // Text color set to Tropical Indigo for outlined button
                fontSize: 20, // Font size set to 20
              ),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor:
                  tropicalIndigo, // Text color set to Tropical Indigo
              minimumSize: Size(double.infinity, 60),
              side: BorderSide(
                  color: tropicalIndigo, width: 2), // Border color and width
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Border radius
              ),
            ),
          );
  }
}
