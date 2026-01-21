# SWIMMER OSINT CTF 2026 - 解法まとめ

---

## 目次

1. [research_2026_01. rain_01_social: Xアカウント特定（スクリーンネーム回答）](#research_2026_01-rain_01_social-xアカウント特定スクリーンネーム回答)
2. [research_2026_01. lilica_01_social: Xアカウント特定（スクリーンネーム回答）](#research_2026_01-lilica_01_social-xアカウント特定スクリーンネーム回答)
3. [research_2026_01. lilica_02_virtual_identity: VRChatユーザーID特定（usr_…回答）](#research_2026_01-lilica_02_virtual_identity-vrchatユーザーid特定usr回答)
4. [research_2026_01. lilica_03_virtual_world: VRChatワールドID特定（wrld_…回答）](#research_2026_01-lilica_03_virtual_world-vrchatワールドid特定wrld回答)
5. [research_2026_01. lilica_04_domain: ドメイン取得日特定（YYYY/MM/DD回答）](#research_2026_01-lilica_04_domain-ドメイン取得日特定yyyymmdd回答)
6. [research_2026_01. flag_on_the_don: イベント会場建物のOSM way番号特定](#research_2026_01-flag_on_the_don-イベント会場建物のosm-way番号特定)

---

# research_2026_01. rain_01_social: Xアカウント特定（スクリーンネーム回答）

> rain は2026年時点でXのアカウントを所持していたようです。我々は、この人物の投稿のスクリーンショットを入手しました。スクリーンショットからアカウントを特定し、このアカウントのID（スクリーンネーム）を解答してください。例えば、@gov_online が対象のアカウントの場合、Flag は SWIMMER{@gov_online} となります。

## 解法

- スクリーンショットに写っている本文（特徴的な文言）から、固有フレーズ **「近所だったから見に行った」** を抽出。
- X上で当該フレーズ検索を実施。
  - 普段使用しているアカウントでは検索にヒットしなかった。
  - 別アカウントで同様に検索したところヒットし、該当投稿を特定。
- 該当投稿の投稿者プロフィールからスクリーンネーム **@bruto_rain** を特定。
- Flag: `SWIMMER{@bruto_rain}`

## 情報源

- [X](https://x.com/home)

---

# research_2026_01. lilica_01_social: Xアカウント特定（スクリーンネーム回答）

> lilica は2026年時点でクリエイターとして活動しており、「黄昏ブロッサムリリカ」と名乗っていたことが分かっています。 また、Xのアカウントを持っていたことが確認されています。そのXアカウントのID（スクリーンネーム）を解答してください。例えば、@gov_online が対象のアカウントの場合、Flag は SWIMMER{@gov_online} となります。

## 解法

- 既知の名義 **「黄昏ブロッサムリリカ」** を検索クエリとしてXで検索。
- ヒットしたアカウントのプロフィール・投稿内容から本人性を確認。
- スクリーンネーム **@twilight_lilica** を特定。
- Flag: `SWIMMER{@twilight_lilica}`

## 情報源

- [X](https://x.com/home)

---

# research_2026_01. lilica_02_virtual_identity: VRChatユーザーID特定（usr_…回答）

> lilica はVRにも関心があるようで、未来でもVR関連の活動がわずかながら確認されています。lilica が2026年時点で使っていたVRChatのユーザーIDを特定し、解答してください。VRChatのユーザー情報はブラウザからも確認できます。例えば、対象アカウントのURLが https://vrchat.com/home/user/usr_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx の場合、 Flagは SWIMMER{usr_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx} となります。

## 解法

- VRChat内で **「黄昏ブロッサムリリカ」** を検索。
- ヒットしたユーザー情報から対象ユーザーを特定。
- ブラウザで当該ユーザーのページ（ https://vrchat.com/home/user/usr_b103fac6-8341-4b89-a606-920092e75e43 ）を確認。
- URLに含まれるユーザーID **usr_b103fac6-8341-4b89-a606-920092e75e43** を抽出。
- Flag: `SWIMMER{usr_b103fac6-8341-4b89-a606-920092e75e43}`

## 情報源

- [VRChat Home](https://vrchat.com/home)

---

# research_2026_01. lilica_03_virtual_world: VRChatワールドID特定（wrld_…回答）

> lilica はVRChatでの活動をSNSに投稿していたようです。2025年11月9日（日本時間）に投稿された画像にはある「ワールド」が写っているようです。このワールドのIDを解答してください。VRChatのワールド情報はブラウザからも確認できます。例えば、対象のワールドのURLが https://vrchat.com/home/world/wrld_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/info だった場合、Flagは SWIMMER{wrld_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx} となります。

## 解法

- 該当ツイートの添付画像を入手し、Google画像検索で類似画像／掲載ページを探索。
- VRChatワールド紹介ブログ記事がヒットし、画像のワールド名に関する手掛かりを取得。
- ブログ記事等で得たキーワード **「NAGISA」** をもとに、VRChat内のWorld検索で候補を絞り込み。
- 該当ワールドを特定後、ブラウザでワールドページ（ https://vrchat.com/home/world/wrld_1b94e327-036b-4d09-81be-e898d71f02cb/info ）を確認。
- URLからワールドID **wrld_1b94e327-036b-4d09-81be-e898d71f02cb** を抽出。
- Flag: `SWIMMER{wrld_1b94e327-036b-4d09-81be-e898d71f02cb}`

## 情報源

- [VRChat Home](https://vrchat.com/home)
- [VRC World Guide 該当記事](https://vrc-world-guide.hatenablog.com/entry/2025/01/27/213500)

---

# research_2026_01. lilica_04_domain: ドメイン取得日特定（YYYY/MM/DD回答）

> lilica は個人のWebサイトを運営していたようです。このWebサイトのドメイン名が取得された日付が知りたいです。YYYY/MM/DD の形式で解答してください。例えば、2026年1月2日 がドメイン取得日の場合、Flagは SWIMMER{2026/01/02} となります。

## 解法

- 12/13 のX投稿から lilica の個人サイトへ遷移し、対象ドメインを取得。
- 対象ドメインをドメイン情報検索（WHOIS等）で照会。
- 結果に含まれる **登録日（Creation Date / Registered On 等）** を取得日として採用。
- 指定フォーマット（YYYY/MM/DD）に変換し、Flag形式に整形して回答。

## 情報源

- （未記入：実際に使用したWHOIS/ドメイン検索サービスのURL）

---

# research_2026_01. flag_on_the_don: イベント会場建物のOSM way番号特定

> 2025年8月28日、群馬県で「太鼓の達人」を利用したイベントが開催されました。その会場となった建物はどこでしょうか。OpenStreetMapのウェイ（way）番号で解答してください。例えば、建物が 123456789 というway番号であれば、Flagは SWIMMER{123456789} となります。

## 解法

- 問題文をChatGPTエージェントに渡して解法を探索。
  - 2025年8月28日に渋川市で「シニアeスポーツイベント」が開催されたことを特定。使用タイトルは「太鼓の達人ドンダフルフェスティバル」等。
  - 会場は **「渋川市民会館」**。
- OpenStreetMapで「渋川市民会館」を検索し、該当する建物（way）を特定。
- way番号 **628293186** を取得。
- Flag: `SWIMMER{628293186}`

## 情報源

- [渋川市PDF（参照資料）](https://www.city.shibukawa.lg.jp/manage/contents/upload/68870b94eeb0d.pdf)
