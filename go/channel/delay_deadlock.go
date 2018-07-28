package main

import "fmt"
import "time"

func main() {
	mailbox := make(chan string)

	// Do nothing Bob groutine
	go func() {
		time.Sleep(1000 * time.Millisecond)
		fmt.Println("Bob : I will send letter to mailbox, after sleepling.")
		time.Sleep(1000 * time.Millisecond)
		fmt.Println("Bob : Umm but it is not today. I will sleep again.")
		time.Sleep(1000 * time.Millisecond)
	}()

	// This message appears soon
	// Because in this timing, Alice -main- goroutine does not wait Bob groutine
	fmt.Println("Alice : I wait for Bob to send message to mailbox while sleeping.")

	// Alice starts to wait for receiving letter from Bob groutine
	// While Bob groutine runnning, it raises no errors.
	// Error occurs after Bob groutine finished
	fmt.Println(<-mailbox) // fatal error: all goroutines are asleep - deadlock!
}
