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
//pointers (1)
// "&" gives the memory address of 
// the value the variable is pointing at
	jimPointer := &jim
	jimPointer.updateName("jimmy")
	jim.print()
}

// star in front of type vs star intfront of receiver
// a type of pointer that points at a person
func (pointerToPerson *person) updateName(newFirstName string){
// "*" gives the value this memory address is pointing at
	(*pointerToPerson).firstName = newFirstName
}

func (p person) print(){
	fmt.Printf("%%+v", p)
}



