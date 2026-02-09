package com.example.ai_assistant

import android.content.Context
import org.tensorflow.lite.Interpreter
import org.tensorflow.lite.flex.FlexDelegate
import java.io.FileInputStream
import java.nio.MappedByteBuffer
import java.nio.channels.FileChannel

/**
 * Repository for ML operations
 * 
 * Handles reading TFLite models and performing real inference.
 */
class MLRepository(private val context: Context) {
    private var interpreter: Interpreter? = null

    init {
        try {
            val options = Interpreter.Options()
            // Required for TextVectorization/SELECT_TF_OPS
            options.addDelegate(FlexDelegate())
            interpreter = Interpreter(loadModelFile(), options)
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    private fun loadModelFile(): MappedByteBuffer {
        val fileDescriptor = context.assets.openFd("financial_model.tflite")
        val inputStream = FileInputStream(fileDescriptor.fileDescriptor)
        val fileChannel = inputStream.channel
        val startOffset = fileDescriptor.startOffset
        val declaredLength = fileDescriptor.declaredLength
        return fileChannel.map(FileChannel.MapMode.READ_ONLY, startOffset, declaredLength)
    }

    suspend fun analyzeMessage(message: String): Map<String, Any> {
        val interpreter = this.interpreter 
            ?: return mapOf("error" to "ML Engine not initialized (check assets)")

        // Input shape in our Keras model: [batch, 1] string
        val inputs = arrayOf(arrayOf(message))
        
        // Output shape in our Keras model: [batch, 4] float
        val outputs = Array(1) { FloatArray(4) }

        try {
            interpreter.run(inputs, outputs)
        } catch (e: Exception) {
            return mapOf("error" to "Inference failed: ${e.message}")
        }

        val probabilities = outputs[0]
        val labels = listOf("fraud", "payment", "alert", "info")
        val maxIndex = probabilities.indices.maxByOrNull { probabilities[it] } ?: -1
        val intent = if (maxIndex != -1) labels[maxIndex] else "unknown"
        val confidenceValue = if (maxIndex != -1) probabilities[maxIndex] else 0f

        // Risk Mapping Logic
        val riskLevel = when (intent) {
            "fraud" -> if (confidenceValue > 0.8) "critical" else "high"
            "alert" -> "medium"
            "payment" -> "low"
            else -> "low"
        }

        return mapOf(
            "sentiment" to "neutral", // TFLite model could be expanded for sentiment
            "intent" to intent,
            "riskLevel" to riskLevel,
            "confidence" to if (confidenceValue > 0.75) "high" else "medium",
            "detectedKeywords" to emptyList<String>(),
            "isLocal" to true,
            "model" to "TFLite Real Engine",
            "confidenceScore" to confidenceValue
        )
    }

    fun isAvailable(): Boolean = interpreter != null
}
