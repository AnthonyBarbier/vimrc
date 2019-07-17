#!/usr/bin/env python3

import sys
import re


if __name__ == '__main__':
    prefix = ""
    line = sys.stdin.readline()
    while line:
        m = re.match("^((ERROR|WARNING|INFO|DEBUG):)", line)
        if m:
            #print("Found: "+m.group(1)+" in "+line)
            prefix = m.group(1)
        else:
            m = re.match("^[^:]+:[0-9]+:[0-9]+: ((warning|error):)", line)
            if m:
                #print("Found: "+m.group(1)+" in "+line)
                prefix = m.group(1).upper()
            line = prefix + " " + line
        print(line, end="")
        line = sys.stdin.readline()

