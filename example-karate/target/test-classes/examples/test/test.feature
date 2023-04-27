#テストの概要を記載
Feature: 住所検索APIのテスト

#シナリオの概要を記載
Scenario: 東京タワー住所取得

#def -> 変数の定義
* def zipCode = "1050011"

#送信先を設定
Given url "https://zipcloud.ibsnet.co.jp/api/search?zipcode=" + zipCode

#送信メソッドを設定
When method get

#送信結果検証
Then status 200
And match response.results[0].address1 == '東京都'
And match response.results[0].address2 == '港区'
And match response.results[0].address3 == '芝公園'
