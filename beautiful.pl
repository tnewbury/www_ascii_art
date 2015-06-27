#!/usr/bin/perl

#use strict;

#use warnings;

use GD;
#use HTTP::Lite;
use String::HexConvert ':all';


$filename=0;


$filename ++;

my $hexcode = "";
my $twitcode = "";
my $x=0; # x coord
my $y=0; # y coord
my $i=0; #loop var
my $row =0;
my $weight=0;
my $r =0;
my $g =0;
my $b =0;


        #my $im = new GD::Image(20,10);

#$http = HTTP::Lite->new;
#$req = $http->request("http://wemakeawesomesh.it/make")
#$req = $http->request("http://twitter.com/justinbieber") 
#$req = $http->request("http://www.cpan.org") 
#$req = $http->request("http://feeds.bbci.co.uk/news/rss.xml")
#$req = $http->request("http://hatrafficinfo.dft.gov.uk/feeds/datex/England/MatrixSignals/content.xml")
#$req = $http->request("http://www.theregister.co.uk")

 #               or die "Unable to get document: $!";

#$twitcode = $http->body();

open FILE, "0xhgp10a.txt" or die $!;
binmode FILE;

while (<FILE>) {
	 $twitcode .= $_;
 }

$hexcode = ascii_to_hex($twitcode);

$size = sqrt((length($hexcode) / 6) );

my $im = new GD::Image($size,$size,1);
#print $hexcode;

for ($i=0;$i <= length($hexcode);$i = $i + 2){ 
        $row ++;
        $weight ++;
#        print "\n\nWEIGHT:  $weight CHARPOS:  $i \n";
			
			if ($weight == 1){
				$r = hex(substr($hexcode, $i, 2));
#				print "\n" . substr($hexcode, $i, 2);
			} 

			if ($weight == 2){

				$g = hex(substr($hexcode, $i, 2));
#				print "\n" . substr($hexcode, $i, 2);

			}

			if ($weight == 3){

				$b = hex(substr($hexcode, $i, 2));

#				print "\n" . substr($hexcode, $i, 2);

#				print "\nCOORDS: X: $x, Y: $y----- $r,$g,$b\n";

				$cursorcolour = $im->colorAllocate($r,$g,$b); 

				$im->GD::Image::setPixel($x,$y,$cursorcolour); 

				$x++;

                $weight=0;

					if ($x >= $size){

                        $x=0;

                        $y++;

					}

			}        

}


        

        binmode STDOUT;

        open (MYFILE, ">frame.png");

        print MYFILE $im->png;

        close (MYFILE);


