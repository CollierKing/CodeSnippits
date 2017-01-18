# http://pandas.pydata.org/pandas-docs/stable/io.html#io-store-in-csv

import pandas as pd
import numpy as np

# The pandas I/O API is a set of top level reader functions accessed 
# like pd.read_csv() that generally return a pandas object.

# The corresponding writer functions are object methods that are accessed like df.to_csv()

## CSV & Text files
###################
# The two workhorse functions for reading text files (a.k.a. flat files) 
# are read_csv() and read_table(). 
# They both use the same parsing code to intelligently convert tabular data into a DataFrame object. 

print(open('foo.csv').read())
test = pd.read_csv('foo.csv')

# In the case of indexed data, 
# you can pass the column number or column name you wish to use as the index:
pd.read_csv('foo.csv', index_col=0)
pd.read_csv('foo.csv', index_col='date')

# You can also use a list of columns to create a hierarchical index:
pd.read_csv('foo.csv', index_col=[0, 'A'])

## Excel files
##############
# The read_excel() method can read Excel 2003 (.xls) and Excel 2007+ (.xlsx) 
# files using the xlrd Python module. The to_excel() instance method is used 
# for saving a DataFrame to Excel. Generally the semantics are similar 
# to working with csv data

# Reading Excel Files
# In the most basic use-case, read_excel takes a path to an Excel file, 
# and the sheetname indicating which sheet to parse.

read_excel('path_to_file.xls', sheetname='Sheet1')

# ExcelFile class
# To facilitate working with multiple sheets from the same file, 
# the ExcelFile class can be used to wrap the file and can be be passed 
# into read_excel There will be a performance benefit for reading 
# multiple sheets as the file is read into memory only once.
os.chdir("/Users/Collier/Dropbox/Skills/R/Data/MIS2016/")
xlsx = pd.ExcelFile('BostonHousing(1).xls')
df = pd.read_excel(xlsx, 'Data')

# The ExcelFile class can also be used as a context manager.
with pd.ExcelFile('BostonHousing(1).xls') as xls:
    df1 = pd.read_excel(xls, 'Data')
    #df2 = pd.read_excel(xls, 'Sheet2')

# The sheet_names property will generate a list of the sheet names in the file.
# The primary use-case for an ExcelFile is parsing multiple sheets with different parameters
data = {}
# For when Sheet1's format differs from Sheet2
with pd.ExcelFile('path_to_file.xls') as xls:
    data['Sheet1'] = pd.read_excel(xls, 'Sheet1', index_col=None, na_values=['NA'])
    data['Sheet2'] = pd.read_excel(xls, 'Sheet2', index_col=1)
    
# Note that if the same parsing parameters are used for all sheets, 
# a list of sheet names can simply be passed to read_excel with no loss in performance.

# using the ExcelFile class
data = {}
with pd.ExcelFile('BostonHousing(1).xls') as xls:
    data['data'] = pd.read_excel(xls, 'Data', index_col=None, na_values=['NA'])
    #data['Sheet2'] = read_excel(xls, 'Sheet2', index_col=None, na_values=['NA'])

# Returns a DataFrame
read_excel('path_to_file.xls', 'Sheet1', index_col=None, na_values=['NA'])
# Default values
read_excel('path_to_file.xls')
# equivalent using the read_excel function
data = read_excel('path_to_file.xls', ['Sheet1', 'Sheet2'], index_col=None, na_values=['NA'])
# Using None to get all sheets:
# Returns a dictionary of DataFrames
read_excel('path_to_file.xls',sheetname=None)
# Using a list to get multiple sheets:
# Returns the 1st and 4th sheet, as a dictionary of DataFrames.
read_excel('path_to_file.xls',sheetname=['Sheet1',3])

# Reading a MultiIndex
# read_excel can read a MultiIndex index, by passing a list of columns 
# to index_col and a MultiIndex column by passing a list of rows to header. 
# If either the index or columns have serialized level names those will be 
# read in as well by specifying the rows/columns that make up the levels.

# For example, to read in a MultiIndex index without names:
df = pd.DataFrame({'a':[1,2,3,4], 'b':[5,6,7,8]},
                  index=pd.MultiIndex.from_product([['a','b'],['c','d']]))

df.to_excel('path_to_file.xlsx')
df = pd.read_excel('path_to_file.xlsx', index_col=[0,1])
df
# If the index has level names, they will parsed as well, using the same parameters.
df.index = df.index.set_names(['lvl1', 'lvl2'])
df.to_excel('path_to_file.xlsx')
df = pd.read_excel('path_to_file.xlsx', index_col=[0,1])
df
# If the source file has both MultiIndex index and columns, 
# lists specifying each should be passed to index_col and header
df.columns = pd.MultiIndex.from_product([['a'],['b', 'd']], names=['c1', 'c2'])
df
df.to_excel('path_to_file.xlsx')
df = pd.read_excel('path_to_file.xlsx',
                     index_col=[0,1], header=[0,1])
df

# Parsing Specific Columns
read_excel('path_to_file.xls', 'Sheet1', parse_cols=2)
read_excel('path_to_file.xls', 'Sheet1', parse_cols=[0, 2, 3])
# Cell Converters
# It is possible to transform the contents of Excel cells via the converters option. 
# For instance, to convert a column to boolean:
read_excel('path_to_file.xls', 'Sheet1', converters={'MyBools': bool})

# Writing Excel Files
df.to_excel('path_to_file.xlsx', sheet_name='Sheet1')
# Files with a .xls extension will be written using xlwt and those with a 
# .xlsx extension will be written using xlsxwriter (if available) or openpyxl.

# In order to write separate DataFrames to separate sheets in a single Excel file, 
# one can pass an ExcelWriter.
with ExcelWriter('path_to_file.xlsx') as writer:
    df1.to_excel(writer, sheet_name='Sheet1')
    df2.to_excel(writer, sheet_name='Sheet2')
    
# By default, pandas uses the XlsxWriter for .xlsx and openpyxl for .xlsm files and xlwt for .xls files. 
# To specify which writer you want to use, 
# you can pass an engine keyword argument to to_excel and to ExcelWriter. 
# The built-in engines are:
# * openpyxl
# * xlsxwriter
# * xlwt

# By setting the 'engine' in the DataFrame and Panel 'to_excel()' methods.
df.to_excel('path_to_file.xlsx', sheet_name='Sheet1', engine='xlsxwriter')

# By setting the 'engine' in the ExcelWriter constructor.
writer = ExcelWriter('path_to_file.xlsx', engine='xlsxwriter')

# Or via pandas configuration.
from pandas import options
options.io.excel.xlsx.writer = 'xlsxwriter'

df.to_excel('path_to_file.xlsx', sheet_name='Sheet1')

## Clipboard
############

# A handy way to grab data is to use the read_clipboard method, 
# which takes the contents of the clipboard buffer and passes 
# them to the read_table method.

clipdf = pd.read_clipboard()

# The to_clipboard method can be used to write the contents of a DataFrame to the clipboard. 
from numpy import random
df = pd.DataFrame(random.randn(5,3))
df

df.to_clipboard()
pd.read_clipboard()

# MYSQL
############
#####
import pymysql
import sqlalchemy
from sqlalchemy import create_engine
import pandas as pd
engine = create_engine('mysql+pymysql://user:pass@host/schema', echo=False)
f = pd.read_sql_query('SELECT * FROM trades', engine)
f.head()

