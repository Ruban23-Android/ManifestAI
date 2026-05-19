package com.manifestai.app.model

// ── Enums ─────────────────────────────────────────────────────────────────────

enum class BeliefSystem(val label: String, val emoji: String) {
    HINDUISM("Hinduism", "🕉️"),
    ISLAM("Islam", "☪️"),
    CHRISTIANITY("Christianity", "✝️"),
    BUDDHISM("Buddhism", "☸️"),
    SIKHISM("Sikhism", "🪯"),
    JUDAISM("Judaism", "✡️"),
    SPIRITUAL("Spiritual", "✨"),
    NON_RELIGIOUS("Non-religious", "🌿"),
    CUSTOM("Custom", "💫"),
}

enum class ManifestCategory(val label: String, val emoji: String, val color: Long) {
    WEALTH("Wealth & Finance",        "💰", 0xFFF5C842),
    LOVE("Love & Relationships",      "❤️", 0xFFFF6B9D),
    HEALTH("Health & Wellness",       "🌱", 0xFF3ECFB2),
    SELF_CONCEPT("Self-Concept",      "🪞", 0xFF9B8CBF),
    MINDSET("Mindset & Spiritual",    "🧘", 0xFF6B3FA0),
    LIFESTYLE("Lifestyle Upgrades",   "🏡", 0xFF7EC8E3),
    LEARNING("Learning & Creativity", "📚", 0xFFFF9F45),
    SOCIAL("Social Influence",        "🌟", 0xFFF5C842),
    SERVICE("Service & Contribution", "🤝", 0xFF3ECFB2),
    CUSTOM("Custom Manifestation",    "✏️", 0xFFCDB4DB),
}

enum class ActionType(val label: String) {
    MICRO_HABIT("Micro-habit"),
    SKILL_REP("Skill rep"),
    BEHAVIORAL("Behavioral action"),
    IDENTITY("Identity step"),
}

// ── Data Classes ──────────────────────────────────────────────────────────────

data class Manifestation(
    val id: String,
    val title: String,
    val category: ManifestCategory,
    val intention: String,
    val milestones: List<String> = emptyList(),
    val alignmentScore: Int = 0,      // 0-100
)

data class DailyAction(
    val id: String,
    val title: String,
    val type: ActionType,
    val manifestationId: String,
    val isCompleted: Boolean = false,
    val durationMinutes: Int? = null,
)

data class HabitEntry(
    val id: String,
    val title: String,
    val streak: Int = 0,
    val isCompletedToday: Boolean = false,
)

data class AlignmentScore(
    val total: Int,               // 0-100
    val actionStrength: Int,
    val habitRhythm: Int,
    val reflectionDepth: Int,
    val clarityStructure: Int,
)

data class JournalEntry(
    val id: String,
    val date: String,
    val morningIntention: String = "",
    val eveningReflection: String = "",
)

// ── Sample / Seed Data ────────────────────────────────────────────────────────

object SampleData {
    val manifestations = listOf(
        Manifestation(
            id = "1",
            title = "Financial Freedom",
            category = ManifestCategory.WEALTH,
            intention = "Build ₹10L emergency fund and invest consistently",
            milestones = listOf("Save ₹1L", "Invest in mutual funds", "Build ₹5L fund"),
            alignmentScore = 72,
        ),
        Manifestation(
            id = "2",
            title = "Vibrant Health",
            category = ManifestCategory.HEALTH,
            intention = "Run a 5K and maintain a balanced diet",
            milestones = listOf("Run 1K without stopping", "30-day clean eating", "Complete 5K"),
            alignmentScore = 55,
        ),
        Manifestation(
            id = "3",
            title = "Creative Mastery",
            category = ManifestCategory.LEARNING,
            intention = "Publish my first digital art collection",
            milestones = listOf("Complete 10 artworks", "Build portfolio site", "Launch on Gumroad"),
            alignmentScore = 40,
        ),
    )

    val todayActions = listOf(
        DailyAction("a1", "Meditate for 10 minutes",       ActionType.MICRO_HABIT,  "2", durationMinutes = 10),
        DailyAction("a2", "Review investment portfolio",    ActionType.BEHAVIORAL,   "1", durationMinutes = 5),
        DailyAction("a3", "Sketch one page in sketchbook",  ActionType.SKILL_REP,    "3", durationMinutes = 20),
        DailyAction("a4", "Affirm: I am growing stronger",  ActionType.IDENTITY,     "2"),
        DailyAction("a5", "Walk 3,000 steps",               ActionType.MICRO_HABIT,  "2", durationMinutes = 30, isCompleted = true),
        DailyAction("a6", "Read 10 pages of finance book",  ActionType.SKILL_REP,    "1", durationMinutes = 15, isCompleted = true),
    )

    val habits = listOf(
        HabitEntry("h1", "Morning meditation", streak = 7,  isCompletedToday = true),
        HabitEntry("h2", "Evening journaling",  streak = 4,  isCompletedToday = false),
        HabitEntry("h3", "Daily walk",          streak = 12, isCompletedToday = true),
        HabitEntry("h4", "Read 10 pages",       streak = 2,  isCompletedToday = false),
    )

    val alignmentScore = AlignmentScore(
        total            = 68,
        actionStrength   = 75,
        habitRhythm      = 80,
        reflectionDepth  = 50,
        clarityStructure = 65,
    )

    val affirmations = mapOf(
        BeliefSystem.HINDUISM      to "Walk with clarity today; one action begins transformation. 🕉️",
        BeliefSystem.CHRISTIANITY  to "Stay encouraged — take today's next faithful step. ✝️",
        BeliefSystem.NON_RELIGIOUS to "Your consistent effort is shaping your future — start with one block. 🌿",
        BeliefSystem.SPIRITUAL     to "You are aligned with the universe — your next step is divinely guided. ✨",
        BeliefSystem.ISLAM         to "With every action taken in purpose, you honor your path. ☪️",
        BeliefSystem.BUDDHISM      to "Each mindful step brings you closer to who you are becoming. ☸️",
        BeliefSystem.SIKHISM       to "Serve, act, and trust — your efforts are never wasted. 🪯",
        BeliefSystem.JUDAISM       to "Each day of intention builds the life you seek. ✡️",
        BeliefSystem.CUSTOM        to "You are becoming wiser and stronger — take your next 10-minute step. 💫",
    )
}
