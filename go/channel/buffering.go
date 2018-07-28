// https://gobyexample.com/channel-buffering

package main

import "fmt"

func main() {

	// Keep 2 buffer spaces in channel
	messages := make(chan string, 2)

	// Stack 2 buffers, left 0 buffer spaces
	messages <- "One"
	messages <- "Two"

	// Release 2 buffers, left 2 buffer spaces
	fmt.Println(<-messages) // Print "One"
	fmt.Println(<-messages) // Print "Two"

	// Stack 2 buffers, left 0 buffer spaces
	messages <- "One"
	messages <- "Two"

	// Oops! no more buffer spaces
	// fatal error: all goroutines are asleep - deadlock!
	messages <- "Two"
}
