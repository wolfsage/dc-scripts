#!/usr/bin/perl

use strict;
use warnings;

use IPC::Open3;

no warnings 'once';
my $pid = open3(\*IN, \*OUT, \*ERR,
  'dc maze.dc'
);

while (<OUT>) {
  if ($_ =~ /^>(\d+) please/) {
    my $rand = int(rand($1+1));
    print { *IN } $rand . "\n";
    next;
  }

  print $_;
}
