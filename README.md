# Pixelforce Explore

This Flutter project implements the Explore screen from the PixelForce Figma design and includes an onboarding flow and login that navigate into the Explore screen.

## What is inside

* Onboarding page that redirects to login page
* Login screen with basic username and password
* Explore screen that fetches JSON from provided endpoints and displays cards for:

  * Trips
  * Living Styles
  * Experiences
* Models, API client, and modular widgets

## How to run

1. Ensure Flutter SDK is installed.
2. Extract or clone the project.
3. From project root run:

```bash
flutter pub get
flutter run
```

## Summary

* Built onboarding, login, and Explore screens with API-driven cards using `FutureBuilder`.
* Handled layout challenges and overflows with `SingleChildScrollView`, fixed heights for horizontal lists, and proper padding.
* Implemented navigation flows, gradients, shadows, and consistent typography to closely match the Figma design.
* Used modular architecture: models for JSON, API client for networking, and widgets for reusable UI components.

## Project Structure

```
lib/
├── core/
│   ├── api/
│   │   └── api_client.dart
│   ├── models/
│   │   ├── trip.dart
│   │   ├── living_style.dart
│   │   ├── experience.dart
│   │   └── user.dart
│   └── styles/
│       ├── app_colors.dart
│       └── app_text.dart
        └── app_theme.dart
├── features/
│   ├── onboarding/
│   │   └── onboarding_page.dart
│   ├── auth/
│   │   └── login_page.dart
│   └── explore/
│       ├── explore_page.dart
│       └── widgets/
│           ├── trip_card.dart
│           ├── living_style_card.dart
│           └── experience_card.dart
└── main.dart
```

## Notes

* All UI components are modular and reusable.
* API responses are mapped to models, avoiding inline JSON handling.
* The design closely follows the Figma layout for a consistent look and feel.


