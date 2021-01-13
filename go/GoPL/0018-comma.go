func comma(s string) string {
	n := len(s)
	if n <= 3 {
		return s
	}
	// s := "abc"
	// b = []byte(s)
	// s2 := string(b)
	return comma(s[:n-3] + "," + s[n-3]:)
}