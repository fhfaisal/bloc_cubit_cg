# Flutter App

This project serves as an example of organizing a Flutter project into well-defined layers: Core,
Data, Domain, and Presentation.

A Flutter application that demonstrates a
1.lean architecture,
2.implementation with dependency injection,
3.state management using Cubits,
4.remote API integration using Dio,
5.local caching with GetStorage,
6.and routing with GoRouter.

## Summary
-------------------------------******--------------------------------
Core Layer:
We defined custom exceptions, failures, Dio configuration (with SSL bypass for development),
dependency injection using GetIt, and route management with GoRouter (using named routes).

Data Layer:
We implemented the remote data source (with API calls), local data source (using GetStorage for
caching), and repository implementation that bridges the data sources and domain layer.

Domain Layer:
We defined the User entity and the abstract contract for authentication operations (AuthRepository).

Presentation Layer:
We set up the AuthCubit with states, and built UI pages for Onboarding, Login, and Home with
navigation managed by GoRouter using named routes (with route replacement to clear the navigation
stack on sign-in/sign-out).

Main Entry Point:
The app initializes dependencies, sets up Bloc providers, and configures routing via GoRouter.

This is the current progress of our project. Let me know if you'd like to review any part of it
further or proceed with additional features!
6.and routing with GoRouter.
-------------------------------******--------------------------------
## Project Structure
-------------------------------******--------------------------------
The project is organized into several directories to promote separation of concerns and
maintainability. Below is a high-level overview of the directory structure:
lib/
│── core/
│ ├── error/
│ │ ├── exceptions.dart // Custom exceptions (e.g., ServerException)
│ │ ├── failures.dart // Custom failure classes (e.g., ServerFailure)
│ ├── network/
│ │ ├── dio_config.dart // Dio configuration with SSL bypass (development only)
│ ├── di/
│ │ ├── injection_container.dart // Dependency Injection setup with GetIt
│ ├── routes/
│ │ ├── app_routes.dart // Route names constants
│ │ ├── app_router.dart // GoRouter configuration with initial route determination
│
│── data/
│ ├── models/
│ │ ├── user_model.dart // UserModel with JSON parsing and conversion to domain entity
│ ├── sources/
│ │ ├── auth_remote_data_source.dart // Remote API calls for authentication
│ │ ├── auth_local_data_source.dart // Local caching using GetStorage
│ ├── repositories/
│ │ ├── auth_repository_impl.dart // Implementation of AuthRepository using remote & local sources
│
│── domain/
│ ├── entities/
│ │ ├── user.dart // Domain User entity
│ ├── repositories/
│ │ ├── auth_repository.dart // Abstract contract for authentication operations
│
│── presentation/
│ ├── cubits/
│ │ ├── auth/
│ │ │ ├── auth_state.dart // States: initial, loading, authenticated, error
│ │ │ ├── auth_cubit.dart // Cubit managing authentication logic
│ ├── pages/
│ │ ├── onboarding/
│ │ │ ├── onboarding_page.dart // Onboarding screen for first-time users
│ │ ├── auth/
│ │ │ ├── login_page.dart // Login page using AuthCubit; navigates with GoRouter
│ │ ├── home/
│ │ │ ├── home_page.dart // Home page shown when user is authenticated
│
└── main.dart // App entry point; initializes DI and routes via GoRouter
-------------------------------******--------------------------------

## Features
-------------------------------******--------------------------------
- **Clean Architecture**: Separation of concerns using Core, Data, Domain, and Presentation layers.
- **Dependency Injection**: Managed by GetIt for easy testing and scalability.
- **State Management**: Implemented with Cubits for authentication state.
- **Networking**: API calls are handled via Dio with custom SSL bypass for development.
- **Local Caching**: Utilizes GetStorage for caching user data.
- **Routing**: Navigation handled with GoRouter for a declarative routing approach.
-------------------------------******--------------------------------

### Prerequisites
-------------------------------******--------------------------------
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- A code editor such as [Visual Studio Code](https://code.visualstudio.com/)
  or [Android Studio](https://developer.android.com/studio)
- [Dart](https://dart.dev/get-dart) (usually comes with Flutter)
-------------------------------******--------------------------------

### Installation
-------------------------------******--------------------------------
1. **Clone the repository:**

   ```bash

HTTPS:- git clone https://github.com/fhfaisal/bloc_cubit_cg.git
GithubCLI:- gh repo clone fhfaisal/bloc_cubit_cg
-------------------------------******--------------------------------
-------------------------------------------------------------------------------------
# Developed ❤️ by Faisal Hasan                                                      -
linkedin:- https://www.linkedin.com/in/faisal-hasan-0067aa205/                      -
email:- faisalhasan.dev@gmail.com                                                   -
-------------------------------------------------------------------------------------