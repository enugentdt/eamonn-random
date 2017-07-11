airports = [
    "KBOS", "KJFK", "KBWI", "KIAD", "KORD", "KDFW", "KLAX", "KSFO", "KOAK", "CYYZ", "KMIA", "KJAX", "KAUS", "KPHL", "KEWR", "KDEN"
]

function genAirport()
{
    var num = Math.ceil(Math.random() * airports.length);
    while (num == NaN) {
        num = Math.ceil(Math.random() * airports.length);
    }
    return airports[num];
}