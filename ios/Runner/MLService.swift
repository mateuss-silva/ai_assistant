import Foundation

/// Service for ML operations
///
/// Handles reading Core ML models and performing inference.
/// Currently simulates inference with heuristics logic.
class MLService {
    
    func analyzeMessage(_ message: String) -> [String: Any] {
        // Simulating processing time if needed, but synchronous for now
        // In real Core ML, prediction is often synchronous but heavy
        
        let lowerMessage = message.lowercased()
        
        // --- Heuristic Logic (Placeholder for Core ML) ---
        // In a real app:
        // 1. Create NLModel / VNCoreMLRequest
        // 2. Perform request
        // 3. Process VSClassificationObservation
        
        // Fraud-related keywords
        let fraudKeywords = [
            "urgente", "imediato", "confirme", "clique", "link",
            "senha", "suspeita", "atualizar dados", "verificar conta",
            "prazo", "expira", "bloqueado", "regularize"
        ]
        // Payment-related keywords
        let paymentKeywords = [
            "pagamento", "pix", "transferência", "boleto", "fatura",
            "débito", "crédito", "parcela", "vencimento", "qr code"
        ]
        // Alert keywords
        let alertKeywords = [
            "alerta", "aviso", "atenção", "detectamos", "notificação",
            "importante", "informamos", "comunicado"
        ]
        
        var fraudScore = 0
        var paymentScore = 0
        var alertScore = 0
        var detectedKeywords: [String] = []
        
        for keyword in fraudKeywords {
            if lowerMessage.contains(keyword) { fraudScore += 1; detectedKeywords.append(keyword) }
        }
        for keyword in paymentKeywords {
            if lowerMessage.contains(keyword) { paymentScore += 1; detectedKeywords.append(keyword) }
        }
        for keyword in alertKeywords {
            if lowerMessage.contains(keyword) { alertScore += 1; detectedKeywords.append(keyword) }
        }
        
        // Intent
        let intent: String
        if fraudScore >= 2 { intent = "fraud" }
        else if paymentScore > 0 { intent = "payment" }
        else if alertScore > 0 { intent = "alert" }
        else { intent = "info" }
        
        // Risk Level
        let riskLevel: String
        if fraudScore >= 3 { riskLevel = "critical" }
        else if fraudScore >= 2 { riskLevel = "high" }
        else if fraudScore >= 1 || alertScore >= 2 { riskLevel = "medium" }
        else { riskLevel = "low" }
        
        // Confidence
        let totalKeywords = detectedKeywords.count
        let confidence: String
        if totalKeywords >= 4 { confidence = "high" }
        else if totalKeywords >= 2 { confidence = "medium" }
        else { confidence = "low" }
        
        // Sentiment
        let negativeWords = ["suspeita", "urgente", "problema", "bloqueado", "negado", "irregular"]
        let positiveWords = ["aprovado", "sucesso", "confirmado", "liberado"]
        
        let negScore = negativeWords.filter { lowerMessage.contains($0) }.count
        let posScore = positiveWords.filter { lowerMessage.contains($0) }.count
        
        let sentiment: String
        if negScore > posScore { sentiment = "negative" }
        else if posScore > negScore { sentiment = "positive" }
        else { sentiment = "neutral" }
        
        return [
            "sentiment": sentiment,
            "intent": intent,
            "riskLevel": riskLevel,
            "confidence": confidence,
            "detectedKeywords": detectedKeywords,
            "isLocal": true,
            "model": "Core ML (Simulated)"
        ]
    }
}
