# USAGE: perl day07.pl <INTPUT>

sub uniq {
    local %h = ();
    foreach $k (@_) {
	$h{$k} = 1;
    }
    return keys %h;
}

sub children_count {
    local ($h, $f) = @_; # within hash %{$h}, give children of $f

    if (keys %{$h->{$f}} == 0) {
	return 0;
    } else {
	local $count = 0;
	foreach $c (keys %{$h->{$f}}) {
	    $count += $h->{$f}->{$c} * (children_count($h, $c) + 1);
	}
	return $count;
    }
}

# We'll create a hash of a hash. The keys of the outer hash are the bags
# and the keys of the inner bags are the containing bags of the outer hash.
# The values of the inner hash tell how many times the inner key is contained
# in the outer key.
#
# If $h{red}->{blue} = 5, it means that the red bag contains 5 blue bags.
# If $h{red}->{green} = 4, it means that the red bag contains 4 green bags.
# In total, red holds 9 bags (provided that the blue and green bags are empty)
while (<>) {
    $_ =~ /(.*?) bags contain (.*)/;
    $key = $1;
    $children = $2;

    $h{$key} = {};

    while ($children =~ /(\d+) (.*?) bags?[,.]/g) {
	$h{$key}->{$2} = $1;
    }

    #print "parent $key has children: ", join(" ", map {"**$_**"} keys %{$h{$key}}), "\n";
}

# Part 1
@t = ( "shiny gold" );
$i = 0;

while ($i < @t) {
    foreach $key (keys %h) {
	#print "Exists $t[$i] as child of $key?\n";
	if (exists $h{$key}->{$t[$i]}) {
	    #print "$t[$i] is a child of $key\n";
	    push @t, $key;
	}
    }
    
    $i++;
}

shift @t; # remove "shiny gold" from @t
@uniq = uniq @t;
$size = @uniq;

print "Part 1: $size\n";

# Part 2
$part2 = children_count(\%h, "shiny gold");
print "Part 2: $part2\n";
