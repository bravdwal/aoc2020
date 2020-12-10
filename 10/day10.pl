# USAGE: perl day10.pl <INPUT>

while (<>) {
    chomp;
    push @in, $_;
}

@adp = sort {$a <=> $b} @in;

# Part 1
$freq{1} = 1;
$freq{3} = 1;

for ($i = 1; $i < @adp; $i++) {
    $freq{$adp[$i] - $adp[$i-1]} += 1;
}

#print join("\n", map {"$_  ->  $freq{$_}"} keys %freq), "\n";
print "Part 1: ", ($freq{1} * $freq{3}), "\n";

# Part 2
$dp{0} = 1;
for $joltage (@adp) {
    $dp{$joltage} = ($dp{$joltage-3} || 0) + ($dp{$joltage-2} || 0) + ($dp{$joltage-1} || 0);
}

print "Part 2: ", $dp{$adp[-1]}, "\n";
