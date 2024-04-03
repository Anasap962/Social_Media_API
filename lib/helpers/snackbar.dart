import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Color.fromARGB(255, 255, 41, 41),
      content: Row(
        children: [
          const Icon(Icons.person_pin, color: Color.fromARGB(255, 255, 255, 255)),
          Text(
            ' $message',
            style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ],
      ),
      duration: const Duration(seconds: 3), // Adjust the duration as needed
    ),
  );
}