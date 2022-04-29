#!/usr/bin/env python3
# -*- coding: utf-8 -*-
######################################################################
# Tools
######################################################################
from os import *
import sys, subprocess

from pathlib import Path

sys.path.insert(0, str(Path.home()) + '/Z01-Tools/scripts/')
from config import *
from assembler import *

def main():
  
    print("------------------ Gravando nasm Z011")

    # compilando NASM -> .bin
    nasm = "geralcd.nasm"
    pwd = os.path.dirname(os.path.abspath(__file__))
    hack = pwd+"/../bin/hack/"+os.path.splitext(os.path.basename(nasm))[0]

    # assembler
    assemblerFile(ASSEMBLER_JAR, nasm, hack, True)

    # program ROM
    writeROM(hack+".mif")
