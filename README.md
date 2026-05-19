# ManifestAI — Jetpack Compose Sample App

A full-featured Android sample app built from the **ManifestAI product documentation**.
Implements the core **Think → Believe → Execute → Measure** loop with a polished deep-space UI.

---

## 📁 Project Structure

```
app/src/main/java/com/manifestai/app/
├── MainActivity.kt                    ← Entry point
├── model/
│   └── Models.kt                      ← Data classes, enums, seed data
├── viewmodel/
│   └── ManifestViewModel.kt           ← StateFlow-based UI state
├── navigation/
│   └── NavHost.kt                     ← NavController + all routes
├── ui/
│   ├── theme/
│   │   └── Theme.kt                   ← Colors, typography, MaterialTheme
│   ├── components/
│   │   └── Components.kt              ← Shared composables (cards, charts, buttons)
│   └── screens/
│       ├── OnboardingScreen.kt        ← Belief system selector
│       ├── HomeScreen.kt              ← Dashboard (affirmation, stats, manifestations)
│       ├── ActionEngineScreen.kt      ← Today's micro-steps with checkboxes
│       ├── HabitsScreen.kt            ← Habit tracker with streaks
│       ├── AlignmentScreen.kt         ← Animated score ring + breakdown
│       └── JournalScreen.kt           ← Morning intention & evening reflection
```

---

## 🚀 Setup

### Prerequisites
- Android Studio Hedgehog (2023.1.1) or newer
- Kotlin 2.x
- `minSdk 26`, `compileSdk 35`

### Steps
1. Create a new **Empty Activity** project in Android Studio.
2. Replace / create all files as listed above.
3. In `build.gradle.kts` (app), the BOM and dependencies are already listed.
4. Run on an emulator or device (API 26+).

---

## 🎨 Design System

| Token          | Value              | Usage                         |
|----------------|--------------------|-------------------------------|
| `DeepIndigo`   | `#1A1035`          | Background                    |
| `CosmicPurple` | `#6B3FA0`          | Primary / buttons             |
| `AuroraMint`   | `#3ECFB2`          | Actions, progress, score      |
| `StarGold`     | `#F5C842`          | Habits, affirmations          |
| `SoftLavender` | `#CDB4DB`          | Identity actions, reflections |
| `CardSurface`  | `#2E1F5E`          | Glass cards                   |

---

## 📱 Screens

| Screen           | Feature covered                                  |
|------------------|--------------------------------------------------|
| Onboarding       | Belief system selection (9 options)              |
| Home             | Daily affirmation, stats, manifestation carousel |
| Action Engine    | Daily actions with type tags and completion      |
| Habits           | Streak tracking, today's habit checklist         |
| Alignment Score  | Animated ring + 4-component breakdown            |
| Journal / Ritual | Morning intention + evening reflection text      |

---

## 🔧 Extending for Production

- **Room** — replace `SampleData` with a local database
- **Retrofit / Ktor** — connect to the NestJS backend for LLM affirmations
- **DataStore** — persist belief system selection and journal entries
- **WorkManager** — schedule morning/evening ritual reminders
- **Coil** — load vision card images from the backend
