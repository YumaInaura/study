package main

func main() {
	messages := make(chan string)

	// If comment out below line, this script will not raise deadlock
	// go func() { <-messages }()

	// Main goroutine try to send message to channel
	// But no receiver exists on other groutine so it raises deadlock
	messages <- "channel" // fatal error: all goroutines are asleep - deadlock!
}
