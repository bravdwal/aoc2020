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
$i = 0;
while (<>) {
    chomp;
    push @boot, [];

    $_ =~ /(\w+) ([+-]\d+)/;

    push @{$boot[-1]}, "$1"; # boot[...]->[0] = opcode
    push @{$boot[-1]}, "$2"; # boot[...]->[1] = arg
    push @{$boot[-1]}, 0; # boot[...] ->[2] = visited

    push @jns, $i if $1 ne "acc"; # keep rack of jmps and nops
    $i++;
}

#print join("\n", map {"$boot[$_]->[0] $boot[$_]->[1] $boot[$_]->[2]"} keys @boot), "\n";

$acc = 0; # accumulator
$i = 0; # index of next opcode to execute in boot code
$j = -1; # index in @jns of changed opcode (jmp <-> nop)

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
	# If an opcode was changed before, undo this change
	replace_jmp_nop(\@boot, $jns[$j]) unless $j < 0;
	$j++; # Maybe the next jmp or nop need to be changed
	replace_jmp_nop(\@boot, $jns[$j]);

	# Reset the visited, $i and $acc
	clear_boot_visits(\@boot);
	$i = 0;
	$acc = 0;
    }
}

print "Part 2: $acc\n";


