import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggested_action.freezed.dart';
part 'suggested_action.g.dart';

/// Represents a suggested action for the user based on message analysis
@freezed
class SuggestedAction with _$SuggestedAction {
  const factory SuggestedAction({
    required String title,
    required String description,
    @Default(false) bool isUrgent,
    String? safeAlternative,
  }) = _SuggestedAction;

  factory SuggestedAction.fromJson(Map<String, dynamic> json) =>
      _$SuggestedActionFromJson(json);
}

/// Predefined safe actions
class SafeActions {
  static const doNotClickLinks = SuggestedAction(
    title: 'Não clique em links',
    description: 'Acesse o aplicativo oficial do seu banco diretamente.',
    isUrgent: true,
    safeAlternative:
        'Use o app oficial ou ligue para a central de atendimento.',
  );

  static const verifySource = SuggestedAction(
    title: 'Verifique a origem',
    description: 'Confirme se a mensagem veio de um canal oficial.',
    isUrgent: false,
    safeAlternative: 'Compare o número ou email com os canais oficiais.',
  );

  static const ignoreMessage = SuggestedAction(
    title: 'Pode ignorar',
    description: 'Mensagem parece segura e informativa.',
    isUrgent: false,
  );

  static const reportFraud = SuggestedAction(
    title: 'Denuncie como fraude',
    description: 'Esta mensagem tem características de golpe.',
    isUrgent: true,
    safeAlternative: 'Bloqueie o remetente e denuncie ao seu banco.',
  );
}
