import 'package:flutter/material.dart';
import '../../core/styles/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned.fill(
            top: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _imageColumn(
                    [
                      "https://i.ibb.co/hcwLryT/bali-indonesia.jpg",
                      "https://i.ibb.co/vZt1WZS/tokyo-city.jpg",
                      "https://i.ibb.co/mhKDThR/sydney-city.jpg",
                    ],
                    [130, 140, 175],
                  ),
                  _imageColumn(
                    [
                      "https://i.ibb.co/hcwLryT/bali-indonesia.jpg",
                      "https://i.ibb.co/phPV00W/new-york-city.jpg",
                      "https://i.ibb.co/mhKDThR/sydney-city.jpg",
                    ],
                    [175, 130, 140],
                  ),
                  _imageColumn(
                    [
                      "https://i.ibb.co/hcwLryT/bali-indonesia.jpg",
                      "https://i.ibb.co/phPV00W/new-york-city.jpg",
                      "https://i.ibb.co/vZt1WZS/tokyo-city.jpg",
                    ],
                    [175, 140, 175],
                  ),
                ],
              ),
            ),
          ),
     
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 260,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0xFFFCFCFC),
                    Color(0xFFFCFCFC),
                  ],
                  stops: [0.0, 0.6, 1.0],
                ),
              ),
            ),
          ),

          
          Positioned(
            left: 0,
            right: 0,
            bottom: 34,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    "New Place, New Home!",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blueDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Are you ready to uproot and start over in a new area? Placoo will help you on your journey!",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: AppColors.navGray,
                    ),
                  ),
                  const SizedBox(height: 30),

                
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors:  [AppColors.gradientStart, AppColors.gradientEnd],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.blueDark,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 8,
            child: Center(
              child: Container(
                width: 148,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageColumn(List<String> urls, List<double> heights) {
    return Column(
      children: List.generate(urls.length, (i) {
        return Container(
          margin: const EdgeInsets.only(bottom: 9),
          height: heights[i],
          width: 109,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              urls[i],
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.error, color: Colors.red),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
