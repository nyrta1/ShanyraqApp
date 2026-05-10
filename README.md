# shanyraq-app

## Short description

**shanyraq-app** is a cross-platform Flutter application that connects to Supabase for authentication and data. The UI is organized around a main workspace with separate flows for service requests, voting, CCTV listings, and user profile settings.

## Main features and modules

- **Authentication** — Email-oriented Supabase auth helpers under `lib/auth/` (including `supabase_auth`).
- **Workspace** — Entry dashboard after sign-in (`WorkspacePage`).
- **Service requests** — List and form pages for service requests (`service_request_list_page`, `service_request_form_page`).
- **Voting** — List and form pages for votes (`vote_list_page`, `vote_form_page`).
- **CCTV** — Camera listing screen (`c_c_t_v_list`).
- **User profile** — Profile/settings-style page (`user_profile`).
- **Backend models** — Typed Supabase table wrappers in `lib/backend/supabase/database/tables/`.

## Technologies used

| Area | Technology |
|------|------------|
| Framework | Flutter (Dart SDK `>=3.0.0 <4.0.0`) |
| Routing | `go_router` |
| State / utilities | `provider`, `rxdart`, Hive, `shared_preferences` |
| Backend | Supabase (`supabase`, `supabase_flutter`, PostgREST/realtime/storage clients) |
| UI helpers | FlutterFlow-generated widgets and theme (`lib/flutter_flow/`) |
| Charts | `fl_chart` |
| Media / UX | `cached_network_image`, `google_fonts`, `flutter_animate`, `page_transition`, etc. |
| Platforms | Android, iOS, Web (project includes `android/`, `ios/`, `web/`) |

## Architecture overview

The app boots in `lib/main.dart`: Flutter bindings and URL strategy are configured, **Supabase is initialized** (`SupaFlow.initialize()`), theme settings load, and **`MaterialApp.router`** hosts a **`GoRouter`** from `lib/flutter_flow/nav/nav.dart`.

Navigation uses **`AppStateNotifier`** (based on `ChangeNotifier`) together with the authenticated user stream so the shell can show loading state and react to sign-in/out.

Feature screens live under **`lib/pages/`**, each as a **`*_widget.dart`** plus a matching **`*_model.dart`** (FlutterFlow-style pattern). Shared presentation logic, theme, and routing helpers sit under **`lib/flutter_flow/`**. Supabase access is centralized under **`lib/backend/supabase/`**, with generated-style **table** classes mapping to Postgres table names.

## Folder structure overview

```
shanyraq-app/
├── android/                 # Android Gradle project
├── ios/                     # Xcode / CocoaPods project
├── web/                     # Web entry (index.html, icons)
├── assets/                  # Bundled fonts, images, videos, audio, PDFs, JSON, Rive
├── lib/
│   ├── main.dart            # App entry, Supabase + router setup
│   ├── index.dart           # Barrel exports for pages
│   ├── auth/                # Auth managers and Supabase user provider
│   ├── backend/supabase/    # SupaFlow client + database table definitions
│   ├── flutter_flow/        # Theme, nav, form controllers, UI utilities
│   └── pages/               # Feature pages (auth, cctv, requests, vote, settings, workspace)
└── test/                    # widget_test.dart
```

## Installing dependencies

