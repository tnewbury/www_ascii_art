#!/usr/bin/perl

use GD;
use String::HexConvert ':all';

my $filename=0;


open FILE, "0xhgp10a.txt" or die $!;
binmode FILE;

while (<FILE>) {
	 $content .= $_;
 }



$hexcode = ascii_to_hex($content);

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

        open (MYFILE, ">frame$filename.png");

        print MYFILE $im->png;

        close (MYFILE);
