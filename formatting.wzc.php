<?php

function normalize_whitespace( $str ) {
	if ( ! is_array( $str ) ) {
		$str = trim( $str );
		$str = str_replace( "\r", "\n", $str );
		$str = preg_replace( array( '/\n+/', '/[ \t]+/' ), array( "\n", ' ' ), $str );
	}

	return $str;
}
