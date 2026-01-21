# SWIMMER OSINT CTF 2026 - 解法まとめ

---

## 目次

1. [research_2025_01. CX問題1: フライト便名](#research_2025_01-cx問題1-フライト便名)
2. [research_2025_02. CX問題2: パイロット特定](#research_2025_02-cx問題2-パイロット特定)
3. [research_2025_04. 敵国条項死文化決議](#research_2025_04-敵国条項死文化決議---棄権国調査)
4. [research_2025_05. Truck at 11foot8 Bridge](#research_2025_05-truck-at-11foot8-bridge)
5. [research_2025_06. トン袋落下地点特定](#research_2025_06-トン袋落下地点特定)
6. [research_2025_10. Rage](#research_2025_10-rage)
7. [tgt_debeyohiru](#tgt_debeyohiru)
8. [tgt_lilica](#tgt_lilica)

---

# research_2025_01. cx: フライト便名

> 2025年春、かつて香港に存在していた空港の100周年を記念して、特別なフライトが実施されたようです。このフライトの便名を解答してください。

## 解法

「かつて香港に存在していた空港」というキーワードから **啓徳空港（Kai Tak Airport）** を想起。1925年開港のため、2025年がちょうど100周年にあたる。

Web検索で調べると、2025年3月30日にキャセイパシフィック航空が100周年記念フライト **CX8100** を運航したことが判明。

---

# research_2025_02. pilot: パイロット特定

> CX の問題で示されたフライト中、添付画像の席に座っていた人物の名前を英語で解答してください。（添付画像はコックピット右席を指す矢印）

## 解法

CX8100便のクルー情報を調査。複数の記事から、このフライトには以下の2名が搭乗していたことが判明。

| パイロット | 役職 | 推定座席 |
|-----------|------|----------|
| Geoffrey Lui | Chief Pilot (Airbus) | 左席（Captain/PIC） |
| Adrian Scott | Flying Training Manager | 右席（First Officer） |

**座席配置の根拠:**

- 記事では Chief Pilot が先に言及されている（通常は PIC が先）
- 航空業界の慣例として、最高位のパイロットは左席（Captain席）に座る
- よって右席は **Adrian Scott**

## 情報源

- [Geoffrey Lui '95 - CIS Alumni Connect](https://cisalumniconnect.org/geoffrey-lui-95-aviation-cathay-pacific-and-kai-tak-tribute-flight-cx8100/)
- [Cathay Pacific returns to Kai Tak - Checkerboard Hill](https://www.checkerboardhill.com/2025/04/cathay-pacific-flyby-kai-tak-flight-cx8100/)
- [Campaign Brief Asia - CX8100](https://campaignbriefasia.com/2025/04/11/flight-cx8100-takes-off-cathay-soars-once-more-over-kai-tak-in-tribute-to-legendary-flight-path/)
- [CX8100 special flight - FlyerTalk](https://www.flyertalk.com/forum/cathay-pacific-cathay/2190677-cx8100-special-flight-march-30th-4pm-over-kai-tak.html)

---

# research_2025_04. 敵国条項死文化決議 - 棄権国調査

> 2025年11月の日中関係悪化において、中国大使館が国連憲章の「敵国条項」に言及。日本外務省は「1995年の国連決議によって死文化（obsolete）している」と反論。この決議で棄権した国を特定する。

## 解法

「敵国条項 死文化 国連決議 1995」などで検索し、該当する決議を特定。

- **該当決議:** 国連総会決議50/52（A/RES/50/52）
- **採択日:** 1995年12月11日

国連デジタルライブラリで投票記録を確認。

### 投票結果

| 項目 | 数 |
|------|-----|
| 賛成（Yes） | 155 |
| 反対（No） | 0 |
| 棄権（Abstentions） | 3 |

### 棄権した国（公式記録の表記）

1. **CUBA**
2. **DEMOCRATIC PEOPLE'S REPUBLIC OF KOREA**
3. **LIBYAN ARAB JAMAHIRIYA**

※「LIBYAN ARAB JAMAHIRIYA」は1995年当時のリビアの正式国名

## 情報源

- [国連デジタルライブラリ 投票記録](https://digitallibrary.un.org/record/284118?ln=en)
- [決議文書 A/RES/50/52](https://documents.un.org/doc/undoc/gen/n95/257/54/pdf/n9525754.pdf)
- [Wikipedia - Enemy state clauses](https://en.wikipedia.org/wiki/Enemy_State_Clauses_in_the_United_Nations_Charter)

---

# research_2025_05. Truck at 11foot8 Bridge

> あるトラックが Plus Code `8773X3XQ+JWQ` を2025年6月21日 13:39:54（現地時間）ごろに通過しました。このトラックの車体に書かれていたFQDNを解答してください。

## 解法

### 場所の特定

Plus Code を座標に変換すると、**11foot8 Bridge（通称: Can Opener Bridge）** の場所だと判明。この橋は低い高さ（12'4"）で多くのトラックが衝突することで有名で、定点カメラで撮影・公開されている。

| 項目 | 値 |
|------|-----|
| Plus Code | 8773X3XQ+JWQ |
| 座標 | 35.999063, -78.910188 |
| 場所 | 11foot8 Bridge (Can Opener Bridge) |
| 住所 | 201 South Gregson Street, Durham, NC |

### 映像の発見

11foot8.com で該当日時の衝突記録（crash #187）を発見。YouTube動画のタイムスタンプ `2025-06-21 13:39:53` が問題の時刻と一致。

動画を確認すると、トラックは引越し業者 **Miracle Movers** の車両で、車体に FQDN **www.MiracleMoversUSA.com** が記載されていた。

## 情報源

- [11foot8.com](https://11foot8.com/) - The Can Opener Bridge
- [YouTube動画](https://www.youtube.com/watch?v=MJ4tpEhQ86g) - crash #187
- [Miracle Movers USA](https://www.miraclemoversusa.com/) - 会社公式サイト

---

# research_2025_06. トン袋落下地点特定

> 2025年12月8日、日本のあるテレビ番組で、高速道路のパトロール隊への密着取材の様子が放映されました。パトロール隊の108号車は、路上に落下していたトン袋の回収を命じられました。トン袋が最初に落下していた地点はどこでしょうか？

## 解法

### 番組特定

「2025年12月8日 高速道路パトロール テレビ」でGoogle検索すると、フジテレビ「サン！シャイン」の密着取材動画がYouTubeでヒット。

- YouTube公開動画: https://www.youtube.com/watch?v=xo_2KZ3n668

### 字幕からの情報抽出

動画の字幕から以下の情報を抽出:

- 「登りの護国寺合流先、本線センターに大きなトン袋」
- **道路:** 首都高速5号池袋線
- **方向:** 上り（埼玉方面→都心方向）
- **位置:** 護国寺入口（上り）からの合流地点の先

動画に映っている標識などを頼りに、Googleマップで詳細な位置を特定し回答。

---

# research_2025_10. Rage

## 解法

問題で提示された記事の画像に、店舗のロゴらしき欠片が写っていた。

このロゴの欠片を **Google画像検索** にかけると、**RIPNDIP**（スケートブランド/ショップ）がヒット。記事の対象地域がメキシコシティであることを確認し、メキシコシティのRIPNDIP店舗を調査。

Web検索で店舗の **Instagramアカウント** を発見。投稿を遡り、**オープン記念のポスト**を特定。その投稿日を回答として提出。

---

# tgt_debeyohiru

## 05_hidden1 本名特定

これまでの問題で明らかになっていたプロフィールページを開き、**Chrome DevTools** で調査。

Networkタブでリクエスト/レスポンスを確認し、読み込まれているリソースをざっと眺めていたところ、JavaScriptファイルが目に入った。

`https://furaigo5.github.io/profile/js/script.js` を確認すると、ファイル冒頭の **`@author` タグ**に本名が記載されていた。その名前を回答として提出。

---

# tgt_lilica

## 07_work

それまでに明らかになっていた本名を、ヒントをもとに **Facebook → Instagram** の順で検索。

Instagramに本名のローマ字そのままのアカウントを発見。投稿によく出てきていた場所にメトロの駅があることを確認し、その駅名を回答。
