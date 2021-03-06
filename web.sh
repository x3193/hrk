# Apache configuration
# Modifications to conf/apache2/heroku.conf from the Heroku PHP buildpack
echo "ServerSignature Off" >> /app/.heroku/php/etc/apache2/heroku.conf
echo "ServerTokens Prod" >> /app/.heroku/php/etc/apache2/heroku.conf
echo "HostnameLookups Off" >> /app/.heroku/php/etc/apache2/heroku.conf
echo "TraceEnable Off" >> /app/.heroku/php/etc/apache2/heroku.conf
echo "ServerLimit 32" >> /app/.heroku/php/etc/apache2/heroku.conf
echo "MaxClients 32" >> /app/.heroku/php/etc/apache2/heroku.conf

# PHP configuration
# Modifications to conf/php/php.ini from the Heroku PHP buildpack
#sed -i 's/^expose_php = On/expose_php = Off/' /app/.heroku/php/etc/php/php.ini
#sed -i 's/^file_uploads = On/file_uploads = Off/' /app/.heroku/php/etc/php/php.ini
#sed -i 's/^short_open_tag = On/short_open_tag = Off/' /app/.heroku/php/etc/php/php.ini
sed -i 's/^post_max_size = 8M/post_max_size = 400M/' /app/.heroku/php/etc/php/php.ini
sed -i 's/^upload_max_filesize = 2M/upload_max_filesize = 400M/' /app/.heroku/php/etc/php/php.ini
sed -i 's/^max_file_uploads = 20/max_file_uploads = 800/' /app/.heroku/php/etc/php/php.ini
#sed -i 's/^log_errors = On/log_errors = Off/' /app/.heroku/php/etc/php/php.ini
# #sed -i 's/^output_buffering = 4096/output_buffering = 4096/' /app/.heroku/php/etc/php/php.ini
sed -i 's/^max_execution_time = 30/max_execution_time = 300000/' /app/.heroku/php/etc/php/php.ini
sed -i 's/^max_input_time = 60/max_input_time = 600000/' /app/.heroku/php/etc/php/php.ini
sed -i 's/^memory_limit = 128M/memory_limit = 400M/' /app/.heroku/php/etc/php/php.ini
# #sed -i 's/^html_errors = Off/html_errors = Off/' /app/.heroku/php/etc/php/php.ini
#sed -i 's/^error_reporting = E_ALL & ~E_NOTICE/error_reporting = E_ALL \& ~E_STRICT/' /app/.heroku/php/etc/php/php.ini
sed -i 's/^display_errors = Off/display_errors = On/' /app/.heroku/php/etc/php/php.ini
# #sed -i 's/^session.use_cookies = 1/session.use_cookies = 1/' /app/.heroku/php/etc/php/php.ini
# #sed -i 's/^session.use_only_cookies = 1/session.use_only_cookies = 1/' /app/.heroku/php/etc/php/php.ini
# #sed -i 's/^session.cookie_lifetime = 0/session.cookie_lifetime = 0/' /app/.heroku/php/etc/php/php.ini
#sed -i 's/^session.cookie_httponly =/session.cookie_httponly = On/' /app/.heroku/php/etc/php/php.ini
# #sed -i 's/^session.use_trans_sid = 0/session.use_trans_sid = 0/' /app/.heroku/php/etc/php/php.ini
#echo "ignore_user_abort = On" >> /app/.heroku/php/etc/php/php.ini

# Launch Apache with PHP
# Set web root to folder public_html
#vendor/bin/heroku-php-apache2 public_html
vendor/bin/heroku-php-apache2 web/
