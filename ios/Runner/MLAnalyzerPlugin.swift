import Flutter
import Foundation
import Combine

/// Native ML Analyzer Plugin for iOS
///
/// Acts as the View layer in MVVM architecture.
/// Binds MethodChannel inputs to ViewModel commands.
/// Binds ViewModel Published outputs to MethodChannel/EventChannel results.
class MLAnalyzerPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {
    
    static let channelName = "com.ai_assistant/ml_analyzer"
    static let eventChannelName = "com.ai_assistant/ml_events"
    
    private let viewModel = MLAnalyzerViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    // For single-response methods
    private var pendingResult: FlutterResult?
    // For stream events
    private var eventSink: FlutterEventSink?
    
    static func register(with messenger: FlutterBinaryMessenger) {
        let instance = MLAnalyzerPlugin()
        
        // Register MethodChannel
        let channel = FlutterMethodChannel(name: channelName, binaryMessenger: messenger)
        channel.setMethodCallHandler(instance.handle)
        
        // Register EventChannel
        let eventChannel = FlutterEventChannel(name: eventChannelName, binaryMessenger: messenger)
        eventChannel.setStreamHandler(instance)
        
        instance.observeViewModel()
    }
    
    static func register(with registrar: FlutterPluginRegistrar) {
        // Compatibility helper if needed, but main entry point is typically register(with messenger)
        // for modern Flutter iOS plugins or AppDelegate registration.
        // We reuse the logic by extracting the messenger.
        register(with: registrar.messenger())
    }
    
    private func observeViewModel() {
        viewModel.$analysisState
            .receive(on: RunLoop.main)
            .compactMap { $0 } // Filter out initial nil
            .sink { [weak self] state in
                // Send to pending result (Request-Response pattern)
                if let result = self?.pendingResult {
                    result(state)
                    self?.pendingResult = nil
                }
                
                // Also broadcast to EventChannel (Stream pattern)
                if let sink = self?.eventSink {
                    sink(state)
                }
            }
            .store(in: &cancellables)
    }
    
    func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "analyzeMessage":
            guard let args = call.arguments as? [String: Any],
                  let message = args["message"] as? String else {
                result(FlutterError(code: "INVALID_ARGUMENT", message: "Message is required", details: nil))
                return
            }
            pendingResult = result
            viewModel.analyze(message)
            
        case "isAvailable":
            result(true)
            
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    // --- FlutterStreamHandler Implementation ---
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.eventSink = nil
        return nil
    }
}
