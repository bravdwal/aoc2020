# USAGE 1: perl day02.pl <input-file>
# USAGE 2: <OUTPUT> | perl day02.pl

while (<>) {
  $_ =~ /^(\d+)-(\d+) (.): (.*)$/;

  # Excersise 1
  %h = ();
    foreach $char (split //, $4) {
      $h{$char} += 1;
    }

  if ($1 <= $h{$3} && $2 >= $h{$3}) {
    $c1++;
  }
}

print "Valid passwords ex1: $c1\n";
