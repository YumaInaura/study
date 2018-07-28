package main

import "fmt"

func main() {
	messages := make(chan string)

	// Sender - send message to channel in other goroutine
	go func() { messages <- "ping" }()

	// Receiver - receive message from channel in main goroutine
	fmt.Println(<-messages) // print "ping"

	// No sender existence so can not receive message from channel
	// Because above goroutine have already sent messsage to channel and finish his work
	fmt.Println(<-messages) // fatal error: all goroutines are asleep - deadlock!
}
