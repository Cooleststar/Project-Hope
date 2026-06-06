# Project Hope 🕊️

Project Hope is a Flutter-based mental health companion app that integrates Google's Gemini AI to provide a friendly, non-judgmental chat experience. It features a modern UI designed to provide a calming environment for users seeking support.

## ✨ Features

- **AI Chat Companion (Carl)**: A personalized chat interface powered by Gemini AI, acting as a friendly therapist named Carl.
- **Modern UI/UX**: A clean, responsive design using a calming color palette of pink, purple, and dark blue.
- **Dashboard Navigation**: Easy access to Chat, Appointments (placeholder), and Support (placeholder) features.
- **Responsive Layout**: Designed to work seamlessly across different mobile screen sizes.

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing.

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (v3.3.3 or higher)
- [Dart SDK](https://dart.dev/get-dart)
- An Android/iOS Emulator or a physical device for testing.
- A **Gemini API Key** from the [Google AI Studio](https://aistudio.google.com/).

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/projecthope.git
    cd projecthope
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Set up your API Key:**
    - Open `lib/main.dart`.
    - Replace `'APIKEY'` with your actual Gemini API Key:
      ```dart
      const APIKEY = 'YOUR_ACTUAL_API_KEY_HERE';
      ```

4.  **Run the application:**
    ```bash
    flutter run
    ```

## 🛠️ Built With

- [Flutter](https://flutter.dev/) - The framework used.
- [Google Gemini API](https://ai.google.dev/) - For the AI chat functionality.
- [HTTP](https://pub.dev/packages/http) - For network requests.

## 📂 Project Structure

- `lib/main.dart`: Entry point and app theme configuration.
- `lib/constants.dart`: Global color palette and text styles.
- `lib/pages/`:
    - `landing_page.dart`: The welcoming entry screen.
    - `dashboard_page.dart`: The main navigation hub.
    - `chat_screen.dart`: The interactive AI chat interface.
    - `appointments_page.dart`: Placeholder for appointment management.
    - `contact_us_page.dart`: Placeholder for support information.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
