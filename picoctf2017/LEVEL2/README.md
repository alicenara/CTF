# LEVEL 2 :waxing_crescent_moon:
## FORENSICS :whale:
### Meta Find Me  :koala:

They give you a picture, so what?
I changed exposure, contrast... in order to see something, but no.
I run ``` identify -verbose image.jpg  ``` in order to check its internals... and yeah, the flag is there.
The only thing that I didn't get at first was the format of the latitude and longitude, but I found the
explanation in Stack Overflow (unsurprisingly..) 
(https://stackoverflow.com/questions/4983766/getting-gps-data-from-an-images-exif-in-c-sharp/4993222#4993222)

> Latitude is expressed as three rational values giving the degrees, minutes, and seconds respectively. When degrees, 
> minutes, and seconds are expressed, the format is dd/1, mm/1, ss/1. When degrees and minutes are used and, for example, 
> fractions of minutes are given up to two decimal places, the format is dd/1, mmmm/100, 0/1.