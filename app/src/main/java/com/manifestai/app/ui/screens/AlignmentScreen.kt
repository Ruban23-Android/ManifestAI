package com.manifestai.app.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.*
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.*
import com.manifestai.app.ui.components.*
import com.manifestai.app.ui.theme.*
import com.manifestai.app.viewmodel.ManifestViewModel

@Composable
fun AlignmentScreen(viewModel: ManifestViewModel, onBack: () -> Unit) {
    val state by viewModel.uiState.collectAsState()
    val score = state.alignmentScore

    GradientBackground {
        Column(modifier = Modifier.fillMaxSize().statusBarsPadding().navigationBarsPadding()) {
            ManifestTopBar("📊 Alignment Score", onBack)
            Column(
                modifier            = Modifier.fillMaxSize().verticalScroll(rememberScrollState()).padding(horizontal = 24.dp),
                horizontalAlignment = Alignment.CenterHorizontally,
            ) {
                Spacer(Modifier.height(12.dp))
                GlassCard(modifier = Modifier.fillMaxWidth()) {
                    Column(modifier = Modifier.padding(24.dp), horizontalAlignment = Alignment.CenterHorizontally) {
                        ScoreRing(score = score.total, size = 140.dp, strokeWidth = 12.dp)
                        Spacer(Modifier.height(16.dp))
                        Text(
                            when {
                                score.total >= 80 -> "Outstanding alignment 🌟"
                                score.total >= 60 -> "Good momentum 🚀"
                                score.total >= 40 -> "Building consistency 🌱"
                                else              -> "Just getting started 💪"
                            },
                            style = MaterialTheme.typography.titleMedium,
                            color = OnDark,
                            textAlign = TextAlign.Center,
                        )
                        Spacer(Modifier.height(4.dp))
                        Text(
                            "Behavioral alignment — not outcome prediction",
                            style = MaterialTheme.typography.bodyMedium,
                            color = SubtleText,
                            textAlign = TextAlign.Center,
                        )
                    }
                }
                Spacer(Modifier.height(24.dp))
                Text("Score Breakdown", style = MaterialTheme.typography.titleMedium, color = OnDark)
                Spacer(Modifier.height(16.dp))
                GlassCard(modifier = Modifier.fillMaxWidth()) {
                    Column(modifier = Modifier.padding(20.dp), verticalArrangement = Arrangement.spacedBy(18.dp)) {
                        LabeledProgressBar("⚡ Action Strength",   score.actionStrength,   AuroraMint)
                        LabeledProgressBar("🔥 Habit Rhythm",      score.habitRhythm,      StarGold)
                        LabeledProgressBar("📓 Reflection Depth",  score.reflectionDepth,  SoftLavender)
                        LabeledProgressBar("🎯 Clarity Structure", score.clarityStructure, CosmicPurple)
                    }
                }
                Spacer(Modifier.height(24.dp))
                GlassCard(modifier = Modifier.fillMaxWidth()) {
                    Column(modifier = Modifier.padding(20.dp), verticalArrangement = Arrangement.spacedBy(12.dp)) {
                        Text("How it works", style = MaterialTheme.typography.titleMedium, color = OnDark)
                        Row { Text("⚡ Action Strength   ", style = MaterialTheme.typography.labelLarge, color = OnDark); Text("Completion of planned daily actions", style = MaterialTheme.typography.bodyMedium, color = SubtleText) }
                        Row { Text("🔥 Habit Rhythm      ", style = MaterialTheme.typography.labelLarge, color = OnDark); Text("Stability of your supportive habits", style = MaterialTheme.typography.bodyMedium, color = SubtleText) }
                        Row { Text("📓 Reflection Depth  ", style = MaterialTheme.typography.labelLarge, color = OnDark); Text("Quality of journaling & evening reflections", style = MaterialTheme.typography.bodyMedium, color = SubtleText) }
                        Row { Text("🎯 Clarity Structure ", style = MaterialTheme.typography.labelLarge, color = OnDark); Text("Quality of intentions, milestones & planning", style = MaterialTheme.typography.bodyMedium, color = SubtleText) }
                    }
                }
                Spacer(Modifier.height(32.dp))
            }
        }
    }
}
