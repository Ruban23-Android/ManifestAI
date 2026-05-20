package com.manifestai.app.viewmodel

import androidx.lifecycle.ViewModel
import com.manifestai.app.model.*
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update

data class AppUiState(
    val beliefSystem: BeliefSystem          = BeliefSystem.SPIRITUAL,
    val manifestations: List<Manifestation> = SampleData.manifestations,
    val todayActions: List<DailyAction>     = SampleData.todayActions,
    val habits: List<HabitEntry>            = SampleData.habits,
    val alignmentScore: AlignmentScore      = SampleData.alignmentScore,
    val morningIntention: String            = "",
    val eveningReflection: String           = "",
    val onboardingComplete: Boolean         = false,
)

class ManifestViewModel : ViewModel() {
    private val _uiState = MutableStateFlow(AppUiState())
    val uiState: StateFlow<AppUiState> = _uiState.asStateFlow()

    fun setBeliefSystem(system: BeliefSystem) = _uiState.update { it.copy(beliefSystem = system) }
    fun completeOnboarding()                  = _uiState.update { it.copy(onboardingComplete = true) }
    fun updateMorningIntention(text: String)  = _uiState.update { it.copy(morningIntention = text) }
    fun updateEveningReflection(text: String) = _uiState.update { it.copy(eveningReflection = text) }

    fun toggleActionComplete(actionId: String) {
        _uiState.update { state ->
            state.copy(todayActions = state.todayActions.map {
                if (it.id == actionId) it.copy(isCompleted = !it.isCompleted) else it
            })
        }
    }

    fun toggleHabitToday(habitId: String) {
        _uiState.update { state ->
            state.copy(habits = state.habits.map {
                if (it.id == habitId) {
                    val done = !it.isCompletedToday
                    it.copy(isCompletedToday = done, streak = if (done) it.streak + 1 else maxOf(0, it.streak - 1))
                } else it
            })
        }
    }

    fun todayAffirmation(): String =
        SampleData.affirmations[_uiState.value.beliefSystem]
            ?: "You are becoming wiser and stronger — take your next step."

    fun completedActionsCount() = _uiState.value.todayActions.count { it.isCompleted }
    fun totalActionsCount()     = _uiState.value.todayActions.size
}
