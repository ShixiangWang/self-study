package main

//#include <stdio.h>
//void callC() {
// printf("Calling C code!\n");
//}
import "C"
import "fmt"

func main() {
	fmt.Println("A Go Statement!")
	C.callC()
	fmt.Println("Another Go statement!")
}
