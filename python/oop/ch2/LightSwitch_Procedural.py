#!/usr/bin/env python3

from pickle import FALSE

def turnOn():
    global switchIsOn
    switchIsOn = True

def turnOff():
    global switchIsOn
    switchIsOn = False

# Main code
switchIsOn = False
print(switchIsOn)
turnOn()
print(switchIsOn)
turnOff()
print(switchIsOn)

