package com.example.ai_assistant

import android.content.Context
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch

/**
 * ViewModel for managing ML analysis state
 * 
 * Uses StateFlow to emit updates to the main plugin/UI layer.
 * Manages CoroutineScope for background execution.
 */
class MLAnalyzerViewModel(
    private val context: Context,
    private val repository: MLRepository = MLRepository(context)
) {
    // StateFlow for analysis results
    private val _analysisState = MutableStateFlow<Map<String, Any>?>(null)
    val analysisState: StateFlow<Map<String, Any>?> = _analysisState.asStateFlow()

    private val scope = CoroutineScope(Dispatchers.Default)

    fun analyze(message: String) {
        scope.launch {
            try {
                val result = repository.analyzeMessage(message)
                _analysisState.emit(result)
            } catch (e: Exception) {
                _analysisState.emit(mapOf("error" to (e.message ?: "Unknown error")))
            }
        }
    }

    fun isAvailable(): Boolean = repository.isAvailable()
}
