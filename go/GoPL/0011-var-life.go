package main

var global *int


// x is escaped when
// f() returned
func f() {
	var x int
	x = 1
	global = &x
}

// cannot access y
// when func returned
func g() {
	y := new(int)
	*y = 1
}

func main() {
	f()
	g()
}
