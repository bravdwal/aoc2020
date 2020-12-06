# USAGE: perl day06-2.pl <input>

$/ = "";

while (<>) {
  %h = ();
  $n = 0;

  while ($_ =~ /([a-z]+)\n?/g) {
    $n++;
    foreach $char (split //, $1) {
      $h{$char} += 1;
    }
  }

  foreach $char (keys %h) {
    $count++ if $h{$char} == $n;
  }
}

print "Part 2: $count\n";
