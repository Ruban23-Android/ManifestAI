package com.manifestai.app.ui.screens

import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Check
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.*
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.*
import com.manifestai.app.model.HabitEntry
import com.manifestai.app.ui.components.*
import com.manifestai.app.ui.theme.*
import com.manifestai.app.viewmodel.ManifestViewModel

@Composable
fun HabitsScreen(viewModel: ManifestViewModel, onBack: () -> Unit) {
    val state by viewModel.uiState.collectAsState()

    GradientBackground {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .statusBarsPadding()
                .navigationBarsPadding(),
        ) {
            ManifestTopBar("🔥 Habits", onBack)

            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .verticalScroll(rememberScrollState())
                    .padding(horizontal = 24.dp),
            ) {
                Spacer(Modifier.height(4.dp))

                // Summary row
                val completedHabits = state.habits.count { it.isCompletedToday }
                val totalHabits     = state.habits.size
                GlassCard(modifier = Modifier.fillMaxWidth()) {
                    Row(
                        modifier              = Modifier.padding(20.dp),
                        horizontalArrangement = Arrangement.SpaceAround,
                        verticalAlignment     = Alignment.CenterVertically,
                    ) {
                        HabitStat("$completedHabits/$totalHabits", "Done today", AuroraMint)
                        Divider(modifier = Modifier.height(40.dp).width(1.dp), color = SubtleText.copy(alpha = 0.3f))
                        HabitStat(
                            "${state.habits.maxOfOrNull { it.streak } ?: 0}",
                            "Best streak",
                            StarGold,
                        )
                        Divider(modifier = Modifier.height(40.dp).width(1.dp), color = SubtleText.copy(alpha = 0.3f))
                        HabitStat(
                            "${state.habits.sumOf { it.streak }}",
                            "Total days",
                            SoftLavender,
                        )
                    }
                }

                Spacer(Modifier.height(24.dp))

                Text("Today's Habits", style = MaterialTheme.typography.titleMedium, color = OnDark)
                Spacer(Modifier.height(12.dp))

                state.habits.forEach { habit ->
                    HabitRow(
                        habit    = habit,
                        onToggle = { viewModel.toggleHabitToday(habit.id) },
                    )
                    Spacer(Modifier.height(10.dp))
                }

                Spacer(Modifier.height(16.dp))
                Text(
                    "Habit Rhythm: ${state.alignmentScore.habitRhythm}% — contributes to your Alignment Score",
                    style = MaterialTheme.typography.bodyMedium,
                    color = SubtleText,
                )
                Spacer(Modifier.height(32.dp))
            }
        }
    }
}

@Composable
private fun HabitStat(value: String, label: String, color: androidx.compose.ui.graphics.Color) {
    Column(horizontalAlignment = Alignment.CenterHorizontally) {
        Text(value, style = MaterialTheme.typography.titleLarge.copy(fontWeight = FontWeight.Bold), color = color)
        Text(label, style = MaterialTheme.typography.labelSmall, color = SubtleText)
    }
}

@Composable
private fun HabitRow(habit: HabitEntry, onToggle: () -> Unit) {
    GlassCard(modifier = Modifier.fillMaxWidth()) {
        Row(
            modifier          = Modifier.padding(16.dp),
            verticalAlignment = Alignment.CenterVertically,
        ) {
            // Checkbox circle
            Box(
                modifier = Modifier
                    .size(36.dp)
                    .clip(CircleShape)
                    .background(if (habit.isCompletedToday) AuroraMint else CardSurface)
                    .border(
                        width = 1.5.dp,
                        color = if (habit.isCompletedToday) AuroraMint else SubtleText,
                        shape = CircleShape,
                    )
                    .clickable(onClick = onToggle),
                contentAlignment = Alignment.Center,
            ) {
                if (habit.isCompletedToday) {
                    Icon(Icons.Default.Check, null, tint = DeepIndigo, modifier = Modifier.size(20.dp))
                }
            }

            Spacer(Modifier.width(14.dp))

            Column(modifier = Modifier.weight(1f)) {
                Text(habit.title, style = MaterialTheme.typography.bodyLarge, color = OnDark)
                Spacer(Modifier.height(2.dp))
                Text(
                    "🔥 ${habit.streak} day streak",
                    style = MaterialTheme.typography.labelSmall,
                    color = if (habit.streak >= 7) StarGold else SubtleText,
                )
            }

            // Streak badge
            if (habit.streak >= 7) {
                Surface(
                    shape = androidx.compose.foundation.shape.RoundedCornerShape(50),
                    color = StarGold.copy(alpha = 0.2f),
                ) {
                    Text(
                        "🏆 ${habit.streak}d",
                        modifier = Modifier.padding(horizontal = 10.dp, vertical = 4.dp),
                        style    = MaterialTheme.typography.labelSmall,
                        color    = StarGold,
                    )
                }
            }
        }
    }
}
