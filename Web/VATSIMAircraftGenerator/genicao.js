icao = [
    "A318", "A319", "A320", "A321",
    "B721", "B722",
    "B732", "B736", "B737", "B738", "B739",
    "B74S", "B744", "B748",
    "B752", "B753",
    "B762", "B763", "B764",
    "B772", "B77L", "B773", "B77W",
    "B788", "B789", "B78X",
    "CRJ7", "CRJ9",
    "E130", "E135", "E140", "E145", "E170", "E190", "E195",
    "MD11", "MD81", "MD82", "MD83", "MD87", "MD88", "MD89"
]

function genICAO() {
    var num = Math.floor(Math.random() * icao.length);
    while (isNaN(num)) {
        num = Math.floor(Math.random() * icao.length);
    }
    return icao[num];
}
