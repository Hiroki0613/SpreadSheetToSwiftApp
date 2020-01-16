# SpreadSheetToSwiftApp
グーグルスプレッドシートを使ってJSONを作成。データをレンタルサーバーにアップして、Alamofireで取得。
<br>
自分でJSON作成が出来るようになることで、オリジナルアプリ作成時に自分で作成したデータをリアルタイムでアプリへ送信可能。
<br>
アプリ限定会員へクーポン情報を送付する等、自分の好きなタイミングで情報が発信が出来るようになるために作成。 
<br>
用途としては、アプリ起動時に「今日の脳トレ、アドバイス」などを視聴者へ発信するのに使用。<br>

![SpreadSheetToSwiftAppMovie](https://user-images.githubusercontent.com/46615146/69808081-26606780-122a-11ea-9cff-0d11e4b10d5d.gif)
<br>
<br>
この情報をAlamofireで取得。
<br>
・numberはID
<br>
・nameは名前
<br>
としてTableViewに載せる。


<br>
<br>
スプレッドシートを使って作成した、JSONデータ

```
[
{
"number": "1",
"name": "Ichiro"
},
{
"number": "2",
"name": "Jiro"
},
{
"number": "3",
"name": "Saburo"
},
{
"number": "4",
"name": "Hiroki"
},
{
"number": "5",
"name": "Haruhiko"
},
{
"number": "6",
"name": "Yusuke"
},
{
"number": "7",
"name": "Tomoya"
},
{
"number": "8",
"name": "Shinichi"
},
{
"number": "9",
"name": "Toshiyuki"
},
{
"number": "10",
"name": "Makoto"
},
{
"number": "11",
"name": "Yuta"
},
{
"number": "12",
"name": "Tarou"
},
{
"number": "13",
"name": "Yuki"
},
{
"number": "14",
"name": "Kazuya"
},
{
"number": "15",
"name": "Takumi"
},
{
"number": "16",
"name": "Yuji"
},
{
"number": "17",
"name": "Yutaka"
},
{
"number": "18",
"name": "Morio"
},
{
"number": "19",
"name": "Takuya"
},
{
"number": "20",
"name": "Masaya"
}
]
```


<br>
<br>


## 苦労した点
・直接Google Apps Script(GAS)でのJSONの読み込みが上手いことできず、
<br>
　スプレッドシートの内容をサーバーに直接アップすることで解決した。
 
 
 ## 参考URL
 Googleスプレッドシートの内容をjsonデータとして利用する<br>
 https://www.koreyome.com/web/make-spreadsheet-to-json-at-google-apps-script/

