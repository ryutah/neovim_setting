package main

import (
	"fmt"
	"net/http"
)

const (
	AA = iota << 1
	BB
	CC
	DD
)

type Foo interface {
	AA()
}

type Hoge struct {
	Foo   string
	Value int
}

func Fizz() string {
	Bazz("fizz")
	Bazz("fizz")
	Bazz("fizz")
	Bazz("fizz")
	return "fizz"
}

func Bazz(s string) string {
	fmt.Println("fizz", s)
	return "bazz"
}

func hoge(a int) {
	switch a {
	case AA:
		fmt.Println("AA")
	}
}

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, _ *http.Request) {
		hoge(1)
		fmt.Fprintf(w, "Hello, world!")
	})

	if err := http.ListenAndServe(":8080", nil); err != nil {
		panic(err)
	}
}
