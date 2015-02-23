use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'Class::DBI::ClassGenerator',
    META_MERGE => {
        license => 'other',
        resources => {
	    repository => 'https://github.com/DrHyde/perl-modules-Class-DBI-ClassGenerator',
	    bugtracker => 'https://github.com/DrHyde/perl-modules-Class-DBI-ClassGenerator/issues'
        }
    },
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
