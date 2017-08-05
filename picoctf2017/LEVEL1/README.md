# LEVEL 1

## FORENSICS 

### Digital Camouflage

Ok, you need to retrieve the router's password. They give you a .pcap file with a network capture and you need some program
 like wireshark (https://www.wireshark.org/) in order to inspect it.

Then, if you just ignore router sync traffic and look for requests between client and server (those using HTTP protocol), 
 reading the ASCII content of some packets you can see that someone is using the control panel of a router.

Usually, to log in a website, a POST message is sent with the introduced user and password in order to check if they are 
 correct. In this case, we can see this POST request:
 ```
    HTML Form URL Encoded: application/x-www-form-urlencoded
        Form item: "userid" = "randled"
            Key: userid
            Value: randled
        Form item: "pswrd" = "OFBGRW8wdHRIUQ=="
            Key: pswrd
            Value: OFBGRW8wdHRIUQ==
 ```
 Ìf we check the ASCII raw value we can see that, instead of == it has %3D%3D but it's due to the encoding.

Finally, something ending like == is probably encoded in Base64, so you just need to decode it (http://base64decode.net/).

### Special Agent User

Another .pcap file, yay. 

The User Agent is a field in web requests that is used to get data about the client. For example:
 ``` Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36 ``` 

- The user agent application is Mozilla version 5.0, or a piece of software compatible with it. MozillaProductSlice. Claims to be a Mozilla based user agent, which is only true for Gecko browsers like Firefox and Netscape. For all other user agents it means 'Mozilla-compatible'. In modern browsers, this is only used for historical reasons. It has no real meaning anymore.
- The X11 we see means X Window System: a windowing system for bitmap displays.
- The operating system is Linux, on an Intel CPU, 64 bit processor.
- The engine responsible for displaying content on this device is AppleWebKit version 537.36 (and KHTML, an open source layout engine, is present too).
- The client (browser) is Chrome version 58.0.3029.96.
- The client is based on Safari version 537.36.

(Info obtained from http://www.useragentstring.com/ and http://www.whoishostingthis.com/tools/user-agent/)

And the same but using Firefox (who also tells you which Linux is being used):

``` Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:54.0) Gecko/20100101 Firefox/54.0 ```

So for this problem you need to find an HTTP packet with the user agent.
