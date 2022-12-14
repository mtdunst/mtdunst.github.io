## Predicting Bikeshare Demand

**Project description:** Sometimes it may seem like magic how bike share systems work. Unless you’re unlucky, there is always the right number of bikes to be taken from your nearest station and the right number of empty slots at a station near your destination. However, this doesn’t just happen. This optimization is the result of rebalancing - bike share operators intervening in the natural distribution of bikes to keep the cycle ecosystem in order. In this project, I created a model to predict demand for bikeshare in Minneapolis.

### 1. Collecting Data

I brought in past data from Nice Rides, Census data for the city, and weather data for the duration of the data.

<img src="images/Bikeshare/weather_data.png?raw=true" width="600"/>

### 2. Exploring Data

With the releveant variables imported, I took a look under the hood to generally see how and when bikes were being rented. I compared the day of the week, time of day, amenity values, and more.

<img src="images/Bikeshare/bikeshare_header.png?raw=true" width="600"/>
<img src="images/Bikeshare/bikeshare_gif.gif?raw=true" width="600"/>

### 3. Predict for Test Data

I split the source data into training and test sets to calibrate the model. I then created five different models, each with different variables sprinkled in, to see what made the most accurate predictions.

With each new model, the errors got smaller and smaller.

<img src="images/Bikeshare/bikeshare_error_model.png?raw=true" width="600"/>

You can see how the model is "learning" to fit to temporal and meteorlogical trends.

<img src="images/Bikeshare/bikeshare_error_model2.png?raw=true" width="600"/>

### 4. Conclusion
I built a model that took time, time lag, and spatial variables into account. While the model using all of these variables combined is the strongest, even just 1 or 24-hour time lag is a strong predictor of demand.

Because of the strength of time lag, this model should be quite generalizeable. Any chosen time frame for Nice Ride, or any other bike share system, will have the same data. Since time lag is such a strong predictor by itself, the model as a whole should be useful for many other applications.

The model seems to miss most often during peak periods at stations that presumably have the most demand. It is important that Nice Ride avoids this because it would result in lost riders who want a bike but can’t get one. While they can continue a rider incentive program for routine rebalancing, I would recommend that Nice Ride prioritize its rebalancing via employee and van in known high demand locations in the evening and night on weekends.
