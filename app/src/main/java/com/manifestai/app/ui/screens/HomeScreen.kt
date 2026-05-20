package com.manifestai.app.ui.screens

import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.*
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.*
import com.manifestai.app.model.Manifestation
import com.manifestai.app.navigation.Screen
import com.manifestai.app.ui.components.*
import com.manifestai.app.ui.theme.*
import com.manifestai.app.viewmodel.ManifestViewModel

@Composable
fun HomeScreen(viewModel: ManifestViewModel, onNavigate: (String) -> Unit) {
    val state by viewModel.uiState.collectAsState()

    GradientBackground {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .statusBarsPadding()
                .navigationBarsPadding()
                .verticalScroll(rememberScrollState()),
        ) {
            Spacer(Modifier.height(24.dp))
            Column(modifier = Modifier.padding(horizontal = 24.dp)) {
                Text("Good morning 🌅", style = MaterialTheme.typography.bodyMedium, color = SubtleText)
                Text("Your Manifestations", style = MaterialTheme.typography.displayMedium, color = OnDark)
            }
            Spacer(Modifier.height(20.dp))

            // Affirmation
            GlassCard(modifier = Modifier.padding(horizontal = 24.dp).fillMaxWidth()) {
                Column(modifier = Modifier.padding(20.dp)) {
                    Text("Today's Affirmation", style = MaterialTheme.typography.labelLarge, color = StarGold)
                    Spacer(Modifier.height(8.dp))
                    Text(viewModel.todayAffirmation(), style = MaterialTheme.typography.bodyLarge.copy(fontWeight = FontWeight.Medium), color = OnDark)
                }
            }
            Spacer(Modifier.height(24.dp))

            // Stats
            Row(
                modifier              = Modifier.padding(horizontal = 24.dp).fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(16.dp),
            ) {
                StatCard(Modifier.weight(1f), "Actions done",    "${viewModel.completedActionsCount()} / ${viewModel.totalActionsCount()}", AuroraMint)
                StatCard(Modifier.weight(1f), "Alignment score", "${state.alignmentScore.total}", CosmicPurple)
            }
            Spacer(Modifier.height(24.dp))

            // Manifestations carousel
            Text("My Manifestations", style = MaterialTheme.typography.titleMedium, color = OnDark, modifier = Modifier.padding(horizontal = 24.dp))
            Spacer(Modifier.height(12.dp))
            LazyRow(
                contentPadding        = PaddingValues(horizontal = 24.dp),
                horizontalArrangement = Arrangement.spacedBy(16.dp),
            ) {
                items(state.manifestations) { m -> ManifestCard(m) }
            }
            Spacer(Modifier.height(28.dp))

            // Quick actions
            Text("Quick Access", style = MaterialTheme.typography.titleMedium, color = OnDark, modifier = Modifier.padding(horizontal = 24.dp))
            Spacer(Modifier.height(12.dp))
            Column(modifier = Modifier.padding(horizontal = 24.dp), verticalArrangement = Arrangement.spacedBy(12.dp)) {
                QuickActionRow("⚡ Action Engine",   "Today's micro-steps",  AuroraMint)   { onNavigate(Screen.ActionEngine.route) }
                QuickActionRow("🔥 Habits",          "Track your streaks",   StarGold)     { onNavigate(Screen.Habits.route) }
                QuickActionRow("📊 Alignment Score", "See your progress",    CosmicPurple) { onNavigate(Screen.Alignment.route) }
                QuickActionRow("📓 Daily Ritual",    "Morning & evening",    SoftLavender) { onNavigate(Screen.Journal.route) }
            }
            Spacer(Modifier.height(32.dp))
        }
    }
}

@Composable
private fun StatCard(modifier: Modifier, label: String, value: String, color: Color) {
    GlassCard(modifier = modifier) {
        Column(modifier = Modifier.padding(16.dp)) {
            Text(label, style = MaterialTheme.typography.labelSmall, color = SubtleText)
            Spacer(Modifier.height(4.dp))
            Text(value, style = MaterialTheme.typography.titleLarge.copy(fontWeight = FontWeight.Bold), color = color)
        }
    }
}

@Composable
private fun ManifestCard(m: Manifestation) {
    GlassCard(modifier = Modifier.width(240.dp)) {
        Column(modifier = Modifier.padding(16.dp)) {
            CategoryChip(m.category.emoji, m.category.label, Color(m.category.color))
            Spacer(Modifier.height(12.dp))
            Text(m.title, style = MaterialTheme.typography.titleMedium, color = OnDark)
            Spacer(Modifier.height(6.dp))
            Text(m.intention, style = MaterialTheme.typography.bodyMedium, color = SubtleText, maxLines = 2)
            Spacer(Modifier.height(12.dp))
            LabeledProgressBar("Alignment", m.alignmentScore, Color(m.category.color))
        }
    }
}

@Composable
private fun QuickActionRow(title: String, subtitle: String, accent: Color, onClick: () -> Unit) {
    GlassCard(modifier = Modifier.fillMaxWidth().clickable(onClick = onClick)) {
        Row(modifier = Modifier.padding(16.dp), verticalAlignment = Alignment.CenterVertically) {
            Column(modifier = Modifier.weight(1f)) {
                Text(title,    style = MaterialTheme.typography.titleMedium, color = OnDark)
                Text(subtitle, style = MaterialTheme.typography.bodyMedium,  color = SubtleText)
            }
            Text("›", style = MaterialTheme.typography.titleLarge, color = accent)
        }
    }
}
