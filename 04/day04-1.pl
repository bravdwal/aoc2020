# USAGE 1: perl day04.pl <input-file>
# USAGE 2: <OUTPUT> | perl day04.pl

# read file in paragraph mode
$/ = "";

$c = 0; # counter for part 1

while (<>) {
    %h = ();

    while (/(\w+):(.*?)( |\n)/g) {
        $h{$1} = $2;
    }

    # Part 1
    if (exists $h{byr} &&
	exists $h{iyr} &&
	exists $h{eyr} &&
	exists $h{hgt} &&
	exists $h{hcl} &&
	exists $h{ecl} &&
	exists $h{pid}) {
	$c++;
    }
}

print "Part 1: $c\n";
