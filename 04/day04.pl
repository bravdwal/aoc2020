# USAGE: perl day04.pl <input-file>

$/ = "";

$c = 0;
$cc = 0;

while (<>) {
    %h = ();

    print "$_\n";
    while (/(\w+):(.*?)( |\n)/g) {
	print "1 = $1 en 2 = $2\n";
        $h{$1} = $2;
    }
    print "\n";

    print join "\n", map {"$_ -> $h{$_}"} keys %h;
    print "\n\n";

    # Part 1
    if (exists $h{byr} && exists $h{iyr} && exists $h{eyr} && exists $h{hgt} && exists $h{hcl} && exists $h{ecl} && exists $h{pid}) {
	$c++;
    }

    # Part 2
    if ($h{byr} =~ /\d{4}/ && $h{byr} >= 1920 && $h{byr} <= 2002 &&
	$h{iyr} =~ /\d{4}/ && $h{iyr} >= 2010 && $h{byr} <= 2020 &&
	$h{eyr} =~ /\d{4}/ && $h{eyr} >= 2020 && $h{byr} <= 2030 &&
	$h{hgt} =~ /(\d+)(cm|in)/ &&
	$h{hcl} =~ /#([0-9]{6}|[a-f]{6})/ &&
	$h{ecl} =~ /(amb|blu|brn|gry|grn|hzl|oth)/ &&
	$h{pid} =~ /\d{9}/) {
	$cc++ if (($2 eq "cm" && $1 >= 150 && $1 <= 193) || ($2 eq "in" && $1 >= 59 && $1 <= 76));
    }
}

print "There were $c valid passwords found for part 1\n";
print "There were $cc valid passwords found for part 2\n";
