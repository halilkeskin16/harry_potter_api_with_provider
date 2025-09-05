# 🪄 Harry Potter Characters App

This Flutter application fetches **characters from the Harry Potter universe** via a REST API and presents them to the user with a stylish interface. The application is responsive for mobile and desktop devices and features a simple yet powerful architecture managed with Provider.

---

## ✨ Features

- ✅ Dynamically fetches character data from an API
- ✅ Responsive layout with `ListView` on mobile and `GridView` on desktop
- ✅ Notifies the user of errors via a SnackBar without crashing the app
- ✅ State management with `Provider`
- ✅ Displays a loading animation during API requests
- ✅ Pull-to-refresh support
- ✅ Modular components like `CharacterCard` and `CharacterGridCard`

## 🚀 Setup

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.x or higher)
- An IDE (VS Code, Android Studio, etc.)

### To run the project
```bash
flutter pub get
flutter run
For iOS:

Bash

cd ios
pod install
cd ..

📁 Project Structure
lib/
├── core/
│   └── constant/
│       ├── api_constant.dart           # API URL constants
│       └── image_constant.dart         # Default image URL constants
│
├── data/
│   ├── models/
│   │   ├── character.dart              # Character model
│   │   └── wand.dart                   # Wand model
│   │
│   ├── providers/
│   │   └── character_provider.dart     # Provider (state management)
│   │
│   └── services/
│       └── api_service.dart            # API service operations
│
├── ui/
│   ├── screens/
│   │   └── character_list_screen.dart  # Main character list screen
│   │
│   └── widgets/
│       ├── character_grid_card.dart    # Character card for Desktop
│       ├── character_images.dart       # Image loader widget
│       └── character_list_card.dart    # Character card for Mobile
│
└── main.dart                           # Application entry point

🌐 API Source
Data is fetched from: 🔗 hp-api.onrender.com/api/characters

📄 License
MIT © 2025 – [Halil İbrahim KESKİN]
