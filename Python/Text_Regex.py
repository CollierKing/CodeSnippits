#Removing Punctuation

products['review_clean'] = products['review'].str.replace('[^\w\s]','')