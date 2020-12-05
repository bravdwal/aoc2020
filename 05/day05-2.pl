# USAGE 1: perl day05.pl <input-file>
# USAGE 2: <OUTPUT> | perl day05.pl

sub fb_mapper {
  local ($str) = @_;
  local $ret = "";

  foreach $c (split //, $str) {
    $ret = $ret . ($c eq "F" ? "0" : "1");
  }

  return $ret;
}

sub lr_mapper {
  local ($str) = @_;
  local $ret = "";

  foreach $c (split //, $str) {
    $ret = $ret . ($c eq "L" ? "0" : "1");
  }

  return $ret;
}

# Read all lines, convert to seat ID, put them in an array
while (<>) {
  $fb = substr($_, 0, 7);
  $lr = substr($_, 7, 3);

  $row = oct("0b" . fb_mapper($fb));
  $col = oct("0b" . lr_mapper($lr));

  $sid = $row * 8 + $col;
  push @t, $sid;
}

# Sort the seat ids
@s = sort {$a <=> $b} @t;

# Part 2
$i = 1;
while ($i < @s) {
  if ($s[$i] != $s[$i-1]+1) {
    print "Missing seat ID is ", ($s[$i-1]+1), "\n";
    last;
  }
  $i++;
}
