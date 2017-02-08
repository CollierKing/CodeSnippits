#Misc-Mathematical

# Weighted-Averages (method 1)
import functools

def wavg(g, df, weight_series):
    w = df.ix[g.index][weight_series]
    return (g * w).sum() / w.sum()
 
 
def wavg(g, df, weight_series):
    w = df.ix[g.index][weight_series]
    if w.sum() == 0:
        return 0
    else:
        return (g * w).sum() / w.sum()
 
 
forecast = functools.partial(wavg, df=p12, weight_series='PF_COUNTS (RELATIVE WEIGHTS)')
actual = functools.partial(wavg, df=p12, weight_series='ME_COUNTS (RELATIVE WEIGHTS)')
