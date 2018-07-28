package main

import "fmt"
import "time"

func main() {
	communicate_channel := make(chan string)
	orphan_channel := make(chan string)
	slack_channel := make(chan string, 1)

	// Trying send message to communicate_channel
	// And main groutine receives it after
	go func() {
		fmt.Println("Before send message to communicate channel") // Run
		communicate_channel <- "I am communicate_channnel"        // Run
		fmt.Println("After sent message to communicate channel")  // Run
	}()

	// Tring send message to orphan_channel
	// But no groutines receive message
	go func() {
		fmt.Println("Before send message to orphan channel") // Run
		orphan_channel <- "I am orphan_channel"              // Wait
		fmt.Println("After sent message to orphhan channel") // Not run
	}()

	// Trying send message to slack_channel
	// Same as above case, no groutines receive message
	// But this channel has buffer, so do not wait sending and step to next
	go func() {
		fmt.Println("Before send message to orphan channel") // Run
		slack_channel <- "I am slack_channel"                // Run ( Buffering )
		fmt.Println("After sent message to orphhan channel") // Run
	}()

	// Receive message from one channel
	<-communicate_channel

	time.Sleep(300 * time.Millisecond)
}
