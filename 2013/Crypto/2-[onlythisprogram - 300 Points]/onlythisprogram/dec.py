#!/usr/bin/python
import os
import sys
import argparse

blocksize=256

pad1=["0" for x in range(0,256)]
pad2=["0" for x in range(0,256)]

file1=open("pad00", "w")
file2=open("pad20", "w")

for index in xrange(256):
    #print index
    fo=open("replace/"+("%d" %index)+".rec", "r")
    fo.seek(0)
    counter=0
    arr=[0 for x in range(0,256)]
    while 1:
        byte=fo.read(1)
        if not byte:
            break
        arr[ord(byte)] += 1
    max=0
    maxc=0
    for x in xrange(256):
        if arr[x] > max:
            max=arr[x]
            maxc=x
    pad1[index]=chr(maxc^0)
    pad2[index]=chr(maxc^0x20)
    file1.write(pad1[index])
    file2.write(pad1[index])

print "00:"+"".join(pad1)
print "20:"+"".join(pad2)


def dec():
    files=os.listdir("output")

    for f in files:
        fo=open("output/"+f, "r")
        fo.seek(0)
        fdec00=open("enc00/"+f, "w")
        fdec20=open("enc20/"+f, "w")
        counter=0
        while 1:
            byte=fo.read(1)
            if not byte:
                break
            index=counter%blocksize
            enc=chr(ord(byte) ^ ord(pad1[index]))
            fdec00.write(enc)
            enc=chr(ord(byte) ^ ord(pad2[index]))
            fdec20.write(enc)
            counter+=1

dec()