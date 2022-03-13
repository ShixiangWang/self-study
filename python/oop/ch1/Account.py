#!/usr/bin/env python3

class Account():
    def __init__(self, name: str, balance: int, password: str) -> None:
        self.name = name
        self.balance = balance
        self.password = password

    def deposit(self, amountToDeposit: int, password: str) -> int:
        if password != self.password:
            print("Sorry, incorrect password")
            return None
        
        if amountToDeposit < 0:
            print("You cannot deposit a negative amount")
            return None

        self.balance += amountToDeposit
        return self.balance

    def withdraw(self, amountToWithdraw: int, password: int) -> int:
        if password != self.password:
            print("Incorrect password for this account")
            return None

        if amountToWithdraw < 0:
            print("You cannot withdraw a negative amount")
            return None

        if amountToWithdraw > self.balance:
            print("You cannot withdraw more than you have in your account")
            return None
        
        self.balance -= amountToWithdraw
        return self.balance

    def getBalance(self, password: str) -> int:
        if password != self.password:
            print("Sorry, incorrect password")
            return None
        return self.balance

    def show(self):
        print(f'\tName: {self.name}')
        print(f'\tBalance: {self.balance}')
        print(f'\tPassword: {self.password}')
        print()

if __name__ == "__main__":
    ac = Account("test", 10000000, '123')
    ac.show()
    ac.getBalance('123')
    ac.withdraw(10000000, '123')
    ac.deposit(10, '123')
    ac.show()

