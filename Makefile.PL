# $Id: Makefile.PL,v 1.4 2008-09-03 16:32:37 cantrelld Exp $

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'Class-DBI-ClassGenerator',
    VERSION_FROM  => 'lib/Class/DBI/ClassGenerator.pm',
    PREREQ_PM     => {
        'Test::More'  => 0,
        'DBI'         => 0,
        'DBD::SQLite' => 0,
        'File::Temp'  => 0.19,
    },
    EXE_FILES     => [qw(
        bin/c-dbi-classgenerator
    )],
);
