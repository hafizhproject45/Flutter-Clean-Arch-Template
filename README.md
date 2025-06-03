# Flutter Clean Arch Template - Mason Template

This repository contains Mason templates for creating a clean architecture structure in a Flutter project. You can use these templates to quickly generate boilerplate code for new features in your Flutter application using Mason.

## Requirements

- [Mason CLI](https://mason.dev/docs/cli) installed on your machine.
- A Flutter project where you want to use the templates.

## Installation

### Step 1: Install Mason CLI

If you haven't installed **Mason CLI** yet, you can do so by running the following command:

```bash
dart pub global activate mason_cli
```

🍺 Or Install with <https://brew.sh>

```bash
brew tap felangel/mason
brew install mason
```

### Step 2: Initiate Mason in Existing Project

Before using the template, you need to initiate Mason in your existing Flutter project. You can do this by running the following command inside the root directory of your Flutter project:

```bash
mason init
```

### Step 3: Add Template from GitHub

To use this Mason template from GitHub in your project, run the following command in the root directory of your Flutter project:

**Available Feature (name):**

1. Initial Flutter with Clean Architecture (name: initial)
2. Clean Architecture Feature (name: new_feat)

```bash
mason add {{name}} --git-url git@github.com:hafizhproject45/Flutter-Clean-Arch-Template.git --git-path bricks/{{name}} --git-ref main
mason get
```

**notes: Replace {{name}} with name of feature**

### Step 4: Check Available Templates

After running the mason add command, you can verify that the template has been successfully added to your project by listing all the available templates with the following command:

```bash
mason list
```

This command will display all the templates that have been added to the current project, and you should see the one you just added (e.g., initial or new_feat). This ensures that the template has been successfully registered and is ready to be used.

### Step 5: Run Mason to Generate Files

Once the template is added and verified, you can generate the corresponding feature files by running the following command:

```bash
mason make {{name}}
```

**notes: Replace {{name}} with the template name you added (e.g., initial, new_feat).**

## Update Mason Template

```bash
mason update
```

## Folder Structure

```bash
lib/
│
├── core/ --------------------------------- # Contains core and reusable components used throughout the application
│   ├── errors/ --------------------------- # Stores various error types or exceptions used within the application
│   ├── helpers/ -------------------------- # Helper functions or classes that are frequently used across the application
│   ├── usecase/ -------------------------- # Template usecases containing the business logic
│   └── utils/ ---------------------------- # Contains utility and helper functions needed throughout the app
│
├── features/ ----------------------------- # Contains all the feature-related code and logic
│   ├── feature_name/ --------------------- # A specific feature folder (replace 'feature_name' with actual feature name)
│   │   ├── data/ ------------------------- # Handles data fetching and processing for this feature
│   │   │   ├── datasources/ -------------- # Contains data sources for the feature (e.g., API, Database, etc.)
│   │   │   ├── models/ ------------------- # Contains models for data, including request models and data models
│   │   │   │   ├── model.dart ------------ # Main models used in the application for the feature
│   │   │   │   └── request.model.dart ---- # Models for data requests like API requests for this feature
│   │   │   └── repositories/ ------------- # Repositories responsible for connecting data layer with the domain layer
│   │   ├── domain/ ----------------------- # Contains business logic and entities for this feature
│   │   │   ├── entities/ ----------------- # Business entities used in this feature
│   │   │   │   ├── entity.dart ----------- # Main entities used across the feature
│   │   │   │   └── request.entity.dart --- # Entities for data requests like API requests for this feature
│   │   │   ├── repositories/ ------------- # Repositories for the feature to manage data access and manipulation
│   │   │   └── usecase/ ------------------ # Contains usecases for the business logic flow of the feature
│   │   ├── presentation/ ----------------- # Contains UI components and state management for this feature
│   │   │   ├── cubit/ -------------------- # Contains Cubit files for state management (BLoC pattern)
│   │   │   ├── pages/ -------------------- # Contains pages (UI screens) of the feature
│   │   │   └── widget/ ------------------- # Reusable widget components used across multiple pages of the feature
│
├── services/ ----------------------------- # Contains services managing interactions with APIs and app initialization
│   ├── base_api.dart --------------------- # Base class for interacting with APIs
│   └── initialize_app.dart --------------- # Class for initializing the application (e.g., initial configuration)
│
├── injection.container.dart -------------- # Dependency injection file, connects all dependencies in the application
└── main.dart ----------------------------- # Entry point of the Flutter application
```
