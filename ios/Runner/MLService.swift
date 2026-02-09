import Foundation
import NaturalLanguage

/// Service for ML operations
///
/// Handles reading Core ML models and performing real inference.
class MLService {
    
    // In a real iOS project, you would drag the .mlmodel (converted from .tflite) 
    // and it would generate a class. Using NLModel for dynamic loading.
    private var model: NLModel?
    
    init() {
        // Attempt to load the financial model if it exists in the bundle
        if let modelURL = Bundle.main.url(forResource: "FinancialModel", withExtension: "mlmodelc") {
            try? self.model = NLModel(contentsOf: modelURL)
        }
    }
    
    func analyzeMessage(_ message: String) -> [String: Any] {
        guard let model = self.model else {
            // Fallback to basic natural language analysis if model not found
            return performHeuristicFallback(message)
        }
        
        let prediction = model.predictedLabel(for: message)
        
        // Map native labels to project intents
        let intent = prediction ?? "info"
        
        // Define risk level based on intent and model confidence logic
        let riskLevel: String
        switch intent {
        case "fraud": riskLevel = "high"
        case "alert": riskLevel = "medium"
        default: riskLevel = "low"
        }
        
        return [
            "sentiment": "neutral", // NLModel can have sub-models for sentiment
            "intent": intent,
            "riskLevel": riskLevel,
            "confidence": "high", // NLModel prediction is usually high confidence if label exists
            "detectedKeywords": [],
            "isLocal": true,
            "model": "CoreML / NaturalLanguage Real Engine"
        ]
    }
    
    private func performHeuristicFallback(_ message: String) -> [String: Any] {
        // Improved heuristics for when the model file is not yet deployed to the bundle
        let lower = message.lowercased()
        let isFraud = lower.contains("urgente") || lower.contains("link") || lower.contains("senha")
        
        return [
            "sentiment": "neutral",
            "intent": isFraud ? "fraud" : "info",
            "riskLevel": isFraud ? "high" : "low",
            "confidence": "medium",
            "detectedKeywords": [],
            "isLocal": true,
            "model": "iOS Heuristic Fallback (Waiting for .mlmodel deployment)",
            "warning": "Arquivo FinancialModel.mlmodelc não encontrado nos assets do iOS"
        ]
    }
    
    func isAvailable() -> Bool {
        return model != nil
    }
}
