# USAGE: perl day08-1.pl <INPUT>

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
        last;
    }
}

print "Part 1: $acc\n";
