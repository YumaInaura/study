// cf https://gobyexample.com/channels

package main

import "fmt"
import "time"

func main() {

		// Create channel without buffer 
    messages := make(chan string)

    go func() {
			fmt.Println("Set Alice")
			messages <- "Alice"
		}()

		go func() {
			fmt.Println("Set Carol")
			messages <- "Carol"
		}()

    go func() {
			fmt.Println("Set Bob")
			messages <- "Bob"
		}()

		time.Sleep(1 * time.Second)

    fmt.Println("1. " + <-messages)
    fmt.Println("2. " + <-messages)
    fmt.Println("3. " + <-messages)
}
