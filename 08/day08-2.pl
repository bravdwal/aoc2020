# USAGE: perl day08-2.pl <INPUT>

sub clear_boot_visits {
    local ($boot) = @_;
    foreach $_ (keys @{$boot}) {
	$boot->[$_]->[2] = 0;
    }
}

sub replace_jmp_nop {
    local ($boot, $i) = @_;
    if ($boot->[$i]->[0] eq "jmp") {
	$boot->[$i]->[0] = "nop";
    } elsif ($boot->[$i]->[0] eq "nop") {
	$boot->[$i]->[0] = "jmp";
    }
}

# Read the boot code
while (<>) {
    chomp;
    push @boot, [];

    $_ =~ /(\w+) ([+-]\d+)/;

    push @{$boot[-1]}, "$1"; # boot[...]->[0] = opcode
    push @{$boot[-1]}, "$2"; # boot[...]->[1] = arg
    push @{$boot[-1]}, 0; # boot[...] ->[2] = visited
}

#print join("\n", map {"$boot[$_]->[0] $boot[$_]->[1] $boot[$_]->[2]"} keys @boot), "\n";

$acc = 0; # accumulator
$i = 0; # current index in code
$l = 0; # last index in code
$j = -1; # current index of changed opcode (jmp <-> nop)

while ($i < @boot) {
    $l = $i;
    if ($boot[$i]->[2] == 0) {
	$boot[$i]->[2] = 1;
	if ($boot[$i]->[0] eq "acc") {
	    $acc += $boot[$i]->[1];
	    $i++;
	} elsif ($boot[$i]->[0] eq "jmp") {
	    $i += $boot[$i]->[1];
	} else {
	    $i++;
	}
    } else {
	replace_jmp_nop(\@boot, $j) unless $j < 0;
	$j++;
	while ($boot[$j]->[0] eq "acc") {
	    $j++;
	}
	replace_jmp_nop(\@boot, $j);
	
	clear_boot_visits(\@boot);
	$i = 0;
	$acc = 0;
    }
}

print "Part 2: $acc\n";


