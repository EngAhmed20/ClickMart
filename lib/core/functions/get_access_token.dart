import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;
import '../constant/app_string.dart';

class NotificationsHelper {
  // creat instance of fbm
  final _firebaseMessaging = FirebaseMessaging.instance;

  // initialize notifications for this app or device
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    // get device token
    String? deviceToken = await _firebaseMessaging.getToken();
    DeviceToken = deviceToken!;
    print(
        "===================Device FirebaseMessaging Token====================");
    print(deviceToken);
    print(
        "===================Device FirebaseMessaging Token====================");
  }

  // handle notifications when received
  void handleMessages(RemoteMessage? message) {
    if (message != null) {
      // navigatorKey.currentState?.pushNamed(NotificationsScreen.routeName, arguments: message);

    }
  }

  // handel notifications in case app is terminated
  void handleBackgroundNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then((handleMessages));
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessages);
  }

  Future<String?> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "ecommerce-php-96f36",
      "private_key_id": "07caec60f3ceb524924772483f67cd1a623d535e",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCVg70X5GWFeFFj\n4Dk3+3Skabj0Szlp6FesMzjLTCTBg1/XenINIrnwB19Lg0tjtojRN90UdREdpGDo\nxD7K+9Kt97QIyDJT5rS6KxZt09WpqXyAeNKIQbD9oGCnZjycGq0JFUlrshQLqzA+\n5Ovwed2ZcmMC2/5SZ5V4ALP4W4IAjwujUIBEnXSAhSMRyWmvQpUXx+IJkBPMp9XJ\nqu1G09SyvD8M+DtfYS3S6d9VM1weCcdVs9FhqXTAKscI8aNPkshNshmuKZT6eSSa\nXjea2p5d2q69y0BrxtzHs1r9rifhvHg+pA11qHY1j6H9QLheMH0Z/dz89Bwy/MGt\n0wuVDtgLAgMBAAECggEABsr08NxyFlXIkNqTju0QOBYLjqHKSnsBXLP5DRd5Bgez\nd4U7IEinHPYgyLv+1VlqLuM0WqUU8X1R39Fmru8w+7FozwtVagVtyZWCj9vTdcFb\nBDU5D3K4mVVLft+AunDl0qdSbh+plHwjFYBuDb9jp4CQagVXsSO+oTSa+JojtmW3\niynxhXPiiqBSRQmqO/EdTYtGPPeSYgsKXWE0zgX44XFkBeRhclXrgG50Bfe3JC6P\nmeFtdTGEbzIRzIdO1zhPUI5DLaZLkDC95SNqj06HAQHEnYVPaYHWiH75Go+3gj4u\nxBR/nKwNvMkBIuKLRvEezksRoJ+oSGq1pMnlSwzBCQKBgQDN9daFvIZjYaC6+nrj\nNO7BtXbVRyh3vhUapw4W+DozyN4vTwThNkc3EP3dF4ueK8AhiRcdOq+PtrjrWu6S\ntCkZCXJG+8/O6sDNmgXIMj5hcfbP8JIEsA2KhCBNT30EsFzWn1iBpiJqdGWS3WkW\nKrFlcAUNX1ldg7fmxGLjulvqWQKBgQC51yJO15XBlwP4M9trjregFZ4P4HhuZIPS\nWy4f13Qbe5O8faWvTadTdGqdkTSbm2OsubzJl+keMa6lKUCi8IStxgbXpeLY+lQJ\n+afGqEUHhquhTWxlZ8mnWoeyHFhsaCAMunwFdIBhDwoq/aaGsHl7iPeSNe7s7zzE\nmcakhv7BAwKBgQCjbKhV4eu4u+SvuMT9uCijJ/ws65OewAM67MdvTnPQV1iFrWuv\n0EPd2+u0HVS5ovmHIqJmnQRlQpWkmrinS7E4nphA3tpb00Y9XjOsUMHSzH0NLlSO\nx6tW99QxxBrtN4vS+QlfhpXUZpuaV3llD2dHmAVKQRhF7Zhk0futu1fnsQKBgFlr\naLijBw3lSiWtXhC81SIUBMAC9C+58avP77umgdmPdqClnIljRfXj+EDk03lkJWvA\n21Ps4mCC61PRK6a7MDwlIrm0uhhJKxK5q77szHo4lHDCvjt02xTJfK148hsHZxR4\nzqAZVIRfJjdVYUFBvNJyLx2NEe+zlXvLukcEJaRdAoGBAMIb1f0bzpuqMMMy73vo\nH7EGNVclhhiSI/x1L/CVwV9UqHD/J4FFI73p+aC0Z1DgAlhIZie7HhYKWBhaUtnl\nJN3XX9/pEKpRUC7qSJGVdkhSYkn9abqMTMarSAGb2HZhLdXRRVe/Le/+FiO9qt/x\nFRGORkYV9qIKzzFdrUVoAm6h\n-----END PRIVATE KEY-----\n",
      "client_email": "firebase-adminsdk-nhgoe@ecommerce-php-96f36.iam.gserviceaccount.com",
      "client_id": "115438132813550995351",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-nhgoe%40ecommerce-php-96f36.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"

    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    try {
      http.Client client = await auth.clientViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

      auth.AccessCredentials credentials =
      await auth.obtainAccessCredentialsViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
          scopes,
          client);

      client.close();
      print(
          "Access Token: ${credentials.accessToken.data}"); // Print Access Token
      return credentials.accessToken.data;
    } catch (e) {
      print("Error getting access token: $e");
      return null;
    }
  }

  Map<String, dynamic> getBody({
    required String fcmToken,
    required String title,
    required String body,
    required String userId,
    String? type,
  }) {
    return {
      "message": {
        "token": fcmToken,
        "notification": {"title": title, "body": body},
        "android": {
          "notification": {
            "notification_priority": "PRIORITY_MAX",
            "sound": "default"
          }
        },
        "apns": {
          "payload": {
            "aps": {"content_available": true}
          }
        },
        "data": {
          "type": type,
          "id": userId,
          "click_action": "FLUTTER_NOTIFICATION_CLICK"
        }
      }
    };
  }

  Future<void> sendNotifications({
    required String fcmToken,
    required String title,
    required String body,
    required String userId,
    String? type,
  }) async {
    try {
      var serverKeyAuthorization = await getAccessToken();

      // change your project id
      const String urlEndPoint =
          "https://fcm.googleapis.com/v1/projects/(YourProjectId)/messages:send";

      Dio dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $serverKeyAuthorization';

      var response = await dio.post(
        urlEndPoint,
        data: getBody(
          userId: userId,
          fcmToken: fcmToken,
          title: title,
          body: body,
          type: type ?? "message",
        ),
      );

      // Print response status code and body for debugging
      print('Response Status Code: ${response.statusCode}');
      print('Response Data: ${response.data}');
    } catch (e) {
      print("Error sending notification: $e");
    }
  }
}