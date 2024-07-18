import 'package:tomiru_social_flutter/features/notification/domain/models/notification_model.dart';

abstract class NotificationServiceInterface {
  Future<List<NotificationModel>?> getList();
  void saveSeenNotificationCount(int count);
  int? getSeenNotificationCount();
  List<int> getNotificationIdList();
  void addSeenNotificationIdList(List<int> notificationList);
}