1. Install the [Flutter SDK](https://docs.flutter.dev/get-started/install) for your OS and ensure `flutter` is on your `PATH`.
2. From the project root:

```bash
flutter pub get
```

For iOS builds on macOS, install CocoaPods dependencies from `ios/` if prompted during `flutter build` / `flutter run`.

## Running the project locally

From the project root:

```bash
flutter run
```

Use `-d chrome` for web, or select a device/emulator when multiple are available. The root route `/` shows **`WorkspacePageWidget`** when logged in and **`AuthPageWidget`** when not (see `nav.dart`).

## Supabase usage overview

- **Initialization** — `SupaFlow.initialize()` in `lib/backend/supabase/supabase.dart` calls `Supabase.initialize` with a project URL and anon key defined in that file, `debug: false`, and **`FlutterAuthClientOptions`** with **`AuthFlowType.implicit`**.
- **Client access** — `SupaFlow.client` exposes the shared **`SupabaseClient`** for queries and auth.
- **HTTP header** — Requests identify the client with **`X-Client-Info: flutterflow`** (as set in `supabase.dart`).
- **Data layer** — Table-specific Dart classes under `lib/backend/supabase/database/tables/` mirror Supabase/Postgres tables (see Database overview).

For grading or demos, ensure the Supabase project referenced in `supabase.dart` is available and that its schema matches what the generated table classes expect.

## FlutterFlow usage overview

This codebase follows the layout produced by **FlutterFlow** exports:

- **`lib/flutter_flow/`** — Shared theme (`flutter_flow_theme.dart`), widgets, animations, charts, navigation serialization, and **`nav.dart`** routing helpers (`FFRoute`, transition pages).
- **Page split** — Each screen uses a **Widget** + **Model** pair (`*_widget.dart`, `*_model.dart`).
- **Routing** — Named routes and paths are declared on each page widget (e.g. `routeName`, `routePath`) and registered in `createRouter`.

You can continue editing in FlutterFlow and re-export, or maintain the project directly in Dart; keep `flutter_flow` and page conventions consistent if you merge changes.

## Database overview (Supabase tables reflected in code)

The Dart layer declares wrappers for these table names (see `lib/backend/supabase/database/tables/`):

| Table name | Dart file |
|------------|-----------|
| `users` | `users.dart` |
| `cameras` | `cameras.dart` |
| `smart_devices` | `smart_devices.dart` |
| `documents` | `documents.dart` |
| `service_requests` | `service_requests.dart` |
| `request_comments` | `request_comments.dart` |
| `chat_rooms` | `chat_rooms.dart` |
| `chat_messages` | `chat_messages.dart` |
| `votings` | `votings.dart` |
| `voting_questions` | `voting_questions.dart` |
| `voting_answers` | `voting_answers.dart` |
| `user_votes` | `user_votes.dart` |

The **`users`** row type includes fields such as `id`, `full_name`, `email`, optional `phone`, `apartment_number`, `role`, and `created_at` (see `UsersRow`).

## Screens and routes

| Screen | Route path | Widget |
|--------|------------|--------|
| Root / workspace gate | `/` | Logged-in: `WorkspacePageWidget`; else `AuthPageWidget` |
| Workspace | `/workspacePage` | `WorkspacePageWidget` |
| Auth | `/authPage` | `AuthPageWidget` |
| CCTV list | `/cCTVList` | `CCTVListWidget` |
| Service request list | `/serviceRequestListPage` | `ServiceRequestListPageWidget` |
| Service request form | `/serviceRequestFormPage` | `ServiceRequestFormPageWidget` |
| Vote list | `/voteListPage` | `VoteListPageWidget` |
| Vote form | `/voteFormPage` | `VoteFormPageWidget` |
| User profile | `/userProfile` | `UserProfileWidget` |

Unknown routes fall back to **`WorkspacePageWidget`** if logged in, otherwise **`AuthPageWidget`** (`errorBuilder` in `nav.dart`).

## Team and project information

This README describes the repository as delivered. **Add your course name, institution, semester, and team member names and roles** in your submission materials as required by your instructor.

## Configuration and setup

1. **Flutter SDK** — Version constraints are in `pubspec.yaml` (`environment.sdk`).
2. **Supabase** — Project URL and anon key are set in **`lib/backend/supabase/supabase.dart`**. Point these at your Supabase project for local runs.
3. **App label** — Android display name **`shanyraq-app`** is set in `android/app/src/main/res/values/strings.xml`.
4. **Assets** — Declared under `flutter: assets:` in `pubspec.yaml` (`assets/fonts/`, `assets/images/`, etc.).
5. **Analysis** — `analysis_options.yaml` includes `package:flutter_lints/flutter.yaml`.

## Build and export

Standard Flutter release commands from the project root:

```bash
# Android APK (example)
flutter build apk

# Android App Bundle
flutter build appbundle

# iOS (macOS + Xcode)
flutter build ios

# Web
flutter build web
```

Platform-specific signing, provisioning, and store upload steps follow normal Flutter and store documentation for each target.
