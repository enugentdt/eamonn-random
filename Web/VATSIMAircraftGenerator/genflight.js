function genFlight(lat,lng)
{
    var callsign = newAircraft();
    var squawk = 3001;
    // Spacer
    var heading = 010;
    var alt = 27;
    var gs = 1;
    var cdr = 1800;
    var type = "I"; // IFR (I) or VFR (V)
    // Newline
    var actype = genICAO();
    var cruisespeed = 400;
    var depaprt = "KJFK";
    var deptime = 1755;
    var randNum = Math.ceil(Math.random() * 10);
    var cruisealt = 30000 + randNum * 1000;
    var arraprt = genAirport();
    var enroutehrs = 4;
    var enroutemins = 50;
    // Newline
    var route = "DIRECT";
    var voicetype = "/v/";

    var out = callsign + "," + squawk + "," + lat + "," + lng + "," + heading + "," + alt + "," + 
        gs + "," + cdr + "\n" + type + "," + actype + "," + cruisespeed + "," + depaprt + 
        "," + deptime + "," + deptime + "," + cruisealt + "," + arraprt + "," + enroutehrs + "," + 
        enroutemins + "\n" + route + "\n" + voicetype + "\n";
    return out;
}
