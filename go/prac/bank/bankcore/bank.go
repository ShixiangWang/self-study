package bankcore

import (
	"errors"
	"fmt"
)

// Customer ...
type Customer struct {
	Name    string
	Address string
	Phone   string
}

// Account ...
type Account struct {
	Customer
	Number  int32
	Balance float64
}

// Deposit ...
func (a *Account) Deposit(amount float64) error {
	if amount <= 0 {
		return errors.New("the amount to deposit should be greater than 0")
	}

	a.Balance += amount
	return nil
}

// Withdraw ...
func (a *Account) Withdraw(amount float64) error {
	if amount <= 0 {
		return errors.New("the amount to withdraw should be greater than 0")
	}

	if a.Balance < amount {
		return errors.New("the amount to withdraw should be less than the account's balance")
	}

	a.Balance -= amount
	return nil
}

// Statement ...
func (a *Account) Statement() string {
	return fmt.Sprintf("%v - %v - %v", a.Number, a.Name, a.Balance)
}

// Transfer function
func (a *Account) Transfer(amount float64, dest *Account) error {
	if amount <= 0 {
		return errors.New("the amount to transfer should be greater than zero")
	}

	if a.Balance < amount {
		return errors.New("the amount to transfer should be greater than the account's balance")
	}

	a.Withdraw(amount)
	dest.Deposit(amount)
	return nil
}

// Bank
type Bank interface {
	Statement() string
}

// Statement
func Statement(b Bank) string {
	return b.Statement()
}
