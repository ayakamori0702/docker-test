## Dockerコンテナを用いてAnaconda環境下のJupyter notebookにアクセスする　　

### <まずは　docker image　を　Docker Hub　から　pullしてくる　>  

参照：  
[Docker Hub](https://hub.docker.com/r/continuumio/anaconda3)  
[docker imagesのpullの仕方](https://qiita.com/yaiwase/items/3a58313e028315004a56)　　


## 手順
　　
### **1. Anacondaのイメージ(continuumio/anaconda3)をDockerHubからpullする**  
  
### **2. 作業ディレクトリを作成** 
  
**docker-test**というディレクトリを作成し、titanicに必要なデータとスクリプトを投入  
  
*titanic.ipynb  
*test.csv  
*train.csv  
*gender_submission.csv  


### **3. docker run**  

オプションで、マウントするフォルダパスを適切な箇所にして
`$ docker run`  　コマンドを出す
`$ Docker ps -a`　で確認  


### **4. jupyterlabを立ち上げる**


ブラウザ上で　`localhost:8888:8888` を立ち上げる  

  
 ***  


  
### <今度はDckerfileを書いてJupyternotebookにアクセスしてみる>    
参照：  
[Dockerfileを書いて構築](https://traveler0401.com/docker-anaconda/)  

### **1. 作業ディレクトリを作成** 

**docker-test**というディレクトリを作成し、titanicに必要なデータとスクリプトを投入  
  
<span style="color: skyblue; ">titanicのデータ分析に必要なもの</span>  
*titanic.ipynb  
*test.csv  
*train.csv  
*gender_submission.csv  
<span style="color: skyblue; ">dockerコンテナを立ち上げるのに必要なもの</span>  
*Dockerfile  

### **2. Dockerfileに必要事項をかきこむ**  

[jupyterのオプションの意味参照](https://traveler0401.com/docker-anaconda/)  


### **3. cdコマンドで、カレントディレクトリに移動し、Dockerfileのbuild**  

`$ docker image build -t docker-anaconda .`  
-tはdocker imageに名前をつけるオプション  

<span style="color: red; ">エラー</span>：platformエラー  
M1チップだとplatformを指定する必要がある

`$ docker build --platform linux/amd64 -t docker-anaconda .`  

### **3. docker run**  

オプションで、マウントするフォルダパスを適切な箇所にして
`$ docker run -it -p 8888:8888 --rm -v type=bind,src=`pwd`,dst=/opt docker-anaconda`  　コマンド  

### **4. jupyterlabを立ち上げる**


ブラウザ上で　`localhost:8888:8888` を立ち上げる  

起動はできたけれど、マウントできていない・・・
オプションが多いので、まとめてdocker-composeに記載  
 ***  
  

### <docker-composeから、jupyternotebookを立ち上げて、~/Desktop/docker-testをマウントする>  


**docker-test**のなかにymlファイルを投入  

＊docker-compose.yml  

### **2. docker-compose.ymlに必要事項をかきこむ**  
  
[docker-composeの書き方参照](https://qiita.com/yCroma/items/df4b05cf5a977d9e82cf)  

ここでplatformも指定する必要がある

### **3. コンテナを立ち上げる**



docker-testディレクトリにカレントディレクトリをうつしてコマンド  
    
`$ docker-compose up -d`  


<span style="color: pink; ">まとめ</span>  
docker imageをそのまま使いたい場合は、docker Hubから持ってくると楽。
しかし、それだとパッケージのinstallを独自で決められないのでdockerの意味があまりない。  
dockerfileを書いて、docker-composeにオプションを記載することで、コンテナを渡された人も起動が簡単になる
