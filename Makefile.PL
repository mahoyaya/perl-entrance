use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'test.pl',
  VERSION      => '1.0',
  AUTHOR       => 'mahoyaya <snakefighting@gmail.com>',
  EXE_FILES    => ['test.pl'],
  PREREQ_PM    => {'Mojolicious' => '2.0'},
  test         => {TESTS => 't/*.t'}
);