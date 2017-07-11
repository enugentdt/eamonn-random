airports = [
    "KBOS", "KJFK", "KBWI", "KIAD", "KORD", "KDFW", "KLAX", "KSFO", "KOAK", "CYYZ", "KMIA", "KJAX", "KAUS", "KPHL", "KEWR", "KDEN"
]

function genAirport()
{
    var num = Math.floor(Math.random() * (airports.length - 1));
    while (isNaN(num)) {
        num = Math.floor(Math.random() * (airports.length - 1));
    }
    return airports[num];
}