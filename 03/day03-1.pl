# USAGE 1: perl day03.pl <input-file>
# USAGE 2: <OUTPUT> | perl day03.pl

$ROW_SIZE = 31;

$b = 0; # index for: right 3, down 1

$i = 0;
while (<>) {
    chomp $_;

    # right 3, down 1
    $bb++ if substr($_, $b, 1) eq "#";
    $b = ($b + 3) % $ROW_SIZE;
    
    $i++;
}

print "right 3, down 1 encounters $bb trees\n";
