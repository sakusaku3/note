# ALMinium ディレクトリ公開

## 1.仮想ディレクトリ作成

```bash
ln -s /opt/alminium/public/ /var/www/html/alminium
```

## 2.redmine.confの編集
smelt実行時に自動生成される/etc/httpd/conf.d/redmine.confののServerName、DocumentRootの記述を削除し以下の1行を追加します。

```bash
RailsBaseURI /alminium 
```

```bash
LoadModule passenger_module /usr/lib/ruby/gems/1.8/gems/passenger-3.0.11/ext/apache2/mod_passenger.so
PassengerRoot /usr/lib/ruby/gems/1.8/gems/passenger-3.0.11
PassengerRuby /usr/bin/ruby

<VirtualHost *:80>
<VirtualHost *:80>
#ServerName :80
#DocumentRoot /opt/alminium/public
RailsBaseURI /alminium
ExpiresActive On
ExpiresByType application/x-javascript A259200
ExpiresByType application/javascript A259200
ExpiresByType image/png A2592000
ExpiresByType image/jpeg A2592000
ExpiresByType image/gif A2592000
ExpiresByType text/css A2592000

#RewriteEngine On
#RewriteCond %{SERVER_PORT} 80
#RewriteCond %{SERVER_NAME} !localhost
#RewriteRule ^(.*)?$ https://%{HTTP_HOST}$1 [R,L]

</VirtualHost>
</VirtualHost>
```

## 3.httpdの再起動

```bash
service httpd restart
```

これで、~/alminiumにアクセスできる

## ref
[ref1](http://kaji-3.hatenablog.com/entry/2012/03/31/233405)
