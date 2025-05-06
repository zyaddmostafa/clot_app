# ClotApp

<p align="center">
  <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Flutter-3.x-blue.svg" alt="Flutter Version"></a>
  <a href="https://dart.dev"><img src="https://img.shields.io/badge/Dart-3.x-blue.svg" alt="Dart Version"></a>
  <a href="https://github.com/yourusername/clot_app/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License"></a>
</p>

## 📱 About ClotApp

ClotApp is a premium e-commerce platform built with Flutter, delivering an exceptional shopping experience for fashion enthusiasts. With its intuitive interface and performance-optimized architecture, ClotApp stands out as a modern solution for online clothing retail.

## ✨ Key Features

- **Modular Architecture**: Feature-first organization with clean separation of concerns
- **Responsive UI**: Elegant design that adapts perfectly to any screen size
- **Robust State Management**: Intuitive Cubit implementation for predictable state flows
- **Product Catalog**: Rich browsing experience with filtering and categorization
- **Shopping Cart**: Seamless product selection and checkout process
- **User Profiles**: Personalized experience with order history and preferences
- **Theme Customization**: Support for both light and dark modes
- **Network Resilience**: Graceful handling of connectivity issues with local caching

## 📸 Screenshots

<p align="center">
  <img src="screenshots/home_screen.png" width="200" alt="Home Screen"/>
  <img src="screenshots/product_details.png" width="200" alt="Product Details"/>
  <img src="screenshots/favorites.png" width="200" alt="Favorites"/>
  <img src="screenshots/user_profile.png" width="200" alt="User Profile"/>
</p>

## 🛠️ Technology Stack

- **Frontend**: Flutter 3.x with Dart 3.x
- **State Management**: BLoC/Cubit pattern for predictable state flows
- **Architecture**: Clean Architecture with SOLID principles
- **Networking**: Dio for HTTP requests with interceptors for caching
- **Local Storage**: Hive NoSQL database for offline persistence
- **Authentication**: Secure JWT implementation with biometric options
- **Analytics**: Custom event tracking for user engagement metrics
- **Performance**: Optimized rendering with minimal widget rebuilds

## 📚 Project Architecture

```
lib/
├── core/
│   ├── di/                # Dependency injection
│   ├── networking/        # API and network services
│   ├── routing/           # Navigation and routing
│   ├── helper/            # Helper functions and utilities
│   ├── theme/             # App theming and styling
│   ├── service/           # Core services
│   └── widgets/           # Common reusable widgets
├── features/
│   ├── home/              # Home feature
│   │   ├── data/
│   │   │   ├── models/    # Home feature data models
│   │   │   └── repo/      # Home feature repositories
│   │   └── presentation/
│   │       ├── screens/   # Home screens
│   │       ├── widgets/   # Home-specific widgets
│   │       └── cubit/     # Home state management
│   ├── product/           # Product feature
│   │   ├── data/
│   │   │   ├── models/    # Product feature data models
│   │   │   └── repo/      # Product feature repositories
│   │   └── presentation/
│   │       ├── screens/   # Product screens
│   │       ├── widgets/   # Product-specific widgets
│   │       └── cubit/     # Product state management
│   ├── cart/              # Cart feature
│   │   ├── data/
│   │   │   ├── models/    # Cart feature data models
│   │   │   └── repo/      # Cart feature repositories
│   │   └── presentation/
│   │       ├── screens/   # Cart screens
│   │       ├── widgets/   # Cart-specific widgets
│   │       └── cubit/     # Cart state management
│   └── profile/           # Profile feature
│       ├── data/
│       │   ├── models/    # Profile feature data models
│       │   └── repo/      # Profile feature repositories
│       └── presentation/
│           ├── screens/   # Profile screens
│           ├── widgets/   # Profile-specific widgets
│           └── cubit/     # Profile state management
└── main.dart              # Entry point
```
