## Creating TOD Strategy Recommendations for Bogotá

**Project description:** Bogotá has debated over whether or not to build a rail-based metro system for decades, but it has finally started construction. As part of my capstone planning studio, I set out to create recommended transit-oriented development strategies for each station. Bogotá has many needs as a growing city, so how can they use their metro system as a single entity to balance each station's strengths, resources, and opportunities?

### 1. The World Bank's 3 V's Framework

I based my analysis on the existing framework for categorizing TOD strategies from the World Bank. This framework analyzes a station's network, place, and market value.

<img src="images/Bogota/3vs.png?raw=true" width="600"/>

I then calculated these various indices using methods including network analysis in Python using NetworkX, land use entropy calculations in R, and walk shed accessibility analysis using ArcGIS Pro's Network Analyst toolbox.

### 2. Compiling the Data

With the relevant variables calculated, I created an index for each category to minimize the issues associated with varying scales and units; finally, I created scores for each value category.

To help convey this process during our presentation, I used R, ArcGIS Pro, and Adobe Illustrator to create this graphic showing how I compiled the indices together.

<img src="images/Bogota/Bogota TOD readiness graphic.png?raw=true" width="600"/>

### 3. Drafting TOD Strategies

With the three values calculated, I followed the framework's process of plotting them on a three-dimensional chart. This allowed me to compare each station to the framework's work, but this wasn't specific enough to Bogotá's context for me. I made a more nuanced version of their categories: Transformation, Intensification, and Infill. These categories balance the competing needs of value capture, creating new housing, and locating people closer to job centers.

<img src="images/Bogota/strategies.png?raw=true" width="600"/>

Each of the needs that Bogotá faces could be addressed to an almost unlimited degree with transit-oriented development. However, this framework allows planners to utilize the market strengths of central stations to capture value for public purposes, increase density of jobs and housing in a majority of the city, and vastly increase the amount of housing with access to high-quality transit at infill stations.

<img src="images/Bogota/strat_map.png?raw=true" width="600"/>

### 4. Integration with colleagues' projects

This project was the building block of two of my colleagues' studio projects. The first additional project was using my recommendations to guide a value capture study. Their analysis found that, by following my recommendation of using in-demand stations to generate revenue for public housing at infill stations, a metro value capture scheme could generate upwards of $300 million dollars.

The second additional project built off of my work by taking my station recommendations and creating site plans for a handful of sites to calculate the specific number of housing units, square footage of office space, etc. that could be developed.













