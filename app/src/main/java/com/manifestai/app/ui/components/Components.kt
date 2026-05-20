package com.manifestai.app.ui.components

import androidx.compose.animation.core.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.*
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.*
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.*
import com.manifestai.app.ui.theme.*

@Composable
fun GradientBackground(content: @Composable BoxScope.() -> Unit) {
    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(
                Brush.radialGradient(
                    colors = listOf(CosmicPurple.copy(alpha = 0.35f), DeepIndigo),
                    center = Offset(300f, 200f),
                    radius = 900f,
                )
            ),
        content = content,
    )
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ManifestTopBar(title: String, onBack: (() -> Unit)? = null) {
    TopAppBar(
        title = { Text(title, style = MaterialTheme.typography.titleLarge, color = OnDark) },
        navigationIcon = {
            if (onBack != null) {
                IconButton(onClick = onBack) {
                    Text("←", style = MaterialTheme.typography.titleLarge, color = OnDark)
                }
            }
        },
        colors = TopAppBarDefaults.topAppBarColors(containerColor = Color.Transparent),
    )
}

@Composable
fun GlassCard(modifier: Modifier = Modifier, content: @Composable ColumnScope.() -> Unit) {
    Card(
        modifier  = modifier,
        shape     = RoundedCornerShape(20.dp),
        colors    = CardDefaults.cardColors(containerColor = CardSurface.copy(alpha = 0.85f)),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp),
        content   = content,
    )
}

@Composable
fun CategoryChip(emoji: String, label: String, color: Color) {
    Surface(shape = RoundedCornerShape(50), color = color.copy(alpha = 0.18f)) {
        Row(
            modifier              = Modifier.padding(horizontal = 10.dp, vertical = 4.dp),
            verticalAlignment     = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(4.dp),
        ) {
            if (emoji.isNotEmpty()) Text(emoji, fontSize = 14.sp)
            Text(label, style = MaterialTheme.typography.labelSmall, color = color)
        }
    }
}

@Composable
fun ScoreRing(score: Int, size: Dp = 120.dp, strokeWidth: Dp = 10.dp, color: Color = AuroraMint) {
    val animatedScore by animateIntAsState(
        targetValue   = score,
        animationSpec = tween(1000, easing = EaseOutCubic),
        label         = "scoreAnim",
    )
    Box(contentAlignment = Alignment.Center, modifier = Modifier.size(size)) {
        Canvas(modifier = Modifier.size(size)) {
            val stroke = strokeWidth.toPx()
            val radius = (this.size.minDimension - stroke) / 2
            val arcSize = androidx.compose.ui.geometry.Size(radius * 2, radius * 2)
            val topLeft = Offset(stroke / 2, stroke / 2)
            drawArc(color.copy(alpha = 0.2f), -90f, 360f, false, Stroke(stroke), topLeft, arcSize)
            drawArc(color, -90f, 360f * animatedScore / 100f, false, Stroke(stroke, cap = StrokeCap.Round), topLeft, arcSize)
        }
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            Text("$animatedScore", style = MaterialTheme.typography.titleLarge.copy(fontWeight = FontWeight.Bold), color = color)
            Text("/ 100", style = MaterialTheme.typography.labelSmall, color = SubtleText)
        }
    }
}

@Composable
fun LabeledProgressBar(label: String, value: Int, color: Color = AuroraMint) {
    val animatedValue by animateFloatAsState(
        targetValue   = value / 100f,
        animationSpec = tween(800, easing = EaseOutCubic),
        label         = "progress",
    )
    Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
        Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
            Text(label, style = MaterialTheme.typography.bodyMedium, color = SubtleText)
            Text("$value%", style = MaterialTheme.typography.labelLarge, color = color)
        }
        LinearProgressIndicator(
            progress   = { animatedValue },
            modifier   = Modifier.fillMaxWidth().height(6.dp).clip(RoundedCornerShape(50)),
            color      = color,
            trackColor = color.copy(alpha = 0.15f),
        )
    }
}

@Composable
fun PrimaryButton(text: String, onClick: () -> Unit, modifier: Modifier = Modifier) {
    Button(
        onClick  = onClick,
        modifier = modifier.height(52.dp),
        shape    = RoundedCornerShape(16.dp),
        colors   = ButtonDefaults.buttonColors(containerColor = CosmicPurple, contentColor = Color.White),
    ) {
        Text(text, style = MaterialTheme.typography.labelLarge)
    }
}
