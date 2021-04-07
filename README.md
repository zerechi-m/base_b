# README

## 概要
- 草野球チームの対戦マッチング・試合結果の集計アプリです。
  チームと選手を登録し、アプリ内のメッセージ機能を使用することで他の登録チームから対戦のオファーや
  対戦したいチームに対戦オファーをすることができます。

- 対戦アプリ内ではオーダー作成機能や各個人の打席結果も記載を行うことで個人の打率
  や打点をはじめ、チーム打率なども自動で保管・反映することができます。
  対戦中には相手チームの打撃結果も見ることができるので、より戦術的な野球をすることが可能になります。


## 本番環境

https://base-b.herokuapp.com/

basic認証
- ユーザー名：admin@
- パスワード：2234

ログイン情報（テストユーザー1)
- Email : test@test
- パスワード : 111111

ログイン情報（テストユーザー2）
- Email : test2@test2
- パスワード : 222222

## 製作意図
- 自身が草野球チームに加入していることから、所属しているリーグ外のチームとの対戦が
  行えると週末も有意義に過ごせるのではないかと思い製作を行いました。
- また一打席ずつ記録も保存することができるので、チームの戦歴や自分の通算成績、他チームに所属している各選手の個人成績を
  つけることができます。チーム記録を閲覧して、自分達のレベルにあった相手に対戦申込みができるので、草野球で楽しく熱い週末を過ごすことを
  目的として作成しました。
 
## DEMO

**トップページ**

'![demo](https://raw.github.com/wiki/zerechi-m/base_b/gif/top_page.gif)'

- 登録された草野球チームが一覧に表示されており、各チームをクリックすることで
  メンバー詳細・チーム情報詳細・対戦申し込み画面へ遷移することができる。

**メンバー詳細画面**

'![demo](https://raw.github.com/wiki/zerechi-m/base_b/gif/member.gif)'

- チームに登録された選手の打率や打点、野球部歴を確認することができる。
- チームの情報を閲覧した上で対戦申し込みボタンを押すとメッセージ画面へ遷移する

**メッセージ画面**

'![demo](https://raw.github.com/wiki/zerechi-m/base_b/gif/message.gif)'

- 対戦相手への対戦オファー・メッセージを記載することができる。
  対戦オファーは独自のフォームに「試合予定日・球場・住所」を記載して送信することで、送信相手に「承諾・辞退」のボタンが現れる。
- 承諾ボタンを押すと試合日程画面に遷移し、辞退ボタンを押すとオファー自体が削除される。

**試合日程画面**

'![demo](https://raw.github.com/wiki/zerechi-m/base_b/gif/game.gif)'

- 自チームの試合日程が一覧表示
- 両チームがオーダを作成することで試合開始のボタンが出現する。
- 試合開始ボタンへ遷移後に先攻と後攻を選択して試合開始

**試合中の画面遷移**

- 作成したオーダー順に打席の結果を記載して送信
  送信後に、下記に打席結果が反映されて結果ごとに色を変えています。
- 得点板も結果に同期しており、イニングの点数・ヒット数・エラー数がリアルタイムで反映がされます。
- 対戦相手の打撃結果も閲覧できるので、打者に応じた守備体系を行うことができます。
- 試合終了の条件分岐（サヨナラ・引き分けなど）を行い、試合が終わると打席の記入を終了し、試合終了ボタンが出現

**試合終了画面**

'![demo](https://raw.github.com/wiki/zerechi-m/base_b/gif/result.gif)'

- 各チームの打撃成績と得点が記載されています。
- プロ野球中継さながらの打撃成績結果表示で選手の達成感と反省点を洗い出すことが可能です。


## 工夫したポイント
- メッセージ画面の実装では、メッセージの送信と受信側で位置と背景色を変更させている
- メッセージルームを削除する際に削除ボタンを押すとjavascriptが発火して、各ルームの横に削除ボタンの出現
- 試合画面での試合開始ボタン出現の条件分岐を両チームオーダー作成時に変更
- オーダー作成画面では、一度選択された選手とポジションを重複しないようにJavascriptで実装
- 試合画面の得点板では、リアルタイムで結果が反映されるように、テーブルからレコードを抽出してアウトカウントで表示を変更
- 打席ではオーダー順に反映させるようにレコードに最後に保存された打順の番号から番号を取得することにより実現
  

