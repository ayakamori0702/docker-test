## 前回作成したdockerコンテナを、自宅パソコンのubuntu20で立ち上げてみる
　

### docker-test フォルダに入っているもの　　

<span style="color: skyblue; ">titanicのデータ分析に必要なもの</span>  
*titanic.ipynb  
*test.csv  
*train.csv  
*gender_submission.csv  
<span style="color: skyblue; ">dockerコンテナを立ち上げるのに必要なもの</span>  
*Dockerfile  
*docker-compose.yml
　　
***
　　
## 手順
　　
### **1. dockerの環境構築**

ubuntuOSに docker,docker-compose をインストールする  
  
参照：  
[dockerのインストール](https://www.trifields.jp/how-to-install-docker-on-ubuntu-2004-4436)  
[docker-composeのインストール](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04-ja)  
  
### **2. 作業フォルダを入手** 

今回はGoogle　Driveからダウンロードした。
  

### **3. コンテナを立ち上げる**



docker-testディレクトリにカレントディレクトリをうつしてコマンド  
    
`$ docker-compose up -d`  

<span style="color: red; ">エラー１</span>：platformｎエラー　　platformについての記載をdocker-compose.ymlに記載したままだったので、該当部分を消去してみた。→OK  


<span style="color: red; ">エラー2</span>：容量が足りなくなった。　そもそも１０Gしか割り当ててなかったので、３０Gに増やした。→OK
テスト先の容量のことも考えないといけない？
  

### **4. jupyterlabを立ち上げる**


ブラウザ上で　`localhost:8888:8888` を立ち上げる  

　　　　　　　　　　　

### **5. 実行してみる**
ライブラリのimportは難なくクリア  

フォルダパスの書き換えが必要。書き換えたら難なくクリア＜完＞
***



<span style="color: pink; ">dockerの利点</span>  
一度 Dockerfileを作ってしまえば、もらった人は　$ docker-compose up -d　とコマンドするだけで同じ環境をつくれるのでとても便利だった(環境つくる人だけdockerの知識があればいい？)
　大人数で使用したり、いろんな環境を使い分けたいときには良さそう  
<span style="color: skyblue; ">dockerの欠点</span>  
初回はdockerをインストールする手間がある
　


***  
***  
*** 



## 前回作成したdockerコンテナを、AWSのEC2で立ち上げてみる　　





### docker-test フォルダに入っているもの　　



<span style="color: skyblue; ">titanicのデータ分析に必要なもの</span>  
*titanic.ipynb  
*test.csv  
*train.csv  
*gender_submission.csv  
<span style="color: skyblue; ">dockerコンテナを立ち上げるのに必要なもの</span>  
*Dockerfile  
*docker-compose.yml
　　
***

## 手順
今回は、講習で教えていただいたCloud9のサービスを利用してUbuntuを動かした。SSHキーを作成してEC2にアクセスすればOK

### **1. dockerの環境構築**

ubuntuOSに docker,docker-compose をインストールする


### **2. 作業フォルダを入手**  

どのようにやるかわからなかったので、適当にフォルダをドラッグしてアップロードしてみたらできた！（簡単）  


### **3. コンテナを立ち上げる**


今回は、前回の反省を活かし、最初にDockerfileのplatformの記載を削除

docker-testディレクトリにカレントディレクトリをうつしてコマンド  
   
`$ docker-compose up -d`
   

　　　　　
<span style="color: red; ">エラー1</span>：容量が足りなくなった。　講習のとおり、８Gしかストレージの確保していなかったので、足りない。
今回の変更可能最大容量、30Gに変更。→OK

<span style="color: red; ">エラー2</span>：管理者権限の問題なのか、apt-getできなかった。。。  
今回は、仮に割り当ててもらったアカウントだったからなのか、原因わからずタイムアウト。

***



<span style="color: pink; ">AWSの利点</span> 
簡単に素早くサーバを利用することができる。
容量の割り当ての変更がものすごく簡単だった。  



<span style="color: skyblue; ">AWSの欠点</span>  
実際課金して使用するとなると、計画的に使うサービスや容量を把握する必要がありそう。
