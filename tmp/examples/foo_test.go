package main

import (
	"testing"
)

func TestFizz(t *testing.T) {
	tests := []struct {
		name string
		want string
	}{
		{
			name: "sample",
			want: "fizz",
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := Fizz(); got != tt.want {
				t.Errorf("Fizz() = %v, want %v", got, tt.want)
			}
		})
	}
}

func TestBazz(t *testing.T) {
	tests := []struct {
		name string
		want string
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := Bazz("xx"); got != tt.want {
				t.Errorf("Bazz() = %v, want %v", got, tt.want)
			}
		})
	}
}
