package com.manifestai.app.ui.screens

import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Check
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.*
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.*
import com.manifestai.app.model.ActionType
import com.manifestai.app.model.DailyAction
import com.manifestai.app.ui.components.*
import com.manifestai.app.ui.theme.*
import com.manifestai.app.viewmodel.ManifestViewModel

@Composable
fun ActionEngineScreen(viewModel: ManifestViewModel, onBack: () -> Unit) {
    val state by viewModel.uiState.collectAsState()

    GradientBackground {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .statusBarsPadding()
                .navigationBarsPadding(),
        ) {
            ManifestTopBar("⚡ Action Engine", onBack)

            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .verticalScroll(rememberScrollState())
                    .padding(horizontal = 24.dp),
            ) {
                Spacer(Modifier.height(4.dp))

                // Summary
                val done  = state.todayActions.count { it.isCompleted }
                val total = state.todayActions.size
                GlassCard(modifier = Modifier.fillMaxWidth()) {
                    Row(
                        modifier          = Modifier.padding(20.dp),
                        verticalAlignment = Alignment.CenterVertically,
                    ) {
                        ScoreRing(
                            score       = if (total == 0) 0 else done * 100 / total,
                            size        = 80.dp,
                            strokeWidth = 7.dp,
                            color       = AuroraMint,
                        )
                        Spacer(Modifier.width(20.dp))
                        Column {
                            Text("Today's Actions", style = MaterialTheme.typography.titleMedium, color = OnDark)
                            Spacer(Modifier.height(4.dp))
                            Text(
                                "$done of $total completed",
                                style = MaterialTheme.typography.bodyMedium,
                                color = SubtleText,
                            )
                            Spacer(Modifier.height(6.dp))
                            LinearProgressIndicator(
                                progress  = { if (total == 0) 0f else done.toFloat() / total },
                                modifier  = Modifier
                                    .width(160.dp)
                                    .height(6.dp)
                                    .clip(RoundedCornerShape(50)),
                                color     = AuroraMint,
                                trackColor = AuroraMint.copy(alpha = 0.2f),
                            )
                        }
                    }
                }

                Spacer(Modifier.height(24.dp))

                Text("Today's Action Plan", style = MaterialTheme.typography.titleMedium, color = OnDark)
                Spacer(Modifier.height(12.dp))

                state.todayActions.forEach { action ->
                    ActionItem(
                        action  = action,
                        onToggle = { viewModel.toggleActionComplete(action.id) },
                    )
                    Spacer(Modifier.height(10.dp))
                }

                Spacer(Modifier.height(24.dp))
            }
        }
    }
}

@Composable
private fun ActionItem(action: DailyAction, onToggle: () -> Unit) {
    val accent = when (action.type) {
        ActionType.MICRO_HABIT  -> AuroraMint
        ActionType.SKILL_REP    -> StarGold
        ActionType.BEHAVIORAL   -> CosmicPurple
        ActionType.IDENTITY     -> SoftLavender
    }

    GlassCard(modifier = Modifier.fillMaxWidth()) {
        Row(
            modifier          = Modifier.padding(16.dp),
            verticalAlignment = Alignment.CenterVertically,
        ) {
            // Checkbox
            Box(
                modifier = Modifier
                    .size(32.dp)
                    .clip(CircleShape)
                    .background(if (action.isCompleted) AuroraMint else CardSurface)
                    .border(1.5.dp, if (action.isCompleted) AuroraMint else SubtleText, CircleShape)
                    .clickable(onClick = onToggle),
                contentAlignment = Alignment.Center,
            ) {
                if (action.isCompleted) {
                    Icon(Icons.Default.Check, contentDescription = "Done", tint = DeepIndigo, modifier = Modifier.size(18.dp))
                }
            }

            Spacer(Modifier.width(14.dp))

            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text  = action.title,
                    style = MaterialTheme.typography.bodyLarge,
                    color = if (action.isCompleted) SubtleText else OnDark,
                )
                Spacer(Modifier.height(4.dp))
                Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                    CategoryChip("", action.type.label, accent)
                    action.durationMinutes?.let {
                        CategoryChip("⏱", "${it}m", SubtleText)
                    }
                }
            }
        }
    }
}
