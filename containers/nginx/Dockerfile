FROM nginx:1.14.0

# 設定ファイル更新
RUN rm -f /etc/nginx/conf.d/*
ADD nginx.conf /etc/nginx/conf.d/app.conf

# Nginx 起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
