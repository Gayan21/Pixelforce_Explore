# Pixelforce Explore - 

This Flutter project implements the Explore screen from the PixelForce Figma design and includes a onboarding,login that navigates into the Explore screen. 

## What is inside
- starting with onboarding page reirects to login page
- Login screen with basic usernaeme and password 
- Explore screen that fetches JSON from provided endpoints and displays cards for Trips, Living Styles and Experiences
- Models, API client, and modular widgets



## How to run
1. Ensure Flutter SDK is installed.
2. Extract the project.
3. From project root:
```bash
flutter pub get
flutter run
```
## Summary

- Built onboarding, login, and Explore screens with API-driven cards for Trips, Living Styles, and Experiences, using FutureBuilder for async data handling.
- Handled layout challenges and overflows with SingleChildScrollView, fixed heights for horizontal lists, and proper padding.
- Implemented navigation flows, gradients, shadows, and consistent typography to closely match the Figma design.



## project Structure


lib/
 ├─ core/
 │   ├─ api/
 │   │   └─ api_client.dart
 │   ├─ models/
 │   │   ├─ trip.dart
 │   │   ├─ living_style.dart
 │   │   ├─ experience.dart
 │   │   └─ user.dart
 │   └─ styles/
 │       ├─ app_colors.dart
 │       └─ app_text.dart
 ├─ features/
 │   ├─ onboarding/
 │   │   └─ onboarding_page.dart
 │   ├─ auth/
 │   │   └─ login_page.dart
 │   └─ explore/
 │       ├─ explore_page.dart
 │       └─ widgets/
 │           ├─ trip_card.dart
 │           ├─ living_style_card.dart
 │           └─ experience_card.dart
 └─ main.dart



