## RSA is the public-private key crypto system used to both cypher and sign documents
## It works like: 
## cyphertext = message ^ guyApublickey (mod N) (N is a number determined before)
## message = cyphertext ^ guyAprivatekey (mod N)
## So people have your public key and they cipher things so only you can decypher using
## your private key

#c = raw_input("Cyphertext:")
#d = raw_input("Private key:")
#n = raw_input("N:")

c = 150815
d = 1941
n = 435979

print (c ** d) % n