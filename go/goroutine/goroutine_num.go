// cf http://jxck.hatenablog.com/entry/20130414/1365960707

package main

import "fmt"
import "runtime"
import "time"

func main() {
	// Print goroutine num
	fmt.Println(runtime.NumGoroutine()) // 1

	// run goroutine
	go func() {}()

	fmt.Println(runtime.NumGoroutine()) // 2

	time.Sleep(time.Second)
}
