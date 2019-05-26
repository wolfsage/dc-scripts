#!/usr/bin/perl

use strict;
use warnings;

use IPC::Open3;

no warnings 'once';
my $pid = open3(\*IN, \*OUT, \*ERR,
  'dc maze.dc'
);

while (<OUT>) {
  if ($_ =~ /^>2 please/) {
    my $rand = int(rand(2));
    print { *IN } $rand . "\n";
    next;
  }

  print $_;
}
