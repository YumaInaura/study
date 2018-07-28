package main

import "fmt"
import "time"

func main() {
	communicate_channel := make(chan bool)
	orphan_channel := make(chan bool)

	// Try to send message to channel ( And before main groutine receives it )
	go func() {
		fmt.Println("Before send message to communicate channel") // Run
		communicate_channel <- true                               // Run
		fmt.Println("After sent message to communicate channel")  // Run
	}()

	// Try to send message to other channel ( But no groutines receive message )
	go func() {
		fmt.Println("Before send message to orphan channel") // Run
		orphan_channel <- true                               // Wait
		fmt.Println("After sent message to orphhan channel") // Not run
	}()

	// Receive message from one channel
	<-communicate_channel

	time.Sleep(300 * time.Millisecond)
}
