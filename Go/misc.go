//GO CLI
go build //compiles a bunch of go source code files
go run //compiles and executes one or more files
go fmt //formats all the code in each file in the current directory
go install //compiles and installs a package
go get //downloads the raw source code of someone else's package
go test //runs any tests associated with the current project

// PACKAGES
// packages have multiple files all with "package {name} at top"
// 2 types of packages:
// 1) executable: generates a file we can run...created by reserved word "package main"
// 1A) always needs a function called "main", otherwise wont compile an executable
// 2) reusable: code used as 'helpers', good place to put reusable logic...created by any word other than "package main"

// IMPORTS
// import "blah" gives our package access to all the code in another package
// golang.org/pkg 

// FUNCTIONS
func main(){
	card := newCard()
	fmt.Println("hi there")
}
func newCard() string { //must specify return type after func name()
	return "Five of Diamonds"
}
// function with receiver (d deck) takes a type
// sets up methods on variables we create
type deck []string

func (d deck) print() {
	//any var of type deck gets access to print method
	for i, card := range d { //d is roughly equivalent to "self" in python, "this" in js
		fmt.Println(i, card)
	}
}
//receivers vs arguments:
// if we added a receiver we would call it like this:
deck.print()
// vs
print(deck)



// VARIABLES
// assignments/declarations
var {name} {type} = "test"
// OR
{name} := "test" //relies on Go compiler to find the type
//re-assignment: must drop the ":"
//! can initialize a variable outside of a function, but cannot assign a value to it


//LISTS OF RECORDS
// *must be assigned a data type
//Array: fixed length, very basic/primitive data structure for holding list of records
//Slice: an array that can grow or shrink

//LOOPS
// * every variable declared must be used
for index, card := range cards {
    fmt.Println(card)
}
// solution is to use "_" instead
for _, suit := range cardSuits {
	for _, value := range cardValues {
		cards = append(cards, suit+" of "+value)
	}
}

//TYPES
type deck []string //type deck inherits everything from a slice of type string
type deck == []string 
// example
cards := deck{"Deal me...", newCard()}

//TYPE CONVERSION
[]byte("Hi There!")

// TESTS
// test files follow this file name format: "name_test.go"
// test functions always start with capital letter
func TestNewDeck(t *testing.T) {
	//t is the test "handler" tells us what went wrong
	d := newDeck()
	if len(d) != 16 {
		t.Errorf("Expected deck length of 16, but got %v", len(d))
	}
}
// !go test


//Evens & Odds
package main

func main() {

	s := []int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}

	for _, val := range s {
		if val%2 == 0 {
			println(val, "even")
		} else {
			println(val, "odd")
		}
	}

}

//STRUCTS
// a struct can be embedded within a struct
// ie: contact info for an individual
type contactInfo struct {
	email   string
	zipCode int
}

type person struct {
	firstName string
	lastName  string
	contactInfo
}

func main() {

	jim := person{
		firstName: "Jim",
		lastName:  "Party",
		contactInfo: contactInfo{
			email:   "jim@gmail.com",
			zipCode: 94000,
		},
	}
//POINTERS (1)
// "&" gives the memory address of 
// the value the variable is pointing at
	
	jim.updateName("jimmy")
	jim.print()
}

// star in front of type vs star intfront of receiver
//looking for type of pointer to a person
// When you call a method that requires a pointer receiver 
// on a variable with a non-pointer type, Go will automatically 
// convert the receiver to a pointer for you
func (pointerToPerson *person) updateName(newFirstName string){
//turn this pointer into a person value
	(*pointerToPerson).firstName = newFirstName
}

func (p person) print(){
	fmt.Printf("%%+v", p)
}



//MAPS
//maps:first way
// with maps the values and keys must all be same type
package main

import "fmt"

func main(){
	// declare a map where
	// all keys are type string
	// all values are type string
	colors := map[string]string{

		"red":"#ff0000",
		"green":"#4bf745",

	}

	fmt.Println(colors)
}

//maps:second way 
package main

import "fmt"

func main(){
	
	var colors map[string]string
	// OR
	colors := make(map[string]string)

	// adding another KV pay
	colors["white"] = "#ffffff" //key has to be of appropriate type

	//deleting a KV from a map
	colors[10] = "#ffffff"
	delete(colors,10)

	fmt.Println(colors)
}

//iterating over a map
package main

import "fmt"

func main(){
	
	colors:= map[string]string{
	"red":"#ff0000",
	"green":"#4bf745",
	"white":"#ffffff",
	}

	// fmt.Println(colors)
	printMap(colors)

}

