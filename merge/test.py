"""import os
import glob
import pandas as pd
os.chdir("/home/roopkatha/Downloads/paper work/merge")
extension = 'csv'
all_filenames = [i for i in glob.glob('*.{}'.format(extension))]
#combine all files in the list
combined_csv = pd.concat([pd.read_csv(f) for f in all_filenames ])
#export to csv
combined_csv.to_csv( "combined_csv.csv", index=False, encoding='utf-8-sig')	"""
import pandas as pd

df1 = pd.read_csv('combined_323.csv')
df2 = pd.read_csv('combined_768.csv')
df3 = pd.read_csv('combined_81.csv')

df4 = df1.merge(df2, on='rank')	
df = df4.merge(df3, on='rank')

#df = df1.merge(df2, on='rank')
df.to_csv( "assamese_merged.csv", index=False, encoding='utf-8-sig')