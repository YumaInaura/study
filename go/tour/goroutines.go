// https://tour.golang.org/concurrency/1
// The evaluation of f, x, y, and z happens in the current goroutine and the execution of f happens in the new goroutine.

package main

import (
	"fmt"
	"time"
)

func say(s string, round int) {
	for i := 0; i < round; i++ {
		time.Sleep(100 * time.Millisecond)
		fmt.Println(s)
	}
}

func main() {
	go say("Alice", 5) // Run in A goroutine
	go say("Bob", 5)   // Run in B goroutine
	go say("Carol", 5) // Run in C goroutine

	say("David <=", 3) // Run in D groutine
	say("Diana <=", 3) // Run in D goroutine // Run after say("David")
}

// Outputs Example

// Carol
// Alice
// Bob
// David <=
// Alice
// David <=
// Carol
// Bob
// Alice
// Bob
// David <=
// Carol
// Diana <=
// Bob
// Carol
// Alice
// Alice
// Carol
// Bob
// Diana <=
// Diana <=
