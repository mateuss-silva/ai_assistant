/// Types of suggested actions for localization
enum SuggestedActionType {
  doNotClickLinks,
  verifySource,
  ignoreMessage,
  reportFraud,
}

/// Represents a suggested action for the user based on message analysis
class SuggestedAction {
  final SuggestedActionType type;
  final String title; // Kept for backward compatibility/default
  final String description; // Kept for backward compatibility/default
  final bool isUrgent;
  final String? safeAlternative; // Kept for backward compatibility/default

  const SuggestedAction({
    required this.type,
    required this.title,
    required this.description,
    this.isUrgent = false,
    this.safeAlternative,
  });

  factory SuggestedAction.fromJson(Map<String, dynamic> json) {
    return SuggestedAction(
      type: SuggestedActionType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => SuggestedActionType.ignoreMessage,
      ),
      title: json['title'] as String,
      description: json['description'] as String,
      isUrgent: json['isUrgent'] as bool? ?? false,
      safeAlternative: json['safeAlternative'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'title': title,
      'description': description,
      'isUrgent': isUrgent,
      'safeAlternative': safeAlternative,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuggestedAction &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          title == other.title &&
          description == other.description &&
          isUrgent == other.isUrgent &&
          safeAlternative == other.safeAlternative;

  @override
  int get hashCode =>
      type.hashCode ^
      title.hashCode ^
      description.hashCode ^
      isUrgent.hashCode ^
      safeAlternative.hashCode;
}

/// Predefined safe actions
class SafeActions {
  static const doNotClickLinks = SuggestedAction(
    type: SuggestedActionType.doNotClickLinks,
    title: 'Não clique em links',
    description: 'Acesse o aplicativo oficial do seu banco diretamente.',
    isUrgent: true,
    safeAlternative:
        'Use o app oficial ou ligue para a central de atendimento.',
  );

  static const verifySource = SuggestedAction(
    type: SuggestedActionType.verifySource,
    title: 'Verifique a origem',
    description: 'Confirme se a mensagem veio de um canal oficial.',
    isUrgent: false,
    safeAlternative: 'Compare o número ou email com os canais oficiais.',
  );

  static const ignoreMessage = SuggestedAction(
    type: SuggestedActionType.ignoreMessage,
    title: 'Pode ignorar',
    description: 'Mensagem parece segura e informativa.',
    isUrgent: false,
  );

  static const reportFraud = SuggestedAction(
    type: SuggestedActionType.reportFraud,
    title: 'Denuncie como fraude',
    description: 'Esta mensagem tem características de golpe.',
    isUrgent: true,
    safeAlternative: 'Bloqueie o remetente e denuncie ao seu banco.',
  );
}
