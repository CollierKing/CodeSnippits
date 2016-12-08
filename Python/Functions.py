# In this example, we define an f() function in three different places.
class Some:
    # A static method is defined with a decorator in a Some class.
        @staticmethod
        def f():
            print "f() method"
    def f():
        print "f() function"
    # The function is defined in a module.
    def g():
        def f():
            print "f() inner function"
        f()
    # Here the f() function is defined inside another g() function.
    # It is an inner function.
    # The static method is called by specifying the class name,
    # the dot operator and the function name with square brackets.
    # Other functions are called using their names and square brackets.
Some.f()
f()
g()

# Functions as objects
# ----------------------------------------
# The isinstance() function checks whether the f() function is an instance of the object.
# All objects in Python inherit from this base entity.
print isinstance(f, object)
print id(f)
print f.func_doc
print f.func_name
# ex: store functions in a collection
def f():
    pass

def g():
    pass

def h(f):
    print id(f)

a = (f, g, h)
# ex: store functions in a tuple
for i in a:
    print i

h(f)
h(g)

# Function Redefinition
# ----------------------------------------
# From the time module we import two functions which are used to compute the current time.
from time import gmtime, strftime

def showMessage(msg):
    print msg
# This is the first definition of a function. It only prints a message to the console

showMessage("Ready.")

def showMessage(msg):
    print strftime("%H:%M:%S", gmtime()),
    print msg

showMessage("Processing.")
