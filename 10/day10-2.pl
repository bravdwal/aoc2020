# USAGE: perl day10-2.pl <INPUT>

while (<>) {
    chomp;
    push @in, $_;
}

@adp = sort {$a <=> $b} @in;

$dp{0} = 1;
for $joltage (@adp) {
    $dp{$joltage} = ($dp{$joltage-3} || 0) + ($dp{$joltage-2} || 0) + ($dp{$joltage-1} || 0);
}

print "Part 2: ", $dp{$adp[-1]}, "\n";
