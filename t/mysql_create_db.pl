# $Id: mysql_create_db.pl,v 1.1 2008-08-27 15:09:31 cantrelld Exp $

use strict;
use warnings;

use DBI;

if(
    my $db = DBI->connect('dbi:mysql:', 'root', '')
) {
    my $dbname = 'DRCcdbicgentest01';
    while(!$db->do("CREATE DATABASE $dbname")) {
        $dbname++;
        last if($dbname eq 'DRCcdbicgentest10');
    }
    END {
        $db->do("DROP DATABASE $dbname") if($dbname);
    }

    if($dbname ne 'DRCcdbicgentest10') {
        my $dbh = DBI->connect("dbi:mysql:database=$dbname", 'root', '');

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
    }
    $dbname;
} else {
    'DRCcdbicgentest10';
}
