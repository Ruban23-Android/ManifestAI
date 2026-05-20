package com.manifestai.app.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.*
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.*
import com.manifestai.app.ui.components.*
import com.manifestai.app.ui.theme.*
import com.manifestai.app.viewmodel.ManifestViewModel

@Composable
fun JournalScreen(viewModel: ManifestViewModel, onBack: () -> Unit) {
    val state by viewModel.uiState.collectAsState()

    GradientBackground {
        Column(modifier = Modifier.fillMaxSize().statusBarsPadding().navigationBarsPadding()) {
            ManifestTopBar("📓 Daily Ritual", onBack)
            Column(
                modifier            = Modifier.fillMaxSize().verticalScroll(rememberScrollState()).padding(horizontal = 24.dp),
                verticalArrangement = Arrangement.spacedBy(20.dp),
            ) {
                Spacer(Modifier.height(4.dp))
                GlassCard(modifier = Modifier.fillMaxWidth()) {
                    Column(modifier = Modifier.padding(20.dp)) {
                        Text("✨ Affirmation", style = MaterialTheme.typography.labelLarge, color = StarGold)
                        Spacer(Modifier.height(8.dp))
                        Text(viewModel.todayAffirmation(), style = MaterialTheme.typography.bodyLarge, color = OnDark)
                    }
                }
                RitualSection(
                    icon          = "🌅",
                    title         = "Morning Intention",
                    subtitle      = "60–90 seconds to set your direction",
                    hint          = "What do I intend to embody today?",
                    value         = state.morningIntention,
                    onValueChange = viewModel::updateMorningIntention,
                    accentColor   = StarGold,
                )
                RitualSection(
                    icon          = "🌙",
                    title         = "Evening Reflection",
                    subtitle      = "60–90 seconds to close your day",
                    hint          = "What did I learn or feel grateful for today?",
                    value         = state.eveningReflection,
                    onValueChange = viewModel::updateEveningReflection,
                    accentColor   = SoftLavender,
                )
                PrimaryButton("Save Today's Ritual", onClick = {}, modifier = Modifier.fillMaxWidth())
                Text(
                    "Reflection depth contributes to your Alignment Score",
                    style = MaterialTheme.typography.bodyMedium,
                    color = SubtleText,
                )
                Spacer(Modifier.height(16.dp))
            }
        }
    }
}

@Composable
private fun RitualSection(
    icon: String, title: String, subtitle: String,
    hint: String, value: String, onValueChange: (String) -> Unit, accentColor: Color,
) {
    GlassCard(modifier = Modifier.fillMaxWidth()) {
        Column(modifier = Modifier.padding(20.dp)) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Text(icon, style = MaterialTheme.typography.titleLarge)
                Spacer(Modifier.width(10.dp))
                Column {
                    Text(title,    style = MaterialTheme.typography.titleMedium, color = OnDark)
                    Text(subtitle, style = MaterialTheme.typography.bodyMedium,  color = SubtleText)
                }
            }
            Spacer(Modifier.height(14.dp))
            OutlinedTextField(
                value         = value,
                onValueChange = onValueChange,
                placeholder   = { Text(hint, color = SubtleText) },
                modifier      = Modifier.fillMaxWidth().heightIn(min = 100.dp),
                shape         = RoundedCornerShape(12.dp),
                colors        = OutlinedTextFieldDefaults.colors(
                    focusedBorderColor   = accentColor,
                    unfocusedBorderColor = SubtleText.copy(alpha = 0.4f),
                    focusedTextColor     = OnDark,
                    unfocusedTextColor   = OnDark,
                    cursorColor          = accentColor,
                ),
                minLines = 3,
            )
        }
    }
}
