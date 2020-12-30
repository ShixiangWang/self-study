## PyAutoGUI has a fail-safe feature. 
## Moving the mouse cursor to the
## upper-left corner of the screen will 
## cause PyAutoGUI to raise the 
## pyautogui.FailSafeException exception.
## 
## Reference: https://automatetheboringstuff.com/chapter18/

import pyautogui

## 1s pause after each function call

pyautogui.PAUSE = 1
## Enable the fail-safe feature
pyautogui.FAILSAFE = True

## Coordinates (0, 0) -> (1919, 1079) for 1920 x 1080 resolution
## X from left to right, Y from top to bottom
## Run pyautogui.size() to get resolution information
## Run pyautogui.position() to get the current position

## Move the mouse
## moveTo() move to the specified position
## moveRel() move based on the current position
## duration set the time (in seconds) to finish the move
# for i in range(10):
#     pyautogui.moveTo(100, 100, duration=0.25)
#     pyautogui.moveTo(200, 100, duration=0.25)
#     pyautogui.moveTo(200, 200, duration=0.25)
#     pyautogui.moveTo(100, 200, duration=0.25)

## Print position
##  x, y = pyautogui.position()
##  positionStr = 'X: ' + str(x).rjust(4) + ' Y: ' + str(y).rjust(4)
##  print(positionStr, end='')
##  print('\b' * len(positionStr), end='', flush=True)
## To erase text, print the \b backspace escape character.

## Click the mouse
## pyautogui.click() # default click left mouse button in current position
## We can set the position and the button
## pyautogui.click(x, y, button = ["left", "middle", "right"])
## mouseDown() to only push the mouse button down
## mouseUp() to only release the mouse button
##
## wrappers: doubleClick(), leftClick(), rightClick(), middleClick()

## Drag the mouse:
## dragTo() and dragRel()
## Scroll the mouse:
## scroll()
## Get a screenshot
## screenshot()

import time

time.sleep(5)

while True:
    pyautogui.rightClick(1920/2+100, 1080/2+100, duration=0.25)
    pyautogui.rightClick(1920/2-100, 1080/2-100, duration=0.25)
