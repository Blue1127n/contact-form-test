FROM php:8.0

# 必要な PHP 拡張をインストール
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    && docker-php-ext-install xml pdo pdo_mysql

# 作業ディレクトリを設定
WORKDIR /var/www

# Composer をインストール
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# アプリケーションソースをコピー
COPY . .

# Composer で依存関係をインストール
RUN composer install
