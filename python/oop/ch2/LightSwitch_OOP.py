class LightSwitch():
    def __init__(self) -> None:
        self.switchIsOn = False

    def turnOn(self) -> None:
        self.switchIsOn = True

    def turnOff(self) -> None:
        self.switchIsOn = False

oLightSwitch = LightSwitch()
oLightSwitch.turnOn()
print(oLightSwitch.switchIsOn)
oLightSwitch.turnOff()
print(oLightSwitch.switchIsOn)

t = 'abc'
print('t'.lower())