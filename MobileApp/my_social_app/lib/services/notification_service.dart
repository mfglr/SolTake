import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/notification_endpoints.dart';
import 'package:my_social_app/models/notification.dart';
import 'package:my_social_app/services/app_client.dart';

class NotificationService{
  final AppClient _appClient;

  const NotificationService._(this._appClient);
  static final NotificationService _singleton = NotificationService._(AppClient());
  factory NotificationService() => _singleton;

  Future<void> markNotificationsAsViewed(List<int> ids) async
    => await _appClient.put(
      "$notificationController/$markNotificationsAsViewedEndpoint",
      body: { 'ids': ids }
    );
  
  Future<Iterable<Notification>> getUnviewedNotifications() async{
    String url = "$notificationController/$getUnviewedNotificationsEndpoint";
    final list = (await _appClient.get(url)) as List; 
    return list.map((item) => Notification.fromJson(item));
  }

  Future<Iterable<Notification>> getNotifications({int? lastId,int? take}) async {
    String endpoint = "$notificationController/$getNotificationsEndpoint";
    String url = _appClient.generatePaginationUrl(endpoint, lastId, take);
    final list = (await _appClient.get(url)) as List; 
    return list.map((item) => Notification.fromJson(item));
  }
}