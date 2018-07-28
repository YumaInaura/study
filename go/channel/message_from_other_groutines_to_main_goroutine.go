// cf. https://programming.guide/go/detect-deadlock.html

package main

import "fmt"
import "time"

func main() {
	messages := make(chan string)

	// No other goroutines running at this line
	// ( only main goroutine running )
	// So main groutine can not send message to other groutines throgh channel
	//
	// messages <- "ping" // fatal error: all goroutines are asleep - deadlock!

	// Other goroutines receive message from channel
	go func() { fmt.Println(<-messages) }()
	go func() { fmt.Println(<-messages) }()

	// Main groutine send message to other goroutines through channel
	messages <- "ping"
	messages <- "pong"

	time.Sleep(100 * time.Millisecond)
}
