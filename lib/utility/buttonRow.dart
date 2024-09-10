import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  // List of button labels
  final List<String> buttonLabels = [
    'Dapps',
    'NFTs',
    'Blockchain',
    'Memes',
    'Crypto',
    'DeFi',
    'Web3'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        height: 50, // Set a fixed height for the buttons
        child: ListView.builder(
          scrollDirection:
              Axis.horizontal, // Makes the ListView scrollable horizontally
          itemCount: buttonLabels.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 6.0), // Adds some spacing between buttons
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                  print('${buttonLabels[index]} button pressed');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  backgroundColor: Color(0xFF3e8da8), // Background color
                ),
                child: Text(
                  buttonLabels[index],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
