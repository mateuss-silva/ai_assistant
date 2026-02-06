package com.example.ai_assistant

import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow

/**
 * Repository for ML operations
 * 
 * Handles reading TFLite models and performing inference.
 * Currently simulates inference with heuristics logic.
 */
class MLRepository {

    suspend fun analyzeMessage(message: String): Map<String, Any> {
        // Simulating heavy computation or TFLite inference time
        delay(100)
        
        val lowerMessage = message.lowercase()
        
        // --- Heuristic Logic (Placeholder for TFLite) ---
        // In a real app, you would:
        // 1. Tokenize the message
        // 2. Run interpreter.run(input, output)
        // 3. Post-process output logits
        
        // Fraud-related keywords
        val fraudKeywords = listOf(
            "urgente", "imediato", "confirme", "clique", "link", 
            "senha", "suspeita", "atualizar dados", "verificar conta",
            "prazo", "expira", "bloqueado", "regularize"
        )
        // Payment-related keywords
        val paymentKeywords = listOf(
            "pagamento", "pix", "transferência", "boleto", "fatura",
            "débito", "crédito", "parcela", "vencimento", "qr code"
        )
        // Alert keywords
        val alertKeywords = listOf(
            "alerta", "aviso", "atenção", "detectamos", "notificação",
            "importante", "informamos", "comunicado"
        )
        
        var fraudScore = 0
        var paymentScore = 0
        var alertScore = 0
        val detectedKeywords = mutableListOf<String>()

        fraudKeywords.forEach { if (lowerMessage.contains(it)) { fraudScore++; detectedKeywords.add(it) } }
        paymentKeywords.forEach { if (lowerMessage.contains(it)) { paymentScore++; detectedKeywords.add(it) } }
        alertKeywords.forEach { if (lowerMessage.contains(it)) { alertScore++; detectedKeywords.add(it) } }

        // Intent
        val intent = when {
            fraudScore >= 2 -> "fraud"
            paymentScore > 0 -> "payment"
            alertScore > 0 -> "alert"
            else -> "info"
        }

        // Risk Level
        val riskLevel = when {
            fraudScore >= 3 -> "critical"
            fraudScore >= 2 -> "high"
            fraudScore >= 1 || alertScore >= 2 -> "medium"
            else -> "low"
        }

        // Confidence
        val totalKeywords = detectedKeywords.size
        val confidence = when {
            totalKeywords >= 4 -> "high"
            totalKeywords >= 2 -> "medium"
            else -> "low"
        }
        
        // Sentiment (simplified)
        val negativeWords = listOf("suspeita", "urgente", "problema", "bloqueado", "negado")
        val positiveWords = listOf("aprovado", "sucesso", "confirmado", "liberado")
        val negScore = negativeWords.count { lowerMessage.contains(it) }
        val posScore = positiveWords.count { lowerMessage.contains(it) }
        val sentiment = when {
            negScore > posScore -> "negative"
            posScore > negScore -> "positive"
            else -> "neutral"
        }

        return mapOf(
            "sentiment" to sentiment,
            "intent" to intent,
            "riskLevel" to riskLevel,
            "confidence" to confidence,
            "detectedKeywords" to detectedKeywords,
            "isLocal" to true,
            "model" to "TFLite (Simulated)"
        )
    }
}
