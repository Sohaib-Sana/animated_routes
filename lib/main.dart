import 'package:animated_routes/core/color_pallet/app_colors.dart';
import 'package:animated_routes/pages/details_page.dart';
import 'package:animated_routes/pages/profile_page.dart';
import 'package:animated_routes/pages/settings_page.dart';
import 'package:animated_routes/slide_transition_on_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildElevatedButton(
                context,
                "Slide",
                " to Details Page",
                () => context.slideToPage(const DetailsPage()),
              ),
              _buildElevatedButton(
                context,
                "Scale",
                " up Profile Page",
                () => context.scaleToPage(const ProfilePage()),
              ),
              _buildElevatedButton(
                context,
                "Fade",

                " in Settings Page",
                () => context.fadeToPage(const SettingsPage()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for creating buttons with consistent styling
  Widget _buildElevatedButton(
    BuildContext context,
    String primaryWord,
    String text,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              AppColors.primaryColor, // Set button color to primary color
          foregroundColor: AppColors.buttonTextColor, // Text color on button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          textStyle: TextStyle(fontWeight: FontWeight.w600), // Make text bold
        ),
        onPressed: onPressed,
        child: RichText(
          text: TextSpan(
            text: primaryWord,
            style: TextStyle(color: AppColors.primaryWordColor),
            children: [
              TextSpan(
                text: text,
                style: TextStyle(color: AppColors.buttonTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
