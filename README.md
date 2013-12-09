weatherwall
===========

Ruby Script to update wallpaper based on weather

Instructions
------------

Change parameters in **weather.properties** file and execute the script **weatherwall.rb**.

#### weather.properties parameters

 - `lat`, `lon` : latitude and longitude of the place
 - `imagesdir` : Absolute path of the images directory
 - `apiurl` : API endpoint for weather service <*do **not** change*>

#### Images directory content format
Images are picked from `imagesdir` location of weather.properties. Rename your favorite wallpapers according to the following naming convention and it will be picked up based on the weather condition

| filename: Day | filename: Night| Description     |
| ------------- |:-------------:| -----:           |
| 01d.jpg       | 01n.jpb       | clear sky        |
| 02d.jpg       | 02n.jpb       | few clouds       |
| 03d.jpg       | 03n.jpb       | scattered clouds |
| 04d.jpg       | 04n.jpb       | broken clouds    |
| 09d.jpg       | 09n.jpb       | shower rain      |
| 10d.jpg       | 10n.jpb       | Rain             |
| 11d.jpg       | 11n.jpb       | Thunderstorm     |
| 13d.jpg       | 13n.jpb       | snow             |
| 50d.jpg       | 50n.jpb       | mist             |