## 課題や今後実装したい機能

- 機能面では、代打や投手交代に対応させていない為、選手交代にも対応させていきたい。 
- 打率や得点を反映させている為のActiveRecordメソッドの記述を変更してN＋1問題に対処して処理速度向上を実現させたい。
- 球場の住所に対応したgoogleマップを追加していきたい


## 使用技術（開発環境）
# バックエンド
Ruby2.6.5, Ruby on Rails 6.0.0

# フロントエンド
Javascript, HTML&CSS

# データベース
MySQL

# 本番環境
Heroku

# テスト
** 未実装 **
RSpecでのモデル単体テスト実装

# ソース管理
GitHub, GitHubDesktop

# エディタ
VScode

## DB設計

**Team**

| Column             | Type            | Options                       |
|--------------------|-----------------| ------------------------------|
| team_name          | string          | null: false                   |
| rep_name           | string          | null: false                   |
| started            | integer         | null: false, active hash      |
| email              | string          | null: false , uniqueness: true|
| encrypted_password | string          | null: false                   |

### Association
- has_many :members
- has_many :games, through: game_team
- has_many :game_team
- has_many :messages
- has_many :room_teams
- has_many :rooms ,through :room_teams


**Member**

| Column             | Type            | Options                       |
|--------------------|-----------------| ------------------------------|
| name               | string          | null: false                   |
| uni_no             | integer         |                               |
| age                | integer         | null: false                   |
| position_id        | integer         | active hash                   | ポジション
| base_hist_id       | integer         | active hash                   | 最終部活歴
| team_id            | references      | null: false, foreign_key      |


### Association
- belongs_to :team , prevent: :destroy
- has_many :batting_result , prevent: :destroy
- has_many :pitching_result , prevent: :destroy
- has_one_attached :image

**batting_result**

| Column             | Type            | Options                       |
|--------------------|-----------------| ------------------------------|
| at_bat             | integer         | null: false                   | 打席数
| batting-ave        | float           | null: false                   | 打率
| rbi                | integer         | null: false                   | 打点
| still              | integer         | null: false                   | 盗塁
| member_id          | references      | null: false, foreign_key      | 

### Association
- belongs_to :member


**Game**

| Column             | Type            | Options                       |
|--------------------|-----------------| ------------------------------|
| point              | integer         | null: false                   | 勝利
| win                | integer         | null: false                   | 勝利
| lose               | integer         | null: false                   | 敗北
| strikeout          | integer         | null: false                   | 三振数
| hits               | integer         | null: false                   | 被安打数
| home_run           | integer         | null: false                   | 被本塁打
| game_team_id       | references      | null: false, foreign_key      | 
| team_id            | references      | null: false, foreign_key      | 

### Association
- has_many :teams, through: game_team
- has_many :game_team

**Game_team**

| Column             | Type            | Options                       |
|--------------------|-----------------| ------------------------------|
| team_id            | references      | null: false, foreign_key      | 
| game_id            | references      | null: false, foreign_key      | 


### Association
- belongs_to :game
- belongs_to :team

**Rooms**

| Column             | Type            | Options                       |
|--------------------|-----------------| ------------------------------|
| game_date          | date            | null: false                   |


### Association
has_many :room_teams
has_many :teams ,through :room_teams

**room_Teams**

| Column             | Type            | Options                       |
|--------------------|-----------------| ------------------------------|
| room               | references      | null: false, foreign_key      |
| team               | references      | null: false, foreign_key      |

### Association
- has_many :teams
- has_many :games, through: game_team
- has_many :game_team

**messages**

| Column             | Type            | Options                       |
|--------------------|-----------------| ------------------------------|
| content            | text            | null: false                   |
| team               | references      | null: false, foreign_key      |
| room               | references      | null: false, foreign_key      | 

### Association
belongs_to :team
belongs_to :room
