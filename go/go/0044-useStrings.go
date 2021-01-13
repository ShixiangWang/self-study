package main

import (
	"fmt"
	s "strings"
)

var f = fmt.Printf

func main() {
	upper := s.ToUpper("Hello World!")
	f("To Upper: %s\n", upper)
	f("To Lower: %s\n", s.ToLower("Hello THERE"))
	f("EqualFold: %v\n", s.EqualFold("Mihalis", "MIHAlis"))
	f("EqualFold: %v\n", s.EqualFold("Mihalis", "MIHAli"))
	// s.HasPrefix()
	// s.HasSuffix()
	// s.Index()
	// s.Count()
	// s.Repeat()
	// s.TrimSpace()
	// s.TrimLeft()
	// s.TrimRight()
	// s.Compare()
	// s.Fields()
	// s.Split()
	// s.Replace()
	// s.Join()
}
