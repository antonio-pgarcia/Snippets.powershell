# |-- resolve network addresses
function netgrasp($n) {
    $byte = 0..255
    $class = 8,16,24
    if(-Not ($n -match "^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/(\d{1,2})$") ) { write-host "invalid network" $n; return }   
    if(-Not ($class -contains $matches[5])) { write-host "invalid network mask" $matches[5]; return }   
    
    $ip1 = $matches[1]
    $ip2 = @(&{If($matches[5] -eq 8 ) {$byte} Else {$matches[2]}})
    $ip3 = @(&{If($matches[5] -eq 16 ) {$byte} Else {$matches[3]}})
    $ip4 = @($byte)
    
    foreach($o2 in $ip2) {
        foreach($o3 in $ip3) {
            foreach($o4 in $ip4) {
                [string]$ip = $ip1 + "." + $o2 + "." + $o3 + "." + $o4
                $name = $ip
                try{$name = [System.Net.Dns]::GetHostEntry($ip).HostName} catch{}
                $name = (&{If($ip -eq $name ) {"Unassigned"} Else {$name}})
                write-host "[" $ip "<- " $name "]";
            }
        }
    }
}

# |-- The main entry point.
function main {
    param([Parameter(Mandatory=$True,Position=1)][string]$net)
    "Welcome to netgrasp"; 
    write-host "trying to grasp net:" $net;   
    netgrasp($net)
}

# | -- calling main function
main @args;

