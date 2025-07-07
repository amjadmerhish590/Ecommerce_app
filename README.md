# 🛍️ Client App – Flutter E-Commerce Application

This is the Client App for a multi-module e-commerce system developed using Flutter.  
It provides end-users with a seamless shopping experience, including authentication, product browsing, order management, and real-time notifications.

---

## ✨ Features

- 🔐 **User Authentication**
    - Sign up, Login, Forgot Password, and OTP Verification.

- 🛒 **Shopping Cart & Checkout**
    - Add items to the cart.
    - Choose delivery method (pickup or delivery).
    - Multiple payment options:
        - 💵 Cash payment
        - 💳 Electronic payment

- ❤️ **Favorites**
    - Save products to a personalized favorites list.

- 🔔 **Notifications**
    - Get real-time updates about orders and status changes.

- 🗺️ **Google Maps Integration**
    - Users can add delivery addresses using map-based location picking.

- 📦 **Order Management**
    - Track current orders, view archived orders, and see order details.

- ⚙️ **Settings Page**
    - Manage addresses, access About Us / Call Us pages, and logout.

- 🔍 **Search**
    - Smart search functionality to find products efficiently.

## 🧱 Architecture

This project follows the **MVC (Model-View-Controller)** architectural pattern:

- **Model** → Defined inside the `lib/data/` directory. Responsible for data handling and structures.
- **View** → Built inside the `lib/view/` directory. Includes all UI screens and components.
- **Controller** → Managed in the `lib/controller/` directory. Handles the business logic and app state using GetX.

This clean separation of concerns makes the app more maintainable, scalable, and testable.

---

## 🛠️ Technologies Used

- Flutter
- Firebase
- Google Maps API
- GetX (for state management and dependency injection)

---

## 📦 Firebase Integration

The app uses **Firebase** for:
- 🔥 Cloud Messaging (Push Notifications)

Firebase is initialized securely inside:
lib/core/services/services.dart

> ⚠️ **Note:**  
- Sensitive Firebase configuration keys (`apiKey`, `appId`, `messagingSenderId`, `projectId`) are defined manually inside `lib/core/services/services.dart`.
- This file is excluded from version control to prevent exposing credentials.

---

## 🗺️ Google Maps API Key

- The Google Maps API Key is **not hardcoded** in the manifest.
- It is stored securely in `local.properties` and injected using `manifestPlaceholders` in `build.gradle`.

> ✅ This prevents the key from being exposed in public repositories.

---
## 🛠️ API Configuration

- `linkapi.dart`:  
  This file contains all the API endpoints linking the app to the project's MySQL backend database.  
  It manages the server address and various backend service access points.

> **Note:**  
> Update API URLs in this file whenever the server configuration or environment changes.

---


## 📁 Project Structure

Ecommerce_app/
├── lib/
│ ├── bindings/
│ ├── controller/
│ ├── core/
│ │ ├── services/
│ │ │ └── services.dart
│ │ ├── class/
│ │ ├── constant/
│ │ ├── functions/
│ │ ├── localization/
│ │ ├── middleware/
│ │ └── shared/
│ ├── data/
│ ├── view/
│ ├── linkapi.dart
│ ├── main.dart
│ └── routes.dart
├── android/
│ └── app/
│ └── google-services.json (excluded)
├── ios/
├── pubspec.yaml
└── README.md
---


## 🚫 Sensitive Files (Excluded via .gitignore)


lib/core/services/services.dart
android/app/google-services.json


---

## 📌 Notes

- This is one of **three apps** in the full system (client, admin, delivery).
- Make sure to set your `google-services.json` and `API keys` locally before running.

---

## 🚀 Getting Started

```bash
flutter pub get
flutter run
