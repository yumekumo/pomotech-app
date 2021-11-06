# Pomotech
Pomotechは、ポモドーロ・タイマーを導入したタスク管理アプリです。  
25分の作業と5分の休息を1セットとし、それを繰り返すことで作業の効率を上げることができます。  
また、一日や一週間の作業量をセット数で記録することで、作業量を可視化します。

## Webサイト
https://pomo-tech.herokuapp.com/  
<br>
テスト用アカウント  
Email : test@gmail.com  
Password : password  

## 製作背景
ポモドーロ・タイマーは研究等で日頃から利用しており、どの作業を何セット行ったかの記録を付けたかったため、利便性の高いWebアプリとして製作を行いました。

## 使用例
https://user-images.githubusercontent.com/59229602/139516330-9445ef6d-f340-4cce-9d53-6faf0ac01235.mov

詳しい使い方については、アプリケーション内の[infoページ](https://pomo-tech.herokuapp.com/info)を確認してください。

## 機能一覧
- ユーザ登録・ログイン機能
- プロフィール画像投稿機能
- タスクのCRUD機能
- タスクの状態(未完了・完了)分類機能
- ポモドーロ・タイマー機能
- タスク実施回数(セット)のカウント機能
- タスク実施回数の日，週，月ごとの集計機能

## 工夫した点
- タスクの未完了・完了を分類する事で、今やるべきタスクが一目でわかる。また、完了したタスクに項目が並ぶ事で、達成感を得られるようにした。
- ポモドーロ・タイマーとタスク管理機能を組み合わせる事で、作業量をセット数で可視化できるようにした。
- アクセス制限を実装し、他ユーザのタスクは確認できないようになっている。
- レイアウトをBootstrapで作成し、オリジナルのCSSは最小限にする事で保守性を高めた。
- Herokuのフリープランでは画像の保存ができなかったため、ストレージサービスのAmazon S3を用いて画像の保存を可能にした。

## 開発環境
- OS : macOS (Big Sur)
- 言語 : HTML, CSS, JavaScript, Ruby 2.6.6
- フレームワーク : Ruby on Rails 5.2.6
- ライブラリ : ImageMagick 7.0.11
- ストレージ：Amazon S3
- デプロイ先 : Heroku