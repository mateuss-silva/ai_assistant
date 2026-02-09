package com.example.ai_assistant

import android.content.Context
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch

/**
 * Native ML Analyzer Plugin for Android
 * 
 * Acts as the View layer in MVVM architecture.
 * Binds MethodChannel inputs to ViewModel commands.
 * Binds ViewModel StateFlow outputs to MethodChannel/EventChannel results.
 */
class MLAnalyzerPlugin private constructor(
    private val context: Context
) : MethodChannel.MethodCallHandler, EventChannel.StreamHandler {

    private val viewModel = MLAnalyzerViewModel(context)
    private val mainScope = CoroutineScope(Dispatchers.Main)
    
    // For single-response methods
    private var pendingResult: MethodChannel.Result? = null

    companion object {
        private const val CHANNEL_NAME = "com.ai_assistant/ml_analyzer"
        private const val EVENT_CHANNEL_NAME = "com.ai_assistant/ml_events"

        fun registerWith(flutterEngine: FlutterEngine, context: Context) {
            val plugin = MLAnalyzerPlugin(context)
            
            // Register MethodChannel
            val methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME)
            methodChannel.setMethodCallHandler(plugin)
            
            // Register EventChannel
            val eventChannel = EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT_CHANNEL_NAME)
            eventChannel.setStreamHandler(plugin)
            
            plugin.observeViewModel()
        }
    }

    private fun observeViewModel() {
        mainScope.launch {
            viewModel.analysisState.collect { state ->
                if (state != null) {
                    // Send to pending result (Request-Response pattern)
                    pendingResult?.success(state)
                    pendingResult = null
                    
                    // Also broadcast to EventChannel (Stream pattern)
                    eventSink?.success(state)
                }
            }
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "analyzeMessage" -> {
                val message = call.argument<String>("message")
                if (message != null) {
                    pendingResult = result
                    viewModel.analyze(message)
                } else {
                    result.error("INVALID_ARGUMENT", "Message is required", null)
                }
            }
            "isAvailable" -> {
                // Now checking the real availability of the engine
                result.success(viewModel.isAvailable())
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    // --- EventChannel Implementation ---
    private var eventSink: EventChannel.EventSink? = null

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
    }
    
    fun dispose() {
        mainScope.cancel()
    }
}
