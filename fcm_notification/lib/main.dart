import 'package:fcm_notification/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

//以下のコードはバックグラウンド時に通知を処理する関数　フォアグランド時には36行目のonMessageリスナーが実行され通知がが送られる
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  //FlutterFireの公式ページからコピペ。以下のコードでfirebaseと連携している
  WidgetsFlutterBinding.ensureInitialized(); //WidgetFlutterBindingクラスをensureInitializedメソッドで初期化している　Firebaseとの連携では必須の初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); //プラットフォームに即したオプションを自動で設定するためにFirebase SDKを初期化している

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);//バックグラウンドで受信したFCMを_firebaseMessagingBackgroundHandler関数で処理する記述

  FirebaseMessaging messaging = FirebaseMessaging.instance; //FirebaseMessageインスタンスを作成。FCMサービスにアクセスするために使用される。

  NotificationSettings settings = await messaging.requestPermission(
    //ユーザーがアプリケーションで通知を許可してもらう際の設定を記載している。FCMを使用してモバイルアプリで通知を受信するための設定。
    alert: true, //新しい通知がきたときにアラートを表示させるかどうかの設定
    announcement: false, //スクリーンリーダーに通知のアナウンスを行うかどうかの設定
    badge: true, //通知が来たときにアプリアイコンのバッジに数値を表示するかどうかの設定
    carPlay: false, //CarPlay上での通知の表示を許可するかどうかの設定
    criticalAlert: false, //重要な通知を表示することができるかどうかの設定
    provisional: false, //仮想通知を許可するかどうかの設定 仮想通知はアプリがまだインストールされていない場合に表示される
    sound: true, //通知が届いたときにサウンドを再生するかどうかの設定
  );
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //以下のコードはアプリがフォアグラウンドで実行されている場合に通知を受け取る処理。フォアグラウンドとはアプリを実行している画面の事。
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
