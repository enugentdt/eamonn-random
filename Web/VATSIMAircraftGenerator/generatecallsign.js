airlines = 
[
"UAL", "AAL", "DAL", "JBU", "ASA", "SWA", "FTA", "HAL", "VIR", "FDX", "UPS", "PAC", "SKW"
];

function newAircraft()
{
    var airline = airlines[Math.ceil(Math.random() * airlines.length)];
    var num = Math.ceil(Math.random() * 9999);
    return airline + num;
}