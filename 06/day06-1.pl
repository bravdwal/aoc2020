# USAGE: perl day06-1.pl <INPUT>

$/ = "";

while (<>) {
  %h = ();
  s/\n//g;

  foreach $char ($_) {
    $h{$char} = 1;
  }

  $count += keys %h;
}

print "Part 1: $count\n";
