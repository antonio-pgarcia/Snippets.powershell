using System;

# -- | Function head
function head($list) {
	return $list | Select-Object -first 1
}

# -- | Function tail
function tail($list) {
	return $list | Select-Object -skip 1
}

# -- | Function myrandom
function myrandom($a, $b, $s) {
	return Get-Random -Minimum $a -Maximum $b -SetSeed $s
}

# -- | The main entry point.
function main {
    "Welcome to ListShuffle!";
}


main
