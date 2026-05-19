package com.manifestai.app.navigation

import androidx.compose.runtime.*
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavHostController
import androidx.navigation.compose.*
import com.manifestai.app.ui.screens.*
import com.manifestai.app.viewmodel.ManifestViewModel

sealed class Screen(val route: String) {
    object Onboarding   : Screen("onboarding")
    object Home         : Screen("home")
    object ActionEngine : Screen("action_engine")
    object Habits       : Screen("habits")
    object Alignment    : Screen("alignment")
    object Journal      : Screen("journal")
}

@Composable
fun ManifestAINavHost(
    navController: NavHostController = rememberNavController(),
    viewModel: ManifestViewModel = viewModel(),
) {
    val uiState by viewModel.uiState.collectAsState()

    val start = if (uiState.onboardingComplete) Screen.Home.route else Screen.Onboarding.route

    NavHost(navController = navController, startDestination = start) {

        composable(Screen.Onboarding.route) {
            OnboardingScreen(
                onFinish = { belief ->
                    viewModel.setBeliefSystem(belief)
                    viewModel.completeOnboarding()
                    navController.navigate(Screen.Home.route) {
                        popUpTo(Screen.Onboarding.route) { inclusive = true }
                    }
                }
            )
        }

        composable(Screen.Home.route) {
            HomeScreen(
                viewModel  = viewModel,
                onNavigate = { route -> navController.navigate(route) }
            )
        }

        composable(Screen.ActionEngine.route) {
            ActionEngineScreen(
                viewModel = viewModel,
                onBack    = { navController.popBackStack() }
            )
        }

        composable(Screen.Habits.route) {
            HabitsScreen(
                viewModel = viewModel,
                onBack    = { navController.popBackStack() }
            )
        }

        composable(Screen.Alignment.route) {
            AlignmentScreen(
                viewModel = viewModel,
                onBack    = { navController.popBackStack() }
            )
        }

        composable(Screen.Journal.route) {
            JournalScreen(
                viewModel = viewModel,
                onBack    = { navController.popBackStack() }
            )
        }
    }
}
