// cf. https://gobyexample.com/channels

package main

import "fmt"

func main() {
	messages := make(chan string)

	go func() { messages <- "ping" }()
	go func() { messages <- "pong" }()
	go func() { messages <- "pang" }()

	// messages <- "ping" // fatal error: all goroutines are asleep - deadlock!

	fmt.Println(<-messages)
	fmt.Println(<-messages)
	fmt.Println(<-messages)
	// fmt.Println(<-messages) // fatal error: all goroutines are asleep - deadlock!
}
