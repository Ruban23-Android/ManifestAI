package com.manifestai.app.ui.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.*
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.*
import com.manifestai.app.model.BeliefSystem
import com.manifestai.app.ui.components.*
import com.manifestai.app.ui.theme.*

@Composable
fun OnboardingScreen(onFinish: (BeliefSystem) -> Unit) {
    var selected by remember { mutableStateOf<BeliefSystem?>(null) }

    GradientBackground {
        Column(
            modifier                = Modifier
                .fillMaxSize()
                .statusBarsPadding()
                .navigationBarsPadding()
                .padding(horizontal = 24.dp),
            horizontalAlignment     = Alignment.CenterHorizontally,
        ) {
            Spacer(Modifier.height(48.dp))

            Text(
                text  = "✨ ManifestAI",
                style = MaterialTheme.typography.displayLarge,
                color = OnDark,
            )
            Spacer(Modifier.height(8.dp))
            Text(
                text      = "Think · Believe · Execute · Measure",
                style     = MaterialTheme.typography.bodyMedium,
                color     = SubtleText,
                textAlign = TextAlign.Center,
            )

            Spacer(Modifier.height(40.dp))

            Text(
                text      = "Choose your belief system",
                style     = MaterialTheme.typography.titleMedium,
                color     = OnDark,
                textAlign = TextAlign.Center,
            )
            Text(
                text      = "This shapes the tone of your affirmations only — no doctrine, no doctrine.",
                style     = MaterialTheme.typography.bodyMedium,
                color     = SubtleText,
                textAlign = TextAlign.Center,
                modifier  = Modifier.padding(top = 4.dp),
            )

            Spacer(Modifier.height(24.dp))

            LazyVerticalGrid(
                columns               = GridCells.Fixed(3),
                verticalArrangement   = Arrangement.spacedBy(12.dp),
                horizontalArrangement = Arrangement.spacedBy(12.dp),
                modifier              = Modifier.weight(1f),
            ) {
                items(BeliefSystem.values()) { system ->
                    val isSelected = selected == system
                    Surface(
                        modifier = Modifier
                            .aspectRatio(1f)
                            .clip(RoundedCornerShape(16.dp))
                            .clickable { selected = system }
                            .border(
                                width  = if (isSelected) 2.dp else 0.dp,
                                color  = if (isSelected) AuroraMint else Color.Transparent,
                                shape  = RoundedCornerShape(16.dp),
                            ),
                        color = if (isSelected)
                            CardSurface
                        else
                            CardSurface.copy(alpha = 0.5f),
                        shape = RoundedCornerShape(16.dp),
                    ) {
                        Column(
                            modifier            = Modifier
                                .fillMaxSize()
                                .padding(8.dp),
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.Center,
                        ) {
                            Text(text = system.emoji, fontSize = 28.sp)
                            Spacer(Modifier.height(6.dp))
                            Text(
                                text      = system.label,
                                style     = MaterialTheme.typography.labelSmall,
                                color     = if (isSelected) AuroraMint else SubtleText,
                                textAlign = TextAlign.Center,
                            )
                        }
                    }
                }
            }

            Spacer(Modifier.height(24.dp))

            AnimatedVisibility(visible = selected != null) {
                PrimaryButton(
                    text     = "Begin My Journey →",
                    onClick  = { selected?.let(onFinish) },
                    modifier = Modifier.fillMaxWidth(),
                )
            }

            Spacer(Modifier.height(24.dp))
        }
    }
}
