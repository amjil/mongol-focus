# Minii Focus (Mongol Focus)

**Minii Focus** is a modern, cross-platform productivity, task management, and traditional lunar calendar application built specifically for **Traditional Vertical Mongolian Script (ᠮᠤᠩᠭᠤᠯ ᠪᠢᠴᠢᠭ)**. Inspired by clean, Things-style task workflows and traditional Mongolian cultural almanacs, it is built with **ClojureDart**, **Flutter**, and **Drift (SQLite)**.

---

## ✨ Key Features

### 1. Vertical Traditional Mongolian Task Management
* **Native Vertical Typography**: Designed from the ground up for left-to-right vertical Mongolian script (`OyunQaganTig` font) using the `mongol` Flutter package.
* **Built-in Mongolian Virtual Keyboard**: Seamless vertical text input with candidate word prediction, automatic punctuation mapping, and floating action toolbars.
* **Hierarchical Organization**:
  * **Categories & Lists**: Custom categories with icon pickers and drag-and-drop ordering.
  * **Subtasks & Checklists**: Break complex tasks down into manageable subtasks with real-time completion progress indicators.
  * **Recurrence & Reminders**: Configure daily, weekly, or monthly repeating tasks and exact local push notifications.
  * **Logbook**: Automatically archives completed tasks for historical review and statistics.

### 2. Mongolian Lunar Calendar & Almanac (`ᠮᠤᠩᠭᠤᠯ ᠬᠤᠸᠠᠩᠯᠢ`)
* **Elder-Friendly High-Contrast UI**: Enlarged vertical typography, clear weekend tinting, and elevated Bento-style cards tailored for effortless readability across all age groups.
* **Smooth Horizontal Month Navigation**: Switch months naturally via horizontal swipe/drag gestures or the floating vertical month capsule, complete with synchronized slide-and-fade transitions.
* **Traditional Mongolian Lunar Almanac**:
  * Displays Lunar Month and Day names, Year Color & Element (`Жишээ: Хөхөгчин могой жил`), and Day Ganzhi (`Өдрийн өнгө`).
  * Highlights 24 Solar Terms (`24 улирал`) directly in the calendar grid and detail cards.

### 3. Dual-Calendar Birthdays & Anniversaries (`ᠲᠦᠷᠦᠭᠰᠡᠨ ᠡᠳᠦᠷ ᠪᠠ ᠣᠢ`)
* **Solar & Lunar Support**: Record birthdays and memorials using either the **Lunar Calendar (`ᠪᠢᠯᠢᠭ ᠦᠨ ᠤᠯᠠᠷᠢᠯ`)** or the **Gregorian Solar Calendar (`ᠠᠷᠭ᠎ᠠ ᠶᠢᠨ ᠤᠯᠠᠷᠢᠯ`)**.
* **Smart Date Resolution**: Automatically handles Lunar leap months (`Илүү сар`), 30-to-29 small-month fallbacks, and Gregorian Feb 29 leap-year adjustments.
* **Standalone Countdown Page**: View all upcoming birthdays, memorials, and traditional festivals sorted by days remaining, with titled vertical number wheels (`ᠰᠠᠷ᠎ᠠ` / `ᠡᠳᠦᠷ`) for easy creation and editing.
* **Built-in Traditional Festivals**: One-tap toggle to display traditional Mongolian festivals (such as *Tsagaan Sar* `ᠴᠠᠭᠠᠨ ᠰᠠᠷ᠎ᠠ`, *Gal Tahih* `ᠭᠠᠯ ᠲᠠᠬᠢᠬᠤ ᠡᠳᠦᠷ`, etc.).
* **Automated Local Notifications**: Schedules local reminders at 09:00 AM both in advance (e.g., 3 days prior) and on the exact day of the anniversary.

### 4. Adaptive Material 3 Theming
* Full support for Light and Dark modes using dynamic Material 3 `ColorScheme` palettes.

---

## 🏗️ Project Structure

