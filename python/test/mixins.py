#! /usr/bin/env python3
# 多重继承

class Loggable:
  def __init__(self):
    self.title = ""
  def log(self):
    print("Log message from " + self.title)

class Connection:
  def __init__(self):
    self.server = ""
  def connect(self):
    print("Connecting to database on " + self.server)

class SqlDatabase(Connection, Loggable):
  def __init__(self):
    self.title = "Sql Connection Demo"
    self.database = "Some_Server"

def framework(item):
  if isinstance(item, Connection):
    item.connect()
  if isinstance(item, Loggable):
    item.log()

sql_connection = SqlDatabase()
framework(sql_connection)

