#!/usr/bin/env python3

class Presenter():
  def __init__(self, name):
    # Constructor
    self.name = name
    print(self.name)
    print(self.__name)

  @property
  def name(self):
    print("In the getter")
    return self.__name

  @name.setter
  def name(self, value):
    print("in setter")
    # cool validation
    self.__name = value

  def say_hello(self):
    print(self.name)

if __name__ == "__main__":
  p = Presenter("Shixiang")
  p.name = "Shixiang Wang"
  p.say_hello()

