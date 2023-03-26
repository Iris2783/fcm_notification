import 'package:fcm_notification/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  //FlutterFireの公式ページからコピペ。以下のコードでfirebaseと連携している
  WidgetsFlutterBinding.ensureInitialized(); //WidgetFlutterBindingクラスをensureInitializedメソッドで初期化している　Firebaseとの連携では必須の初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); //プラットフォームに即したオプションを自動で設定するためにFirebase SDKを初期化している

  FirebaseMessaging messaging = FirebaseMessaging.instance; //Firabasemessageインスタンスを作成。FCMサービスにアクセスするために使用される。

  NotificationSettings settings = await messaging.requestPermission(
    //ユーザーがアプリケーションで通知を許可してもらう際の設定を記載している。FCMを使用してモバイルアプリで通知を受信するための設定。
    alert: true, //新しい通知がきたときにアラートを表示させるかどうか
    announcement: false, //スクリーンリーダーに通知のアナウンスを行うかどうか
    badge: true, //通知が来たときにアプリアイコンのバッジに数値を表示するかどうか
    carPlay: false, //CarPlay上での通知の表示を許可するかどうか
    criticalAlert: false, //重要な通知を表示することができるかどうか
    provisional: false, //仮想通知を許可するかどうか 仮想通知はアプリがまだインストールされていない場合に表示される
    sound: true, //通知が届いたときにサウンドを再生するかどうか
  );

  print('User granted permission: ${settings.authorizationStatus}');
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
