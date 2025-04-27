# ClotApp

<p align="center">
  <img src="assets/images/app_logo.png" alt="ClotApp Logo" width="200"/>
</p>

<p align="center">
  <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Flutter-3.x-blue.svg" alt="Flutter Version"></a>
  <a href="https://dart.dev"><img src="https://img.shields.io/badge/Dart-3.x-blue.svg" alt="Dart Version"></a>
  <a href="https://github.com/yourusername/clot_app/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License"></a>
</p>

## 📱 About ClotApp

ClotApp is a modern e-commerce application for clothing and fashion items built with Flutter. The app provides a seamless shopping experience with clean UI, intuitive navigation, and robust features designed for fashion enthusiasts.

## ✨ Features

- **Elegant UI/UX Design**: Clean and modern interface optimized for shopping experience
- **Product Categories**: Browse products by categories
- **Product Details**: Comprehensive product information with images, sizes, and pricing
- **Favorites System**: Save your favorite items for later
- **User Profiles**: Personalized user experience
- **Responsive Design**: Works smoothly on various device sizes

## 📸 Screenshots

<p align="center">
  <img src="screenshots/home_screen.png" width="200" alt="Home Screen"/>
  <img src="screenshots/product_details.png" width="200" alt="Product Details"/>
  <img src="screenshots/favorites.png" width="200" alt="Favorites"/>
  <img src="screenshots/user_profile.png" width="200" alt="User Profile"/>
</p>

## 🛠️ Technologies Used

- **Flutter**: UI framework for building natively compiled applications
- **Bloc/Cubit**: State management solution
- **Dependency Injection**: Using get_it for service locator pattern
- **Repository Pattern**: Clean separation of data sources and business logic
- **RESTful API Integration**: For fetching product data

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code
- Android Emulator / iOS Simulator / Physical Device

### Installation

1. Clone the repository

   ```bash
   git clone https://github.com/yourusername/clot_app.git
   ```

2. Navigate to the project directory

   ```bash
   cd clot_app
   ```

3. Install dependencies

   ```bash
   flutter pub get
   ```

4. Run the app
   ```bash
   flutter run
   ```

## 📚 Project Structure

```
lib/
├── core/
│   ├── di/                # Dependency injection setup
│   ├── theme/             # App theming
│   └── utils/             # Helper functions & constants
├── features/
│   ├── home/              # Home feature with products display
│   ├── favorites/         # User's favorite items
│   └── profile/           # User profile management
└── main.dart              # Entry point
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. Commit your changes
   ```bash
   git commit -m 'Add some amazing feature'
   ```
4. Push to the branch
   ```bash
   git push origin feature/amazing-feature
   ```
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📧 Contact

Your Name - [@your_twitter](https://twitter.com/your_twitter) - email@example.com

Project Link: [https://github.com/yourusername/clot_app](https://github.com/yourusername/clot_app)

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/yourusername">Your Name</a>
</p>
