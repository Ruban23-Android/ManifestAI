package com.manifestai.app.ui.theme

import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp

val DeepIndigo   = Color(0xFF1A1035)
val CosmicPurple = Color(0xFF6B3FA0)
val AuroraMint   = Color(0xFF3ECFB2)
val StarGold     = Color(0xFFF5C842)
val SoftLavender = Color(0xFFCDB4DB)
val DarkSurface  = Color(0xFF241847)
val CardSurface  = Color(0xFF2E1F5E)
val OnDark       = Color(0xFFF1EDFF)
val SubtleText   = Color(0xFF9B8CBF)
val ErrorRed     = Color(0xFFFF6B6B)

private val DarkColors = darkColorScheme(
    primary          = CosmicPurple,
    onPrimary        = Color.White,
    primaryContainer = CardSurface,
    secondary        = AuroraMint,
    onSecondary      = DeepIndigo,
    tertiary         = StarGold,
    background       = DeepIndigo,
    surface          = DarkSurface,
    onBackground     = OnDark,
    onSurface        = OnDark,
    error            = ErrorRed,
)

val ManifestTypography = Typography(
    displayLarge  = TextStyle(fontWeight = FontWeight.Bold,      fontSize = 36.sp, letterSpacing = (-0.5).sp),
    displayMedium = TextStyle(fontWeight = FontWeight.Bold,      fontSize = 28.sp),
    titleLarge    = TextStyle(fontWeight = FontWeight.SemiBold,  fontSize = 22.sp),
    titleMedium   = TextStyle(fontWeight = FontWeight.SemiBold,  fontSize = 18.sp),
    bodyLarge     = TextStyle(fontWeight = FontWeight.Normal,    fontSize = 16.sp, lineHeight = 24.sp),
    bodyMedium    = TextStyle(fontWeight = FontWeight.Normal,    fontSize = 14.sp, lineHeight = 20.sp),
    labelLarge    = TextStyle(fontWeight = FontWeight.Medium,    fontSize = 14.sp, letterSpacing = 0.5.sp),
    labelSmall    = TextStyle(fontWeight = FontWeight.Medium,    fontSize = 11.sp, letterSpacing = 0.8.sp),
)

@Composable
fun ManifestAITheme(content: @Composable () -> Unit) {
    MaterialTheme(
        colorScheme = DarkColors,
        typography  = ManifestTypography,
        content     = content,
    )
}
