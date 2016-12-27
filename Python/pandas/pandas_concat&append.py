## Concatenate & Append
################################
# http://pandas.pydata.org/pandas-docs/stable/merging.html#merging
################################

# pandas provides various facilities for easily combining together Series, 
# DataFrame, and Panel objects with various kinds of set logic for the indexes 
# and relational algebra functionality in the case of join / merge-type operations.

# Concatenating objects
#############################
# The concat function (in the main pandas namespace) does all of the heavy lifting 
# of performing concatenation operations along an axis while performing optional 
# set logic (union or intersection) of the indexes (if any) on the other axes. 
# Note that I say “if any” because there is only a single possible axis of 
# concatenation for Series.

# Before diving into all of the details of concat and what it can do, here is a simple example:
df1 = pd.DataFrame({'A': ['A0', 'A1', 'A2', 'A3'],
                        'B': ['B0', 'B1', 'B2', 'B3'],
                        'C': ['C0', 'C1', 'C2', 'C3'],
                        'D': ['D0', 'D1', 'D2', 'D3']},
                        index=[0, 1, 2, 3])
df1    

df2 = pd.DataFrame({'A': ['A4', 'A5', 'A6', 'A7'],
                        'B': ['B4', 'B5', 'B6', 'B7'],
                        'C': ['C4', 'C5', 'C6', 'C7'],
                        'D': ['D4', 'D5', 'D6', 'D7']},
                         index=[4, 5, 6, 7])
df2 

df3 = pd.DataFrame({'A': ['A8', 'A9', 'A10', 'A11'],
                        'B': ['B8', 'B9', 'B10', 'B11'],
                        'C': ['C8', 'C9', 'C10', 'C11'],
                        'D': ['D8', 'D9', 'D10', 'D11']},
                        index=[8, 9, 10, 11])
df3 

frames = [df1, df2, df3]
result = pd.concat(frames)
result

# Like its sibling function on ndarrays, numpy.concatenate, pandas.concat takes 
# a list or dict of homogeneously-typed objects and concatenates them with some 
# configurable handling of “what to do with the other axes”:

pd.concat(objs, axis=0, join='outer', join_axes=None, ignore_index=False,
          keys=None, levels=None, names=None, verify_integrity=False,
          copy=True)
          
# * objs : a sequence or mapping of Series, DataFrame, or Panel objects. 
    # If a dict is passed, the sorted keys will be used as the keys argument, 
    # unless it is passed, in which case the values will be selected (see below). 
    # Any None objects will be dropped silently unless they are all None in which 
    # case a ValueError will be raised.

# * axis : {0, 1, ...}, default 0. The axis to concatenate along.

# * join : {‘inner’, ‘outer’}, default ‘outer’. How to handle indexes on other 
    # axis(es). Outer for union and inner for intersection.

# * ignore_index : boolean, default False. If True, do not use the index values 
    # on the concatenation axis. The resulting axis will be labeled 0, ..., n - 1. 
    # This is useful if you are concatenating objects where the concatenation axis 
    # does not have meaningful indexing information. Note the index values on the 
    # other axes are still respected in the join.

# * join_axes : list of Index objects. Specific indexes to use for the other n - 1 
    # axes instead of performing inner/outer set logic.

# * keys : sequence, default None. Construct hierarchical index using the passed 
    # keys as the outermost level. If multiple levels passed, should contain 
    # tuples.
    
# * levels : list of sequences, default None. Specific levels (unique values) 
    # to use for constructing a MultiIndex. Otherwise they will be inferred 
    # from the keys.
    
# * names : list, default None. Names for the levels in the resulting 
    # hierarchical index.
    
# * verify_integrity : boolean, default False. Check whether the new 
    # concatenated axis contains duplicates. This can be very expensive 
    # relative to the actual data concatenation.
    
# * copy : boolean, default True. If False, do not copy data unnecessarily.

# Without a little bit of context and example many of these arguments don’t 
# make much sense. Let’s take the above example. Suppose we wanted to associate 
# specific keys with each of the pieces of the chopped up DataFrame. 
# We can do this using the keys argument:
result = pd.concat(frames, keys=['x', 'y', 'z'])
result

# As you can see (if you’ve read the rest of the documentation), 
# the resulting object’s index has a hierarchical index. 
# This means that we can now do stuff like select out each chunk by key:
result.ix['y']

# It’s not a stretch to see how this can be very useful. 
# More detail on this functionality below.

# Note:  It is worth noting however, that concat (and therefore append) 
# makes a full copy of the data, and that constantly reusing this function 
# can create a significant performance hit. 
# If you need to use the operation over several datasets, use a list comprehension.
frames = [ process_your_file(f) for f in files ]
result = pd.concat(frames)

# Set logic on the other axes
################################
# When gluing together multiple DataFrames (or Panels or...), for example, 
# you have a choice of how to handle the other axes (other than the one being 
# concatenated). This can be done in three ways:

# * Take the (sorted) union of them all, join='outer'. 
    # This is the default option as it results in zero information loss.
