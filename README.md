# fcm_notification

[手順]

1. Firebaseプロジェクトの作成　：　内容について前回参照したUdemyの内容をもう一度確認する(Firebaseの連携のところ)　証跡をエクセルに保存。

FlutterFire : https://firebase.flutter.dev/docs/overview
   
   → fcmnotificationプロジェクトを作成
   
   → FlutterFireを検索。手順に従ってアプリとFirebaseを連携。
   
   ※ 初回のfirebase configのところでfirebase_options.dartが作成されなかったが、もう一度firebase configを実施すると作成された。
   
   → 一通りの手順が完了したらflutter cleanを実行してからビルド。
   
   → Androidのビルドでうまくいかずにエラーが出て四苦八苦していたが、修正完了。以下のYoutubeを参考に修正。
   
   https://www.youtube.com/watch?v=54vgoPgB8xE
     

2. Firebaseの認証およびFCMの設定。WebSocketについても確認。　youtubeで内容の確認。

> Websocket

ブラウザとwebサーバー双方間でリアルタイムに通信を行うためのプロトコル。
今までのHTTPプロトコルではSNSなどの普及によるリアルタイムな更新に適しておらずWebSocketの通信規格を利用することが増えた。
WebSocketではHTTPの弱点であるリクエストがクライアント側しか送れない、一つのコネクションで一つのリクエストしか返せない点を克服している。

3. サンプルでUIの構築・作成。試しにアプリの起動画面から作成してみる。実際に通知を受け取るトップページはとりあえずなんでもいい。

4. 
