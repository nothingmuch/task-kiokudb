#!/usr/bin/perl

use strict;
use warnings;
use inc::Module::Install 0.77;

name 'Task-KiokuDB';
all_from 'lib/Task/KiokuDB.pm';

requires 'KiokuDB' => 0;

feature 'JSPON backend',
    -default         => 1,
    'KiokuDB::Backend::JSPON' => 0;

feature 'Berkeley DB backend',
    -default         => 0,
    'BerkeleyDB::Manager' => 0,
    'KiokuDB::Backend::BDB' => 0;

recommends 'Data::UUID::LibUUID';

auto_install;
WriteAll;
