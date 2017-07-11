airlines = 
[
"UAL", "AAL", "DAL", "JBU", "ASA", "SWA", "FTA", "HAL", "VIR", "FDX", "UPS", "PAC", "SKW"
];

function newAircraft()
{
    var anum = Math.floor(Math.random() * airports.length);
    while (isNaN(anum)) {
        anum = Math.floor(Math.random() * airports.length);
    }
    console.log("anum: " + anum);
    
    var airline = airlines[anum];
    var nnum = Math.floor(Math.random() * 10000);
    while (isNaN(nnum)) {
        nnum = Math.floor(Math.random() * 10000);
    }
    console.log("nnum: " + nnum)
    
    return airline + nnum;
}