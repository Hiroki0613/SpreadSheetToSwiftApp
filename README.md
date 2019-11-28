# SpreadSheetToSwiftApp
グーグルスプレッドシートを使ってJSONを作成。データをレンタルサーバーにアップして、Alamofireで取得。
<br>
自分でJSON作成が出来るようになることで、オリジナルアプリ作成時に自分で作成したデータをリアルタイムでアプリへ送信可能。
<br>
アプリ限定会員へクーポン情報を送付する等、自分の好きなタイミングで情報が発信が出来るようになるために作成。 
<br>
<br>
スプレッドシートを使って作成した、JSONデータの一部

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
・
・
・
]
```

この情報をAlamofireで取得。
<br>
・numberはID
<br>
・nameは名前
<br>
としてTableViewに載せる。

