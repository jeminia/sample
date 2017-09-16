FROM centos:latest

MAINTAINER tnagata

#コンテナ構築、または構築後に必要なコマンド(wget,less) をインストール
RUN yum install -y wget
RUN yum -y install less

# Java8 インストール
RUN yum install -y java-1.8.0-openjdk
RUN yum install -y java-1.8.0-openjdk-devel

# Apache 2.4 インストール
RUN yum install -y httpd

# 設定ファイル追加・更新 : Tomcat連携(mod_proxy)
ADD http_proxy.conf /etc/httpd/conf.d/

# tomcat8.5 インストールして展開
WORKDIR /usr/local
RUN wget http://ftp.kddilabs.jp/infosystems/apache/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz
RUN tar zxvf apache-tomcat-8.5.20.tar.gz
RUN mv apache-tomcat-8.5.20 tomcat_gitbucket

# gitbucket.warをダウンロード
WORKDIR /usr/local/tomcat_gitbucket/webapps
RUN wget https://github.com/gitbucket/gitbucket/releases/download/4.16.0/gitbucket.war

# Tomcatを起動
CMD /usr/local/tomcat_gitbucket/bin/startup.sh

#ポート8080をリッスン
EXPOSE 8080 80
