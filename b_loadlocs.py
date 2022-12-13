#import modules
import ee
import os 
from pandas import read_csv

#initialize GEE
ee.Initialize()

#point to file - must contain the parameters Latitude, Longitude, comid, and name
locs_file = 'ReservoirLocations.csv'
locs = read_csv(locs_file)

#rename to required cols Latitude, Longitude, comid, name
locs = locs.rename(columns = {'NW_res':'name', 'id':'comid'})

def csv_to_eeFeat(df):
  features=[]
  for i in range(df.shape[0]):
    x,y = df.Longitude[i],df.Latitude[i]
    latlong =[x,y]
    loc_properties = {'system:index':str(df.comid[i]), 'name':df.name[i], 'comid':str(df.comid[i])}
    g=ee.Geometry.Point(latlong) 
    feature = ee.Feature(g, loc_properties)
    features.append(feature)
  ee_object = ee.FeatureCollection(features)
  return ee_object

locs_feature = csv_to_eeFeat(locs)  

#check to make sure everything showed up.
print(locs_feature.getInfo())
