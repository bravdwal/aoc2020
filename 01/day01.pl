# USAGE 1: perl day01.pl <input-file>
# USAGE 2: <OUTPUT> | perl day01.pl

while (<>) {
  $_ =~ /^(\d+)$/;
  push @t, $1;
}

# Excersise 1
OUTER:
for $i (0..@t-1) {
  for $j ($i+1..@t-1) {
    if ($t[$i] + $t[$j] == 2020) {
      print "$t[$i] * $t[$j] = ", ($t[$i] * $t[$j]), "\n";
      last OUTER;
    }
  }
}

# Excersise 2
for $i (0..@t-1) {
  for $j ($i+1..@t-1) {
    for $k ($j+1..@t-1) {
      if ($t[$i] + $t[$j] + $t[$k] == 2020) {
	print "$t[$i] * $t[$j] * $t[$k] = ", ($t[$i] * $t[$j] * $t[$k]), "\n";
	exit 0;
      }
    }
  }
}
