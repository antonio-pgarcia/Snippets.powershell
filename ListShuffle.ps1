using System;

# -- | Function head
function head($list) {
	return $list | Select-Object -first 1
}

# -- | Function tail
function tail($list) {
	return $list | Select-Object -skip 1
}

# -- | The main entry point.
function main {
    "Welcome to ListShuffle!";
}


main
