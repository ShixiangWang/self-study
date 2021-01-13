package main

import (
	"bufio"
	"fmt"
	"io/ioutil"
	"os"
	"strings"
)

func main() {
	var inputReader *bufio.Reader
	var input string

	inputReader = bufio.NewReader(os.Stdin)
	input, err := inputReader.ReadString('\n')
	input = strings.TrimSuffix(input, "\n")

	outputFile := input + "_copy.txt"

	fmt.Printf("Input file: %s\n", input)
	fmt.Printf("Output file: %s\n", outputFile)

	buf, err := ioutil.ReadFile(input)
	if err != nil {
		fmt.Fprintf(os.Stderr, "File Error: %s\n", err)
	}
	fmt.Printf("%s\n", string(buf))
	err = ioutil.WriteFile(outputFile, buf, 0644)
	if err != nil {
		panic(err.Error())
	}
}
