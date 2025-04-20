import 'package:json_annotation/json_annotation.dart';

part 'notification_topic_request_body.g.dart';

@JsonSerializable()
class NotificationTopicRequestBody {
  NotificationTopicRequestBody({required this.message});

  final MessageBody message;

  Map<String, dynamic> toJson() => _$NotificationTopicRequestBodyToJson(this);
}

@JsonSerializable()
class MessageBody {
  MessageBody({required this.topic, required this.notification});

  final String topic;
  final NotificationBody notification;

  Map<String, dynamic> toJson() => _$MessageBodyToJson(this);
}

@JsonSerializable()
class NotificationBody {
  NotificationBody({required this.title, required this.body});

  final String title;
  final String body;

  Map<String, dynamic> toJson() => _$NotificationBodyToJson(this);
}
