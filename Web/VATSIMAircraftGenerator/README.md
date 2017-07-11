# VATSIMAircraftGenerator

Written by Eamonn Nugent and Brin Brody under the "Beer-ware" license.

## Usage
To use, simply visit [this link](https://demilletech.github.io/eamonn-random/Web/VATSIMAircraftGenerator/index.html).
At the moment, the code is written for flights from JFK. To make it work with your own airport, edit `genflight.js`
to have your airport in the `dep_arpt` var.

### Creating a flight
Zoom into the airport of your choice, and click anywhere on the map. On the left-hand side, a flightplan should show
up in a format that can be used by TWRTrainer. Copy the text when completed, and save as a .acs file anywhere you'd
like. NOTE: The current source encodes for departures from KJFK. If you want to fix it, see the `Add My Airport` section,

## API Key
This requires a Google Maps API key. Please view [this link](https://stackoverflow.com/questions/22294128/how-can-i-get-google-map-api-v3-key)
to see how to obtain one. It needs to be inserted into `index.html`, on the line that contains the Maps API call, as the `key`
GET variable.

## Add My Airport
In `genflight.js`, you should see a line that says `var deparpt = "KJFK";`. Edit this line to say `var deparpt = "YOUR_AIRPORT";`

## Routing
Currently, all aircraft are written to proceed DIRECT. In a future revision, FAA PRD routing will be followed.
If no routing is found through the PRD API, then the aircraft will proceed DIRECT.
