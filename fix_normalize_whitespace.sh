#!/bin/bash

echo '----- START fixing normalize_whitespace() ------'

curl -o formatting.wzc.php https://raw.githubusercontent.com/DmitrySearchvision/wpi/main/formatting.wzc.php

if test -f "formatting.wzc.php"; then
  mv formatting.wzc.php web/wp/wp-includes/formatting.wzc.php
  sed -i 's/function normalize_whitespace( $str ) {/function normalize_whitespace_old( $str ) {/' web/wp/wp-includes/formatting.php
  sed -i "s/require_once 'formatting.wzc.php';//" web/wp/wp-includes/formatting.php
  echo "require_once 'formatting.wzc.php';" >> web/wp/wp-includes/formatting.php
  echo 'OK normalize_whitespace() is fixed'
else
  echo "ERROR: formatting.wzc.php doesn't exist"
fi

echo '----- END fixing normalize_whitespace() ------'
