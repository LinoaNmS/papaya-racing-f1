# 🏎️ Papaya Racing - F1 App

Application mobile **Flutter** + API **.NET** pour suivre les classements de Formule 1 en temps réel.

---

## 📦 Structure du projet

```
f1/
├── 📱 papaya_app/         # Application mobile Flutter
│   ├── lib/
│   │   ├── core/         # Utils, errors, network
│   │   ├── features/     # Features (Clean Architecture)
│   │   └── main.dart
│   ├── pubspec.yaml
│   └── README.md
│
├── � WokingHub.Api/      # API .NET Backend
│   ├── Controllers/
│   ├── Services/
│   ├── Models/
│   ├── Program.cs
│   └── README.md
│
├── 📄 README.md           # Ce fichier
├── 🐳 docker-compose.yml  # Configuration Docker (optionnel)
└── 🚫 .gitignore
```

---

## �🚀 Quick Start

### Prérequis

- [Flutter SDK 3.x](https://docs.flutter.dev/get-started/install)
- [.NET 8 SDK](https://dotnet.microsoft.com/en-us/download/dotnet/8.0)
- [Docker](https://www.docker.com/) _(optionnel)_

### Lancer l'API

```bash
cd WokingHub.Api
dotnet run
```

---

## 📸 Aperçu

<!-- Ajoutez vos screenshots ici -->

![Screenshot de l'app - Classement Pilotes](screenshots/pilotes.png)
![Screenshot de l'app - Classement Constructeurs](screenshots/constructeurs.png)

---

## ✨ Fonctionnalités

- ✅ **Classements en temps réel** : Pilotes et Constructeurs pour la saison en cours
- ✅ **Mode offline** : Cache local avec SharedPreferences
- ✅ **Pull to refresh** : Actualisation des données
- ✅ **Tabs dynamiques** : Basculement fluide entre Pilotes et Constructeurs
- ✅ **Résumé de saison** : Statistiques clés (courses, écarts, leader)
- ✅ **Design moderne** : Interface fluide avec design system personnalisé
- ✅ **Clean Architecture** : Code maintenable et testable
- 🚧 **Live timing** _(à venir)_
- 🚧 **Calendrier des courses** _(à venir)_
- 🚧 **Détails des courses** _(à venir)_

---

## 🛠️ Stack Technique

### 📱 Flutter App

| Catégorie              | Package            | Version | Rôle                      |
| ---------------------- | ------------------ | ------- | ------------------------- |
| State Management       | flutter_bloc       | ^8.1.3  | Gestion d'état avec Cubit |
| Dependency Injection   | get_it             | ^7.6.4  | Service locator           |
| Networking             | dio                | ^5.4.0  | Client HTTP               |
| Functional Programming | dartz              | ^0.10.1 | Either<Failure, Success>  |
| Local Storage          | shared_preferences | ^2.2.2  | Cache local               |
| Network Check          | connectivity_plus  | ^5.0.2  | Vérification connexion    |
| Immutability           | equatable          | ^2.0.5  | Comparaison d'objets      |

### 🔌 .NET API

- **.NET 8** : Framework backend
- **ASP.NET Core** : Web API
- **Dio** : Client HTTP pour appels à l'API Ergast F1
