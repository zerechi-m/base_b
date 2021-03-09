# README

## 概要
- 草野球チームの対戦相手を見つけるマッチングアプリ
- 試合毎に選手の結果をつけるので、各チームの所属人数や所属選手の打撃成績・投手成績を見ることができる
- 自チームの強さに応じて相手を選定することができる

## 機能

**草野球チーム**
  所属リーグ
  本拠地
  自己紹介
  過去3戦の戦績
  平均年齢

**マッチング用のメッセージ機能**
  各チームへ対戦オファーができる
  雨天中止などの連絡もできる

**草野球チームのメンバー**
  年齢
  ポジション投手か野手か？
  顔写真
  最終野球部活歴 /中学/高校/大学
  打撃成績
  投手成績

**球場**
  住所
  電話番号
  google map

**試合画面**
  各回ごとの点数
  各選手のスコアをつけることができる。


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

**Pitching_result**

| Column             | Type            | Options                       |
|--------------------|-----------------| ------------------------------|
| win                | integer         | null: false                   | 勝利
| lose               | integer         | null: false                   | 敗北
| strikeout          | integer         | null: false                   | 三振数
| hits               | integer         | null: false                   | 被安打数
| home_run           | integer         | null: false                   | 被本塁打
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