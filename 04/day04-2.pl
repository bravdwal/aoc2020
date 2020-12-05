# USAGE 1: perl day04.pl <input-file>
# USAGE 2: <OUTPUT> | perl day04.pl

# read file in paragraph mode
$/ = "";

$cc = 0; # counter for part 2

sub valid_byr {
    local ($byr) = @_;
    return "$byr" =~ /^\d{4}$/ && $byr >= 1920 && $byr <= 2002 ? 1 : 0;
}

sub valid_iyr {
    local ($iyr) = @_;
    return $iyr =~ /^\d{4}$/ && $iyr >= 2010 && $iyr <= 2020 ? 1 : 0;
}

sub valid_eyr {
    local ($eyr) = @_;
    return $eyr =~ /^\d{4}$/ && $eyr >= 2020 && $eyr <= 2030 ? 1 : 0;
}

sub valid_hgt {
    local ($hgt) = @_;
    $hgt =~ /^(\d+)(cm|in)$/;

    if ($2 eq "cm") {
	return $1 >= 150 && $1 <= 193 ? 1 : 0;
    } elsif ($2 eq "in") {
	return $1 >= 59 && $1 <= 76 ? 1 : 0;
    }

    return 0;
}

sub valid_hcl {
    local ($hcl) = @_;
    return $hcl =~ /^#[0-9a-f]{6}$/ ? 1 : 0;
}

sub valid_ecl {
    local ($ecl) = @_;
    return $ecl =~ /^(amb|blu|brn|gry|grn|hzl|oth)$/ ? 1 : 0;
}

sub valid_pid {
    local ($pid) = @_;
    return "$pid" =~ /^\d{9}$/ ? 1 : 0;
}

while (<>) {
    %h = ();

    while (/(\w+):(.*?)( |\n)/g) {
        $h{$1} = $2;
    }

    # Part 2
    if (valid_byr("$h{byr}") &&
	valid_iyr("$h{iyr}") &&
	valid_eyr("$h{eyr}") &&
	valid_hgt("$h{hgt}") &&
	valid_hcl("$h{hcl}") &&
	valid_ecl("$h{ecl}") &&
	valid_pid("$h{pid}")) {
	$cc++;
    }
}

print "Part 2: $cc\n";
