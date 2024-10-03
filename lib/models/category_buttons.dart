import 'package:flutter/material.dart';
import 'package:cars_ui/constants/style.dart';

class CategoryButtons extends StatelessWidget {
  const CategoryButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCategoryButton('أمريكي'),
        const SizedBox(width: 8),
        _buildCategoryButton('أوروبي'),
        const SizedBox(width: 8),
        _buildCategoryButton('آسيوي'),
      ],
    );
  }

  Widget _buildCategoryButton(String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kTop, // Dark blue background
        foregroundColor: Colors.white,     // White text
        padding: const EdgeInsets.symmetric(horizontal:35, vertical: 0), // Adjust padding for size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Rounded corners
        ),
      ),
      onPressed: () {
        // Define the button action here
      },
      child: Text(label),
    );
  }
}
