## Environmental Geospatial Deterministic Analytics

**Project description:** This is a summary of my work as a research assistant from 2020-2021. This work started out in ArcGIS Pro, where I was already proficient, but quickly moved beyond pre-made software and into Python. Starting with a framework created step by step in Arc, I translated all of the processes into Python using Geopandas and SciPy so that the research team could move more quickly and scale up to the university supercomputer. In the end, I created an analysis process that created an environmental valuation for all 400,000+ parcels in Hennepin County, MN. I also focused heavily on the client side, ensuring that all of my work was documented, its place and importance diagrammed, and conveyed in a straightforward manner.

### 1. Hennepin County Environmental Analysis Example

This data flow is one of 19 I created to model criteria for this project. Using Geopandas, I joined data from a Gini-Simpson Index Value (biodiversity) layer onto my data of parcels in the County. I then calculated the area of "high" biodiversity in each parcel to create a ratio. This was then translated into a final rating to proxy a parcel's biodiversity.

This is an example of a process that was greatly improved by moving off of ArcGIS. I computed that, using Model Builder in ArcGIS, it would take years of computer time to compute the needed data. By moving the process in Python, the process only takes a couple of minutes. And, as the processes are now in Python, the project could be scaled up even further, as my processes can now run on the majority of supercomputers that don't run desktop Windows.

<img src="images/UMN/data_flow.png?raw=true" width="600"/>

[Data Process](/https://github.com/mtdunst/Grad-school-reference/blob/main/Ex.%201%20-%20Habitat%20diversity%20analysis.ipynb)

### 2. Overall Process

This was but one of 19 variables calculated for each parcel. The entire data flow looked like this.

<img src="images/UMN/overall_flow.jpg?raw=true" width="500"/>
