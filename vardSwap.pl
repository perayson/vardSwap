#!/usr/bin/perl

# Script to swap historical spelling variant and modern equivalent in VARD output
# This script assumes the format described in the VARD documentation e.g.
# <normalised orig="Raigne" auto="false">Reign</normalised>
# Converted output will be:
# <normalised reg="Reign" auto="false">Raigne</normalised>
# or:
# <w><choice><reg>Reign</reg><orig>Raigne</orig></choice></w>
# depending on which line you comment out.

# Paul Rayson
# 12th November 2017

# To run type "perl vardSwap.pl input.txt output.txt" or similar

open(INPUT, "< $ARGV[0]");
open(OUTPUT, "> $ARGV[1]");

# Swap historical variant and modern form leaving the remainder of the text untouched

while (<INPUT>)
	{
	# simple swap preserving normalised tag
#	s#<normalised orig="([^"]*)" auto="false">([^<]*)</normalised>#<normalised reg="\2" auto="false">\1</normalised>#g;
		
	# swap and change to choice tag
	s#<normalised orig="([^"]*)" auto="false">([^<]*)</normalised>#<w><choice><reg>\2</reg><orig>\1</orig></choice></w>#g;

	print OUTPUT $_;
	}

close(INPUT);
close(OUTPUT);

