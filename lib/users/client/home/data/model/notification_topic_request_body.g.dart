// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_topic_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$NotificationTopicRequestBodyToJson(
  NotificationTopicRequestBody instance,
) => <String, dynamic>{'message': instance.message};

Map<String, dynamic> _$MessageBodyToJson(MessageBody instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'notification': instance.notification,
    };

Map<String, dynamic> _$NotificationBodyToJson(NotificationBody instance) =>
    <String, dynamic>{'title': instance.title, 'body': instance.body};
