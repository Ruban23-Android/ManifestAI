package com.manifestai.app

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import com.manifestai.app.navigation.ManifestAINavHost
import com.manifestai.app.ui.theme.ManifestAITheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            ManifestAITheme {
                ManifestAINavHost()
            }
        }
    }
}
