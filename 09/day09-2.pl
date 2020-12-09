$PSIZE = 25; # preamble size

sub is_valid {
    local ($value, $window) = @_;
    for (local $i = 0; $i < $PSIZE - 1; $i++) {
	for (local $j = 1; $j < $PSIZE; $j++) {
	    if ($window->[$i] + $window->[$j] == $value) {
		return 1;
	    }
	}
    }
    return 0;
}

sub summation {
    local ($arr) = @_;
    local $sum = 0;
    for (local $i = 0; $i < @{$arr}; $i++) {
	$sum += $arr->[$i];
    }
    return $sum;
}

for ($i = 0; $i < $PSIZE; $i++) {
    $_ = <>;
    chomp;
    push @window, $_;
    push @list, $_;
}

while (<>) {
    chomp;
    push @list, $_;
    if (!$invalid && is_valid($_, \@window)) {
	shift @window;
	push @window, $_;
    } elsif (!$invalid) {
	print "Part 1: $_\n";
	$invalid = $_;
    }
}

# solution has at least 2 entries

for ($i = 0; $i < @list - 1; $i++) {
    @solution = ();
    push @solution, $list[$i];
    push @solution, $list[$i + 1];

    $j = $i + 2;

    while (summation(\@solution) < $invalid) {
	push @solution, $list[$j++];
    }

    if (summation(\@solution) == $invalid) {
	$min_idx = 0;
	$max_idx = 0;
	for ($k = 1; $k < @solution; $k++) {
	    if ($solution[$k] < $solution[$min_idx]) {
		$min_idx = $k;
	    } elsif ($solution[$k] > $solution[$max_idx]) {
		$max_idx = $k;
	    }
	}
	print "Part 2: $solution[$min_idx] + $solution[$max_idx] = ", ($solution[$min_idx] + $solution[$max_idx]), "\n";
	last;
    }
}
