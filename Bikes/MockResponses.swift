//
//  Copyright (c) 2019 Manav Rathi.
//
//  MIT License.
//

import Foundation

#if DEBUG

class MockResponses {
    let bikeRentalStations = #"""
{
  "data": {
    "bikeRentalStations": [
      {
        "stationId": "591",
        "name": "Mellstenintie",
        "bikesAvailable": 14,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.154941,
        "lon": 24.773993,
        "state": "Station on"
      },
      {
        "stationId": "230",
        "name": "Mäkitorpantie",
        "bikesAvailable": 10,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.22892599719876,
        "lon": 24.96355034325867,
        "state": "Station on"
      },
      {
        "stationId": "593",
        "name": "Toppelundintie",
        "bikesAvailable": 7,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.159601,
        "lon": 24.782536,
        "state": "Station on"
      },
      {
        "stationId": "110",
        "name": "Maistraatintori",
        "bikesAvailable": 7,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.19890671373,
        "lon": 24.92486532113,
        "state": "Station on"
      },
      {
        "stationId": "231",
        "name": "Siltavoudintie",
        "bikesAvailable": 11,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.23370685633967,
        "lon": 24.96539507775229,
        "state": "Station on"
      },
      {
        "stationId": "111",
        "name": "Esterinportti",
        "bikesAvailable": 7,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.1975724,
        "lon": 24.9267808,
        "state": "Station on"
      },
      {
        "stationId": "232",
        "name": "Oulunkylän asema",
        "bikesAvailable": 4,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.22869895434673,
        "lon": 24.967608606305625,
        "state": "Station on"
      },
      {
        "stationId": "595",
        "name": "Westendintie",
        "bikesAvailable": 9,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.158194,
        "lon": 24.791754,
        "state": "Station on"
      },
      {
        "stationId": "112",
        "name": "Rautatieläisenkatu",
        "bikesAvailable": 4,
        "spacesAvailable": 18,
        "realtime": true,
        "lat": 60.2014382,
        "lon": 24.9332721,
        "state": "Station on"
      },
      {
        "stationId": "233",
        "name": "Kirkkoherrantie",
        "bikesAvailable": 8,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.22493036511101,
        "lon": 24.972819375145058,
        "state": "Station on"
      },
      {
        "stationId": "596",
        "name": "Toppelundinportti",
        "bikesAvailable": 34,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.1624471,
        "lon": 24.7848628,
        "state": "Station on"
      },
      {
        "stationId": "113",
        "name": "Veturitori",
        "bikesAvailable": 0,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.19970941415,
        "lon": 24.93520368471,
        "state": "Station off"
      },
      {
        "stationId": "234",
        "name": "Otto Brandtin tie",
        "bikesAvailable": 10,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.23178406584145,
        "lon": 24.978138919040457,
        "state": "Station on"
      },
      {
        "stationId": "597",
        "name": "Linnakepolku",
        "bikesAvailable": 10,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.1637,
        "lon": 24.790132,
        "state": "Station on"
      },
      {
        "stationId": "114",
        "name": "Ratapihantie",
        "bikesAvailable": 4,
        "spacesAvailable": 18,
        "realtime": true,
        "lat": 60.19701384571,
        "lon": 24.93588683501,
        "state": "Station on"
      },
      {
        "stationId": "235",
        "name": "Katariina Saksilaisen katu",
        "bikesAvailable": 18,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.217214807977534,
        "lon": 24.984420078358692,
        "state": "Station on"
      },
      {
        "stationId": "115",
        "name": "Venttiilikuja",
        "bikesAvailable": 16,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.1942095,
        "lon": 24.941578,
        "state": "Station on"
      },
      {
        "stationId": "236",
        "name": "Hernepellontie",
        "bikesAvailable": 8,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.224212141004635,
        "lon": 24.98860011548657,
        "state": "Station on"
      },
      {
        "stationId": "116",
        "name": "Linnanmäki",
        "bikesAvailable": 6,
        "spacesAvailable": 26,
        "realtime": true,
        "lat": 60.1911411,
        "lon": 24.9401593,
        "state": "Station on"
      },
      {
        "stationId": "237",
        "name": "Aulangontie",
        "bikesAvailable": 10,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.23030192663912,
        "lon": 24.998533819860555,
        "state": "Station on"
      },
      {
        "stationId": "117",
        "name": "Brahen puistikko",
        "bikesAvailable": 3,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.1896706,
        "lon": 24.9481024,
        "state": "Station on"
      },
      {
        "stationId": "238",
        "name": "Pihlajamäki",
        "bikesAvailable": 5,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.234578571034135,
        "lon": 25.010313905081038,
        "state": "Station on"
      },
      {
        "stationId": "118",
        "name": "Fleminginkatu",
        "bikesAvailable": 1,
        "spacesAvailable": 21,
        "realtime": true,
        "lat": 60.1895417,
        "lon": 24.9521601,
        "state": "Station on"
      },
      {
        "stationId": "239",
        "name": "Viikin tiedepuisto",
        "bikesAvailable": 3,
        "spacesAvailable": 25,
        "realtime": true,
        "lat": 60.227520671727405,
        "lon": 25.010062061139756,
        "state": "Station on"
      },
      {
        "stationId": "119",
        "name": "Gebhardinaukio",
        "bikesAvailable": 0,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.1907096,
        "lon": 24.9568729,
        "state": "Station on"
      },
      {
        "stationId": "240",
        "name": "Viikin normaalikoulu",
        "bikesAvailable": 10,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.227495295832895,
        "lon": 25.02761893353016,
        "state": "Station on"
      },
      {
        "stationId": "120",
        "name": "Mäkelänkatu",
        "bikesAvailable": 1,
        "spacesAvailable": 27,
        "realtime": true,
        "lat": 60.1896352,
        "lon": 24.9635596,
        "state": "Station on"
      },
      {
        "stationId": "241",
        "name": "Agronominkatu",
        "bikesAvailable": 23,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.2340530100318,
        "lon": 25.032857400999006,
        "state": "Station on"
      },
      {
        "stationId": "121",
        "name": "Vilhonvuorenkatu",
        "bikesAvailable": 9,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.1864633,
        "lon": 24.9678718,
        "state": "Station on"
      },
      {
        "stationId": "242",
        "name": "Von Daehnin katu",
        "bikesAvailable": 12,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.23033717886547,
        "lon": 25.04356806988234,
        "state": "Station on"
      },
      {
        "stationId": "001",
        "name": "Kaivopuisto",
        "bikesAvailable": 55,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.15544479382098,
        "lon": 24.950292889690314,
        "state": "Station on"
      },
      {
        "stationId": "122",
        "name": "Lintulahdenkatu",
        "bikesAvailable": 34,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.1837182,
        "lon": 24.9621936,
        "state": "Station on"
      },
      {
        "stationId": "243",
        "name": "Mustikkamaa",
        "bikesAvailable": 1,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.181861779166056,
        "lon": 24.992037110168354,
        "state": "Station on"
      },
      {
        "stationId": "002",
        "name": "Laivasillankatu",
        "bikesAvailable": 18,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.160959094315416,
        "lon": 24.95634747175871,
        "state": "Station on"
      },
      {
        "stationId": "123",
        "name": "Näkinsilta",
        "bikesAvailable": 8,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.179765,
        "lon": 24.9554618,
        "state": "Station on"
      },
      {
        "stationId": "244",
        "name": "Relanderinaukio",
        "bikesAvailable": 5,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.18588749805257,
        "lon": 25.00601922389024,
        "state": "Station on"
      },
      {
        "stationId": "003",
        "name": "Kapteeninpuistikko",
        "bikesAvailable": 14,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.1581892,
        "lon": 24.9449274,
        "state": "Station on"
      },
      {
        "stationId": "124",
        "name": "Isoisänsilta",
        "bikesAvailable": 30,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.18265182058,
        "lon": 24.98179260578,
        "state": "Station on"
      },
      {
        "stationId": "245",
        "name": "Kulosaaren metroasema",
        "bikesAvailable": 4,
        "spacesAvailable": 18,
        "realtime": true,
        "lat": 60.188950088551046,
        "lon": 25.006566530899704,
        "state": "Station on"
      },
      {
        "stationId": "004",
        "name": "Viiskulma",
        "bikesAvailable": 3,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.1609859,
        "lon": 24.9417758,
        "state": "Station on"
      },
      {
        "stationId": "125",
        "name": "Arielinkatu",
        "bikesAvailable": 19,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.18479903388,
        "lon": 24.97864799006,
        "state": "Station on"
      },
      {
        "stationId": "246",
        "name": "Tupasaarentie",
        "bikesAvailable": 9,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.187998177032696,
        "lon": 25.015391648483803,
        "state": "Station on"
      },
      {
        "stationId": "005",
        "name": "Sepänkatu",
        "bikesAvailable": 12,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.1579483,
        "lon": 24.9362853,
        "state": "Station on"
      },
      {
        "stationId": "126",
        "name": "Kalasataman metroasema",
        "bikesAvailable": 34,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.18755649,
        "lon": 24.9770684,
        "state": "Station on"
      },
      {
        "stationId": "247",
        "name": "Haakoninlahdenkatu",
        "bikesAvailable": 14,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.168868558353665,
        "lon": 25.020860955309665,
        "state": "Station on"
      },
      {
        "stationId": "006",
        "name": "Hietalahdentori",
        "bikesAvailable": 1,
        "spacesAvailable": 21,
        "realtime": true,
        "lat": 60.1622251,
        "lon": 24.9297099,
        "state": "Station on"
      },
      {
        "stationId": "127",
        "name": "Teurastamo",
        "bikesAvailable": 12,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.1896994,
        "lon": 24.9711926,
        "state": "Station on"
      },
      {
        "stationId": "248",
        "name": "Gunillantie",
        "bikesAvailable": 12,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.171980271468335,
        "lon": 25.032968849816825,
        "state": "Station on"
      },
      {
        "stationId": "007",
        "name": "Designmuseo",
        "bikesAvailable": 0,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.1631032,
        "lon": 24.94596,
        "state": "Station on"
      },
      {
        "stationId": "128",
        "name": "Päijänteentie",
        "bikesAvailable": 1,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.1920576,
        "lon": 24.9642238,
        "state": "Station on"
      },
      {
        "stationId": "249",
        "name": "Isosaarentie",
        "bikesAvailable": 0,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.17549032254954,
        "lon": 25.044900705939895,
        "state": "Station on"
      },
      {
        "stationId": "008",
        "name": "Vanha kirkkopuisto",
        "bikesAvailable": 1,
        "spacesAvailable": 23,
        "realtime": true,
        "lat": 60.1652883,
        "lon": 24.9391499,
        "state": "Station on"
      },
      {
        "stationId": "129",
        "name": "Pernajantie",
        "bikesAvailable": 16,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.1942342,
        "lon": 24.9579931,
        "state": "Station on"
      },
      {
        "stationId": "009",
        "name": "Erottajan aukio",
        "bikesAvailable": 0,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.166911666820425,
        "lon": 24.944134928807944,
        "state": "Station off"
      },
      {
        "stationId": "250",
        "name": "Reiherintie",
        "bikesAvailable": 4,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.167730503345986,
        "lon": 25.047496264887712,
        "state": "Station on"
      },
      {
        "stationId": "130",
        "name": "Teollisuuskatu",
        "bikesAvailable": 1,
        "spacesAvailable": 23,
        "realtime": true,
        "lat": 60.193486,
        "lon": 24.9487524,
        "state": "Station on"
      },
      {
        "stationId": "251",
        "name": "Laajasalon ostoskeskus",
        "bikesAvailable": 0,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.18009213610057,
        "lon": 25.05188370479307,
        "state": "Station off"
      },
      {
        "stationId": "010",
        "name": "Kasarmitori",
        "bikesAvailable": 1,
        "spacesAvailable": 27,
        "realtime": true,
        "lat": 60.1650171805,
        "lon": 24.94947287873,
        "state": "Station on"
      },
      {
        "stationId": "131",
        "name": "Elimäenkatu",
        "bikesAvailable": 2,
        "spacesAvailable": 22,
        "realtime": true,
        "lat": 60.1962627,
        "lon": 24.9476186,
        "state": "Station on"
      },
      {
        "stationId": "252",
        "name": "Humalniementie",
        "bikesAvailable": 12,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.18374384938291,
        "lon": 25.053037859101934,
        "state": "Station on"
      },
      {
        "stationId": "011",
        "name": "Unioninkatu",
        "bikesAvailable": 7,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.1674573,
        "lon": 24.9510227,
        "state": "Station on"
      },
      {
        "stationId": "132",
        "name": "Hollolantie",
        "bikesAvailable": 6,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.19588479865,
        "lon": 24.95453389981,
        "state": "Station on"
      },
      {
        "stationId": "253",
        "name": "Tammisalon aukio",
        "bikesAvailable": 19,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.19164687919301,
        "lon": 25.06118417092495,
        "state": "Station on"
      },
      {
        "stationId": "012",
        "name": "Kanavaranta",
        "bikesAvailable": 31,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.168384,
        "lon": 24.9583814,
        "state": "Station on"
      },
      {
        "stationId": "133",
        "name": "Paavalinpuisto",
        "bikesAvailable": 0,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.1974886,
        "lon": 24.9614385,
        "state": "Station off"
      },
      {
        "stationId": "254",
        "name": "Agnetankuja",
        "bikesAvailable": 17,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.187234122757424,
        "lon": 25.036412289626025,
        "state": "Station on"
      },
      {
        "stationId": "013",
        "name": "Merisotilaantori",
        "bikesAvailable": 21,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.1678703,
        "lon": 24.9755341,
        "state": "Station on"
      },
      {
        "stationId": "134",
        "name": "Haukilahdenkatu",
        "bikesAvailable": 13,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.1985314,
        "lon": 24.9676708,
        "state": "Station on"
      },
      {
        "stationId": "255",
        "name": "Laivalahden puistotie",
        "bikesAvailable": 22,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.18795810306132,
        "lon": 25.031385306773423,
        "state": "Station on"
      },
      {
        "stationId": "014",
        "name": "Senaatintori",
        "bikesAvailable": 3,
        "spacesAvailable": 18,
        "realtime": true,
        "lat": 60.1691278,
        "lon": 24.9526414,
        "state": "Station on"
      },
      {
        "stationId": "135",
        "name": "Velodrominrinne",
        "bikesAvailable": 1,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.2010614,
        "lon": 24.9440506,
        "state": "Station on"
      },
      {
        "stationId": "256",
        "name": "Herttoniemen ranta",
        "bikesAvailable": 5,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.190210145879014,
        "lon": 25.026065710136564,
        "state": "Station on"
      },
      {
        "stationId": "015",
        "name": "Ritarikatu",
        "bikesAvailable": 3,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.17110664588,
        "lon": 24.95555819284,
        "state": "Station on"
      },
      {
        "stationId": "136",
        "name": "Sofianlehdonkatu",
        "bikesAvailable": 4,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.2032721,
        "lon": 24.9513636,
        "state": "Station on"
      },
      {
        "stationId": "257",
        "name": "Margareetankuja",
        "bikesAvailable": 2,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.19100958139025,
        "lon": 25.037070035460086,
        "state": "Station on"
      },
      {
        "stationId": "016",
        "name": "Liisanpuistikko",
        "bikesAvailable": 24,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.1741822,
        "lon": 24.9613747,
        "state": "Station on"
      },
      {
        "stationId": "137",
        "name": "Arabian kauppakeskus",
        "bikesAvailable": 40,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.2027912,
        "lon": 24.9666128,
        "state": "Station on"
      },
      {
        "stationId": "258",
        "name": "Abraham Wetterin tie",
        "bikesAvailable": 1,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.19270789626325,
        "lon": 25.042580274921047,
        "state": "Station on"
      },
      {
        "stationId": "017",
        "name": "Varsapuistikko",
        "bikesAvailable": 2,
        "spacesAvailable": 28,
        "realtime": true,
        "lat": 60.1731029,
        "lon": 24.9494791,
        "state": "Station on"
      },
      {
        "stationId": "138",
        "name": "Arabiankatu",
        "bikesAvailable": 25,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.20649156514502,
        "lon": 24.977079011778606,
        "state": "Station on"
      },
      {
        "stationId": "259",
        "name": "Petter Wetterin tie",
        "bikesAvailable": 2,
        "spacesAvailable": 18,
        "realtime": true,
        "lat": 60.19313762536413,
        "lon": 25.031111942585127,
        "state": "Station on"
      },
      {
        "stationId": "018",
        "name": "Porthania",
        "bikesAvailable": 3,
        "spacesAvailable": 18,
        "realtime": true,
        "lat": 60.16986222858,
        "lon": 24.9481463998,
        "state": "Station on"
      },
      {
        "stationId": "139",
        "name": "Kaironkatu",
        "bikesAvailable": 6,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.21003424069,
        "lon": 24.97656317933,
        "state": "Station on"
      },
      {
        "stationId": "019",
        "name": "Rautatientori / itä",
        "bikesAvailable": 7,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.1708236,
        "lon": 24.9425268,
        "state": "Station on"
      },
      {
        "stationId": "260",
        "name": "Herttoniemen metroasema",
        "bikesAvailable": 6,
        "spacesAvailable": 18,
        "realtime": true,
        "lat": 60.194614624348006,
        "lon": 25.02887208274608,
        "state": "Station on"
      },
      {
        "stationId": "140",
        "name": "Verkatehtaanpuisto",
        "bikesAvailable": 5,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.2137007,
        "lon": 24.9797283,
        "state": "Station on"
      },
      {
        "stationId": "261",
        "name": "Asentajanpuisto",
        "bikesAvailable": 2,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.19912713758262,
        "lon": 25.042592465753465,
        "state": "Station on"
      },
      {
        "stationId": "020",
        "name": "Kaisaniemenpuisto",
        "bikesAvailable": 1,
        "spacesAvailable": 21,
        "realtime": true,
        "lat": 60.17319894172505,
        "lon": 24.943301000681707,
        "state": "Station on"
      },
      {
        "stationId": "141",
        "name": "Intiankatu",
        "bikesAvailable": 0,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.2078582,
        "lon": 24.9676383,
        "state": "Station on"
      },
      {
        "stationId": "262",
        "name": "Siilitien metroasema",
        "bikesAvailable": 2,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.20596244959136,
        "lon": 25.04516115672629,
        "state": "Station on"
      },
      {
        "stationId": "021",
        "name": "Töölönlahdenkatu",
        "bikesAvailable": 6,
        "spacesAvailable": 43,
        "realtime": true,
        "lat": 60.1729435,
        "lon": 24.939284,
        "state": "Station on"
      },
      {
        "stationId": "142",
        "name": "Koskelantie",
        "bikesAvailable": 12,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.208749,
        "lon": 24.9465139,
        "state": "Station on"
      },
      {
        "stationId": "263",
        "name": "Herttoniemen kirkko",
        "bikesAvailable": 2,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.19844295116548,
        "lon": 25.032112127941765,
        "state": "Station on"
      },
      {
        "stationId": "022",
        "name": "Rautatientori / länsi",
        "bikesAvailable": 8,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.1706061,
        "lon": 24.9397601,
        "state": "Station on"
      },
      {
        "stationId": "143",
        "name": "Kuikkarinne",
        "bikesAvailable": 21,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.15708560052,
        "lon": 24.86930605276,
        "state": "Station on"
      },
      {
        "stationId": "264",
        "name": "Eränkävijäntori",
        "bikesAvailable": 2,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.204561663649095,
        "lon": 25.033597412211737,
        "state": "Station on"
      },
      {
        "stationId": "023",
        "name": "Kiasma",
        "bikesAvailable": 4,
        "spacesAvailable": 26,
        "realtime": true,
        "lat": 60.1712579,
        "lon": 24.9374279,
        "state": "Station on"
      },
      {
        "stationId": "144",
        "name": "Käpyläntie",
        "bikesAvailable": 7,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.2139043,
        "lon": 24.9588108,
        "state": "Station on"
      },
      {
        "stationId": "265",
        "name": "Siilitie 9",
        "bikesAvailable": 10,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.20947670530612,
        "lon": 25.037482215660486,
        "state": "Station on"
      },
      {
        "stationId": "024",
        "name": "Mannerheimintie",
        "bikesAvailable": 0,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.1690724,
        "lon": 24.9394195,
        "state": "Station on"
      },
      {
        "stationId": "145",
        "name": "Pohjolankatu",
        "bikesAvailable": 1,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.213421,
        "lon": 24.9437964,
        "state": "Station on"
      },
      {
        "stationId": "266",
        "name": "Siilitie 13",
        "bikesAvailable": 5,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.215063371665806,
        "lon": 25.04379377901174,
        "state": "Station on"
      },
      {
        "stationId": "025",
        "name": "Narinkka",
        "bikesAvailable": 5,
        "spacesAvailable": 34,
        "realtime": true,
        "lat": 60.1700844,
        "lon": 24.9351212,
        "state": "Station on"
      },
      {
        "stationId": "146",
        "name": "Pohjolanaukio",
        "bikesAvailable": 13,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.2172043,
        "lon": 24.9544112,
        "state": "Station on"
      },
      {
        "stationId": "267",
        "name": "Roihupelto",
        "bikesAvailable": 0,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.20923460018434,
        "lon": 25.05617408732242,
        "state": "Station on"
      },
      {
        "stationId": "026",
        "name": "Kampin metroasema",
        "bikesAvailable": 8,
        "spacesAvailable": 25,
        "realtime": true,
        "lat": 60.1686095,
        "lon": 24.9305373,
        "state": "Station on"
      },
      {
        "stationId": "147",
        "name": "Käpylän asema",
        "bikesAvailable": 3,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.2208057097763,
        "lon": 24.9479290250383,
        "state": "Station on"
      },
      {
        "stationId": "268",
        "name": "Porolahden koulu",
        "bikesAvailable": 17,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.19553971683871,
        "lon": 25.053580944057305,
        "state": "Station on"
      },
      {
        "stationId": "027",
        "name": "Eerikinkatu",
        "bikesAvailable": 1,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.1673332,
        "lon": 24.9357851,
        "state": "Station on"
      },
      {
        "stationId": "148",
        "name": "Juhana Herttuan tie",
        "bikesAvailable": 7,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.2184427,
        "lon": 24.9664619,
        "state": "Station on"
      },
      {
        "stationId": "269",
        "name": "Peukaloisentie",
        "bikesAvailable": 7,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.1987054995554,
        "lon": 25.05854933123242,
        "state": "Station on"
      },
      {
        "stationId": "028",
        "name": "Lastenlehto",
        "bikesAvailable": 0,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.1658121,
        "lon": 24.927021,
        "state": "Station on"
      },
      {
        "stationId": "149",
        "name": "Toinen linja",
        "bikesAvailable": 1,
        "spacesAvailable": 21,
        "realtime": true,
        "lat": 60.183164,
        "lon": 24.9441949,
        "state": "Station on"
      },
      {
        "stationId": "029",
        "name": "Baana",
        "bikesAvailable": 1,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.164088,
        "lon": 24.9225658,
        "state": "Station on"
      },
      {
        "stationId": "701",
        "name": "Gallen-Kallelan tie",
        "bikesAvailable": 0,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.206142,
        "lon": 24.840699,
        "state": "Station on"
      },
      {
        "stationId": "703",
        "name": "Elfvik",
        "bikesAvailable": 10,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.203852,
        "lon": 24.8231,
        "state": "Station on"
      },
      {
        "stationId": "705",
        "name": "Laajalahden keskus",
        "bikesAvailable": 6,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.203892,
        "lon": 24.80493,
        "state": "Station on"
      },
      {
        "stationId": "707",
        "name": "Majurinkulma",
        "bikesAvailable": 12,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.210735,
        "lon": 24.824954,
        "state": "Station on"
      },
      {
        "stationId": "709",
        "name": "Yhdyskunnankuja",
        "bikesAvailable": 5,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.212508,
        "lon": 24.819549,
        "state": "Station on"
      },
      {
        "stationId": "270",
        "name": "Tulisuontie",
        "bikesAvailable": 5,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.202072986712835,
        "lon": 25.060046596074795,
        "state": "Station on"
      },
      {
        "stationId": "150",
        "name": "Töölönlahden puisto",
        "bikesAvailable": 5,
        "spacesAvailable": 23,
        "realtime": true,
        "lat": 60.1766793,
        "lon": 24.9338701,
        "state": "Station on"
      },
      {
        "stationId": "271",
        "name": "Prinsessantie",
        "bikesAvailable": 1,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.206340232662725,
        "lon": 25.060092333540833,
        "state": "Station on"
      },
      {
        "stationId": "030",
        "name": "Itämerentori",
        "bikesAvailable": 4,
        "spacesAvailable": 36,
        "realtime": true,
        "lat": 60.1635309,
        "lon": 24.9145165,
        "state": "Station on"
      },
      {
        "stationId": "272",
        "name": "Marjaniementie",
        "bikesAvailable": 5,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.20432489166999,
        "lon": 25.07606935994523,
        "state": "Station on"
      },
      {
        "stationId": "031",
        "name": "Marian Sairaala",
        "bikesAvailable": 2,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.1680998,
        "lon": 24.9220763,
        "state": "Station on"
      },
      {
        "stationId": "273",
        "name": "Kauppakartanonkuja",
        "bikesAvailable": 0,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.207097461138005,
        "lon": 25.07915481461614,
        "state": "Station on"
      },
      {
        "stationId": "032",
        "name": "Eläinmuseo",
        "bikesAvailable": 0,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.171870055373205,
        "lon": 24.931223405177413,
        "state": "Station on"
      },
      {
        "stationId": "274",
        "name": "Voikukantie",
        "bikesAvailable": 3,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.20899759942336,
        "lon": 25.086782105520793,
        "state": "Station on"
      },
      {
        "stationId": "033",
        "name": "Kauppakorkeakoulu",
        "bikesAvailable": 1,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.1711591,
        "lon": 24.924961,
        "state": "Station on"
      },
      {
        "stationId": "275",
        "name": "Itäkeskuksen metroasema",
        "bikesAvailable": 0,
        "spacesAvailable": 28,
        "realtime": true,
        "lat": 60.20960066552812,
        "lon": 25.07596801515546,
        "state": "Station on"
      },
      {
        "stationId": "034",
        "name": "Kansallismuseo",
        "bikesAvailable": 5,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.1739641,
        "lon": 24.9329875,
        "state": "Station on"
      },
      {
        "stationId": "276",
        "name": "Puotinharju",
        "bikesAvailable": 0,
        "spacesAvailable": 24,
        "realtime": true,
        "lat": 60.21249416558419,
        "lon": 25.08232209439382,
        "state": "Station on"
      },
      {
        "stationId": "035",
        "name": "Cygnauksenkatu",
        "bikesAvailable": 5,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.174063715,
        "lon": 24.92822758053,
        "state": "Station on"
      },
      {
        "stationId": "277",
        "name": "Marjaniemi",
        "bikesAvailable": 8,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.20360955659899,
        "lon": 25.086296156701028,
        "state": "Station on"
      },
      {
        "stationId": "036",
        "name": "Apollonkatu",
        "bikesAvailable": 8,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.1760798,
        "lon": 24.9223942,
        "state": "Station on"
      },
      {
        "stationId": "278",
        "name": "Puotilantie",
        "bikesAvailable": 7,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.209059633662385,
        "lon": 25.100426060233303,
        "state": "Station on"
      },
      {
        "stationId": "037",
        "name": "Töölönkatu",
        "bikesAvailable": 11,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.1775598,
        "lon": 24.9283272,
        "state": "Station on"
      },
      {
        "stationId": "279",
        "name": "Puotinkylän kartano",
        "bikesAvailable": 6,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.21250990784526,
        "lon": 25.10619874297898,
        "state": "Station on"
      },
      {
        "stationId": "038",
        "name": "Töölöntori",
        "bikesAvailable": 12,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.1791231,
        "lon": 24.9249114,
        "state": "Station on"
      },
      {
        "stationId": "039",
        "name": "Ooppera",
        "bikesAvailable": 24,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.1825529,
        "lon": 24.926687,
        "state": "Station on"
      },
      {
        "stationId": "711",
        "name": "Kirjurinkuja",
        "bikesAvailable": 33,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.215751,
        "lon": 24.826368,
        "state": "Station on"
      },
      {
        "stationId": "713",
        "name": "Upseerinkatu",
        "bikesAvailable": 2,
        "spacesAvailable": 28,
        "realtime": true,
        "lat": 60.216067,
        "lon": 24.819396,
        "state": "Station on"
      },
      {
        "stationId": "715",
        "name": "Komentajankatu",
        "bikesAvailable": 11,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.216222,
        "lon": 24.821932,
        "state": "Station on"
      },
      {
        "stationId": "719",
        "name": "Säteri",
        "bikesAvailable": 7,
        "spacesAvailable": 24,
        "realtime": true,
        "lat": 60.213443,
        "lon": 24.811572,
        "state": "Station on"
      },
      {
        "stationId": "280",
        "name": "Puotilan ostoskeskus",
        "bikesAvailable": 2,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.21270057142605,
        "lon": 25.095559512793297,
        "state": "Station on"
      },
      {
        "stationId": "281",
        "name": "Puotilan metroasema",
        "bikesAvailable": 1,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.21482071331432,
        "lon": 25.09112452769074,
        "state": "Station on"
      },
      {
        "stationId": "040",
        "name": "Hakaniemen metroasema",
        "bikesAvailable": 5,
        "spacesAvailable": 24,
        "realtime": true,
        "lat": 60.17810631604,
        "lon": 24.95218124892,
        "state": "Station on"
      },
      {
        "stationId": "161",
        "name": "Eteläesplanadi",
        "bikesAvailable": 3,
        "spacesAvailable": 31,
        "realtime": true,
        "lat": 60.16723083051,
        "lon": 24.94746581951,
        "state": "Station on"
      },
      {
        "stationId": "282",
        "name": "Karhulantie",
        "bikesAvailable": 5,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.218601478441435,
        "lon": 25.10232484990167,
        "state": "Station on"
      },
      {
        "stationId": "041",
        "name": "Ympyrätalo",
        "bikesAvailable": 8,
        "spacesAvailable": 21,
        "realtime": true,
        "lat": 60.180863,
        "lon": 24.9494,
        "state": "Station on"
      },
      {
        "stationId": "162",
        "name": "Leppäsuonaukio",
        "bikesAvailable": 0,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.16957343209,
        "lon": 24.92659049777,
        "state": "Station off"
      },
      {
        "stationId": "283",
        "name": "Alakiventie",
        "bikesAvailable": 5,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.21985096601641,
        "lon": 25.077470244052627,
        "state": "Station on"
      },
      {
        "stationId": "042",
        "name": "Haapaniemenkatu",
        "bikesAvailable": 3,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.18310658307554,
        "lon": 24.95518082169317,
        "state": "Station on"
      },
      {
        "stationId": "163",
        "name": "Lehtisaarentie",
        "bikesAvailable": 25,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.18147257752,
        "lon": 24.85053677106,
        "state": "Station on"
      },
      {
        "stationId": "284",
        "name": "Myllypuron metroasema",
        "bikesAvailable": 1,
        "spacesAvailable": 27,
        "realtime": true,
        "lat": 60.22408646778726,
        "lon": 25.075395792228694,
        "state": "Station on"
      },
      {
        "stationId": "043",
        "name": "Karhupuisto",
        "bikesAvailable": 3,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.1842833,
        "lon": 24.9526763,
        "state": "Station on"
      },
      {
        "stationId": "285",
        "name": "Orpaanporras",
        "bikesAvailable": 0,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.22356519670723,
        "lon": 25.0654218381558,
        "state": "Station on"
      },
      {
        "stationId": "044",
        "name": "Sörnäisten metroasema",
        "bikesAvailable": 2,
        "spacesAvailable": 18,
        "realtime": true,
        "lat": 60.188038054266826,
        "lon": 24.96089210621247,
        "state": "Station on"
      },
      {
        "stationId": "286",
        "name": "Mamsellimyllynkatu",
        "bikesAvailable": 2,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.21825196984328,
        "lon": 25.05910387617357,
        "state": "Station on"
      },
      {
        "stationId": "045",
        "name": "Brahen kenttä",
        "bikesAvailable": 1,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.1868618,
        "lon": 24.9509168,
        "state": "Station on"
      },
      {
        "stationId": "046",
        "name": "Diakoniapuisto",
        "bikesAvailable": 2,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.1862877,
        "lon": 24.9418576,
        "state": "Station on"
      },
      {
        "stationId": "047",
        "name": "Vanha Kauppahalli",
        "bikesAvailable": 52,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.16673071893,
        "lon": 24.95350466638,
        "state": "Station on"
      },
      {
        "stationId": "048",
        "name": "Mastokatu",
        "bikesAvailable": 32,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.1647545,
        "lon": 24.9674861,
        "state": "Station on"
      },
      {
        "stationId": "049",
        "name": "Annankatu",
        "bikesAvailable": 0,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.16345894291,
        "lon": 24.94177084206,
        "state": "Station on"
      },
      {
        "stationId": "721",
        "name": "Säterinrinne",
        "bikesAvailable": 3,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.214193,
        "lon": 24.805613,
        "state": "Station on"
      },
      {
        "stationId": "601",
        "name": "Nokkala",
        "bikesAvailable": 23,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.147974,
        "lon": 24.754344,
        "state": "Station on"
      },
      {
        "stationId": "723",
        "name": "Säterinniitty",
        "bikesAvailable": 3,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.214666,
        "lon": 24.800486,
        "state": "Station on"
      },
      {
        "stationId": "603",
        "name": "Matinlahdenranta",
        "bikesAvailable": 25,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.151041,
        "lon": 24.754196,
        "state": "Station on"
      },
      {
        "stationId": "725",
        "name": "Rummunlyöjänkatu",
        "bikesAvailable": 12,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.217261,
        "lon": 24.806279,
        "state": "Station on"
      },
      {
        "stationId": "727",
        "name": "Ratsutori",
        "bikesAvailable": 4,
        "spacesAvailable": 29,
        "realtime": true,
        "lat": 60.217311,
        "lon": 24.812419,
        "state": "Station on"
      },
      {
        "stationId": "607",
        "name": "Nuottaniementie",
        "bikesAvailable": 18,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.147921,
        "lon": 24.741546,
        "state": "Station on"
      },
      {
        "stationId": "729",
        "name": "Leppävaaranaukio",
        "bikesAvailable": 1,
        "spacesAvailable": 29,
        "realtime": true,
        "lat": 60.218869,
        "lon": 24.813885,
        "state": "Station on"
      },
      {
        "stationId": "609",
        "name": "Sepetlahdentie",
        "bikesAvailable": 12,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.152343,
        "lon": 24.741234,
        "state": "Station on"
      },
      {
        "stationId": "050",
        "name": "Melkonkuja",
        "bikesAvailable": 14,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.1498127,
        "lon": 24.8861094,
        "state": "Station on"
      },
      {
        "stationId": "051",
        "name": "Itälahdenkatu",
        "bikesAvailable": 13,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.15066,
        "lon": 24.8812502,
        "state": "Station on"
      },
      {
        "stationId": "052",
        "name": "Heikkilänaukio",
        "bikesAvailable": 40,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.1540763,
        "lon": 24.8793159,
        "state": "Station on"
      },
      {
        "stationId": "053",
        "name": "Heikkiläntie",
        "bikesAvailable": 14,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.156817,
        "lon": 24.8850653,
        "state": "Station on"
      },
      {
        "stationId": "054",
        "name": "Gyldenintie",
        "bikesAvailable": 5,
        "spacesAvailable": 31,
        "realtime": true,
        "lat": 60.1583842,
        "lon": 24.8766658,
        "state": "Station on"
      },
      {
        "stationId": "055",
        "name": "Puistokaari",
        "bikesAvailable": 11,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.16169596138,
        "lon": 24.85986626853,
        "state": "Station on"
      },
      {
        "stationId": "056",
        "name": "Luoteisväylä",
        "bikesAvailable": 21,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.1654485,
        "lon": 24.8601992,
        "state": "Station on"
      },
      {
        "stationId": "057",
        "name": "Lauttasaaren ostoskeskus",
        "bikesAvailable": 30,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.1603306,
        "lon": 24.8815441,
        "state": "Station on"
      },
      {
        "stationId": "058",
        "name": "Lauttasaarensilta",
        "bikesAvailable": 17,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.1615512,
        "lon": 24.8926386,
        "state": "Station on"
      },
      {
        "stationId": "059",
        "name": "Salmisaarenranta",
        "bikesAvailable": 4,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.16478138043,
        "lon": 24.90096080349,
        "state": "Station on"
      },
      {
        "stationId": "731",
        "name": "Leppävaarankäytävä",
        "bikesAvailable": 11,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.220254,
        "lon": 24.813437,
        "state": "Station on"
      },
      {
        "stationId": "611",
        "name": "Matinkartanontie",
        "bikesAvailable": 13,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.156258,
        "lon": 24.752489,
        "state": "Station on"
      },
      {
        "stationId": "733",
        "name": "Läkkitori",
        "bikesAvailable": 11,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.221019,
        "lon": 24.813109,
        "state": "Station on"
      },
      {
        "stationId": "613",
        "name": "Matinkyläntie",
        "bikesAvailable": 12,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.155689,
        "lon": 24.744978,
        "state": "Station on"
      },
      {
        "stationId": "735",
        "name": "Armas Launiksen katu",
        "bikesAvailable": 6,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.221781,
        "lon": 24.818128,
        "state": "Station on"
      },
      {
        "stationId": "615",
        "name": "Tiistiläntie",
        "bikesAvailable": 11,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.156755,
        "lon": 24.737664,
        "state": "Station on"
      },
      {
        "stationId": "737",
        "name": "Muurarinkuja",
        "bikesAvailable": 3,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.223769,
        "lon": 24.812271,
        "state": "Station on"
      },
      {
        "stationId": "617",
        "name": "Tiistinkallio",
        "bikesAvailable": 21,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.153737,
        "lon": 24.729112,
        "state": "Station on"
      },
      {
        "stationId": "739",
        "name": "Postipuun koulu",
        "bikesAvailable": 4,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.223827,
        "lon": 24.826396,
        "state": "Station on"
      },
      {
        "stationId": "619",
        "name": "Etuniementie",
        "bikesAvailable": 3,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.160645,
        "lon": 24.724835,
        "state": "Station on"
      },
      {
        "stationId": "060",
        "name": "Porkkalankatu",
        "bikesAvailable": 6,
        "spacesAvailable": 32,
        "realtime": true,
        "lat": 60.1632493,
        "lon": 24.905336,
        "state": "Station on"
      },
      {
        "stationId": "061",
        "name": "Länsisatamankatu",
        "bikesAvailable": 16,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.1589276,
        "lon": 24.909692,
        "state": "Station on"
      },
      {
        "stationId": "062",
        "name": "Messitytönkatu",
        "bikesAvailable": 22,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.1610901,
        "lon": 24.9158734,
        "state": "Station on"
      },
      {
        "stationId": "063",
        "name": "Jätkäsaarenlaituri",
        "bikesAvailable": 12,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.1619311,
        "lon": 24.9214896,
        "state": "Station on"
      },
      {
        "stationId": "064",
        "name": "Tyynenmerenkatu",
        "bikesAvailable": 17,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.1565255,
        "lon": 24.9217464,
        "state": "Station on"
      },
      {
        "stationId": "065",
        "name": "Hylkeenpyytäjänkatu",
        "bikesAvailable": 53,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.15352968178976,
        "lon": 24.93125406706023,
        "state": "Station on"
      },
      {
        "stationId": "066",
        "name": "Ehrenströmintie",
        "bikesAvailable": 15,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.155309,
        "lon": 24.9591271,
        "state": "Station on"
      },
      {
        "stationId": "067",
        "name": "Perämiehenkatu",
        "bikesAvailable": 15,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.15997725117,
        "lon": 24.93383428634,
        "state": "Station on"
      },
      {
        "stationId": "068",
        "name": "Albertinkatu",
        "bikesAvailable": 1,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.1618359,
        "lon": 24.9368179,
        "state": "Station on"
      },
      {
        "stationId": "069",
        "name": "Kalevankatu",
        "bikesAvailable": 1,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.1656962,
        "lon": 24.9314323,
        "state": "Station on"
      },
      {
        "stationId": "741",
        "name": "Gransinmäki",
        "bikesAvailable": 1,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.222154,
        "lon": 24.804898,
        "state": "Station on"
      },
      {
        "stationId": "621",
        "name": "Hauenkalliontie",
        "bikesAvailable": 18,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.161138,
        "lon": 24.756272,
        "state": "Station on"
      },
      {
        "stationId": "501",
        "name": "Hanasaari",
        "bikesAvailable": 2,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.16582,
        "lon": 24.840319,
        "state": "Station on"
      },
      {
        "stationId": "623",
        "name": "Nelikkotie",
        "bikesAvailable": 2,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.161588,
        "lon": 24.74663,
        "state": "Station on"
      },
      {
        "stationId": "503",
        "name": "Keilalahti",
        "bikesAvailable": 0,
        "spacesAvailable": 28,
        "realtime": true,
        "lat": 60.171524,
        "lon": 24.827467,
        "state": "Station on"
      },
      {
        "stationId": "745",
        "name": "Leppävaaran urheilupuisto",
        "bikesAvailable": 13,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.224943,
        "lon": 24.800971,
        "state": "Station on"
      },
      {
        "stationId": "625",
        "name": "Suomenlahdentie",
        "bikesAvailable": 29,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.160015,
        "lon": 24.741294,
        "state": "Station on"
      },
      {
        "stationId": "505",
        "name": "Westendinasema",
        "bikesAvailable": 2,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.168266,
        "lon": 24.805758,
        "state": "Station on"
      },
      {
        "stationId": "747",
        "name": "Leppävaaran uimahalli",
        "bikesAvailable": 9,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.226379,
        "lon": 24.804735,
        "state": "Station on"
      },
      {
        "stationId": "627",
        "name": "Piispansilta",
        "bikesAvailable": 6,
        "spacesAvailable": 34,
        "realtime": true,
        "lat": 60.162403,
        "lon": 24.738416,
        "state": "Station on"
      },
      {
        "stationId": "507",
        "name": "Golfpolku",
        "bikesAvailable": 4,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.168143,
        "lon": 24.796136,
        "state": "Station on"
      },
      {
        "stationId": "749",
        "name": "Vallikatu",
        "bikesAvailable": 7,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.228463,
        "lon": 24.813871,
        "state": "Station on"
      },
      {
        "stationId": "629",
        "name": "Piispanportti",
        "bikesAvailable": 22,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.165603,
        "lon": 24.732688,
        "state": "Station on"
      },
      {
        "stationId": "509",
        "name": "Revontulentie",
        "bikesAvailable": 6,
        "spacesAvailable": 24,
        "realtime": true,
        "lat": 60.171551,
        "lon": 24.802938,
        "state": "Station on"
      },
      {
        "stationId": "070",
        "name": "Sammonpuistikko",
        "bikesAvailable": 4,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.1731473,
        "lon": 24.9224112,
        "state": "Station on"
      },
      {
        "stationId": "071",
        "name": "Hietaniemenkatu",
        "bikesAvailable": 5,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.17261154618,
        "lon": 24.91127964812,
        "state": "Station on"
      },
      {
        "stationId": "072",
        "name": "Eteläinen Hesperiankatu",
        "bikesAvailable": 38,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.17558787407832,
        "lon": 24.915662751685453,
        "state": "Station on"
      },
      {
        "stationId": "073",
        "name": "Kesäkatu",
        "bikesAvailable": 13,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.1792967,
        "lon": 24.9132504,
        "state": "Station on"
      },
      {
        "stationId": "074",
        "name": "Rajasaarentie",
        "bikesAvailable": 5,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.183137,
        "lon": 24.911127,
        "state": "Station on"
      },
      {
        "stationId": "075",
        "name": "Korjaamo",
        "bikesAvailable": 17,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.1838677,
        "lon": 24.9198371,
        "state": "Station on"
      },
      {
        "stationId": "076",
        "name": "Olympiastadion",
        "bikesAvailable": 28,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.1845055,
        "lon": 24.9249741,
        "state": "Station on"
      },
      {
        "stationId": "077",
        "name": "Nordenskiöldinaukio",
        "bikesAvailable": 18,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.18523632967096,
        "lon": 24.91724984112588,
        "state": "Station on"
      },
      {
        "stationId": "078",
        "name": "Messeniuksenkatu",
        "bikesAvailable": 22,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.1878352,
        "lon": 24.9180102,
        "state": "Station on"
      },
      {
        "stationId": "079",
        "name": "Uimastadion",
        "bikesAvailable": 2,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.1892172,
        "lon": 24.9292286,
        "state": "Station on"
      },
      {
        "stationId": "751",
        "name": "Vallipolku",
        "bikesAvailable": 3,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.227827,
        "lon": 24.819614,
        "state": "Station on"
      },
      {
        "stationId": "631",
        "name": "Friisilänaukio",
        "bikesAvailable": 15,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.162842,
        "lon": 24.721367,
        "state": "Station on"
      },
      {
        "stationId": "511",
        "name": "Sateentie",
        "bikesAvailable": 5,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.173424,
        "lon": 24.810688,
        "state": "Station on"
      },
      {
        "stationId": "753",
        "name": "Linnuntie",
        "bikesAvailable": 10,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.234401,
        "lon": 24.813954,
        "state": "Station on"
      },
      {
        "stationId": "633",
        "name": "Avaruuskatu",
        "bikesAvailable": 9,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.168971,
        "lon": 24.724908,
        "state": "Station on"
      },
      {
        "stationId": "513",
        "name": "Hakalehto",
        "bikesAvailable": 10,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.173567,
        "lon": 24.79139,
        "state": "Station on"
      },
      {
        "stationId": "755",
        "name": "Kutsuntatie",
        "bikesAvailable": 6,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.230453,
        "lon": 24.824561,
        "state": "Station on"
      },
      {
        "stationId": "635",
        "name": "Kuunkatu",
        "bikesAvailable": 7,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.172673,
        "lon": 24.726025,
        "state": "Station on"
      },
      {
        "stationId": "515",
        "name": "Oravannahkatori",
        "bikesAvailable": 2,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.175769,
        "lon": 24.792559,
        "state": "Station on"
      },
      {
        "stationId": "757",
        "name": "Painiitty",
        "bikesAvailable": 16,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.235089,
        "lon": 24.831397,
        "state": "Station on"
      },
      {
        "stationId": "637",
        "name": "Ruomelantie",
        "bikesAvailable": 4,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.174524,
        "lon": 24.729314,
        "state": "Station on"
      },
      {
        "stationId": "517",
        "name": "Länsituuli",
        "bikesAvailable": 3,
        "spacesAvailable": 21,
        "realtime": true,
        "lat": 60.175358,
        "lon": 24.802049,
        "state": "Station on"
      },
      {
        "stationId": "518",
        "name": "Tuulimäki",
        "bikesAvailable": 1,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.174144,
        "lon": 24.806051,
        "state": "Station on"
      },
      {
        "stationId": "639",
        "name": "Itäportti",
        "bikesAvailable": 3,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.174914,
        "lon": 24.738122,
        "state": "Station on"
      },
      {
        "stationId": "519",
        "name": "Tapionaukio",
        "bikesAvailable": 6,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.176168,
        "lon": 24.805825,
        "state": "Station on"
      },
      {
        "stationId": "080",
        "name": "Jäähalli",
        "bikesAvailable": 6,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.1894025,
        "lon": 24.9205978,
        "state": "Station on"
      },
      {
        "stationId": "081",
        "name": "Stenbäckinkatu",
        "bikesAvailable": 4,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.1883091,
        "lon": 24.9123717,
        "state": "Station on"
      },
      {
        "stationId": "082",
        "name": "Töölöntulli",
        "bikesAvailable": 4,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.19095693226663,
        "lon": 24.912827135427882,
        "state": "Station on"
      },
      {
        "stationId": "083",
        "name": "Meilahden sairaala",
        "bikesAvailable": 7,
        "spacesAvailable": 21,
        "realtime": true,
        "lat": 60.1902195,
        "lon": 24.9083351,
        "state": "Station on"
      },
      {
        "stationId": "084",
        "name": "Paciuksenkatu",
        "bikesAvailable": 4,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.19120215596817,
        "lon": 24.899910050364525,
        "state": "Station on"
      },
      {
        "stationId": "085",
        "name": "Jalavatie",
        "bikesAvailable": 10,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.1934696,
        "lon": 24.905889,
        "state": "Station on"
      },
      {
        "stationId": "086",
        "name": "Kuusitie",
        "bikesAvailable": 13,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.1952452,
        "lon": 24.9018997,
        "state": "Station on"
      },
      {
        "stationId": "087",
        "name": "Kustaankatu",
        "bikesAvailable": 0,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.1882752174,
        "lon": 24.95597593163,
        "state": "Station on"
      },
      {
        "stationId": "088",
        "name": "Kiskontie",
        "bikesAvailable": 12,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.1989402,
        "lon": 24.9012997,
        "state": "Station on"
      },
      {
        "stationId": "089",
        "name": "Tilkanvierto",
        "bikesAvailable": 29,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.1975329,
        "lon": 24.899261,
        "state": "Station on"
      },
      {
        "stationId": "761",
        "name": "Mäkkylän asema",
        "bikesAvailable": 4,
        "spacesAvailable": 28,
        "realtime": true,
        "lat": 60.220467,
        "lon": 24.83939,
        "state": "Station on"
      },
      {
        "stationId": "641",
        "name": "Komeetankatu",
        "bikesAvailable": 1,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.167216,
        "lon": 24.735969,
        "state": "Station on"
      },
      {
        "stationId": "521",
        "name": "Kulttuuriaukio",
        "bikesAvailable": 11,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.177588,
        "lon": 24.803942,
        "state": "Station on"
      },
      {
        "stationId": "763",
        "name": "Kalkkipellonmäki",
        "bikesAvailable": 3,
        "spacesAvailable": 21,
        "realtime": true,
        "lat": 60.220551,
        "lon": 24.833536,
        "state": "Station on"
      },
      {
        "stationId": "643",
        "name": "Auringonkatu",
        "bikesAvailable": 2,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.171548,
        "lon": 24.731472,
        "state": "Station on"
      },
      {
        "stationId": "523",
        "name": "Ahertajantie",
        "bikesAvailable": 0,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.17875,
        "lon": 24.797984,
        "state": "Station on"
      },
      {
        "stationId": "645",
        "name": "Piispankallio",
        "bikesAvailable": 6,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.168441,
        "lon": 24.743532,
        "state": "Station on"
      },
      {
        "stationId": "525",
        "name": "Mäntyviita",
        "bikesAvailable": 8,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.178702,
        "lon": 24.810974,
        "state": "Station on"
      },
      {
        "stationId": "767",
        "name": "Ruutikatu",
        "bikesAvailable": 4,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.223377,
        "lon": 24.820635,
        "state": "Station on"
      },
      {
        "stationId": "647",
        "name": "Lystimäki",
        "bikesAvailable": 9,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.172814,
        "lon": 24.745666,
        "state": "Station on"
      },
      {
        "stationId": "527",
        "name": "Otsolahti",
        "bikesAvailable": 22,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.178655,
        "lon": 24.817423,
        "state": "Station on"
      },
      {
        "stationId": "769",
        "name": "Tiurintie",
        "bikesAvailable": 1,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.204582,
        "lon": 24.814794,
        "state": "Station on"
      },
      {
        "stationId": "649",
        "name": "Lystimäensilta",
        "bikesAvailable": 3,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.17471,
        "lon": 24.752442,
        "state": "Station on"
      },
      {
        "stationId": "529",
        "name": "Keilaniemi (M)",
        "bikesAvailable": 4,
        "spacesAvailable": 36,
        "realtime": true,
        "lat": 60.175233,
        "lon": 24.82895,
        "state": "Station on"
      },
      {
        "stationId": "090",
        "name": "Paciuksenkaari",
        "bikesAvailable": 8,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.1944475,
        "lon": 24.8911179,
        "state": "Station on"
      },
      {
        "stationId": "091",
        "name": "Seurasaari",
        "bikesAvailable": 2,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.188399,
        "lon": 24.8847362,
        "state": "Station on"
      },
      {
        "stationId": "092",
        "name": "Saunalahdentie",
        "bikesAvailable": 4,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.1926305828,
        "lon": 24.87922144235,
        "state": "Station on"
      },
      {
        "stationId": "093",
        "name": "Torpanranta",
        "bikesAvailable": 26,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.1948358,
        "lon": 24.8713963,
        "state": "Station on"
      },
      {
        "stationId": "094",
        "name": "Laajalahden aukio",
        "bikesAvailable": 6,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.19793090756802,
        "lon": 24.876221716500662,
        "state": "Station on"
      },
      {
        "stationId": "095",
        "name": "Munkkiniemen aukio",
        "bikesAvailable": 6,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.1967196,
        "lon": 24.8840917,
        "state": "Station on"
      },
      {
        "stationId": "096",
        "name": "Huopalahdentie",
        "bikesAvailable": 8,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.1996653,
        "lon": 24.8836209,
        "state": "Station on"
      },
      {
        "stationId": "098",
        "name": "Ulvilantie",
        "bikesAvailable": 5,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.2038803,
        "lon": 24.8708833,
        "state": "Station on"
      },
      {
        "stationId": "099",
        "name": "Muusantori",
        "bikesAvailable": 11,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.2071193,
        "lon": 24.8559544,
        "state": "Station on"
      },
      {
        "stationId": "651",
        "name": "Suurpellonaukio",
        "bikesAvailable": 21,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.184596,
        "lon": 24.744131,
        "state": "Station on"
      },
      {
        "stationId": "531",
        "name": "Keilaranta",
        "bikesAvailable": 0,
        "spacesAvailable": 24,
        "realtime": true,
        "lat": 60.178762,
        "lon": 24.835132,
        "state": "Station on"
      },
      {
        "stationId": "532",
        "name": "Betonimies",
        "bikesAvailable": 2,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.180027,
        "lon": 24.831804,
        "state": "Station on"
      },
      {
        "stationId": "653",
        "name": "Lukutori",
        "bikesAvailable": 18,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.187052,
        "lon": 24.742571,
        "state": "Station on"
      },
      {
        "stationId": "533",
        "name": "Tekniikantie",
        "bikesAvailable": 9,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.180806,
        "lon": 24.824747,
        "state": "Station on"
      },
      {
        "stationId": "537",
        "name": "Innopoli",
        "bikesAvailable": 7,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.185096,
        "lon": 24.81422,
        "state": "Station on"
      },
      {
        "stationId": "538",
        "name": "Hagalundinpuisto",
        "bikesAvailable": 3,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.18363,
        "lon": 24.817403,
        "state": "Station on"
      },
      {
        "stationId": "539",
        "name": "Aalto-yliopisto (M), Tietotie",
        "bikesAvailable": 1,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.184987,
        "lon": 24.820099,
        "state": "Station on"
      },
      {
        "stationId": "541",
        "name": "Aalto-yliopisto (M), Korkeakouluaukio",
        "bikesAvailable": 5,
        "spacesAvailable": 34,
        "realtime": true,
        "lat": 60.184312,
        "lon": 24.826671,
        "state": "Station on"
      },
      {
        "stationId": "543",
        "name": "Otaranta",
        "bikesAvailable": 11,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.18483,
        "lon": 24.837133,
        "state": "Station on"
      },
      {
        "stationId": "545",
        "name": "Sähkömies",
        "bikesAvailable": 1,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.188499,
        "lon": 24.829985,
        "state": "Station on"
      },
      {
        "stationId": "547",
        "name": "Jämeräntaival",
        "bikesAvailable": 0,
        "spacesAvailable": 30,
        "realtime": true,
        "lat": 60.188118,
        "lon": 24.835033,
        "state": "Station on"
      },
      {
        "stationId": "549",
        "name": "Maarinranta",
        "bikesAvailable": 4,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.187261,
        "lon": 24.810199,
        "state": "Station on"
      },
      {
        "stationId": "551",
        "name": "Tietäjä",
        "bikesAvailable": 3,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.189143,
        "lon": 24.807083,
        "state": "Station on"
      },
      {
        "stationId": "553",
        "name": "Metsänneidonpolku",
        "bikesAvailable": 7,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.186731,
        "lon": 24.806152,
        "state": "Station on"
      },
      {
        "stationId": "555",
        "name": "Kalevalantie",
        "bikesAvailable": 3,
        "spacesAvailable": 18,
        "realtime": true,
        "lat": 60.184765,
        "lon": 24.804022,
        "state": "Station on"
      },
      {
        "stationId": "557",
        "name": "Louhentori",
        "bikesAvailable": 9,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.18715,
        "lon": 24.796959,
        "state": "Station on"
      },
      {
        "stationId": "559",
        "name": "Pohjankulma",
        "bikesAvailable": 14,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.18288,
        "lon": 24.794014,
        "state": "Station on"
      },
      {
        "stationId": "561",
        "name": "Koivu-Mankkaa",
        "bikesAvailable": 4,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.182976,
        "lon": 24.78576,
        "state": "Station on"
      },
      {
        "stationId": "200",
        "name": "Länsiterminaali",
        "bikesAvailable": 24,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.150395628620245,
        "lon": 24.915862667368163,
        "state": "Station on"
      },
      {
        "stationId": "563",
        "name": "Mankkaanlaaksontie",
        "bikesAvailable": 23,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.188706,
        "lon": 24.780478,
        "state": "Station on"
      },
      {
        "stationId": "201",
        "name": "Länsisatamankuja",
        "bikesAvailable": 24,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.15693191359567,
        "lon": 24.912200440174857,
        "state": "Station on"
      },
      {
        "stationId": "202",
        "name": "Merihaka",
        "bikesAvailable": 4,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.17806592826971,
        "lon": 24.958452215046275,
        "state": "Station on"
      },
      {
        "stationId": "565",
        "name": "Mankkaanaukio",
        "bikesAvailable": 8,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.194599,
        "lon": 24.769021,
        "state": "Station on"
      },
      {
        "stationId": "203",
        "name": "Opastinsilta",
        "bikesAvailable": 6,
        "spacesAvailable": 34,
        "realtime": true,
        "lat": 60.199235425819,
        "lon": 24.937826370875783,
        "state": "Station on"
      },
      {
        "stationId": "204",
        "name": "A.I. Virtasen aukio",
        "bikesAvailable": 0,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.205674609517686,
        "lon": 24.962367446681693,
        "state": "Station off"
      },
      {
        "stationId": "205",
        "name": "Ilmalan asema",
        "bikesAvailable": 1,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.206626437691405,
        "lon": 24.922219888430064,
        "state": "Station on"
      },
      {
        "stationId": "206",
        "name": "Ruskeasuon varikko",
        "bikesAvailable": 0,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.20767995961701,
        "lon": 24.898667890628126,
        "state": "Station on"
      },
      {
        "stationId": "207",
        "name": "Vanha Viertotie",
        "bikesAvailable": 1,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.211075296273414,
        "lon": 24.881660254358646,
        "state": "Station on"
      },
      {
        "stationId": "208",
        "name": "Valimotie",
        "bikesAvailable": 5,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.215922235436786,
        "lon": 24.87646479282845,
        "state": "Station on"
      },
      {
        "stationId": "209",
        "name": "Takomotie",
        "bikesAvailable": 14,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.21785454213256,
        "lon": 24.870539572354964,
        "state": "Station on"
      },
      {
        "stationId": "571",
        "name": "Tapiolan urheilupuisto",
        "bikesAvailable": 28,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.177749,
        "lon": 24.784654,
        "state": "Station on"
      },
      {
        "stationId": "210",
        "name": "Pajamäki",
        "bikesAvailable": 5,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.218807358014985,
        "lon": 24.85566795479381,
        "state": "Station on"
      },
      {
        "stationId": "573",
        "name": "Urheilupuisto (M)",
        "bikesAvailable": 7,
        "spacesAvailable": 21,
        "realtime": true,
        "lat": 60.17465,
        "lon": 24.779428,
        "state": "Station on"
      },
      {
        "stationId": "211",
        "name": "Haagan tori",
        "bikesAvailable": 11,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.21227524113252,
        "lon": 24.899551136356806,
        "state": "Station on"
      },
      {
        "stationId": "212",
        "name": "Tunnelitie",
        "bikesAvailable": 11,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.21661653745581,
        "lon": 24.89954369574049,
        "state": "Station on"
      },
      {
        "stationId": "575",
        "name": "Tontunmäentie",
        "bikesAvailable": 10,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.176107,
        "lon": 24.769667,
        "state": "Station on"
      },
      {
        "stationId": "213",
        "name": "Huopalahden asema",
        "bikesAvailable": 6,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.218088561019165,
        "lon": 24.89505934373838,
        "state": "Station on"
      },
      {
        "stationId": "214",
        "name": "Valimon asema",
        "bikesAvailable": 0,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.22229427877046,
        "lon": 24.875870912746144,
        "state": "Station on"
      },
      {
        "stationId": "577",
        "name": "Olarinluoma",
        "bikesAvailable": 23,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.180848,
        "lon": 24.760606,
        "state": "Station on"
      },
      {
        "stationId": "215",
        "name": "Pitäjänmäen asema",
        "bikesAvailable": 6,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.22431428805152,
        "lon": 24.85863812462164,
        "state": "Station on"
      },
      {
        "stationId": "216",
        "name": "Jännetie",
        "bikesAvailable": 8,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.226769960915966,
        "lon": 24.85354095884256,
        "state": "Station on"
      },
      {
        "stationId": "579",
        "name": "Niittymaa",
        "bikesAvailable": 31,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.171127,
        "lon": 24.775913,
        "state": "Station on"
      },
      {
        "stationId": "217",
        "name": "Marttila",
        "bikesAvailable": 2,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.227143233822176,
        "lon": 24.873227365442304,
        "state": "Station on"
      },
      {
        "stationId": "218",
        "name": "Pohjois-Haagan asema",
        "bikesAvailable": 10,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.230151499496536,
        "lon": 24.88312884546424,
        "state": "Station on"
      },
      {
        "stationId": "219",
        "name": "Näyttelijäntie",
        "bikesAvailable": 14,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.23285213757895,
        "lon": 24.887434554817386,
        "state": "Station on"
      },
      {
        "stationId": "581",
        "name": "Niittykumpu (M)",
        "bikesAvailable": 17,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.170758,
        "lon": 24.763184,
        "state": "Station on"
      },
      {
        "stationId": "220",
        "name": "Ida Aalbergin tie",
        "bikesAvailable": 8,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.229408823326075,
        "lon": 24.892011409257975,
        "state": "Station on"
      },
      {
        "stationId": "583",
        "name": "Haukilahdenkatu",
        "bikesAvailable": 4,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.166481,
        "lon": 24.772708,
        "state": "Station on"
      },
      {
        "stationId": "100",
        "name": "Teljäntie",
        "bikesAvailable": 9,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.20969562580255,
        "lon": 24.868739477207995,
        "state": "Station on"
      },
      {
        "stationId": "221",
        "name": "Thalianaukio",
        "bikesAvailable": 4,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.22534052315868,
        "lon": 24.894792651160333,
        "state": "Station on"
      },
      {
        "stationId": "101",
        "name": "Munkkivuoren ostoskeskus",
        "bikesAvailable": 0,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.2059946,
        "lon": 24.8798291,
        "state": "Station off"
      },
      {
        "stationId": "222",
        "name": "Huovitie",
        "bikesAvailable": 6,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.22197553556329,
        "lon": 24.903286646676616,
        "state": "Station on"
      },
      {
        "stationId": "585",
        "name": "Haukilahdenaukio",
        "bikesAvailable": 10,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.162396,
        "lon": 24.775882,
        "state": "Station on"
      },
      {
        "stationId": "223",
        "name": "Hämeenlinnanväylä",
        "bikesAvailable": 5,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.22746939884859,
        "lon": 24.906443561905945,
        "state": "Station on"
      },
      {
        "stationId": "103",
        "name": "Vihdintie",
        "bikesAvailable": 4,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.208925,
        "lon": 24.8895209,
        "state": "Station on"
      },
      {
        "stationId": "224",
        "name": "Vesakkotie",
        "bikesAvailable": 5,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.22794236805671,
        "lon": 24.926564764263762,
        "state": "Station on"
      },
      {
        "stationId": "587",
        "name": "Hauenkallio",
        "bikesAvailable": 2,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.162477,
        "lon": 24.767831,
        "state": "Station on"
      },
      {
        "stationId": "104",
        "name": "Kriikunakuja",
        "bikesAvailable": 3,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.2056785,
        "lon": 24.8916817,
        "state": "Station on"
      },
      {
        "stationId": "225",
        "name": "Maunula",
        "bikesAvailable": 9,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.231319869075655,
        "lon": 24.935048840096293,
        "state": "Station on"
      },
      {
        "stationId": "105",
        "name": "Tilkantori",
        "bikesAvailable": 7,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.2028392,
        "lon": 24.8934761,
        "state": "Station on"
      },
      {
        "stationId": "226",
        "name": "Lepolantie",
        "bikesAvailable": 2,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.23910894200569,
        "lon": 24.92859501499382,
        "state": "Station on"
      },
      {
        "stationId": "589",
        "name": "Haukilahdenranta",
        "bikesAvailable": 25,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.158048,
        "lon": 24.769864,
        "state": "Station on"
      },
      {
        "stationId": "106",
        "name": "Korppaanmäentie",
        "bikesAvailable": 3,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.2034735,
        "lon": 24.8989297,
        "state": "Station on"
      },
      {
        "stationId": "227",
        "name": "Kylävoudintie",
        "bikesAvailable": 10,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.22440378465167,
        "lon": 24.952561243589713,
        "state": "Station on"
      },
      {
        "stationId": "107",
        "name": "Tenholantie",
        "bikesAvailable": 20,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.2024393,
        "lon": 24.9054609,
        "state": "Station on"
      },
      {
        "stationId": "228",
        "name": "Kustaankartano",
        "bikesAvailable": 2,
        "spacesAvailable": 18,
        "realtime": true,
        "lat": 60.23039170479448,
        "lon": 24.94838914079226,
        "state": "Station on"
      },
      {
        "stationId": "108",
        "name": "Radiokatu",
        "bikesAvailable": 3,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.20444389917,
        "lon": 24.91794928954,
        "state": "Station on"
      },
      {
        "stationId": "229",
        "name": "Käskynhaltijantie",
        "bikesAvailable": 1,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.23268691593805,
        "lon": 24.958761529759155,
        "state": "Station on"
      },
      {
        "stationId": "109",
        "name": "Hertanmäenkatu",
        "bikesAvailable": 6,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.20232751643,
        "lon": 24.9226300335,
        "state": "Station on"
      }
    ]
  }
}
"""#
}

#endif
