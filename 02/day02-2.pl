# USAGE 1: perl day02.pl <input-file>
# USAGE 2: <OUTPUT> | perl day02.pl

while (<>) {
  $_ =~ /^(\d+)-(\d+) (.): (.*)$/;

  # Excersise 2
  $char1 = substr($4, $1 - 1, 1);
  $char2 = substr($4, $2 - 1, 1);
  if (($char1 eq $3 || $char2 eq $3) && ($char1 ne $char2)) {
    $c2++;
  }
}

print "Valid passwords ex2: $c2\n";
