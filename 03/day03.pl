# USAGE 1: perl day03.pl <input-file>
# USAGE 2: <OUTPUT> | perl day03.pl

$ROW_SIZE = 31;

$a = 0; # index for: right 1, down 1
$b = 0; # index for: right 3, down 1
$c = 0; # index for: right 5, down 1
$d = 0; # index for: right 7, down 2

$i = 0;
while (<>) {
    chomp $_;

    # right 1, down 1
    $aa++ if substr($_, $a, 1) eq "#";
    $a = ($a + 1) % $ROW_SIZE;

    # right 3, down 1
    $bb++ if substr($_, $b, 1) eq "#";
    $b = ($b + 3) % $ROW_SIZE;

    # right 5, down 1
    $cc++ if substr($_, $c, 1) eq "#";
    $c = ($c + 5) % $ROW_SIZE;

    # right 7, down 1
    $dd++ if substr($_, $d, 1) eq "#";
    $d = ($d + 7) % $ROW_SIZE;

    # right 1, down 2
    $ee++ if $i % 2 == 0 && substr($_, $e, 1) eq "#";
    $e = ($e + 1) % $ROW_SIZE if $i % 2 == 0;
    
    $i++;
}

print "right 1, down 1 encounters $aa trees\n";
print "right 3, down 1 encounters $bb trees\n";
print "right 5, down 1 encounters $cc trees\n";
print "right 7, down 1 encounters $dd trees\n";
print "right 1, down 2 encounters $ee trees\n";
print "multiplication is ", ($aa * $bb * $cc * $dd * $ee), "\n";
