# LEVEL 1  :new_moon:

## FORENSICS :whale:

### Digital Camouflage  :koala:

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

### Special Agent User  :penguin:

Another .pcap file, yay. 

The User Agent is a field in web requests that is used to get data about the client. For example:
 ``` Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36 ``` 

- The user agent application is Mozilla version 5.0, or a piece of software compatible with it. MozillaProductSlice. 
Claims to be a Mozilla based user agent, which is only true for Gecko browsers like Firefox and Netscape. 
For all other user agents it means 'Mozilla-compatible'. In modern browsers, this is only used for historical reasons. 
It has no real meaning anymore.
- The X11 we see means X Window System: a windowing system for bitmap displays.
- The operating system is Linux, on an Intel CPU, 64 bit processor.
- The engine responsible for displaying content on this device is AppleWebKit version 537.36 
(and KHTML, an open source layout engine, is present too).
- The client (browser) is Chrome version 58.0.3029.96.
- The client is based on Safari version 537.36.

(Info obtained from http://www.useragentstring.com/ and http://www.whoishostingthis.com/tools/user-agent/)

And the same but using Firefox (who also tells you which Linux is being used):

``` Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:54.0) Gecko/20100101 Firefox/54.0 ```

So for this problem you need to find an HTTP packet with the user agent.

## CRYPTOGRAPHY  :key:

### keyz  :loudspeaker:

Ok, this one is pretty easy. Assuming you are working on Linux:
1. You should create a SSH key on you own computer (https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2).
2. Go to ~/.ssh/id_rsa.pub and copy the public key (everything on that file).
3. Go to the webconsole and create the file ~/.ssh/authorized_keys. Paste your key.
4. SSH the server: ssh username@shell2017.picoctf.com

### Substitute    :scissors:

A file here is needed to substitute words for others.

### Hash 101 :8ball:

After connecting to it, it will ask for 4 challenges:
- Convert a binary string to ASCII
- Convert the same ASCII to HEX and then to DEC
- With a given remainder, input a string which the sum of its chars are a multiple of 16 + remainder.
- Decrypt a well known MD5 hash (always the same). I did it with https://hashkiller.co.uk/md5-decrypter.aspx.

For the other ones I'm going to make some files...


## WEB EXPLOITATION  :space_invader:

### What is Web  :cake:

There are 3 parts of the flag hidden in this Web. 
1. You need to look for comments in the HTML main page.
2. There are some comments too in the CSS file.
3. Unexpectedly, there are comments in the JS file too.

## MISC  :shaved_ice:

### Internet Kitties  :camel:

To look what is waiting for you in this port you just need to open a telnet session:
``` telnet url port ```

### Piazza  :fish_cake:

This one is not even a CTF, it's in the welcome message of the Piazza. (just in case someone needs it)

### Leaf of the Tree  :herb:

I just did a recursive ls, not a good idea if there are a lot of branches but whatever.
``` ls -R . ```

### loooooooooong (?)  :octocat:

This time I used netcat for the session, as it is more secure and for non-interactive stuff.
``` netcat url port ```

I knew I needed some kind of script as soon as I saw this (be careful, it is changing all the time): 
 > Please give me the 'w' character '666' times, followed by a single '2'.

Script is in the folder. ** Script: "how to deal with sockets when trying to interact with a connection" **

### Leaf of the Forest  :deciduous_tree:

This time I used something a little bit more sophisticated:
``` loc=$(grep -R -L "flag") 
    cat $loc
```

### WorldChat  :squirrel:

The flag is posted in 8 fragments. I cheated here, I just saved it in a file and then looked for the flags
with vim, although you can search for it with grep.

``` nc host port > chat.txt
    grep "the flag" chat.txt
```
I used "the flag" as the string because the solution is written like "17:39:58 flagperson: this is part 1/8 
of the flag - 3572"


# MASTER CHALLENGE  :eggplant:

This one... I don't know if it is supposed to be more dificult but as I observed that the password 
validation function is not working, I just called the AJAX function with the console.
 ``` F12 + console + make_ajax_req("password") ```

(The JS is loaded in the client, so you can just call it whenever you want).
