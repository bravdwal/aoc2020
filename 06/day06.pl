# USAGE: perl day06-1.pl <INPUT>

$/ = ""; # read in paragraph mode

while (<>) {
  %h = (); # Used in part 1
  %p = (); # Used in part 2
  $h = $_; # copy for part 2

  # Part 1
  # put the answers of all members of the group on one line
  s/\n//g;

  # make sure there is a key for each distinct character
  foreach $char ($_) {
    $h{$char} = 1;
  }

  # count the amount of distinct characters
  $count1 += keys %h;

  # Part 2
  $n = 0; # people in a group

  # Loop through each line in the paragraph.
  # The '\n?' is important because the file might
  # not have a trailing newline but we need the
  # answer of that person too.
  while ($h =~ /([a-z]+)\n?/g) {
    $n++;
    foreach $char (split //, $1) {
      $p{$char} += 1;
    }
  }

  # count all characters that were present in everyone's answers
  foreach $char (keys %p) {
    $count2++ if $p{$char} == $n;
  }
}

print "Part 1: $count1\n";
print "Part 2: $count2\n";
