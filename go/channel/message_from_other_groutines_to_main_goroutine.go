// cf. https://gobyexample.com/channels

package main

import "fmt"
import "time"

func main() {
	messages := make(chan string)

	// No goroutines running at this line
	// So can not send message to channel
	// messages <- "ping" // fatal error: all goroutines are asleep - deadlock!

	// Other goroutines receive message from channel
	go func() { fmt.Println(<-messages) }()
	go func() { fmt.Println(<-messages) }()

	// Main groutine send message to other goroutines through channel
	messages <- "ping"
	messages <- "pong"

	time.Sleep(100 * time.Millisecond)
}
