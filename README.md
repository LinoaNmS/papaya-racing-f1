# 🏎️ Papaya Racing - F1 App

Application mobile Flutter + API .NET pour suivre les classements de Formule 1 en temps réel.

## 📦 Structure du projet

## 🚀 Quick Start

### Prérequis

- Flutter SDK 3.x
- .NET 8 SDK
- Docker (optionnel)

### Lancer l'API

```bash
cd WokingHub.Api
dotnet run
```

📸 Aperçu

<!-- Ajoutez vos screenshots ici -->

[Screenshot de l'app - Classement Pilotes]
[Screenshot de l'app - Classement Constructeurs]
✨ Fonctionnalités

✅ Classements en temps réel : Pilotes et Constructeurs pour la saison en cours
✅ Mode offline : Cache local avec SharedPreferences
✅ Pull to refresh : Actualisation des données
✅ Tabs dynamiques : Basculement fluide entre Pilotes et Constructeurs
✅ Résumé de saison : Statistiques clés (courses, écarts, leader)
✅ Design moderne : Interface fluide avec design system personnalisé
✅ Clean Architecture : Code maintenable et testable
🚧 Live timing (à venir)
🚧 Calendrier des courses (à venir)
🚧 Détails des courses (à venir)

🏗️ Architecture du projet
Ce projet est un monorepo contenant :
f1/
├── 📱 papaya_app/ # Application mobile Flutter
│ ├── lib/
│ │ ├── core/ # Utils, errors, network
│ │ ├── features/ # Features (Clean Architecture)
│ │ └── main.dart
│ ├── pubspec.yaml
│ └── README.md
│
├── 🔌 WokingHub.Api/ # API .NET Backend
│ ├── Controllers/
│ ├── Services/
│ ├── Models/
│ ├── Program.cs
│ └── README.md
│
├── 📄 README.md # Ce fichier
├── 🐳 docker-compose.yml # Configuration Docker (optionnel)
└── 🚫 .gitignore
🛠️ Stack Technique
📱 Flutter App
CatégoriePackageVersionRôleState Managementflutter_bloc^8.1.3Gestion d'état avec CubitDependency Injectionget_it^7.6.4Service locatorNetworkingdio^5.4.0Client HTTPFunctional Programmingdartz^0.10.1Either<Failure, Success>Local Storageshared_preferences^2.2.2Cache localNetwork Checkconnectivity_plus^5.0.2Vérification connexionImmutabilityequatable^2.0.5Comparaison d'objets
🔌 .NET API

.NET 8 : Framework backend
ASP.NET Core : Web API
Dio : Client HTTP pour appels à l'API Ergast F1
