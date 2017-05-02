# IF statements
#################################
food = "spam"

if food == 'spam':
    print('Ummmm, my favorite!')
else:
    print("No, I won't have it. I want spam!")

# ELIF statement
choice = "a"

if choice == 'a':
    print("You chose 'a'.")
elif choice == 'b':
    print("You chose 'b'.")

# Nested
if 0 < x:            # assume x is an int here
    if x < 10:
        print("x")

# Case expression equivalent
def numbers_to_strings(argument):
    switcher = {
        0: "zero",
        1: "one",
        2: "two",
    }
    return switcher.get(argument, "nothing")


# FOR loops
##################################

# traversing a sequence
for friend in ['Margot', 'Kathryn', 'Prisila']:
    invitation = "Hi " + friend + ".  Please come to my party on Saturday!"
    print(invitation)

# iterating over a range
for i in range(5):
    print('i is now:', i)

# ELSE Clause in FOR loop
# The main use case for this behaviour is to implement search loops, where you’re performing a search for an item that meets a particular condition, and need to perform additional processing or raise an informative error if no acceptable value is found:
for x in data:
    if acceptable(x):
        break
else:
    raise ValueError("No acceptable value in {!r:100}".format(data))
# But how do I check if my loop never ran at all?
# The easiest way to check if a for loop never executed is to use None as a sentinel value:
x = None
for x in data:
    # process x
    print(x)
if x is None:
    raise ValueError("Empty data iterable: {!r:100}".format(data))


# WHILE loops
##################################

number = 0
prompt = "What is the meaning of life, the universe, and everything? "

while number != "42":
    number = input(prompt)

# example with if statement

name = 'Harrison'
guess = input("So I'm thinking of person's name. Try to guess it: ")
pos = 0

while guess != name and pos < len(name):
    print("Nope, that's not it! Hint: letter ", end='')
    print(pos + 1, "is", name[pos] + ". ", end='')
    guess = input("Guess again: ")
    pos = pos + 1

if pos == len(name) and name != guess:
    print("Too bad, you couldn't get it.  The name was", name + ".")
else:
    print("\nGreat, you got it in", pos + 1,  "guesses!")

# ELSE clause in WHILE loop
while True:
    if condition:
        pass # Implied by Python's loop semantics
    else:
        ... # While loop else clause runs here
        break
    ... # While loop body runs here


# ABBREVIATED ASSIGNMENTS

count = 0
count += 1
count

n = 2
n *= 5
n

n = 2
n /= 5
n

n -= 4
n

n //= 2
n

n %= 2
n

# BREAK statement in FOR Loop
for i in [12, 16, 17, 24, 29]:
    if i % 2 == 1:  # if the number is odd
        break        # immediately exit the loop
    print(i)
print("done")

# CONTINUE statement in FOR Loop
for i in [12, 16, 17, 24, 29, 30]:
    if i % 2 == 1:      # if the number is odd
        continue        # don't process it
    print(i)
print("done")

# FOR loop on Nested Data
students = [("Alejandro", ["CompSci", "Physics"]),
            ("Justin", ["Math", "CompSci", "Stats"]),
            ("Ed", ["CompSci", "Accounting", "Economics"]),
            ("Margot", ["InfSys", "Accounting", "Economics", "CommLaw"]),
            ("Peter", ["Sociology", "Economics", "Law", "Stats", "Music"])]

# print all students with a count of their courses.
for (name, subjects) in students:
    print(name, "takes", len(subjects), "courses")

# Count how many students are taking CompSci
counter = 0
for (name, subjects) in students:
    for s in subjects:                 # a nested loop!
        if s == "CompSci":
            counter += 1

print("The number of students taking CompSci is", counter)

# LIST comprehensions
# A list comprehension is a syntactic construct that enables lists to be created from other lists using a compact, mathematical syntax:

numbers = [1, 2, 3, 4]
[x**2 for x in numbers]
# [1, 4, 9, 16]
[x**2 for x in numbers if x**2 > 8]
# [9, 16]
[(x, x**2, x**3) for x in numbers]
# [(1, 1, 1), (2, 4, 8), (3, 9, 27), (4, 16, 64)]
files = ['bin', 'Data', 'Desktop', '.bashrc', '.ssh', '.vimrc']
[name for name in files if name[0] != '.']
# ['bin', 'Data', 'Desktop']
letters = ['a', 'b', 'c']
[n * letter for n in numbers for letter in letters]
# ['a', 'b', 'c', 'aa', 'bb', 'cc', 'aaa', 'bbb', 'ccc', 'aaaa', 'bbbb', 'cccc']
