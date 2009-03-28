# $Id: sqlite_create_db.pl,v 1.1 2008-08-27 15:09:31 cantrelld Exp $

use strict;
use warnings;

use DBI;
use File::Temp;

my $dbfile = File::Temp->new(UNLINK => 0)->filename();

my $dbh = DBI->connect("dbi:SQLite:dbname=$dbfile", '', '');

$dbh->do(q{
    CREATE TABLE person (
        id          INT PRIMARY KEY NOT NULL,
        known_as    VARCHAR(128),
        formal_name VARCHAR(128),
        dob         DATETIME
    );
});
$dbh->do(q{
    CREATE TABLE address (
        id          INT PRIMARY KEY,
        person_id   INT,
        address_text VARCHAR(255),
        postcode_area CHAR(4),
        postcode_street CHAR(3)
    );
});

$dbfile;
