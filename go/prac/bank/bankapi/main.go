package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/ShixiangWang/self-study/go/prac/bank/bankcore"
)

// CustomAccount ...
type CustomAccount struct {
	*bankcore.Account
}

var accounts = map[float64]*CustomAccount{}

func main() {
	accounts[1001] = &CustomAccount{
		Account: &bankcore.Account{
			Customer: bankcore.Customer{
				Name:    "John",
				Address: "Los Angeles, California",
				Phone:   "(213) 555 0147",
			},
			Number: 1001,
		},
	}

	accounts[1002] = &CustomAccount{
		Account: &bankcore.Account{
			Customer: bankcore.Customer{
				Name:    "Mark",
				Address: "Irvine, California",
				Phone:   "(949) 555 0198",
			},
			Number: 1002,
		},
	}

	http.HandleFunc("/statement", statement)
	http.HandleFunc("/deposit", deposit)
	http.HandleFunc("/withdraw", withdraw)
	http.HandleFunc("/transfer", transfer)
	log.Fatal(http.ListenAndServe("localhost:8000", nil))
}

func deposit(w http.ResponseWriter, req *http.Request) {
	numberqs := req.URL.Query().Get("number")
	amountqs := req.URL.Query().Get("amount")

	if numberqs == "" {
		fmt.Fprintf(w, "Account number is missing!")
		return
	}

	if number, err := strconv.ParseFloat(numberqs, 64); err != nil {
		fmt.Fprintf(w, "Invalid amount number!")
	} else if amount, err := strconv.ParseFloat(amountqs, 64); err != nil {
		fmt.Fprintf(w, "Invalid amount number!")
	} else {
		account, ok := accounts[number]
		if !ok {
			fmt.Fprintf(w, "Account with number %v can't be found!", number)
		} else {
			err := account.Deposit(amount)
			if err != nil {
				fmt.Fprintf(w, "%v", err)
			} else {
				fmt.Fprintf(w, account.Statement())
			}
		}
	}
}

func withdraw(w http.ResponseWriter, req *http.Request) {
	numberqs := req.URL.Query().Get("number")
	amountqs := req.URL.Query().Get("amount")

	if numberqs == "" {
		fmt.Fprintf(w, "Account number is missing!")
		return
	}

	if number, err := strconv.ParseFloat(numberqs, 64); err != nil {
		fmt.Fprintf(w, "Invalid account number!")
	} else if amount, err := strconv.ParseFloat(amountqs, 64); err != nil {
		fmt.Fprintf(w, "Invalid amount number!")
	} else {
		account, ok := accounts[number]
		if !ok {
			fmt.Fprintf(w, "Account with number %v can't be found!", number)
		} else {
			err := account.Withdraw(amount)
			if err != nil {
				fmt.Fprintf(w, "%v", err)
			} else {
				fmt.Fprintf(w, account.Statement())
			}
		}
	}
}

func statement(w http.ResponseWriter, req *http.Request) {
	numberqs := req.URL.Query().Get("number")

	if numberqs == "" {
		fmt.Fprintf(w, "Account number is missing!")
		return
	}

	number, err := strconv.ParseFloat(numberqs, 64)
	if err != nil {
		fmt.Fprintf(w, "Invalid account number!")
	} else {
		account, ok := accounts[number]
		if !ok {
			fmt.Fprintf(w, "Account with number %v can't be found!", number)
		} else {
			json.NewEncoder(w).Encode(bankcore.Statement(account))
		}
	}
}

func transfer(w http.ResponseWriter, req *http.Request) {
	numberqs := req.URL.Query().Get("number")
	amountqs := req.URL.Query().Get("amount")
	destqs := req.URL.Query().Get("dest")

	if numberqs == "" {
		fmt.Fprintf(w, "Account number is missing!")
		return
	}

	if number, err := strconv.ParseFloat(numberqs, 64); err != nil {
		fmt.Fprintf(w, "Invalid account number!")
	} else if amount, err := strconv.ParseFloat(amountqs, 64); err != nil {
		fmt.Fprintf(w, "Invalid amount number!")
	} else if dest, err := strconv.ParseFloat(destqs, 64); err != nil {
		fmt.Fprintf(w, "Invalid account destination number!")
	} else {
		if accountA, ok := accounts[number]; !ok {
			fmt.Fprintf(w, "Account with number %v can't be found!", number)
		} else if accountB, ok := accounts[dest]; !ok {
			fmt.Fprintf(w, "Account with number %v can't be found!", dest)
		} else {
			err := accountA.Transfer(amount, accountB.Account)
			if err != nil {
				fmt.Fprintf(w, "%v", err)
			} else {
				fmt.Fprintf(w, accountA.Statement())
			}
		}
	}
}

// Statement ...
func (c *CustomAccount) Statement() string {
	json, err := json.Marshal(c)
	if err != nil {
		return err.Error()
	}

	return string(json)
}
