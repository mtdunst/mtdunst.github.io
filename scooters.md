## Minneapolis E-Scooters Research

**Project description:** The popularity of e-scooters has swept across the United States over the past several years. They have low capital costs, low operating costs, practically no required infrastructure, and can be deployed rapidly in new cities and neighborhoods. E-scooters clearly break the mold of other transportation options. With these features, can they provide a new mode of transportation to low-income communities in American cities?

<img src="images/UMN/trips.png?raw=true" width="400"/>

### Data Process

I chose to aggregate the trips based on start and end centerline. This had the downside of losing the data on each unique trip, but had the much larger upside of allowing me to filter the data down from over one million rows to only a couple tens of thousands. After that step, I was able to use GeoPandas in Python to correlate each street segment with the number of trips at that location. GeoPandas is an open source Python library that performs many of the same functions as ArcGIS but more efficiently and quickly.

In order to connect demographic data, I downloaded information from the Minnesota Geospatial Commons and the U.S. Census Bureau that contained block group-level information on racial makeup, population, ethnicity, and income levels. This data was similarly spatially-joined to street centerlines to pair it with the trips data.

I also wanted to see how transit relates to e-scooter usage. To integrate this data into my dataset I calculated the density of transit stops in the vicinity of each street segment. I then spatially-joined that data to the whole dataset to get it paired with the number of trips and the aforementioned demographic data.

Finally, to actually analyze the data, I remained in Python and created linear regressions for different relationships.

### Results and Discussion

I chose to conduct a least-squares regression for four relationships relating to e-scooter usage. They are: percent white population versus total trips, total population (vs total trips), trips per capita versus transit stops per capita, and percent low-income versus total trips. These four criteria were chosen to fulfill some of the “five D’s” (density, diversity, distance to transit, design (not covered), and destination accessibility (not covered).

My findings followed previous research by showing a correlation between increased white population and increased number of trips. On the other hand, a positive relationship was found between the percent low-income population and the number of trips. Additionally, in contrast to previous findings that scooters are used for recreational purposes, a strong correlation was found between transit stops per capita and scooter trips per capita. Overall, however, my findings have the caveat that many of the factors studied can be confounded by other variables. For example, the transit stops per capita metric might also tie into density and that could confound what the relationship is in reality.

<img src="images/UMN/AppSuccess.png?raw=true" width="400"/>


