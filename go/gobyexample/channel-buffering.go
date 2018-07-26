// https://gobyexample.com/channel-buffering

package main

import "fmt"

func main() {

	messages := make(chan string, 2)

	// Spend 2 buffers, left 0 buffer
	messages <- "One"
	messages <- "Two"

	// Release 1 buffer, left 1 buffer
	fmt.Println(<-messages)

	// Spend 1 buffer, left 0 buffer
	messages <- "Three"

	// Oops! no more buffers
	// fatal error: all goroutines are asleep - deadlock!
	messages <- "Four"

}
