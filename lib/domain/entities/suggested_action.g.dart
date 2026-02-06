// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggested_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuggestedActionImpl _$$SuggestedActionImplFromJson(
  Map<String, dynamic> json,
) => _$SuggestedActionImpl(
  title: json['title'] as String,
  description: json['description'] as String,
  isUrgent: json['isUrgent'] as bool? ?? false,
  safeAlternative: json['safeAlternative'] as String?,
);

Map<String, dynamic> _$$SuggestedActionImplToJson(
  _$SuggestedActionImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'isUrgent': instance.isUrgent,
  'safeAlternative': instance.safeAlternative,
};
