# Mongol Focus

A task management and focus application built with ClojureDart + Flutter, featuring traditional Mongolian vertical writing, built-in vertical design system, focus mode, and task database, along with a custom Mongolian virtual keyboard and fonts.

## Overview

Mongol Focus is a productivity application designed specifically for traditional Mongolian vertical writing. It provides a comprehensive task management system with focus capabilities, following the top-to-bottom, right-to-left reading pattern of Mongolian script.

## Key Features

- **Vertical Writing First**: All text is displayed vertically, with columns as the primary structure, following the Mongolian reading pattern from top to bottom and right to left.
- **Page Navigation**: Nine main sections accessible via bottom navigation and drawer: Today, Inbox, Focus, Forecast, Projects, Tags, Review, Statistics, and Settings. The bottom bar retains the four most frequently used pages.
- **Design System**: Comprehensive component library including `MongolColumnLayout`, `MongolTextBlock`, `MongolTaskItem`, `FocusDepthBar`, and more, covering layout, text, gestures, and animations.
- **Focus Capabilities**: Focus container, focus depth bar, session creation/exit, with support for depth score recording and querying.
- **Database**: Drift-based database with tables for Items, ItemTree, Tags, FocusSessions, Reviews, and Settings, with cross-platform connectivity fully implemented.
- **Keyboard & Fonts**: Built-in Mongolian virtual keyboard (based on FST resources in `assets/next.zip`) and multiple vertical writing fonts.

## Project Structure

```
mongol-focus/
├── src/minii_focus/      # ClojureDart source code (components, pages, services, state, utilities)
├── lib/
│   ├── cljd-out/         # Generated Dart code from ClojureDart (do not edit manually)
│   └── database/         # Drift database definitions and platform-specific connections
└── assets/               # Fonts and FST dictionary resources
```

## Requirements

- Flutter 3.10+ (Dart 3.10+)
- Clojure CLI (for ClojureDart compilation)
- Flutter development environment for your target platform (Android/iOS/macOS/Windows/Linux)

## Quick Start

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Build and Run

```bash
clj -M:cljd flutter run
```

This command will:
- Compile `.cljd` source files from `src/` to `lib/cljd-out/`
- Run the Flutter application

You can specify a device with `-d <device-id>`.

### 3. Common Commands

- **Generate code only**: `clj -M:cljd flutter build`
- **Run with hot reload**: `clj -M:cljd flutter run`
- **Run tests**: `flutter test`

## Key Pages and Routing

The application entry point is located in `src/minii_focus/main.cljd`. Navigation is managed through bottom navigation and a drawer, providing access to nine pages (Today/Inbox/Focus/Forecast/Projects/Tags/Review/Statistics/Settings), with a routing table for programmatic navigation.

## Database and Services

- **Drift Table Definitions**: See `lib/database/database.dart`
- **Database Initialization**: `services/database.cljd`
- **Task and Focus Logic**: `services/task.cljd` (task CRUD, Focus sessions, depth updates, etc.)

## Design System

The project includes a comprehensive design system for vertical Mongolian writing:

- **Design Tokens**: Spacing, typography, and color systems
- **Layout Components**: Column-first layouts, vertical page views
- **Text Components**: Vertical text blocks, task items, note blocks
- **Focus Components**: Focus containers and depth indicators
- **Gesture Components**: Unified gesture handling for vertical writing
- **Motion Components**: Animations optimized for vertical layouts

## Progress and Roadmap 

**Completed:**
- Design system and component library
- Database structure and connectivity
- Basic pages and services
- Mongolian virtual keyboard integration

**In Progress:**
- Task hierarchy and ordering management
- Tag and review services
- Task editing and gesture interactions (swipe left to enter Focus, long-press for structure adjustment)
- Real-time data refresh
- Complete routing experience

## Dependencies

### Core
- Flutter SDK
- ClojureDart
- Drift (database)
- Mongol (vertical writing support)

### Key Packages
- `drift`: ^2.27.0 - Database ORM
- `mongol`: ^9.0.0 - Mongolian vertical writing support
- `mongol_code`: ^1.0.4 - Mongolian code utilities
- `path_provider`: ^2.1.4 - File system paths
- `sqlite3_flutter_libs`: ^0.5.34 - SQLite support
- `flutter_local_notifications`: ^19.5.0 - Local notifications
- `vibration`: ^3.1.4 - Haptic feedback

See `pubspec.yaml` for the complete list.

## Assets

The project includes:
- **Mongolian Fonts**: Multiple Oyun family fonts (QaganTig, AgulaTig, GarbiqimelTig, etc.)
- **FST Resources**: Dictionary files for the virtual keyboard (`assets/next.zip`, `assets/fst/`)

## Development

### ClojureDart Workflow

1. Edit `.cljd` files in `src/minii_focus/`
2. Compile with `clj -M:cljd flutter build`
3. Generated Dart code appears in `lib/cljd-out/`
4. Run with Flutter tools

### Database Migrations

Database schema is defined in `lib/database/database.dart`. Run migrations with:

```bash
flutter pub run build_runner build
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please ensure your code follows the existing design system and vertical writing conventions.

## Resources

- [ClojureDart Documentation](https://github.com/tensegritics/ClojureDart)
- [Flutter Documentation](https://flutter.dev/docs)
- [Drift Documentation](https://drift.simonbinder.eu/)
- [Mongol Package](https://pub.dev/packages/mongol)
