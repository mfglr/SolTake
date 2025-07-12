import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/notification_endpoints.dart';
import 'package:my_social_app/models/notification.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/entity_state/pagination_state/page.dart';

class NotificationService{
  final AppClient _appClient;
  
  const NotificationService._(this._appClient);
  static final NotificationService _singleton = NotificationService._(AppClient());
  factory NotificationService() => _singleton;

  Future<void> markNotificationsAsViewed(Iterable<num> ids) =>
    _appClient
      .put(
        "$notificationController/$markNotificationsAsViewedEndpoint",
        body: { 'ids': ids }
      );
  
  Future<Iterable<Notification>> getUnviewedNotifications() =>
    _appClient
      .get("$notificationController/$getUnviewedNotificationsEndpoint")
      .then((json) => json as List)
      .then((list) => list.map((item) => Notification.fromJson(item)));

  Future<Iterable<Notification>> getNotifications(Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$notificationController/$getNotificationsEndpoint",page))
      .then((json) => json as List)
      .then((list) => list.map((item) => Notification.fromJson(item)));
}