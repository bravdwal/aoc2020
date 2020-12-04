# USAGE: perl day02.pl <input-file>

while (<>) {
  $_ =~ /^(\d+)-(\d+) (.): (.*)$/;
  #print "min = $1, max = $2, char = $3, pwd = $4\n";

  # Excersise 1
  %h = ();
    foreach $char (split //, $4) {
      $h{$char} += 1;
    }

  #print join ", ", map {"$_ -> $h{$_}"} keys %h;
  #print "\n";

  if ($1 <= $h{$3} && $2 >= $h{$3}) {
    $c1++;
  }

  # Excersise 2
  $char1 = substr($4, $1 - 1, 1);
  $char2 = substr($4, $2 - 1, 1);
  if (($char1 eq $3 || $char2 eq $3) && ($char1 ne $char2)) {
    $c2++;
  }
}

print "Valid passwords ex1: $c1\n";
print "Valid passwords ex2: $c2\n";
