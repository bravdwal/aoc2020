$PSIZE = 25; # preamble size

sub is_valid {
    local ($value, $window) = @_;
    for (local $i = 0; $i < $PSIZE; $i++) {
	for (local $j = 1; $j < $PSIZE; $j++) {
	    if ($window->[$i] + $window->[$j] == $value) {
		return 1;
	    }
	}
    }
    return 0;
}

for ($i = 0; $i < $PSIZE; $i++) {
    $_ = <>;
    chomp;
    push @window, $_;
}

while (<>) {
    chomp;
    if (is_valid($_, \@window)) {
	shift @window;
	push @window, $_;
    } else {
	print "Part 1: $_\n";
	last;
    }
}
