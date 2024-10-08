import pandas as pd
import matplotlib.pyplot as plt

# open a dataframe
df = pd.read_csv('housing.csv')

# eliminate empty rows from total_bedrooms
df = df.dropna(subset=['total_bedrooms'])

# get unique values from ocean_proximity
df['ocean_proximity'].unique()

# create a new column color from applying the colormap function
df['color'] = df['ocean_proximity'].apply(colormap)

df.plot(kind='scatter', x='longitude', y='latitude')
