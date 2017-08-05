#!/bin/bash

# I wanted to do it with netcat, but if it need to be interactive, the only way is sockets.
# More info: https://unix.stackexchange.com/questions/355216/getting-output-from-netcat-decoding-it-and-returning-an-output/359665#359665

# Create a socket -> exec {file descriptor}<>/dev/{protocol}/{host}/{port} 
# File descriptor: needs to be > 0 and 0-2 are reserved (stdin 0, stdout 1, stderr 2). -> http://xmodulo.com/tcp-udp-socket-bash-shell.html
exec 3<>/dev/tcp/shell2017.picoctf.com/59858;

# Read until line 2, to retrieve info
what_to_do=$(head -2 <&3)

# Get the info. I could have used grep, sed or whatever
letter=$(echo $what_to_do | cut -d "'" -f 2)
loops=$(echo $what_to_do | cut -d "'" -f 4)
ending=$(echo $what_to_do | cut -d "'" -f 6)

# Looping
final_string=""
for ((i=1; i<=$loops; i++))
do
  final_string="$final_string$letter"
done
final_string="$final_string$ending"

# Returning the solution to the socket
echo $final_string >&3;

# Displaying the final answer of the server
cat <&3;

#echo $what_to_do
#echo $letter
#echo $loops
#echo $ending