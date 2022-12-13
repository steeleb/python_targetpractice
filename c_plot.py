# import modules
from pandas import read_csv
import numpy as np
import matplotlib.pyplot as plt

#point to file - must contain the parameters Latitude, Longitude, comid, and name
locs_file = 'ReservoirLocations.csv'
locs = read_csv(locs_file)

#create a somewhat nonsense figure of lat/long from the Northern Water reseroir locations
fig, ax = plt.subplots(figsize=(5, 5), layout='constrained')
ax.scatter('Longitude', 'Latitude', data=locs)
ax.set_xlabel('Longitude')
ax.set_ylabel('Latitude')
ax.xaxis_inverted()
plt.show()
print();
