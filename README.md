# PHP Alpine Base Images

[![Build Status](https://img.shields.io/travis/vkerkhoff/docker-php-alpine/master.svg)](https://travis-ci.org/vkerkhoff/docker-php-alpine)
[![Docker Pulls](https://img.shields.io/docker/pulls/vkerkhoff/php-alpine.svg)](https://hub.docker.com/r/vkerkhoff/php-alpine/)
[![Image Size](https://images.microbadger.com/badges/image/vkerkhoff/php-alpine.svg)](https://microbadger.com/images/vkerkhoff/php-alpine)

Public image for php in alpine with a set of common extensions

## Images

- `7.2`, `7`, `latest` [7.2/Dockerfile](https://github.com/vkerkhoff/docker-php-alpine/blob/master/7.2/Dockerfile)
- `7.1` [7.1/Dockerfile](https://github.com/vkerkhoff/docker-php-alpine/blob/master/7.1/Dockerfile)
- `7.0` [7.0/Dockerfile](https://github.com/vkerkhoff/docker-php-alpine/blob/master/7.0/Dockerfile)

### PHP Modules

[apcu](http://php.net/manual/en/book.apcu.php) (PHP 7.0 +), [bcmath](http://php.net/manual/en/book.bc.php), Core,
[ctype](http://php.net/manual/en/book.ctype.php), [curl](http://php.net/manual/en/book.curl.php),
[date](http://php.net/manual/en/book.datetime.php), [dom](http://php.net/manual/en/book.dom.php),
[ev](http://php.net/manual/en/book.ev.php), [fileinfo](http://php.net/manual/en/book.fileinfo.php),
[filter](http://php.net/manual/en/book.filter.php), [hash](http://php.net/manual/en/book.hash.php),
[iconv](http://php.net/manual/en/book.iconv.php) (with a [fix](https://github.com/docker-library/php/issues/240)),
[intl](http://php.net/manual/en/book.intl.php), [json](http://php.net/manual/en/book.json.php),
[libxml](http://php.net/manual/en/book.libxml.php), [mbstring](http://php.net/manual/en/book.mbstring.php),
[memcached](http://php.net/manual/en/book.memcached.php), [mysqli](http://php.net/manual/en/book.mysqli.php),
[mysqlnd](http://php.net/manual/en/book.mysqlnd.php), [openssl](http://php.net/manual/en/book.openssl.php),
[pcre](http://php.net/manual/en/book.pcre.php), [PDO](http://php.net/manual/en/book.pdo.php),
[pdo_mysql](http://php.net/manual/en/ref.pdo-mysql.php), [pdo_pgsql](http://php.net/manual/en/ref.pdo-pgsql.php),
[pdo_sqlite](http://php.net/manual/en/ref.pdo-sqlite.php), [pgsql](http://php.net/manual/en/book.pgsql.php),
[Phar](http://php.net/manual/en/book.phar.php), [posix](http://php.net/manual/en/book.posix.php),
[readline](http://php.net/manual/en/book.readline.php), [Reflection](http://php.net/manual/en/book.reflection.php),
[session](http://php.net/manual/en/book.session.php), [SimpleXML](http://php.net/manual/en/book.simplexml.php),
[soap](http://php.net/manual/en/book.soap.php), [sockets](http://php.net/manual/en/book.sockets.php),
[sodium](http://php.net/manual/en/book.sodium.php) (PHP 7.2 +), [SPL](http://php.net/manual/en/book.spl.php),
standard, [tokenizer](http://php.net/manual/en/book.tokenizer.php), [xml](http://php.net/manual/en/book.xml.php),
[xmlreader](http://php.net/manual/en/book.xmlreader.php), [xmlwriter](http://php.net/manual/en/book.xmlwriter.php),
[yaml](http://php.net/manual/en/book.yaml.php), [Zend OPcache](http://php.net/manual/en/book.opcache.php),
[zip](http://php.net/manual/en/book.zip.php), [zlib](http://php.net/manual/en/book.zlib.php)

## Testing Images

Testing images are the same as the standard, but with xdebug (php5.6) or phpdbg (php7.*)

- `7.2-test`, `7-test`, `test` [7.2/Dockerfile.debug](https://github.com/graze/docker-php-alpine/blob/master/7.2/Dockerfile.debug)
- `7.1-test` [7.1/Dockerfile.debug](https://github.com/graze/docker-php-alpine/blob/master/7.1/Dockerfile.debug)
- `7.0-test` [7.0/Dockerfile.debug](https://github.com/graze/docker-php-alpine/blob/master/7.0/Dockerfile.debug)

## Testing PHP Modules

All of the above modules, [xdebug](https://xdebug.org/) (PHP 5.6 only, PHP 7.0+ uses phpdbg)

## Dev

    ~ $ make build-quick
    ~ $ make tag test

## Pulling

    ~ $ docker pull vkerkhoff/php-alpine

## Usage

    ~ $ docker run --rm vkerkhoff/php-alpine -v $(pwd):/srv php some/script.php

## Running with phpdbg

    ~ $ docker run --rm vkerkhoff/php-alpine:test -v $(pwd):/srv phpdbg7 some/script.php
