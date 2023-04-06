#テストの概要を記載
Feature: 住所検索APIのテスト

#東京タワー郵便番号
Background:
* def globalZipCode = "1050011"

#シナリオの概要を記載
Scenario: 通天閣・首里城住所取得

#def -> 変数の定義
* def zipCode = "5560002"

#送信先を設定
Given url "https://zipcloud.ibsnet.co.jp/api/search?zipcode=" + zipCode

#送信メソッドを設定
When method get

#送信結果検証
Then status 200
And match response.results[0].address1 == '大阪府'
#And match response.results[0].address1 == '北海道'
And match response.results[0].address2 == '大阪市浪速区'
And match response.results[0].address3 == '恵美須東'

# レスポンスの値を取得することも可能
* def osakaZipCode = response.results[0].zipcode

# print コンソールに出力も可能
* print kandaZipCode

#　同じシナリオ内で複数回送信することも可能

# 首里城郵便番号
* def zipCode = "9030815"

#送信先を設定
Given url "https://zipcloud.ibsnet.co.jp/api/search?zipcode=" + zipCode

#送信メソッドを設定
When method get

#送信結果検証
Then status 200
And match response.results[0].address1 == '沖縄県'
And match response.results[0].address2 == '那覇市'
And match response.results[0].address3 == '首里金城町'

#先ほど取得した送信先（通天閣）を設定
Given url "https://zipcloud.ibsnet.co.jp/api/search?zipcode=" + osakaZipCode

#送信メソッドを設定
When method get

#送信結果検証
Then status 200
And match response.results[0].address1 == '大阪府'
And match response.results[0].address2 == '大阪市浪速区'
And match response.results[0].address3 == '恵美須東'



#複数シナリオを記載することも可能
Scenario: 東京タワー住所取得

#送信先を設定
Given url "https://zipcloud.ibsnet.co.jp/api/search?zipcode=" + globalZipCode

#送信メソッドを設定
When method get

#送信結果検証
Then status 200
And match response.results[0].address1 == '東京都'
And match response.results[0].address2 == '港区'
And match response.results[0].address3 == '芝公園'

