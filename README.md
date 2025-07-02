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


> ⚠️ **Note:**  
- Sensitive Firebase configuration keys (`apiKey`, `appId`, `messagingSenderId`, `projectId`) are defined manually inside `lib/core/services/services.dart`.
- This file is excluded from version control to prevent exposing credentials.

---

## 🗺️ Google Maps API Key

- The Google Maps API Key is **not hardcoded** in the manifest.
- It is stored securely in `local.properties` and injected using `manifestPlaceholders` in `build.gradle`.

> ✅ This prevents the key from being exposed in public repositories.

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
