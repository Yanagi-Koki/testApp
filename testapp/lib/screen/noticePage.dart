import 'package:flutter/material.dart';

class NoticeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通知'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
           connectToFCM();
          },
          child: Text('FCM接続'),
        ),
      ),
    );
  }
}

  void connectToFCM() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // トークンの取得
    String? token = await messaging.getToken();
    print("FCMトークン: $token");

    // 通知の設定
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('メッセージを受信しました: ${message.messageId}');
      // 通知を表示するコードをここに追加
    });

    // 通知の許可をリクエスト
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('通知が許可されました');
    } else {
      print('通知が許可されませんでした');
    }
  }
}