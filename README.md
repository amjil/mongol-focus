# Mongol Focus

A modern task management application built with Flutter and ClojureDart, designed specifically for Mongolian language support. Inspired by Things-style task management, Mongol Focus provides a clean and intuitive interface for organizing your daily tasks.

## Features

### Task Management
- **Create, Edit, and Delete Tasks**: Full CRUD operations for task management
- **Task Details**: Support for task titles and detailed notes
- **Task Completion**: Mark tasks as done with automatic completion timestamp
- **Task Prioritization**: Set priority levels for tasks
- **Due Dates**: Optional due date assignment for tasks
- **Task Reordering**: Manual drag-and-drop sorting with display order persistence

### Categories & Organization
- **Category Management**: Create and manage custom categories/lists
- **Category Icons**: Assign icons to categories for visual organization
- **Category Filtering**: Filter tasks by category
- **Sidebar Navigation**: Quick access to categories via sidebar drawer

### Search & Filtering
- **Full-Text Search**: Search tasks by title or notes content
- **Category-Aware Search**: Combine search with category filtering
- **Real-Time Filtering**: Instant search results as you type

### Views & Navigation
- **Today View**: View all active (uncompleted) tasks
- **Logbook View**: Browse completed tasks sorted by completion date
- **Settings Page**: Customize app preferences
- **Bottom Navigation**: Easy switching between main views
- **Smooth Animations**: Fade transitions and entry animations for better UX

### Mongolian Language Support
- **Mongolian Text Rendering**: Full support for vertical Mongolian script using the `mongol` package
- **Multiple Font Families**: Support for 8 different Mongolian fonts:
  - OyunQaganTig
  - OyunAgulaTig
  - OyunGarbiqimelTig
  - OyunGarqagTig
  - OyunGurbanUlusTig
  - OyunHaraTig
  - OyunHawangTig
  - OyunSoninTig
- **Virtual Keyboard**: Integrated Mongolian virtual keyboard for text input
- **FST Input Method**: Finite State Transducer (FST) based input method for efficient Mongolian text entry
- **Mongolian UI Elements**: All UI components support Mongolian text display

### Data Persistence
- **SQLite Database**: Local data storage using Drift (formerly Moor)
- **Reactive Queries**: Stream-based reactive database queries for real-time UI updates
- **Data Migration**: Built-in database migration support

### User Interface
- **Material Design 3**: Modern Material Design 3 UI components
- **Dark Mode**: Full dark theme support
- **Responsive Layout**: Adaptive layouts for different screen sizes
- **Floating Action Button**: Quick task creation with scroll-aware FAB
- **Slidable Actions**: Swipe actions on task cards for quick operations

### Settings & Customization
- **Dark Mode Toggle**: Enable/disable dark theme
- **Notification Settings**: Configure notification preferences
- **Language Settings**: Language preference management
- **Sidebar Control**: Toggle sidebar visibility

## Technology Stack

- **Framework**: Flutter 3.10.4+
- **Language**: ClojureDart (Clojure for Dart/Flutter)
- **Database**: Drift (SQLite) with reactive streams
- **Mongolian Support**: 
  - `mongol` package for vertical text rendering
  - `mongol_code` for Mongolian text encoding
  - Custom virtual keyboard implementation
  - FST-based input method
- **State Management**: Atom-based state management with reactive streams
- **UI Components**: Material Design 3, custom Mongolian components

## Project Structure

```
lib/
  ├── main.dart                    # Flutter entry point
  ├── database.dart                # Drift database schema
  └── connection/                  # Database connection logic

src/minii_focus/
  ├── main.cljd                    # Application entry point
  ├── pages/
  │   ├── home.cljd               # Main home page
  │   ├── settings.cljd           # Settings page
  │   └── task_detail.cljd        # Task detail view
  ├── widgets/
  │   ├── main_list.cljd          # Task list widget
  │   ├── task_card.cljd          # Individual task card
  │   ├── bottom_nav.cljd         # Bottom navigation
  │   ├── fab.cljd                # Floating action button
  │   ├── sidebar.cljd            # Category sidebar
  │   └── ...                     # Other UI components
  ├── logic/
  │   ├── db.cljd                 # Database operations
  │   ├── task.cljd               # Task business logic
  │   ├── task_actions.cljd       # Task action handlers
  │   ├── category_actions.cljd   # Category operations
  │   └── search_actions.cljd     # Search functionality
  └── state/
      └── store.cljd              # Global state management

assets/
  ├── fonts/                      # Mongolian font files
  └── fst/                        # FST input method resources
```

## Getting Started

### Prerequisites

- Flutter SDK 3.10.4 or higher
- Clojure CLI tools
- Dart SDK (included with Flutter)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd mongol-focus
```

2. Install Flutter dependencies:
```bash
flutter pub get
```

3. Install ClojureDart dependencies:
```bash
clj -M:cljd prep
```

4. Generate database code:
```bash
flutter pub run build_runner build
```

5. Run the application:
```bash
flutter run
```

## Development

### Building

To build the ClojureDart code:
```bash
clj -M:cljd prep
```

To generate database code:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Database Schema

The application uses Drift for database management with two main tables:

- **Tasks**: Stores task information (title, notes, completion status, due dates, priority, category, etc.)
- **Categories**: Stores category/list information (name, icon, position)

## Dependencies

### Flutter Packages
- `drift`: Reactive SQLite database
- `mongol`: Mongolian vertical text rendering
- `mongol_code`: Mongolian text encoding
- `flutter_slidable`: Swipeable list items
- `flutter_styled_toast`: Toast notifications
- `vibration`: Haptic feedback
- `http`: HTTP client
- `archive`: Archive file handling
- `path_provider`: File system paths
- `intl`: Internationalization

### ClojureDart Dependencies
- `tensegritics/clojuredart`: ClojureDart runtime
- `amjil/mongol-virtual-keyboard`: Mongolian virtual keyboard
- `amjil/mongol-date-picker`: Mongolian date picker
- `amjil/mgl-components`: Mongolian UI components

## License

See [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
