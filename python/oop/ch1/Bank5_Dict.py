accountList = []

def newAccount(aName, aBalance, aPasswrod):
    global accountList
    newAccountDict = {'name': aName,
        'balance': aBalance, 'password': aPasswrod}
    accountList.append(newAccountDict)

def show(accountNumber):
    global accountList
    print('Account', accountNumber)
    thisAccountDict = accountList[accountNumber]
    print(f'\tName: {thisAccountDict["name"]}')
    print(f'\Balance: {thisAccountDict["Balance"]}')
    print(f'\Password: {thisAccountDict["password"]}')
    print()

# ...