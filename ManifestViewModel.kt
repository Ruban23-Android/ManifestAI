package com.manifestai.app.viewmodel

import androidx.lifecycle.ViewModel
import com.manifestai.app.model.*
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update

data class AppUiState(
    val beliefSystem: BeliefSystem            = BeliefSystem.SPIRITUAL,
    val manifestations: List<Manifestation>   = SampleData.manifestations,
    val todayActions: List<DailyAction>       = SampleData.todayActions,
    val habits: List<HabitEntry>              = SampleData.habits,
    val alignmentScore: AlignmentScore        = SampleData.alignmentScore,
    val morningIntention: String              = "",
    val eveningReflection: String             = "",
    val onboardingComplete: Boolean           = false,
)

class ManifestViewModel : ViewModel() {

    private val _uiState = MutableStateFlow(AppUiState())
    val uiState: StateFlow<AppUiState> = _uiState.asStateFlow()

    fun setBeliefSystem(system: BeliefSystem) {
        _uiState.update { it.copy(beliefSystem = system) }
    }

    fun completeOnboarding() {
        _uiState.update { it.copy(onboardingComplete = true) }
    }

    fun toggleActionComplete(actionId: String) {
        _uiState.update { state ->
            val updated = state.todayActions.map { action ->
                if (action.id == actionId) action.copy(isCompleted = !action.isCompleted)
                else action
            }
            state.copy(todayActions = updated)
        }
    }

    fun toggleHabitToday(habitId: String) {
        _uiState.update { state ->
            val updated = state.habits.map { habit ->
                if (habit.id == habitId) {
                    val nowCompleted = !habit.isCompletedToday
                    habit.copy(
                        isCompletedToday = nowCompleted,
                        streak = if (nowCompleted) habit.streak + 1 else maxOf(0, habit.streak - 1),
                    )
                } else habit
            }
            state.copy(habits = updated)
        }
    }

    fun updateMorningIntention(text: String) {
        _uiState.update { it.copy(morningIntention = text) }
    }

    fun updateEveningReflection(text: String) {
        _uiState.update { it.copy(eveningReflection = text) }
    }

    fun todayAffirmation(): String =
        SampleData.affirmations[_uiState.value.beliefSystem]
            ?: "You are becoming wiser and stronger — take your next step."

    fun completedActionsCount(): Int = _uiState.value.todayActions.count { it.isCompleted }
    fun totalActionsCount(): Int     = _uiState.value.todayActions.size
}
