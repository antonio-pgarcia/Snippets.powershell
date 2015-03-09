# -- | Function head
function head($list) {
	return $list | Select-Object -first 1
}

# -- | Function tail
function tail($list) {
	return $list | Select-Object -skip 1
}

# -- | Function fst
function fst($l) {
	return $t.Item1
}

# -- | Function snd
function snd($l) {
	return $t.Item2
}

# -- | Function length
function length($list) {
	$len = $list.length
	$len = if($len -eq $null) {0} else {$len}
	return $len
}

# -- | Removes the nth element from list
function drop($i, $l) {
	 _drop ($i) $l 0 @()
}

# -- | Auxiliary recursive drop entry point
function _drop($i, $l1, $p, $l2) {
	 if((length $l2) -eq (length $l1)-1) {return $l2}
	 else {
		$p = if($p -eq $i) {($p+1)} else {$p}
		_drop $i $l1 ($p+1) @($l2 + $l1[$p])
	}  	 
} 

# -- | Pop nth element from list and returns a tuple
function pop($i, $l) {
	if($l -eq $null) {return New-Object 'Tuple[int,int[]]'($null,$())}
	write-host "pop: (" $i ") " $l  
	$e = $l[$i]
	$ll = drop $i $l
	return New-Object 'Tuple[int,int[]]'($e,$ll)
}

# -- | Function myrandom
function myrandom($a, $b, $s) {
	if($a -ge $b) {return 0}
	else {return Get-Random -Minimum $a -Maximum $b -SetSeed $s}
}

# -- | Shuffle a list
function shuffle($l) {
	return _shuffle (myrandom 0 (length $l) 0) $l @()
}

# -- | Auxiliary shuffle
function _shuffle($r, $l1, $l2) {
	$len = (length $l1) 
	#write-host "shuffle: (" $r ") " (snd $t)  
	$t = pop $r $l1
	if($len -eq 0) { return $l2 }
	else { _shuffle (myrandom 0 ($len-1) $r) $t.Item2 @($l2 + (fst $t) ) }
}

# -- | The main entry point.
function main {
    "Welcome to ListShuffle!";
    $l = 1..10
    shuffle $l
}


main
