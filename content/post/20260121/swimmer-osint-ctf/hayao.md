# SWIMMER OSINT CTF writeup

## tagt_debeyohiru

### debeyohiru_01_social

> 調査対象の人物はソフトウェアエンジニアで、2026年以降には debeyohiru というIDでの活動が確認されています。
この人物がこのIDでの活動を開始したのは2026年1月のようです。この人物がこれ以前に使用していたIDを特定できないでしょうか？
2026年1月時点で、noteというサービスに古いIDのアカウントが残存しているようです。
このアカウントのIDを解答してください。
例えば、digital_jpn_gc が対象のアカウントの場合、 Flag は SWIMMER{digital_jpn_gc} となります。

Noteを開き検索窓でdebeyohiruと検索すると [https://note.com/debeyohiru](https://note.com/debeyohiru)が見つかります。

ここから古いIDを探していきます。

他にも、[@debeyohiru@.bsky.social](https://bsky.app/profile/debeyohiru.bsky.social)というBlueskyのアカウントも運用しているようです。

投稿を見ていくと、Blueskyのハンドルネームを変更した[投稿](https://bsky.app/profile/debeyohiru.bsky.social/post/3mbbljxdixs23)が見つかりました。

> あまりいいところのない一年だったから、来年からは心機一転ハンドルを変えてみるというのを思いついた。blueskyだけでも変えてみようか。

かつてのTwitterにはID(@のやつ)の変更を追跡できるサイトがあることを思い出し、似たようなものがBlueskyにもないか探していきます。

Googleで「bluesky 過去のid」のような感じでプロトコルの仕組みやツールを検索していきます。

<https://ruindig.hatenablog.jp/entry/2024/12/13/120000>

BlueskyにはDIDという変更不可能なIDがあるようです。更に検索を続けます。

「bluesky tracking past id」で検索すると以下のサイトがヒットしました。

<https://www.bskyinfo.com/blog/how-to-track-bluesky-handle-history-with-internect-info/>

[https://internect.info/](https://internect.info/)というサイトがBlueskyの内部情報を検索できるようです。

[debeyohiruのIDを入力してあげる](https://internect.info/at/debeyohiru.bsky.social)と過去のIDが見つかりました。

![alt text](debeyohiru_bsky_history.png)

彼は過去に`furaigo5`と名乗っていたようです。これをNoteで検索してあげると

<https://note.com/furaigo5>

が見つかります。

ということでフラグは`SWIMMER{furaigo5}`でした。

### debeyohiru_02_profile

> debeyohiru は2026年1月時点で求職中で、プロフィールページをウェブ上に公開していたようです。
このページを探り出し、そのURLを解答してください。
例えば、 <https://example.com/foobar> が対象のページの場合、 Flagは SWIMMER{<https://example.com/foobar}> となります。

Debeyohiruやfuraigo5をGoogleで検索してみても特に何も見つからず。BingやYandex、DuckDuckGo等で検索を行うも特にありませんでした。
何故かYandexで法律的にアウトスレスレなえっちなものが出てきて普通に困惑していました。

`furaigo5`を横断検索ツールで検索すると、GitHubにヒットし <https://github.com/furaigo5> を発見しました。

プロフィールのURLにアクセスすると、就職用のプロフィールページでした。

ということでフラグは`SWIMMER{https://furaigo5.github.io/profile/}`になります。

### debeyohiru_03_email

> debeyohiru が2026年現在、普段使っているメールアドレスが知りたいです。
この人物が現在使用中とおぼしきメールアドレスを探り出し、解答してください。
例えば、メールアドレスが<foobar@example.com>の場合、Flagは SWIMMER{<foobar@example.com>} となります。

GitHubのAPIを叩いてメールアドレスが手に入らないか試みましたが見つからず。

```bash
gh api users/furaigo5
```

改めて前のホームページを見ると、そのまま記載されていました。なんてこった。

`SWIMMER{furaigo5.onionsoup@gmail.com}`

## tgt_lilica

### lilica_04_domain

### lilica_05_hosting

チームメイトから`twilight-lilica.com`のホスティングサービスを特定してほしいとのことだったので、`traceroute`コマンドで経路を特定しました。

```txt
hayao@Hayao-XPS9350 ~> traceroute twilight-lilica.com
traceroute to twilight-lilica.com (45.77.129.141), 30 hops max, 60 byte packets
 1  _gateway (192.168.128.1)  8.374 ms  8.292 ms  8.281 ms
 2  ntt.setup (192.168.1.1)  8.257 ms  8.248 ms  8.238 ms
 3  * * *
 4  * * *
 5  * * *
 6  * * *
 7  * * *
 8  * * *
 9  * * *
10  * * *
11  xxxxxxxxxxxx.jp.ce.gin.ntt.net (xx.xx.xx.xx)  24.853 ms * *
12  * * *
13  * * *
14  209.222.31.250.vultrusercontent.com (209.222.31.250)  22.751 ms  22.697 ms  22.683 ms
15  * * *
16  * * *
17  * * *
18  * * *
19  * * *
20  * * *
21  * * *
22  * * *
23  * * *
24  * * *
25  * * *
26  * * *
27  * * *
28  * * *
29  * * *
30  * * *
```

`vultrusercontent.com`を調べると、[Vultr](https://www.vultr.com/)を発見。

通報のためのメールアドレスとのことなので以下のサイトより、フラグは`SWIMMER{abuse@vultr.com}`

<https://www.vultr.com/legal/use-policy/>

### lilica_06_name

既に他のチームメイトによってTwitterが特定されていたので、投稿を確認します。

> 面白くなっちゃって
> とりあえず髪留めこねてみたんだけど
>
> これどうやったらVRCのアクセサリにできるんだろう？

<https://x.com/twilight_lilica/status/2000551415039791278>

Gigafile便で何やらモデルデータを配布しているようです。ダウンロードするとfbxという拡張子のバイナリデータでした。

```txt
hayao@Hayao-XPS9350 ~/Desktop> file simple_hair_pin.fbx
simple_hair_pin.fbx: Kaydara FBX model, version 7700
```

`file`コマンドで確認してあげるとこんな出力が。よくわからないので`strings`コマンドでテキストを探してみる。

```bash

hayao@Hayao-XPS9350 ~/Desktop> strings simple_hair_pin.fbx | sort | uniq
(省略)
.]P~_2zA
0<=7
0|`+
1/#5
15/11/2025 00:00:00.000
15/11/2025 00:00:00.000
2025-11-16 04:30:11:874
2025.3.2
4@'6
70000$F
:|`+
(省略)
?D8,
@c|
@u\;]
AD8,
ADgfffff
ActiveAnimStackNameS
AmbientColorS
(省略)
C:\Users\shiharu_nanaogi\Documents\modeling\vrc_test\hair_pin\simple_hair_pin.fbx
C:\Users\shiharu_nanaogi\Documents\modeling\vrc_test\hair_pin\simple_hair_pin.fbxD
CILP
Casts ShadowsS
Cinema 4D2025.3.2d
Collection
DisplacementFactorS
DocumentLPG
DocumentUrlS
E-QV
EmissiveColorS
EmissiveFactorS
EmissiveS
EncryptionTypeI
FBX SDK/FBX Plugins version 2020.3.4
FBX SDK/FBX Plugins version 2020.3.4 build=9634e3495v
FBXHeaderExtensiont
FBXHeaderVersionI
FBXVersionI
FbxMesh0.
FbxNodeN+
(省略)
MaxDampStrengthYS
MaxDampStrengthZS
Maxon
Maxon Cinema 4D 2025.3.2W
MemberS%
(省略)
VersionIe
VersionIf
Verticesd
Visibility InheritanceS
VisibilityS
Vs S
Y?7>
YearI
[J]>
]8Z=
^ g\
_'^`W
_____C1_1_SelectionNode
_____C1_1_SelectionSet
_____C2_2_SelectionNode
_____C2_2_SelectionSet
_____R1_3_SelectionNode
_____R1_3_SelectionSet
_____R2_4_SelectionNode
_____R2_4_SelectionSet
_____S_0_SelectionNode
_____S_0_SelectionSet
_____selectionComplement_SelectionNode
_____selectionComplement_SelectionSet
b\TB
boolS
cX{T
doubleS
enumS
g$$^g
g9wJ
(省略)
~2_{
~BG^(
```

ファイルのフルパスや使用されているソフトウェア、作成日時といったそれらしいデータを取得できました。

ということで、パスのユーザー名より`SWIMMER{Shiharu Nanaogi}`

## research_2025

### satellite_imagery

> この衛星画像が取得（撮影）された日はいつでしょうか？ YYYY/MM/DD 形式で解答してください。
> 例えば2026年1月17日の場合、Flagは SWIMMER{2026/01/17} となります。

マップの左上に「ケータリングビル」と書かれているのでGoogle Earthで検索してみます。すぐに以下がヒット。

<https://earth.google.com/web/search/%E3%82%B1%E3%83%BC%E3%82%BF%E3%83%AA%E3%83%B3%E3%82%B0%E3%83%93%E3%83%AB/@42.7818063,141.67707077,24.93146269a,600.56938599d,35y,0h,0t,0r/d>

駐車場の車の状況を確認すると、現時点の最新のものと同一であることがわかった。

 ![alt text](google_earth_date.png)

したがって、`SWIMMER{2025/04/18}`

## ops_swimmer

最終問題です。この問題は全てを解き終わると出現するようになっていたのですが、それに気づかず完答したと思い込んでいました。

writeupを書くために再びアクセスしたところ、この問題を発見。この時点で23:45分で大焦り。チーム全員で一斉に取り掛かりました。

私が解けなかった debeyohiru_05_hidden1やdebeyohiru_06_hidden2の調査でdebeyohiru氏の調査をしていたなかで、こんなものを見つけていました。

```txt
🗓️ Calendar data

[+] Public Google Calendar found !

Calendar ID : furaigo5.onionsoup@gmail.com
[+] Calendar Summary : ふらいご
Calendar Timezone : Asia/Tokyo

[+] 1 event dumped ! Showing the last 1 one...

╔══════╤═════════════════════╤══════════╗
║ Name │   Datetime (UTC)    │ Duration ║
╟──────┼─────────────────────┼──────────╢
║ 集会 │ 2025/12/30 09:30:00 │ 2 hours  ║
╚══════╧═════════════════════╧══════════╝

🗃️ Download link :
=> https://calendar.google.com/calendar/ical/furaigo5.onionsoup@gmail.com/public/basic.ics
```

これはfuraigo5名義のホームページに書かれているメールアドレスをGHuntに投げた結果です。

この`basic.ics`を覗いてみると、こんな感じになっていました。

```txt
BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:PUBLISH
X-WR-CALNAME:ふらいご
X-WR-TIMEZONE:Asia/Tokyo
BEGIN:VEVENT
DTSTART:20251230T093000Z
DTEND:20251230T113000Z
DTSTAMP:20260117T093404Z
UID:57ol3cl8unee2aa4291ofbqcvp@google.com
CREATED:20251228T070800Z
DESCRIPTION:18:30集合\n店の前
LAST-MODIFIED:20260102T164452Z
SEQUENCE:1
STATUS:CONFIRMED
SUMMARY:集会
TRANSP:OPAQUE
END:VEVENT
END:VCALENDAR
```

ということで、2025年12月30日 18時30分にどこかの店の前に集合になっていることがわかりました。

更に調査を続けていきます。

<https://x.com/twilight_lilica/status/2007451888996724926>

<https://x.com/twilight_lilica/status/2007449492468211719>

ブロッサムリリカがその時の食事の画像を投稿しています。この写真より、デニーズであることがわかりました。

更にコミケノのあとであるという情報から、東京(いくら無理に考慮しても関東圏内)であることがわかります。

<https://x.com/bruto_rain/status/2007384438939021503>

rain氏も似たような画像を投稿しています。映り込んでいる料理が同じであることから、これらの写真は同じ場所で撮影されたものであると推測されます。

ここまでの情報で、以下のことがわかりました。

- 集合時刻: 2025年12月30日 18時30分
- 解散予定: 2025年12月30日 20時30分
- コミケのあとに行ける→東京? (最悪でも関東?)

これらの情報から有明に近い以下の店舗の内装をGoogle Mapで調べて回答してみるも正解にならず……。正直残り数分だったのでかなり焦っていました。入れてみてだめだったフラグは以下。

- `SWIMMER{2025/12/30_1830_デニーズ江東枝川店}`
- `SWIMMER{2025/12/30_1830_デニーズ渋谷公園通り店}`

流石に大雑把すぎるということで方針を変えようとしてた瞬間、一足先に帰宅したはずのチームメンバーがチャットに以下のURLを投稿。

<https://x.com/bruto_rain/status/2006604801514057878>

<https://x.com/bruto_rain/status/2005982246499742052>

同時刻に、rain氏(我々は彼のことを鉄オタ君と読んでいました)が大手町での写真を掲載してたのを見つけてくれました。

ということでフラグは`SWIMMER{2025/12/30_1830_デニーズ大井町駅前店}`でした。
