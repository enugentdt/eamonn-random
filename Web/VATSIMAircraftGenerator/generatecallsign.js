airlines = 
[
"UAL", "AAL", "DAL", "JBU", "ASA", "SWA", "FTA", "HAL", "VIR", "FDX", "UPS", "PAC", "SKW"
];

function newAircraft()
{
    var anum = Math.floor(Math.random() * airports.length);
    while (anum == NaN) {
        anum = Math.floor(Math.random() * airports.length);
    }
    
    var airline = airlines[anum];
    var nnum = Math.ceil(Math.random() * 9999);
    while (nnum == NaN) {
        nnum = Math.ceil(Math.random() * 9999);
    }
    
    return airline + nnum;
}