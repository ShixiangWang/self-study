#! /usr/bin/env python3
# 继承

class Person:
  def __init__(self, name):
    self.name = name
  def say_hello(self):
    print("Hello " + self.name)


class Student(Person):
  def __init__(self, name, school):
    super().__init__(name)
    self.school = school
  def sing_school_song(self):
    print("Ode to " + self.school)
  def say_hello(self):
    # Let the parent do some work
    super().say_hello()
    # Add on custom code
    print("I am rather tired.")
  def __str__(self) -> str:
      return f"{self.name} attends {self.school}"

student = Student('Shixiang', 'Changning')
print(student)
print(str(student))

student.say_hello()
student.sing_school_song()
# Waht are you
print(isinstance(student, Student))
print(isinstance(student, Person))
print(issubclass(Student, Person))