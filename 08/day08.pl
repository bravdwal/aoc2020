# USAGE: perl day08.pl <INPUT>

# Read the boot code
$pc = 0;
while (<>) {
    chomp;
    push @boot, [];

    $_ =~ /(\w+) ([+-]\d+)/;

    push @{$boot[-1]}, "$1" eq "jmp" ? 0 : "$1" eq "nop" ? 1 : 2; # boot[...]->[0] = opcode
    push @{$boot[-1]}, "$2"; # boot[...]->[1] = arg

    push @jns, $pc if $1 ne "acc"; # keep rack of jmps and nops
    $pc++;
}

#print join("\n", map {"$boot[$_]->[0] $boot[$_]->[1] $boot[$_]->[2]"} keys @boot), "\n";

$acc = 0; # accumulator
$pc = 0; # program counter within boot code
$j = -1; # index in @jns of changed opcode (jmp <-> nop)

while ($pc < @boot) {
    if ($visits{$pc} != 1) {
	$visits{$pc} = 1;
	if ($boot[$pc]->[0] == 2) {
	    $acc += $boot[$pc]->[1];
	    $pc++;
	} elsif ($boot[$pc]->[0] == 0) {
	    $pc += $boot[$pc]->[1];
	} else {
	    $pc++;
	}
    } else {
	# If no opcode was changed yet, then $acc is solution of part 1
	print "Part 1: $acc\n" if $j < 0;

	# If an opcode was changed before, undo this change
	$boot[$jns[$j]]->[0] = ($boot[$jns[$j]]->[0] + 1) % 2 unless $j < 0;
	$j++; # Maybe the next jmp or nop need to be changed
	$boot[$jns[$j]]->[0] = ($boot[$jns[$j]]->[0] + 1) % 2;

	# Reset the visited, $pc and $acc
	%visits = ();
	$pc = 0;
	$acc = 0;
    }
}

print "Part 2: $acc\n";