# * Take the intersection, join='inner'.
# * Use a specific index (in the case of DataFrame) or indexes (in the case 
    # of Panel or future higher dimensional objects), i.e. the join_axes argument

# Here is a example of each of these methods. First, the default join='outer' behavior:
df4 = pd.DataFrame({'B': ['B2', 'B3', 'B6', 'B7'],
                     'D': ['D2', 'D3', 'D6', 'D7'],
                     'F': ['F2', 'F3', 'F6', 'F7']},
                    index=[2, 3, 6, 7])
df1
df4
result = pd.concat([df1, df4], axis=1)
result

# Note that the row indexes have been unioned and sorted. 
# Here is the same thing with join='inner':
result = pd.concat([df1, df4], axis=1, join='inner')
result

# Lastly, suppose we just wanted to reuse the exact index from the original DataFrame:
result = pd.concat([df1, df4], axis=1, join_axes=[df1.index])
result

## Concatenating using append
#############################
# A useful shortcut to concat are the append instance methods on Series and 
# DataFrame. These methods actually predated concat. They concatenate along 
# axis=0, namely the index:
result = df1.append(df2)
result

# In the case of DataFrame, the indexes must be disjoint but the columns do not need to be:
result = df1.append(df4)
result

# append may take multiple objects to concatenate:
result = df1.append([df2, df3])
result

# Unlike list.append method, which appends to the original list and returns 
# nothing, append here does not modify df1 and returns its copy with df2 appended.

# Ignoring indexes on the concatenation axis
######################################################
# For DataFrames which don’t have a meaningful index, you may wish to append 
# them and ignore the fact that they may have overlapping indexes:

# To do this, use the ignore_index argument:
result = pd.concat([df1, df4], ignore_index=True)
result

# This is also a valid argument to DataFrame.append:
result = df1.append(df4, ignore_index=True)
result

# Concatenating with mixed ndims
#######################################
# You can concatenate a mix of Series and DataFrames. 
# The Series will be transformed to DataFrames with the column name as the 
# name of the Series.
s1 = pd.Series(['X0', 'X1', 'X2', 'X3'], name='X')
s1
df1
result = pd.concat([df1, s1], axis=1)
result

# If unnamed Series are passed they will be numbered consecutively.
s2 = pd.Series(['_0', '_1', '_2', '_3'])
s2
df1
result = pd.concat([df1, s2, s2, s2], axis=1)
result

# Passing ignore_index=True will drop all name references.
result = pd.concat([df1, s1], axis=1, ignore_index=True)
result

# More concatenating with group keys
##############################################
# A fairly common use of the keys argument is to override the column names 
# when creating a new DataFrame based on existing Series. 
# Notice how the default behaviour consists on letting the resulting DataFrame 
# inherits the parent Series’ name, when these existed.
s3 = pd.Series([0, 1, 2, 3], name='foo')
s3
s4 = pd.Series([0, 1, 2, 3])
s4
s5 = pd.Series([0, 1, 4, 5])
s5
pd.concat([s3, s4, s5], axis=1) # add columns
pd.concat([s3, s4, s5], axis=0) # add rows

# Through the keys argument we can override the existing column names.
pd.concat([s3, s4, s5], axis=1, keys=['red','blue','yellow'])

# Let’s consider now a variation on the very first example presented:
result = pd.concat(frames, keys=['x', 'y', 'z'])
result

# You can also pass a dict to concat in which case the dict keys will 
# be used for the keys argument (unless other keys are specified):
pieces = {'x': df1, 'y': df2, 'z': df3}
pieces
result = pd.concat(pieces)
result

result = pd.concat(pieces, keys=['z', 'y'])
result

# The MultiIndex created has levels that are constructed from the passed 
# keys and the index of the DataFrame pieces:
result.index.levels

# If you wish to specify other levels (as will occasionally be the case), 
# you can do so using the levels argument:
result = pd.concat(pieces, keys=['x', 'y', 'z'],
                    levels=[['z', 'y', 'x', 'w']],
                    names=['group_key'])
result
pieces

result.index.levels
# Yes, this is fairly esoteric, but is actually necessary for implementing 
# things like GroupBy where the order of a categorical variable is meaningful.

# Appending rows to a DataFrame
###########################################

# While not especially efficient (since a new object must be created), 
# you can append a single row to a DataFrame by passing a Series or dict to 
# append, which returns a new DataFrame as above.
s2 = pd.Series(['X0', 'X1', 'X2', 'X3'], index=['A', 'B', 'C', 'D'])
s2
result = df1.append(s2, ignore_index=True)
result

# You should use ignore_index with this method to instruct DataFrame to 
# discard its index. If you wish to preserve the index, you should construct 
# an appropriately-indexed DataFrame and append or concatenate those objects.

# You can also pass a list of dicts or Series:
dicts = [{'A': 1, 'B': 2, 'C': 3, 'X': 4},
             {'A': 5, 'B': 6, 'C': 7, 'Y': 8}]
dicts

result = df1.append(dicts, ignore_index=True)
result




