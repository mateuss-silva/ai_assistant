package com.example.ai_assistant

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        // Register ML Analyzer Plugin
        MLAnalyzerPlugin.registerWith(flutterEngine, this)
    }
}
