import Foundation
import Combine

/// ViewModel for managing ML analysis state
///
/// Uses ObservableObject and @Published to emit updates.
/// Conformant to iOS MVVM patterns.
class MLAnalyzerViewModel: ObservableObject {
    
    @Published var analysisState: [String: Any]?
    
    private let service = MLService()
    
    func analyze(_ message: String) {
        // Ensure UI updates (if bound to SwiftUI) happen on main thread
        // Also good for Plugin result callback
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let result = self?.service.analyzeMessage(message)
            
            DispatchQueue.main.async {
                self?.analysisState = result
            }
        }
    }
}