```text
├── assets/                     # App icons and static assets
├── lib/                        # Dart interop & Drift SQLite layer
│   ├── connection/             # Native / Web SQLite database connections
│   ├── database.dart           # Drift table definitions (Tasks, Categories, Anniversaries)
│   ├── database.g.dart         # Generated Drift query & data classes
│   ├── notification_helper.dart# Platform-specific notification permission helpers
│   └── main.dart               # Flutter entry point bridging to ClojureDart
├── src/minii_focus/            # ClojureDart application source
│   ├── logic/                  # Pure business logic & reactive DB streams
│   │   ├── anniversary.cljd    # Solar/Lunar date resolution & countdown engine
│   │   ├── category_actions.cljd
│   │   ├── db.cljd             # Reactive Drift streams & CRUD operations
│   │   ├── lunar.cljd          # Mongolian lunar calendar & haircut almanac calculations
│   │   ├── notification.cljd   # Local push notification scheduling
│   │   ├── records.cljd        # Drift row <-> Clojure map normalization
│   │   ├── stats.cljd          # Task completion statistics
│   │   └── task.cljd           # Task grouping and filtering helpers
│   ├── pages/                  # Top-level application screens
│   │   ├── anniversary_management.cljd # Standalone Birthday & Anniversary page
│   │   ├── calendar_page.cljd          # Mongolian Lunar Calendar page
│   │   ├── category_management.cljd    # Category CRUD & reordering page
│   │   ├── home.cljd                   # Main task list & navigation shell
│   │   ├── settings.cljd               # Theme & preferences page
│   │   ├── subtasks_list.cljd          # Subtasks management view
│   │   └── task_detail.cljd            # Detailed task editor
│   ├── state/
│   │   └── store.cljd          # Global UI state atoms
│   ├── widgets/                # Reusable vertical Mongolian UI components
│   │   ├── calendar/           # Modularized calendar sub-components
│   │   │   ├── body.cljd       # Top grid + bottom Bento split layout
│   │   │   ├── dates.cljd      # Grid cell date helpers
│   │   │   ├── dialogs.cljd    # Elder-friendly large-font modals & wheel pickers
│   │   │   ├── grid.cljd       # Month switcher pill & 7x6 day cells
│   │   │   ├── panels.cljd     # Bottom lunar almanac & day tasks cards
│   │   │   ├── state.cljd      # Calendar month, selected date & swipe state
│   │   │   └── theme.cljd      # Calendar typography & Material 3 palette
│   │   ├── input_dialog.cljd   # Unified Mongolian virtual keyboard input dialog
│   │   └── ...
│   ├── main.cljd               # ClojureDart app initialization
│   ├── route_names.cljd        # Named route constants
│   └── routes.cljd             # Route table configuration
├── web/                        # Web build assets & OyunQaganTig font
├── deps.edn                    # ClojureDart dependencies & aliases
└── pubspec.yaml                # Flutter/Dart package dependencies
```

---

## 🚀 Getting Started

### Prerequisites
* **Flutter SDK** (3.x or later)
* **Clojure CLI** (`clj` / `clojure`)
* **Java JDK** (11 or later, required by Clojure CLI)

### 1. Install Dependencies
Fetch the Dart/Flutter packages:
```bash
flutter pub get
```

### 2. Generate Drift Database Code (If Schema Changed)
If you modify `lib/database.dart`, regenerate `lib/database.g.dart` using `build_runner`:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 3. Run the Application with ClojureDart
Start the ClojureDart compiler and launch the Flutter app on your connected device or simulator:
```bash
clj -M:cljd flutter
```
*(Or pass a target device, e.g., `clj -M:cljd flutter -d macos`, `-d chrome`, or `-d <device-id>`).*

---

## 🛠️ Tech Stack

* **Language**: [ClojureDart](https://github.com/Tensegritics/ClojureDart)
* **UI Framework**: [Flutter](https://flutter.dev/) (Material 3)
* **Vertical Script Layout**: [`mongol`](https://pub.dev/packages/mongol)
* **Local Database**: [Drift](https://drift.simonbinder.eu/) (Reactive SQLite)
* **Lunar & Solar Astronomy**: [`lunar`](https://pub.dev/packages/lunar)
* **Local Notifications**: [`flutter_local_notifications`](https://pub.dev/packages/flutter_local_notifications) & [`timezone`](https://pub.dev/packages/timezone)

---

## 📄 License

This project is licensed under the terms specified in the [LICENSE](LICENSE) file.
