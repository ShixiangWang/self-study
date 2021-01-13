// For security
// Use http://en.wikipedia.org/wiki/Cryptographic_hash_function
package main

import (
	"crypto/sha1"
	"fmt"
)

func main() {
	s := "sha1 this string"

	// same way for md5
	// in package md5
	h := sha1.New()
	h.Write([]byte(s))
	bs := h.Sum(nil)

	fmt.Println(s)
	fmt.Printf("%x\n", bs)
}