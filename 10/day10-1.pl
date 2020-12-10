# USAGE: perl day10-1.pl

while (<>) {
    chomp;
    push @in, $_;
}

@adp = sort {$a <=> $b} @in;

$freq{1} = 1;
$freq{3} = 1;

for ($i = 1; $i < @adp; $i++) {
    $freq{$adp[$i] - $adp[$i-1]} += 1;
}

#print join("\n", map {"$_  ->  $freq{$_}"} keys %freq), "\n";
print "Part 1: ", ($freq{1} * $freq{3}), "\n";