// map of keys type string, values type string
func printMap(c map[string]string){
	for color, hex := range c{
		fmt.Println("Hex code for",color,"is",hex)
	}
}

//INTERFACES
// let you define variables and function parameters 
// that will hold any type, as long as that type defines 
// certain methods.

// In Go, an interface is defined as a set of methods that 
// certain values are expected to have. You can think of an 
// interface as a set of actions you need a type to be able to perform.

// interfaces are not "generic" types
// interfaces are "implicit"
// we never put in any type of manual code to link together the types
// (go takes care of it for us)

package main

import "fmt"

type bot interface {
	//list as many funcs inside of an interface
	// to list what a type has to satisfy as type bot
	getGreeting() string
}
type englishBot struct{}
type spanishBot struct{}

func main() {

	eb := englishBot{}
	sb := spanishBot{}

	printGreeting(eb)
	printGreeting(sb)

}

func printGreeting(b bot) {
	fmt.Println(b.getGreeting())
}

func (englishBot) getGreeting() string {

	return "Hi There!"
}

func (spanishBot) getGreeting() string {

	return "Hola!"
}

//example with io & http
package main

import (
	"fmt"
	"io"
	"net/http"
	"os"
)

type logWriter struct {
}

func main() {

	resp, err := http.Get("http://google.com")
	if err != nil {
		fmt.Println("Error:", err)
		os.Exit(1)
	}

	lw := logWriter{}
	io.Copy(lw, resp.Body)

}

//associates with writer interface
func (logWriter) Write(bs []byte) (int, error) {

	// return the body of the byte slice returned from the call
	// fmt.Println(string(bs))
	//return # of bytes written from bs
	fmt.Println("Just wrote this many bytes:",
		len(bs))
	return len(bs), nil

}

//GOROUTINES:
// a separate line of code execution that can be used to
// handle blocking code

//CHANNELS:
// communicate between go routines

// PARALLEL example (Go routines)
// a go routine is something that exists inside of our process
// takes every line of code in our program and executes everything line by line

//CONCURRENCY IS NOT PARALLELISM!
// Concurrency - we can have multiple threads
// executing code.  If one thread blocks, another one
// is picked up and worked on.

// go scheduler runs in background
// go used 1 cpu core by detault
// only one go routine is run at any given time
// scheduler runs one routine until it finishes or
// makes a blocking call (line an http request)

// CONCURRENCY:
// A program is concurrent if it has the ability to load up
// multiple go routines "at the same time" (if more than 1 core)

// PARALLELISM:
// we only get this when we start to use more than 1 cpu core
// while one go routine on one core is being used,
// another go routine on another core can also be used

package main

import (
	"fmt"
	"net/http"
	"time"
)

// main routine determines when our program starts & ends
// doesnt care about child routines (started with goroutines) --> exits (entire program quites)

//CHANNELS:
// used to make main routine aware of child routines
// only way for main routine to communicate with child routines
// channels are types just like any other go variable
// can only use messages of the channel's type

// with channels there is always a "sender"
// send 5 into a channel:
// channel <- 5

// wait for a value to be sent into the channel,
// when we get one, assign to the value myNumber:
// myNumber <- channel

// wait for a value to be send into the channel
// when we get one, log it out immediately:
// fmt.Println(<- channel)

func main() {

	links := []string{

		"http://google.com",
		"http://facebook.com",
		"http://stackoverflow.com",
		"http://golang.org",
		"http://amazon.com",
	}

	//initialize a channel
	c := make(chan string)

	for _, link := range links {
		//"go" opens a new go routine
		// continue to spawn new go routines until one exists for each link
		go checkLink(link, c)

	}

	//receive a value out of the channel
	// when we wait for a msg to come thru a chan, its a blocking call
	// main routine is put to sleep
	// only have 5 messages printed because we are only spinning up 5 goroutines
	// main routine waits for the sixth+ goroutine but doesnt get anything
	for l := range c {

		//function literal
		go func(link string) {
			time.Sleep(5 * time.Second)
			checkLink(link, c)
		}(l)
	}
}

//pass channel into the function
// c is going to be a channel: can only communicate over it with type strings
func checkLink(link string, c chan string) {
	// fmt.Println(link, ".........")
	_, err := http.Get(link)
	if err != nil {
		fmt.Println(link, " might be down!")
		c <- link
		return
	}

	fmt.Println(link, " is up!")
	c <- link

}
