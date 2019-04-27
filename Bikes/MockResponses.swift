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
        "bikesAvailable": 16,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.154941,
        "lon": 24.773993
      },
      {
        "stationId": "230",
        "name": "Mäkitorpantie",
        "bikesAvailable": 11,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.22892599719876,
        "lon": 24.96355034325867
      },
      {
        "stationId": "593",
        "name": "Toppelundintie",
        "bikesAvailable": 7,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.159601,
        "lon": 24.782536
      },
      {
        "stationId": "110",
        "name": "Maistraatintori",
        "bikesAvailable": 0,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.19890671373,
        "lon": 24.92486532113
      },
      {
        "stationId": "231",
        "name": "Siltavoudintie",
        "bikesAvailable": 12,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.23370685633967,
        "lon": 24.96539507775229
      },
      {
        "stationId": "111",
        "name": "Esterinportti",
        "bikesAvailable": 0,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.1975724,
        "lon": 24.9267808
      },
      {
        "stationId": "232",
        "name": "Oulunkylän asema",
        "bikesAvailable": 4,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.22869895434673,
        "lon": 24.967608606305625
      },
      {
        "stationId": "595",
        "name": "Westendintie",
        "bikesAvailable": 8,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.158194,
        "lon": 24.791754
      },
      {
        "stationId": "112",
        "name": "Rautatieläisenkatu",
        "bikesAvailable": 2,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.2014382,
        "lon": 24.9332721
      },
      {
        "stationId": "233",
        "name": "Kirkkoherrantie",
        "bikesAvailable": 1,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.22493036511101,
        "lon": 24.972819375145058
      },
      {
        "stationId": "596",
        "name": "Toppelundinportti",
        "bikesAvailable": 30,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.1624471,
        "lon": 24.7848628
      },
      {
        "stationId": "113",
        "name": "Veturitori",
        "bikesAvailable": 0,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.19970941415,
        "lon": 24.93520368471
      },
      {
        "stationId": "234",
        "name": "Otto Brandtin tie",
        "bikesAvailable": 8,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.23178406584145,
        "lon": 24.978138919040457
      },
      {
        "stationId": "597",
        "name": "Linnakepolku",
        "bikesAvailable": 10,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.1637,
        "lon": 24.790132
      },
      {
        "stationId": "114",
        "name": "Ratapihantie",
        "bikesAvailable": 2,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.19701384571,
        "lon": 24.93588683501
      },
      {
        "stationId": "235",
        "name": "Katariina Saksilaisen katu",
        "bikesAvailable": 16,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.217214807977534,
        "lon": 24.984420078358692
      },
      {
        "stationId": "115",
        "name": "Venttiilikuja",
        "bikesAvailable": 2,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.1942095,
        "lon": 24.941578
      },
      {
        "stationId": "236",
        "name": "Hernepellontie",
        "bikesAvailable": 6,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.224212141004635,
        "lon": 24.98860011548657
      },
      {
        "stationId": "116",
        "name": "Linnanmäki",
        "bikesAvailable": 3,
        "spacesAvailable": 29,
        "realtime": true,
        "lat": 60.1911411,
        "lon": 24.9401593
      },
      {
        "stationId": "237",
        "name": "Aulangontie",
        "bikesAvailable": 5,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.23030192663912,
        "lon": 24.998533819860555
      },
      {
        "stationId": "117",
        "name": "Brahen puistikko",
        "bikesAvailable": 6,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.1896706,
        "lon": 24.9481024
      },
      {
        "stationId": "238",
        "name": "Pihlajamäki",
        "bikesAvailable": 4,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.234578571034135,
        "lon": 25.010313905081038
      },
      {
        "stationId": "118",
        "name": "Fleminginkatu",
        "bikesAvailable": 11,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.1895417,
        "lon": 24.9521601
      },
      {
        "stationId": "239",
        "name": "Viikin tiedepuisto",
        "bikesAvailable": 8,
        "spacesAvailable": 21,
        "realtime": true,
        "lat": 60.227520671727405,
        "lon": 25.010062061139756
      },
      {
        "stationId": "119",
        "name": "Gebhardinaukio",
        "bikesAvailable": 1,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.1907096,
        "lon": 24.9568729
      },
      {
        "stationId": "240",
        "name": "Viikin normaalikoulu",
        "bikesAvailable": 15,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.227495295832895,
        "lon": 25.02761893353016
      },
      {
        "stationId": "120",
        "name": "Mäkelänkatu",
        "bikesAvailable": 3,
        "spacesAvailable": 25,
        "realtime": true,
        "lat": 60.1896352,
        "lon": 24.9635596
      },
      {
        "stationId": "241",
        "name": "Agronominkatu",
        "bikesAvailable": 24,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.2340530100318,
        "lon": 25.032857400999006
      },
      {
        "stationId": "121",
        "name": "Vilhonvuorenkatu",
        "bikesAvailable": 24,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.1864633,
        "lon": 24.9678718
      },
      {
        "stationId": "242",
        "name": "Von Daehnin katu",
        "bikesAvailable": 10,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.23033717886547,
        "lon": 25.04356806988234
      },
      {
        "stationId": "001",
        "name": "Kaivopuisto",
        "bikesAvailable": 56,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.15544479382098,
        "lon": 24.950292889690314
      },
      {
        "stationId": "122",
        "name": "Lintulahdenkatu",
        "bikesAvailable": 31,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.1837182,
        "lon": 24.9621936
      },
      {
        "stationId": "243",
        "name": "Mustikkamaa",
        "bikesAvailable": 5,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.181861779166056,
        "lon": 24.992037110168354
      },
      {
        "stationId": "002",
        "name": "Laivasillankatu",
        "bikesAvailable": 8,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.160959094315416,
        "lon": 24.95634747175871
      },
      {
        "stationId": "123",
        "name": "Näkinsilta",
        "bikesAvailable": 13,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.179765,
        "lon": 24.9554618
      },
      {
        "stationId": "244",
        "name": "Relanderinaukio",
        "bikesAvailable": 6,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.18588749805257,
        "lon": 25.00601922389024
      },
      {
        "stationId": "003",
        "name": "Kapteeninpuistikko",
        "bikesAvailable": 13,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.1581892,
        "lon": 24.9449274
      },
      {
        "stationId": "124",
        "name": "Isoisänsilta",
        "bikesAvailable": 25,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.18265182058,
        "lon": 24.98179260578
      },
      {
        "stationId": "245",
        "name": "Kulosaaren metroasema",
        "bikesAvailable": 5,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.188950088551046,
        "lon": 25.006566530899704
      },
      {
        "stationId": "004",
        "name": "Viiskulma",
        "bikesAvailable": 3,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.1609859,
        "lon": 24.9417758
      },
      {
        "stationId": "125",
        "name": "Arielinkatu",
        "bikesAvailable": 2,
        "spacesAvailable": 18,
        "realtime": true,
        "lat": 60.18479903388,
        "lon": 24.97864799006
      },
      {
        "stationId": "246",
        "name": "Tupasaarentie",
        "bikesAvailable": 6,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.187998177032696,
        "lon": 25.015391648483803
      },
      {
        "stationId": "005",
        "name": "Sepänkatu",
        "bikesAvailable": 21,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.1579483,
        "lon": 24.9362853
      },
      {
        "stationId": "126",
        "name": "Kalasataman metroasema",
        "bikesAvailable": 41,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.18755649,
        "lon": 24.9770684
      },
      {
        "stationId": "247",
        "name": "Haakoninlahdenkatu",
        "bikesAvailable": 9,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.168868558353665,
        "lon": 25.020860955309665
      },
      {
        "stationId": "006",
        "name": "Hietalahdentori",
        "bikesAvailable": 9,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.1622251,
        "lon": 24.9297099
      },
      {
        "stationId": "127",
        "name": "Teurastamo",
        "bikesAvailable": 37,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.1896994,
        "lon": 24.9711926
      },
      {
        "stationId": "248",
        "name": "Gunillantie",
        "bikesAvailable": 6,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.171980271468335,
        "lon": 25.032968849816825
      },
      {
        "stationId": "007",
        "name": "Designmuseo",
        "bikesAvailable": 3,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.1631032,
        "lon": 24.94596
      },
      {
        "stationId": "128",
        "name": "Päijänteentie",
        "bikesAvailable": 4,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.1920576,
        "lon": 24.9642238
      },
      {
        "stationId": "249",
        "name": "Isosaarentie",
        "bikesAvailable": 2,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.17549032254954,
        "lon": 25.044900705939895
      },
      {
        "stationId": "008",
        "name": "Vanha kirkkopuisto",
        "bikesAvailable": 18,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.1652883,
        "lon": 24.9391499
      },
      {
        "stationId": "129",
        "name": "Pernajantie",
        "bikesAvailable": 7,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.1942342,
        "lon": 24.9579931
      },
      {
        "stationId": "009",
        "name": "Erottajan aukio",
        "bikesAvailable": 0,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.166911666820425,
        "lon": 24.944134928807944
      },
      {
        "stationId": "250",
        "name": "Reiherintie",
        "bikesAvailable": 3,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.167730503345986,
        "lon": 25.047496264887712
      },
      {
        "stationId": "130",
        "name": "Teollisuuskatu",
        "bikesAvailable": 8,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.193486,
        "lon": 24.9487524
      },
      {
        "stationId": "251",
        "name": "Laajasalon ostoskeskus",
        "bikesAvailable": 0,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.18009213610057,
        "lon": 25.05188370479307
      },
      {
        "stationId": "010",
        "name": "Kasarmitori",
        "bikesAvailable": 2,
        "spacesAvailable": 26,
        "realtime": true,
        "lat": 60.1650171805,
        "lon": 24.94947287873
      },
      {
        "stationId": "131",
        "name": "Elimäenkatu",
        "bikesAvailable": 8,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.1962627,
        "lon": 24.9476186
      },
      {
        "stationId": "252",
        "name": "Humalniementie",
        "bikesAvailable": 8,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.18374384938291,
        "lon": 25.053037859101934
      },
      {
        "stationId": "011",
        "name": "Unioninkatu",
        "bikesAvailable": 33,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.1674573,
        "lon": 24.9510227
      },
      {
        "stationId": "132",
        "name": "Hollolantie",
        "bikesAvailable": 5,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.19588479865,
        "lon": 24.95453389981
      },
      {
        "stationId": "253",
        "name": "Tammisalon aukio",
        "bikesAvailable": 16,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.19164687919301,
        "lon": 25.06118417092495
      },
      {
        "stationId": "012",
        "name": "Kanavaranta",
        "bikesAvailable": 23,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.168384,
        "lon": 24.9583814
      },
      {
        "stationId": "133",
        "name": "Paavalinpuisto",
        "bikesAvailable": 0,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.1974886,
        "lon": 24.9614385
      },
      {
        "stationId": "254",
        "name": "Agnetankuja",
        "bikesAvailable": 13,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.187234122757424,
        "lon": 25.036412289626025
      },
      {
        "stationId": "013",
        "name": "Merisotilaantori",
        "bikesAvailable": 15,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.1678703,
        "lon": 24.9755341
      },
      {
        "stationId": "134",
        "name": "Haukilahdenkatu",
        "bikesAvailable": 2,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.1985314,
        "lon": 24.9676708
      },
      {
        "stationId": "255",
        "name": "Laivalahden puistotie",
        "bikesAvailable": 24,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.18795810306132,
        "lon": 25.031385306773423
      },
      {
        "stationId": "014",
        "name": "Senaatintori",
        "bikesAvailable": 1,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.1691278,
        "lon": 24.9526414
      },
      {
        "stationId": "135",
        "name": "Velodrominrinne",
        "bikesAvailable": 2,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.2010614,
        "lon": 24.9440506
      },
      {
        "stationId": "256",
        "name": "Herttoniemen ranta",
        "bikesAvailable": 6,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.190210145879014,
        "lon": 25.026065710136564
      },
      {
        "stationId": "015",
        "name": "Ritarikatu",
        "bikesAvailable": 1,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.17110664588,
        "lon": 24.95555819284
      },
      {
        "stationId": "136",
        "name": "Sofianlehdonkatu",
        "bikesAvailable": 4,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.2032721,
        "lon": 24.9513636
      },
      {
        "stationId": "257",
        "name": "Margareetankuja",
        "bikesAvailable": 4,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.19100958139025,
        "lon": 25.037070035460086
      },
      {
        "stationId": "016",
        "name": "Liisanpuistikko",
        "bikesAvailable": 9,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.1741822,
        "lon": 24.9613747
      },
      {
        "stationId": "137",
        "name": "Arabian kauppakeskus",
        "bikesAvailable": 25,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.2027912,
        "lon": 24.9666128
      },
      {
        "stationId": "258",
        "name": "Abraham Wetterin tie",
        "bikesAvailable": 3,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.19270789626325,
        "lon": 25.042580274921047
      },
      {
        "stationId": "017",
        "name": "Varsapuistikko",
        "bikesAvailable": 7,
        "spacesAvailable": 23,
        "realtime": true,
        "lat": 60.1731029,
        "lon": 24.9494791
      },
      {
        "stationId": "138",
        "name": "Arabiankatu",
        "bikesAvailable": 12,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.20649156514502,
        "lon": 24.977079011778606
      },
      {
        "stationId": "259",
        "name": "Petter Wetterin tie",
        "bikesAvailable": 9,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.19313762536413,
        "lon": 25.031111942585127
      },
      {
        "stationId": "018",
        "name": "Porthania",
        "bikesAvailable": 1,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.16986222858,
        "lon": 24.9481463998
      },
      {
        "stationId": "139",
        "name": "Kaironkatu",
        "bikesAvailable": 1,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.21003424069,
        "lon": 24.97656317933
      },
      {
        "stationId": "019",
        "name": "Rautatientori / itä",
        "bikesAvailable": 4,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.1708236,
        "lon": 24.9425268
      },
      {
        "stationId": "260",
        "name": "Herttoniemen metroasema",
        "bikesAvailable": 5,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.194614624348006,
        "lon": 25.02887208274608
      },
      {
        "stationId": "140",
        "name": "Verkatehtaanpuisto",
        "bikesAvailable": 3,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.2137007,
        "lon": 24.9797283
      },
      {
        "stationId": "261",
        "name": "Asentajanpuisto",
        "bikesAvailable": 2,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.19912713758262,
        "lon": 25.042592465753465
      },
      {
        "stationId": "020",
        "name": "Kaisaniemenpuisto",
        "bikesAvailable": 3,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.17319894172505,
        "lon": 24.943301000681707
      },
      {
        "stationId": "141",
        "name": "Intiankatu",
        "bikesAvailable": 11,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.2078582,
        "lon": 24.9676383
      },
      {
        "stationId": "262",
        "name": "Siilitien metroasema",
        "bikesAvailable": 3,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.20596244959136,
        "lon": 25.04516115672629
      },
      {
        "stationId": "021",
        "name": "Töölönlahdenkatu",
        "bikesAvailable": 7,
        "spacesAvailable": 42,
        "realtime": true,
        "lat": 60.1729435,
        "lon": 24.939284
      },
      {
        "stationId": "142",
        "name": "Koskelantie",
        "bikesAvailable": 21,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.208749,
        "lon": 24.9465139
      },
      {
        "stationId": "263",
        "name": "Herttoniemen kirkko",
        "bikesAvailable": 3,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.19844295116548,
        "lon": 25.032112127941765
      },
      {
        "stationId": "022",
        "name": "Rautatientori / länsi",
        "bikesAvailable": 3,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.1706061,
        "lon": 24.9397601
      },
      {
        "stationId": "143",
        "name": "Kuikkarinne",
        "bikesAvailable": 4,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.15708560052,
        "lon": 24.86930605276
      },
      {
        "stationId": "264",
        "name": "Eränkävijäntori",
        "bikesAvailable": 5,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.204561663649095,
        "lon": 25.033597412211737
      },
      {
        "stationId": "023",
        "name": "Kiasma",
        "bikesAvailable": 5,
        "spacesAvailable": 25,
        "realtime": true,
        "lat": 60.1712579,
        "lon": 24.9374279
      },
      {
        "stationId": "144",
        "name": "Käpyläntie",
        "bikesAvailable": 4,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.2139043,
        "lon": 24.9588108
      },
      {
        "stationId": "265",
        "name": "Siilitie 9",
        "bikesAvailable": 3,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.20947670530612,
        "lon": 25.037482215660486
      },
      {
        "stationId": "024",
        "name": "Mannerheimintie",
        "bikesAvailable": 12,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.1690724,
        "lon": 24.9394195
      },
      {
        "stationId": "145",
        "name": "Pohjolankatu",
        "bikesAvailable": 2,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.213421,
        "lon": 24.9437964
      },
      {
        "stationId": "266",
        "name": "Siilitie 13",
        "bikesAvailable": 1,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.215063371665806,
        "lon": 25.04379377901174
      },
      {
        "stationId": "025",
        "name": "Narinkka",
        "bikesAvailable": 13,
        "spacesAvailable": 27,
        "realtime": true,
        "lat": 60.1700844,
        "lon": 24.9351212
      },
      {
        "stationId": "146",
        "name": "Pohjolanaukio",
        "bikesAvailable": 16,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.2172043,
        "lon": 24.9544112
      },
      {
        "stationId": "267",
        "name": "Roihupelto",
        "bikesAvailable": 1,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.20923460018434,
        "lon": 25.05617408732242
      },
      {
        "stationId": "026",
        "name": "Kampin metroasema",
        "bikesAvailable": 2,
        "spacesAvailable": 30,
        "realtime": true,
        "lat": 60.1686095,
        "lon": 24.9305373
      },
      {
        "stationId": "147",
        "name": "Käpylän asema",
        "bikesAvailable": 1,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.2208057097763,
        "lon": 24.9479290250383
      },
      {
        "stationId": "268",
        "name": "Porolahden koulu",
        "bikesAvailable": 15,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.19553971683871,
        "lon": 25.053580944057305
      },
      {
        "stationId": "027",
        "name": "Eerikinkatu",
        "bikesAvailable": 8,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.1673332,
        "lon": 24.9357851
      },
      {
        "stationId": "148",
        "name": "Juhana Herttuan tie",
        "bikesAvailable": 4,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.2184427,
        "lon": 24.9664619
      },
      {
        "stationId": "269",
        "name": "Peukaloisentie",
        "bikesAvailable": 1,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.1987054995554,
        "lon": 25.05854933123242
      },
      {
        "stationId": "028",
        "name": "Lastenlehto",
        "bikesAvailable": 0,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.1658121,
        "lon": 24.927021
      },
      {
        "stationId": "149",
        "name": "Toinen linja",
        "bikesAvailable": 1,
        "spacesAvailable": 21,
        "realtime": true,
        "lat": 60.183164,
        "lon": 24.9441949
      },
      {
        "stationId": "029",
        "name": "Baana",
        "bikesAvailable": 2,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.164088,
        "lon": 24.9225658
      },
      {
        "stationId": "701",
        "name": "Gallen-Kallelan tie",
        "bikesAvailable": 0,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.206142,
        "lon": 24.840699
      },
      {
        "stationId": "703",
        "name": "Elfvik",
        "bikesAvailable": 8,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.203852,
        "lon": 24.8231
      },
      {
        "stationId": "705",
        "name": "Laajalahden keskus",
        "bikesAvailable": 5,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.203892,
        "lon": 24.80493
      },
      {
        "stationId": "707",
        "name": "Majurinkulma",
        "bikesAvailable": 7,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.210735,
        "lon": 24.824954
      },
      {
        "stationId": "709",
        "name": "Yhdyskunnankuja",
        "bikesAvailable": 2,
        "spacesAvailable": 18,
        "realtime": true,
        "lat": 60.212508,
        "lon": 24.819549
      },
      {
        "stationId": "270",
        "name": "Tulisuontie",
        "bikesAvailable": 4,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.202072986712835,
        "lon": 25.060046596074795
      },
      {
        "stationId": "150",
        "name": "Töölönlahden puisto",
        "bikesAvailable": 5,
        "spacesAvailable": 23,
        "realtime": true,
        "lat": 60.1766793,
        "lon": 24.9338701
      },
      {
        "stationId": "271",
        "name": "Prinsessantie",
        "bikesAvailable": 1,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.206340232662725,
        "lon": 25.060092333540833
      },
      {
        "stationId": "030",
        "name": "Itämerentori",
        "bikesAvailable": 10,
        "spacesAvailable": 30,
        "realtime": true,
        "lat": 60.1635309,
        "lon": 24.9145165
      },
      {
        "stationId": "272",
        "name": "Marjaniementie",
        "bikesAvailable": 5,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.20432489166999,
        "lon": 25.07606935994523
      },
      {
        "stationId": "031",
        "name": "Marian Sairaala",
        "bikesAvailable": 3,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.1680998,
        "lon": 24.9220763
      },
      {
        "stationId": "273",
        "name": "Kauppakartanonkuja",
        "bikesAvailable": 0,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.207097461138005,
        "lon": 25.07915481461614
      },
      {
        "stationId": "032",
        "name": "Eläinmuseo",
        "bikesAvailable": 0,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.171870055373205,
        "lon": 24.931223405177413
      },
      {
        "stationId": "274",
        "name": "Voikukantie",
        "bikesAvailable": 1,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.20899759942336,
        "lon": 25.086782105520793
      },
      {
        "stationId": "033",
        "name": "Kauppakorkeakoulu",
        "bikesAvailable": 3,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.1711591,
        "lon": 24.924961
      },
      {
        "stationId": "275",
        "name": "Itäkeskuksen metroasema",
        "bikesAvailable": 1,
        "spacesAvailable": 27,
        "realtime": true,
        "lat": 60.20960066552812,
        "lon": 25.07596801515546
      },
      {
        "stationId": "034",
        "name": "Kansallismuseo",
        "bikesAvailable": 2,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.1739641,
        "lon": 24.9329875
      },
      {
        "stationId": "276",
        "name": "Puotinharju",
        "bikesAvailable": 0,
        "spacesAvailable": 24,
        "realtime": true,
        "lat": 60.21249416558419,
        "lon": 25.08232209439382
      },
      {
        "stationId": "035",
        "name": "Cygnauksenkatu",
        "bikesAvailable": 3,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.174063715,
        "lon": 24.92822758053
      },
      {
        "stationId": "277",
        "name": "Marjaniemi",
        "bikesAvailable": 9,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.20360955659899,
        "lon": 25.086296156701028
      },
      {
        "stationId": "036",
        "name": "Apollonkatu",
        "bikesAvailable": 4,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.1760798,
        "lon": 24.9223942
      },
      {
        "stationId": "278",
        "name": "Puotilantie",
        "bikesAvailable": 8,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.209059633662385,
        "lon": 25.100426060233303
      },
      {
        "stationId": "037",
        "name": "Töölönkatu",
        "bikesAvailable": 3,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.1775598,
        "lon": 24.9283272
      },
      {
        "stationId": "279",
        "name": "Puotinkylän kartano",
        "bikesAvailable": 9,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.21250990784526,
        "lon": 25.10619874297898
      },
      {
        "stationId": "038",
        "name": "Töölöntori",
        "bikesAvailable": 10,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.1791231,
        "lon": 24.9249114
      },
      {
        "stationId": "039",
        "name": "Ooppera",
        "bikesAvailable": 18,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.1825529,
        "lon": 24.926687
      },
      {
        "stationId": "711",
        "name": "Kirjurinkuja",
        "bikesAvailable": 33,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.215751,
        "lon": 24.826368
      },
      {
        "stationId": "713",
        "name": "Upseerinkatu",
        "bikesAvailable": 3,
        "spacesAvailable": 27,
        "realtime": true,
        "lat": 60.216067,
        "lon": 24.819396
      },
      {
        "stationId": "715",
        "name": "Komentajankatu",
        "bikesAvailable": 8,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.216222,
        "lon": 24.821932
      },
      {
        "stationId": "719",
        "name": "Säteri",
        "bikesAvailable": 6,
        "spacesAvailable": 25,
        "realtime": true,
        "lat": 60.213443,
        "lon": 24.811572
      },
      {
        "stationId": "280",
        "name": "Puotilan ostoskeskus",
        "bikesAvailable": 1,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.21270057142605,
        "lon": 25.095559512793297
      },
      {
        "stationId": "281",
        "name": "Puotilan metroasema",
        "bikesAvailable": 0,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.21482071331432,
        "lon": 25.09112452769074
      },
      {
        "stationId": "040",
        "name": "Hakaniemen metroasema",
        "bikesAvailable": 6,
        "spacesAvailable": 23,
        "realtime": true,
        "lat": 60.17810631604,
        "lon": 24.95218124892
      },
      {
        "stationId": "161",
        "name": "Eteläesplanadi",
        "bikesAvailable": 29,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.16723083051,
        "lon": 24.94746581951
      },
      {
        "stationId": "282",
        "name": "Karhulantie",
        "bikesAvailable": 1,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.218601478441435,
        "lon": 25.10232484990167
      },
      {
        "stationId": "041",
        "name": "Ympyrätalo",
        "bikesAvailable": 23,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.180863,
        "lon": 24.9494
      },
      {
        "stationId": "162",
        "name": "Leppäsuonaukio",
        "bikesAvailable": 0,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.16957343209,
        "lon": 24.92659049777
      },
      {
        "stationId": "283",
        "name": "Alakiventie",
        "bikesAvailable": 3,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.21985096601641,
        "lon": 25.077470244052627
      },
      {
        "stationId": "042",
        "name": "Haapaniemenkatu",
        "bikesAvailable": 3,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.18310658307554,
        "lon": 24.95518082169317
      },
      {
        "stationId": "163",
        "name": "Lehtisaarentie",
        "bikesAvailable": 22,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.18147257752,
        "lon": 24.85053677106
      },
      {
        "stationId": "284",
        "name": "Myllypuron metroasema",
        "bikesAvailable": 2,
        "spacesAvailable": 26,
        "realtime": true,
        "lat": 60.22408646778726,
        "lon": 25.075395792228694
      },
      {
        "stationId": "043",
        "name": "Karhupuisto",
        "bikesAvailable": 3,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.1842833,
        "lon": 24.9526763
      },
      {
        "stationId": "285",
        "name": "Orpaanporras",
        "bikesAvailable": 0,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.22356519670723,
        "lon": 25.0654218381558
      },
      {
        "stationId": "044",
        "name": "Sörnäisten metroasema",
        "bikesAvailable": 10,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.188038054266826,
        "lon": 24.96089210621247
      },
      {
        "stationId": "286",
        "name": "Mamsellimyllynkatu",
        "bikesAvailable": 1,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.21825196984328,
        "lon": 25.05910387617357
      },
      {
        "stationId": "045",
        "name": "Brahen kenttä",
        "bikesAvailable": 1,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.1868618,
        "lon": 24.9509168
      },
      {
        "stationId": "046",
        "name": "Diakoniapuisto",
        "bikesAvailable": 1,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.1862877,
        "lon": 24.9418576
      },
      {
        "stationId": "047",
        "name": "Vanha Kauppahalli",
        "bikesAvailable": 49,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.16673071893,
        "lon": 24.95350466638
      },
      {
        "stationId": "048",
        "name": "Mastokatu",
        "bikesAvailable": 25,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.1647545,
        "lon": 24.9674861
      },
      {
        "stationId": "049",
        "name": "Annankatu",
        "bikesAvailable": 5,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.16345894291,
        "lon": 24.94177084206
      },
      {
        "stationId": "721",
        "name": "Säterinrinne",
        "bikesAvailable": 4,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.214193,
        "lon": 24.805613
      },
      {
        "stationId": "601",
        "name": "Nokkala",
        "bikesAvailable": 23,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.147974,
        "lon": 24.754344
      },
      {
        "stationId": "723",
        "name": "Säterinniitty",
        "bikesAvailable": 3,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.214666,
        "lon": 24.800486
      },
      {
        "stationId": "603",
        "name": "Matinlahdenranta",
        "bikesAvailable": 25,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.151041,
        "lon": 24.754196
      },
      {
        "stationId": "725",
        "name": "Rummunlyöjänkatu",
        "bikesAvailable": 13,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.217261,
        "lon": 24.806279
      },
      {
        "stationId": "727",
        "name": "Ratsutori",
        "bikesAvailable": 0,
        "spacesAvailable": 33,
        "realtime": true,
        "lat": 60.217311,
        "lon": 24.812419
      },
      {
        "stationId": "607",
        "name": "Nuottaniementie",
        "bikesAvailable": 20,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.147921,
        "lon": 24.741546
      },
      {
        "stationId": "729",
        "name": "Leppävaaranaukio",
        "bikesAvailable": 11,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.218869,
        "lon": 24.813885
      },
      {
        "stationId": "609",
        "name": "Sepetlahdentie",
        "bikesAvailable": 7,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.152343,
        "lon": 24.741234
      },
      {
        "stationId": "050",
        "name": "Melkonkuja",
        "bikesAvailable": 5,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.1498127,
        "lon": 24.8861094
      },
      {
        "stationId": "051",
        "name": "Itälahdenkatu",
        "bikesAvailable": 4,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.15066,
        "lon": 24.8812502
      },
      {
        "stationId": "052",
        "name": "Heikkilänaukio",
        "bikesAvailable": 37,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.1540763,
        "lon": 24.8793159
      },
      {
        "stationId": "053",
        "name": "Heikkiläntie",
        "bikesAvailable": 11,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.156817,
        "lon": 24.8850653
      },
      {
        "stationId": "054",
        "name": "Gyldenintie",
        "bikesAvailable": 4,
        "spacesAvailable": 32,
        "realtime": true,
        "lat": 60.1583842,
        "lon": 24.8766658
      },
      {
        "stationId": "055",
        "name": "Puistokaari",
        "bikesAvailable": 13,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.16169596138,
        "lon": 24.85986626853
      },
      {
        "stationId": "056",
        "name": "Luoteisväylä",
        "bikesAvailable": 16,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.1654485,
        "lon": 24.8601992
      },
      {
        "stationId": "057",
        "name": "Lauttasaaren ostoskeskus",
        "bikesAvailable": 26,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.1603306,
        "lon": 24.8815441
      },
      {
        "stationId": "058",
        "name": "Lauttasaarensilta",
        "bikesAvailable": 4,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.1615512,
        "lon": 24.8926386
      },
      {
        "stationId": "059",
        "name": "Salmisaarenranta",
        "bikesAvailable": 0,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.16478138043,
        "lon": 24.90096080349
      },
      {
        "stationId": "731",
        "name": "Leppävaarankäytävä",
        "bikesAvailable": 22,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.220254,
        "lon": 24.813437
      },
      {
        "stationId": "611",
        "name": "Matinkartanontie",
        "bikesAvailable": 4,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.156258,
        "lon": 24.752489
      },
      {
        "stationId": "733",
        "name": "Läkkitori",
        "bikesAvailable": 10,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.221019,
        "lon": 24.813109
      },
      {
        "stationId": "613",
        "name": "Matinkyläntie",
        "bikesAvailable": 14,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.155689,
        "lon": 24.744978
      },
      {
        "stationId": "735",
        "name": "Armas Launiksen katu",
        "bikesAvailable": 6,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.221781,
        "lon": 24.818128
      },
      {
        "stationId": "615",
        "name": "Tiistiläntie",
        "bikesAvailable": 8,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.156755,
        "lon": 24.737664
      },
      {
        "stationId": "737",
        "name": "Muurarinkuja",
        "bikesAvailable": 2,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.223769,
        "lon": 24.812271
      },
      {
        "stationId": "617",
        "name": "Tiistinkallio",
        "bikesAvailable": 18,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.153737,
        "lon": 24.729112
      },
      {
        "stationId": "739",
        "name": "Postipuun koulu",
        "bikesAvailable": 2,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.223827,
        "lon": 24.826396
      },
      {
        "stationId": "619",
        "name": "Etuniementie",
        "bikesAvailable": 3,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.160645,
        "lon": 24.724835
      },
      {
        "stationId": "060",
        "name": "Porkkalankatu",
        "bikesAvailable": 1,
        "spacesAvailable": 37,
        "realtime": true,
        "lat": 60.1632493,
        "lon": 24.905336
      },
      {
        "stationId": "061",
        "name": "Länsisatamankatu",
        "bikesAvailable": 14,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.1589276,
        "lon": 24.909692
      },
      {
        "stationId": "062",
        "name": "Messitytönkatu",
        "bikesAvailable": 13,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.1610901,
        "lon": 24.9158734
      },
      {
        "stationId": "063",
        "name": "Jätkäsaarenlaituri",
        "bikesAvailable": 2,
        "spacesAvailable": 22,
        "realtime": true,
        "lat": 60.1619311,
        "lon": 24.9214896
      },
      {
        "stationId": "064",
        "name": "Tyynenmerenkatu",
        "bikesAvailable": 0,
        "spacesAvailable": 29,
        "realtime": true,
        "lat": 60.1565255,
        "lon": 24.9217464
      },
      {
        "stationId": "065",
        "name": "Hylkeenpyytäjänkatu",
        "bikesAvailable": 75,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.15352968178976,
        "lon": 24.93125406706023
      },
      {
        "stationId": "066",
        "name": "Ehrenströmintie",
        "bikesAvailable": 19,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.155309,
        "lon": 24.9591271
      },
      {
        "stationId": "067",
        "name": "Perämiehenkatu",
        "bikesAvailable": 5,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.15997725117,
        "lon": 24.93383428634
      },
      {
        "stationId": "068",
        "name": "Albertinkatu",
        "bikesAvailable": 3,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.1618359,
        "lon": 24.9368179
      },
      {
        "stationId": "069",
        "name": "Kalevankatu",
        "bikesAvailable": 8,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.1656962,
        "lon": 24.9314323
      },
      {
        "stationId": "741",
        "name": "Gransinmäki",
        "bikesAvailable": 1,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.222154,
        "lon": 24.804898
      },
      {
        "stationId": "621",
        "name": "Hauenkalliontie",
        "bikesAvailable": 18,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.161138,
        "lon": 24.756272
      },
      {
        "stationId": "501",
        "name": "Hanasaari",
        "bikesAvailable": 1,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.16582,
        "lon": 24.840319
      },
      {
        "stationId": "623",
        "name": "Nelikkotie",
        "bikesAvailable": 3,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.161588,
        "lon": 24.74663
      },
      {
        "stationId": "503",
        "name": "Keilalahti",
        "bikesAvailable": 0,
        "spacesAvailable": 28,
        "realtime": true,
        "lat": 60.171524,
        "lon": 24.827467
      },
      {
        "stationId": "745",
        "name": "Leppävaaran urheilupuisto",
        "bikesAvailable": 8,
        "spacesAvailable": 24,
        "realtime": true,
        "lat": 60.224943,
        "lon": 24.800971
      },
      {
        "stationId": "625",
        "name": "Suomenlahdentie",
        "bikesAvailable": 36,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.160015,
        "lon": 24.741294
      },
      {
        "stationId": "505",
        "name": "Westendinasema",
        "bikesAvailable": 0,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.168266,
        "lon": 24.805758
      },
      {
        "stationId": "747",
        "name": "Leppävaaran uimahalli",
        "bikesAvailable": 7,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.226379,
        "lon": 24.804735
      },
      {
        "stationId": "627",
        "name": "Piispansilta",
        "bikesAvailable": 6,
        "spacesAvailable": 34,
        "realtime": true,
        "lat": 60.162403,
        "lon": 24.738416
      },
      {
        "stationId": "507",
        "name": "Golfpolku",
        "bikesAvailable": 5,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.168143,
        "lon": 24.796136
      },
      {
        "stationId": "749",
        "name": "Vallikatu",
        "bikesAvailable": 2,
        "spacesAvailable": 22,
        "realtime": true,
        "lat": 60.228463,
        "lon": 24.813871
      },
      {
        "stationId": "629",
        "name": "Piispanportti",
        "bikesAvailable": 22,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.165603,
        "lon": 24.732688
      },
      {
        "stationId": "509",
        "name": "Revontulentie",
        "bikesAvailable": 6,
        "spacesAvailable": 24,
        "realtime": true,
        "lat": 60.171551,
        "lon": 24.802938
      },
      {
        "stationId": "070",
        "name": "Sammonpuistikko",
        "bikesAvailable": 3,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.1731473,
        "lon": 24.9224112
      },
      {
        "stationId": "071",
        "name": "Hietaniemenkatu",
        "bikesAvailable": 14,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.17261154618,
        "lon": 24.91127964812
      },
      {
        "stationId": "072",
        "name": "Eteläinen Hesperiankatu",
        "bikesAvailable": 39,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.17558787407832,
        "lon": 24.915662751685453
      },
      {
        "stationId": "073",
        "name": "Kesäkatu",
        "bikesAvailable": 18,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.1792967,
        "lon": 24.9132504
      },
      {
        "stationId": "074",
        "name": "Rajasaarentie",
        "bikesAvailable": 1,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.183137,
        "lon": 24.911127
      },
      {
        "stationId": "075",
        "name": "Korjaamo",
        "bikesAvailable": 18,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.1838677,
        "lon": 24.9198371
      },
      {
        "stationId": "076",
        "name": "Olympiastadion",
        "bikesAvailable": 18,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.1845055,
        "lon": 24.9249741
      },
      {
        "stationId": "077",
        "name": "Nordenskiöldinaukio",
        "bikesAvailable": 10,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.18523632967096,
        "lon": 24.91724984112588
      },
      {
        "stationId": "078",
        "name": "Messeniuksenkatu",
        "bikesAvailable": 11,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.1878352,
        "lon": 24.9180102
      },
      {
        "stationId": "079",
        "name": "Uimastadion",
        "bikesAvailable": 2,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.1892172,
        "lon": 24.9292286
      },
      {
        "stationId": "751",
        "name": "Vallipolku",
        "bikesAvailable": 3,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.227827,
        "lon": 24.819614
      },
      {
        "stationId": "631",
        "name": "Friisilänaukio",
        "bikesAvailable": 16,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.162842,
        "lon": 24.721367
      },
      {
        "stationId": "511",
        "name": "Sateentie",
        "bikesAvailable": 6,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.173424,
        "lon": 24.810688
      },
      {
        "stationId": "753",
        "name": "Linnuntie",
        "bikesAvailable": 14,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.234401,
        "lon": 24.813954
      },
      {
        "stationId": "633",
        "name": "Avaruuskatu",
        "bikesAvailable": 10,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.168971,
        "lon": 24.724908
      },
      {
        "stationId": "513",
        "name": "Hakalehto",
        "bikesAvailable": 6,
        "spacesAvailable": 18,
        "realtime": true,
        "lat": 60.173567,
        "lon": 24.79139
      },
      {
        "stationId": "755",
        "name": "Kutsuntatie",
        "bikesAvailable": 3,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.230453,
        "lon": 24.824561
      },
      {
        "stationId": "635",
        "name": "Kuunkatu",
        "bikesAvailable": 8,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.172673,
        "lon": 24.726025
      },
      {
        "stationId": "515",
        "name": "Oravannahkatori",
        "bikesAvailable": 2,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.175769,
        "lon": 24.792559
      },
      {
        "stationId": "757",
        "name": "Painiitty",
        "bikesAvailable": 17,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.235089,
        "lon": 24.831397
      },
      {
        "stationId": "637",
        "name": "Ruomelantie",
        "bikesAvailable": 0,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.174524,
        "lon": 24.729314
      },
      {
        "stationId": "517",
        "name": "Länsituuli",
        "bikesAvailable": 3,
        "spacesAvailable": 21,
        "realtime": true,
        "lat": 60.175358,
        "lon": 24.802049
      },
      {
        "stationId": "518",
        "name": "Tuulimäki",
        "bikesAvailable": 1,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.174144,
        "lon": 24.806051
      },
      {
        "stationId": "639",
        "name": "Itäportti",
        "bikesAvailable": 1,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.174914,
        "lon": 24.738122
      },
      {
        "stationId": "519",
        "name": "Tapionaukio",
        "bikesAvailable": 6,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.176168,
        "lon": 24.805825
      },
      {
        "stationId": "080",
        "name": "Jäähalli",
        "bikesAvailable": 8,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.1894025,
        "lon": 24.9205978
      },
      {
        "stationId": "081",
        "name": "Stenbäckinkatu",
        "bikesAvailable": 1,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.1883091,
        "lon": 24.9123717
      },
      {
        "stationId": "082",
        "name": "Töölöntulli",
        "bikesAvailable": 6,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.19095693226663,
        "lon": 24.912827135427882
      },
      {
        "stationId": "083",
        "name": "Meilahden sairaala",
        "bikesAvailable": 0,
        "spacesAvailable": 28,
        "realtime": true,
        "lat": 60.1902195,
        "lon": 24.9083351
      },
      {
        "stationId": "084",
        "name": "Paciuksenkatu",
        "bikesAvailable": 0,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.19120215596817,
        "lon": 24.899910050364525
      },
      {
        "stationId": "085",
        "name": "Jalavatie",
        "bikesAvailable": 6,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.1934696,
        "lon": 24.905889
      },
      {
        "stationId": "086",
        "name": "Kuusitie",
        "bikesAvailable": 18,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.1952452,
        "lon": 24.9018997
      },
      {
        "stationId": "087",
        "name": "Kustaankatu",
        "bikesAvailable": 4,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.1882752174,
        "lon": 24.95597593163
      },
      {
        "stationId": "088",
        "name": "Kiskontie",
        "bikesAvailable": 7,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.1989402,
        "lon": 24.9012997
      },
      {
        "stationId": "089",
        "name": "Tilkanvierto",
        "bikesAvailable": 14,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.1975329,
        "lon": 24.899261
      },
      {
        "stationId": "761",
        "name": "Mäkkylän asema",
        "bikesAvailable": 3,
        "spacesAvailable": 29,
        "realtime": true,
        "lat": 60.220467,
        "lon": 24.83939
      },
      {
        "stationId": "641",
        "name": "Komeetankatu",
        "bikesAvailable": 1,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.167216,
        "lon": 24.735969
      },
      {
        "stationId": "521",
        "name": "Kulttuuriaukio",
        "bikesAvailable": 20,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.177588,
        "lon": 24.803942
      },
      {
        "stationId": "763",
        "name": "Kalkkipellonmäki",
        "bikesAvailable": 2,
        "spacesAvailable": 22,
        "realtime": true,
        "lat": 60.220551,
        "lon": 24.833536
      },
      {
        "stationId": "643",
        "name": "Auringonkatu",
        "bikesAvailable": 1,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.171548,
        "lon": 24.731472
      },
      {
        "stationId": "523",
        "name": "Ahertajantie",
        "bikesAvailable": 5,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.17875,
        "lon": 24.797984
      },
      {
        "stationId": "645",
        "name": "Piispankallio",
        "bikesAvailable": 6,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.168441,
        "lon": 24.743532
      },
      {
        "stationId": "525",
        "name": "Mäntyviita",
        "bikesAvailable": 10,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.178702,
        "lon": 24.810974
      },
      {
        "stationId": "767",
        "name": "Ruutikatu",
        "bikesAvailable": 0,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.223377,
        "lon": 24.820635
      },
      {
        "stationId": "647",
        "name": "Lystimäki",
        "bikesAvailable": 11,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.172814,
        "lon": 24.745666
      },
      {
        "stationId": "527",
        "name": "Otsolahti",
        "bikesAvailable": 21,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.178655,
        "lon": 24.817423
      },
      {
        "stationId": "769",
        "name": "Tiurintie",
        "bikesAvailable": 1,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.204582,
        "lon": 24.814794
      },
      {
        "stationId": "649",
        "name": "Lystimäensilta",
        "bikesAvailable": 2,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.17471,
        "lon": 24.752442
      },
      {
        "stationId": "529",
        "name": "Keilaniemi (M)",
        "bikesAvailable": 6,
        "spacesAvailable": 34,
        "realtime": true,
        "lat": 60.175233,
        "lon": 24.82895
      },
      {
        "stationId": "090",
        "name": "Paciuksenkaari",
        "bikesAvailable": 30,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.1944475,
        "lon": 24.8911179
      },
      {
        "stationId": "091",
        "name": "Seurasaari",
        "bikesAvailable": 2,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.188399,
        "lon": 24.8847362
      },
      {
        "stationId": "092",
        "name": "Saunalahdentie",
        "bikesAvailable": 6,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.1926305828,
        "lon": 24.87922144235
      },
      {
        "stationId": "093",
        "name": "Torpanranta",
        "bikesAvailable": 23,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.1948358,
        "lon": 24.8713963
      },
      {
        "stationId": "094",
        "name": "Laajalahden aukio",
        "bikesAvailable": 9,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.19793090756802,
        "lon": 24.876221716500662
      },
      {
        "stationId": "095",
        "name": "Munkkiniemen aukio",
        "bikesAvailable": 9,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.1967196,
        "lon": 24.8840917
      },
      {
        "stationId": "096",
        "name": "Huopalahdentie",
        "bikesAvailable": 8,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.1996653,
        "lon": 24.8836209
      },
      {
        "stationId": "098",
        "name": "Ulvilantie",
        "bikesAvailable": 7,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.2038803,
        "lon": 24.8708833
      },
      {
        "stationId": "099",
        "name": "Muusantori",
        "bikesAvailable": 8,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.2071193,
        "lon": 24.8559544
      },
      {
        "stationId": "651",
        "name": "Suurpellonaukio",
        "bikesAvailable": 20,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.184596,
        "lon": 24.744131
      },
      {
        "stationId": "531",
        "name": "Keilaranta",
        "bikesAvailable": 0,
        "spacesAvailable": 24,
        "realtime": true,
        "lat": 60.178762,
        "lon": 24.835132
      },
      {
        "stationId": "532",
        "name": "Betonimies",
        "bikesAvailable": 1,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.180027,
        "lon": 24.831804
      },
      {
        "stationId": "653",
        "name": "Lukutori",
        "bikesAvailable": 17,
        "spacesAvailable": 1,
        "realtime": true,
        "lat": 60.187052,
        "lon": 24.742571
      },
      {
        "stationId": "533",
        "name": "Tekniikantie",
        "bikesAvailable": 3,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.180806,
        "lon": 24.824747
      },
      {
        "stationId": "537",
        "name": "Innopoli",
        "bikesAvailable": 7,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.185096,
        "lon": 24.81422
      },
      {
        "stationId": "538",
        "name": "Hagalundinpuisto",
        "bikesAvailable": 0,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.18363,
        "lon": 24.817403
      },
      {
        "stationId": "539",
        "name": "Aalto-yliopisto (M), Tietotie",
        "bikesAvailable": 2,
        "spacesAvailable": 18,
        "realtime": true,
        "lat": 60.184987,
        "lon": 24.820099
      },
      {
        "stationId": "541",
        "name": "Aalto-yliopisto (M), Korkeakouluaukio",
        "bikesAvailable": 21,
        "spacesAvailable": 18,
        "realtime": true,
        "lat": 60.184312,
        "lon": 24.826671
      },
      {
        "stationId": "543",
        "name": "Otaranta",
        "bikesAvailable": 9,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.18483,
        "lon": 24.837133
      },
      {
        "stationId": "545",
        "name": "Sähkömies",
        "bikesAvailable": 0,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.188499,
        "lon": 24.829985
      },
      {
        "stationId": "547",
        "name": "Jämeräntaival",
        "bikesAvailable": 15,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.188118,
        "lon": 24.835033
      },
      {
        "stationId": "549",
        "name": "Maarinranta",
        "bikesAvailable": 1,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.187261,
        "lon": 24.810199
      },
      {
        "stationId": "551",
        "name": "Tietäjä",
        "bikesAvailable": 2,
        "spacesAvailable": 18,
        "realtime": true,
        "lat": 60.189143,
        "lon": 24.807083
      },
      {
        "stationId": "553",
        "name": "Metsänneidonpolku",
        "bikesAvailable": 5,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.186731,
        "lon": 24.806152
      },
      {
        "stationId": "555",
        "name": "Kalevalantie",
        "bikesAvailable": 4,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.184765,
        "lon": 24.804022
      },
      {
        "stationId": "557",
        "name": "Louhentori",
        "bikesAvailable": 3,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.18715,
        "lon": 24.796959
      },
      {
        "stationId": "559",
        "name": "Pohjankulma",
        "bikesAvailable": 15,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.18288,
        "lon": 24.794014
      },
      {
        "stationId": "561",
        "name": "Koivu-Mankkaa",
        "bikesAvailable": 3,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.182976,
        "lon": 24.78576
      },
      {
        "stationId": "200",
        "name": "Länsiterminaali",
        "bikesAvailable": 22,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.150395628620245,
        "lon": 24.915862667368163
      },
      {
        "stationId": "563",
        "name": "Mankkaanlaaksontie",
        "bikesAvailable": 17,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.188706,
        "lon": 24.780478
      },
      {
        "stationId": "201",
        "name": "Länsisatamankuja",
        "bikesAvailable": 2,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.15693191359567,
        "lon": 24.912200440174857
      },
      {
        "stationId": "202",
        "name": "Merihaka",
        "bikesAvailable": 9,
        "spacesAvailable": 7,
        "realtime": true,
        "lat": 60.17806592826971,
        "lon": 24.958452215046275
      },
      {
        "stationId": "565",
        "name": "Mankkaanaukio",
        "bikesAvailable": 5,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.194599,
        "lon": 24.769021
      },
      {
        "stationId": "203",
        "name": "Opastinsilta",
        "bikesAvailable": 1,
        "spacesAvailable": 39,
        "realtime": true,
        "lat": 60.199235425819,
        "lon": 24.937826370875783
      },
      {
        "stationId": "204",
        "name": "A.I. Virtasen aukio",
        "bikesAvailable": 0,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.205674609517686,
        "lon": 24.962367446681693
      },
      {
        "stationId": "205",
        "name": "Ilmalan asema",
        "bikesAvailable": 1,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.206626437691405,
        "lon": 24.922219888430064
      },
      {
        "stationId": "206",
        "name": "Ruskeasuon varikko",
        "bikesAvailable": 0,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.20767995961701,
        "lon": 24.898667890628126
      },
      {
        "stationId": "207",
        "name": "Vanha Viertotie",
        "bikesAvailable": 0,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.211075296273414,
        "lon": 24.881660254358646
      },
      {
        "stationId": "208",
        "name": "Valimotie",
        "bikesAvailable": 0,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.215922235436786,
        "lon": 24.87646479282845
      },
      {
        "stationId": "209",
        "name": "Takomotie",
        "bikesAvailable": 12,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.21785454213256,
        "lon": 24.870539572354964
      },
      {
        "stationId": "571",
        "name": "Tapiolan urheilupuisto",
        "bikesAvailable": 26,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.177749,
        "lon": 24.784654
      },
      {
        "stationId": "210",
        "name": "Pajamäki",
        "bikesAvailable": 5,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.218807358014985,
        "lon": 24.85566795479381
      },
      {
        "stationId": "573",
        "name": "Urheilupuisto (M)",
        "bikesAvailable": 12,
        "spacesAvailable": 17,
        "realtime": true,
        "lat": 60.17465,
        "lon": 24.779428
      },
      {
        "stationId": "211",
        "name": "Haagan tori",
        "bikesAvailable": 6,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.21227524113252,
        "lon": 24.899551136356806
      },
      {
        "stationId": "212",
        "name": "Tunnelitie",
        "bikesAvailable": 4,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.21661653745581,
        "lon": 24.89954369574049
      },
      {
        "stationId": "575",
        "name": "Tontunmäentie",
        "bikesAvailable": 10,
        "spacesAvailable": 6,
        "realtime": true,
        "lat": 60.176107,
        "lon": 24.769667
      },
      {
        "stationId": "213",
        "name": "Huopalahden asema",
        "bikesAvailable": 4,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.218088561019165,
        "lon": 24.89505934373838
      },
      {
        "stationId": "214",
        "name": "Valimon asema",
        "bikesAvailable": 0,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.22229427877046,
        "lon": 24.875870912746144
      },
      {
        "stationId": "577",
        "name": "Olarinluoma",
        "bikesAvailable": 18,
        "spacesAvailable": 2,
        "realtime": true,
        "lat": 60.180848,
        "lon": 24.760606
      },
      {
        "stationId": "215",
        "name": "Pitäjänmäen asema",
        "bikesAvailable": 5,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.22431428805152,
        "lon": 24.85863812462164
      },
      {
        "stationId": "216",
        "name": "Jännetie",
        "bikesAvailable": 7,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.226769960915966,
        "lon": 24.85354095884256
      },
      {
        "stationId": "579",
        "name": "Niittymaa",
        "bikesAvailable": 38,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.171127,
        "lon": 24.775913
      },
      {
        "stationId": "217",
        "name": "Marttila",
        "bikesAvailable": 2,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.227143233822176,
        "lon": 24.873227365442304
      },
      {
        "stationId": "218",
        "name": "Pohjois-Haagan asema",
        "bikesAvailable": 5,
        "spacesAvailable": 11,
        "realtime": true,
        "lat": 60.230151499496536,
        "lon": 24.88312884546424
      },
      {
        "stationId": "219",
        "name": "Näyttelijäntie",
        "bikesAvailable": 16,
        "spacesAvailable": 3,
        "realtime": true,
        "lat": 60.23285213757895,
        "lon": 24.887434554817386
      },
      {
        "stationId": "581",
        "name": "Niittykumpu (M)",
        "bikesAvailable": 23,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.170758,
        "lon": 24.763184
      },
      {
        "stationId": "220",
        "name": "Ida Aalbergin tie",
        "bikesAvailable": 5,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.229408823326075,
        "lon": 24.892011409257975
      },
      {
        "stationId": "583",
        "name": "Haukilahdenkatu",
        "bikesAvailable": 1,
        "spacesAvailable": 15,
        "realtime": true,
        "lat": 60.166481,
        "lon": 24.772708
      },
      {
        "stationId": "100",
        "name": "Teljäntie",
        "bikesAvailable": 2,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.20969562580255,
        "lon": 24.868739477207995
      },
      {
        "stationId": "221",
        "name": "Thalianaukio",
        "bikesAvailable": 1,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.22534052315868,
        "lon": 24.894792651160333
      },
      {
        "stationId": "101",
        "name": "Munkkivuoren ostoskeskus",
        "bikesAvailable": 0,
        "spacesAvailable": 0,
        "realtime": true,
        "lat": 60.2059946,
        "lon": 24.8798291
      },
      {
        "stationId": "222",
        "name": "Huovitie",
        "bikesAvailable": 7,
        "spacesAvailable": 5,
        "realtime": true,
        "lat": 60.22197553556329,
        "lon": 24.903286646676616
      },
      {
        "stationId": "585",
        "name": "Haukilahdenaukio",
        "bikesAvailable": 13,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.162396,
        "lon": 24.775882
      },
      {
        "stationId": "223",
        "name": "Hämeenlinnanväylä",
        "bikesAvailable": 6,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.22746939884859,
        "lon": 24.906443561905945
      },
      {
        "stationId": "103",
        "name": "Vihdintie",
        "bikesAvailable": 6,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.208925,
        "lon": 24.8895209
      },
      {
        "stationId": "224",
        "name": "Vesakkotie",
        "bikesAvailable": 3,
        "spacesAvailable": 9,
        "realtime": true,
        "lat": 60.22794236805671,
        "lon": 24.926564764263762
      },
      {
        "stationId": "587",
        "name": "Hauenkallio",
        "bikesAvailable": 1,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.162477,
        "lon": 24.767831
      },
      {
        "stationId": "104",
        "name": "Kriikunakuja",
        "bikesAvailable": 1,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.2056785,
        "lon": 24.8916817
      },
      {
        "stationId": "225",
        "name": "Maunula",
        "bikesAvailable": 3,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.231319869075655,
        "lon": 24.935048840096293
      },
      {
        "stationId": "105",
        "name": "Tilkantori",
        "bikesAvailable": 4,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.2028392,
        "lon": 24.8934761
      },
      {
        "stationId": "226",
        "name": "Lepolantie",
        "bikesAvailable": 1,
        "spacesAvailable": 13,
        "realtime": true,
        "lat": 60.23910894200569,
        "lon": 24.92859501499382
      },
      {
        "stationId": "589",
        "name": "Haukilahdenranta",
        "bikesAvailable": 20,
        "spacesAvailable": 4,
        "realtime": true,
        "lat": 60.158048,
        "lon": 24.769864
      },
      {
        "stationId": "106",
        "name": "Korppaanmäentie",
        "bikesAvailable": 3,
        "spacesAvailable": 14,
        "realtime": true,
        "lat": 60.2034735,
        "lon": 24.8989297
      },
      {
        "stationId": "227",
        "name": "Kylävoudintie",
        "bikesAvailable": 4,
        "spacesAvailable": 10,
        "realtime": true,
        "lat": 60.22440378465167,
        "lon": 24.952561243589713
      },
      {
        "stationId": "107",
        "name": "Tenholantie",
        "bikesAvailable": 11,
        "spacesAvailable": 8,
        "realtime": true,
        "lat": 60.2024393,
        "lon": 24.9054609
      },
      {
        "stationId": "228",
        "name": "Kustaankartano",
        "bikesAvailable": 0,
        "spacesAvailable": 20,
        "realtime": true,
        "lat": 60.23039170479448,
        "lon": 24.94838914079226
      },
      {
        "stationId": "108",
        "name": "Radiokatu",
        "bikesAvailable": 2,
        "spacesAvailable": 12,
        "realtime": true,
        "lat": 60.20444389917,
        "lon": 24.91794928954
      },
      {
        "stationId": "229",
        "name": "Käskynhaltijantie",
        "bikesAvailable": 0,
        "spacesAvailable": 16,
        "realtime": true,
        "lat": 60.23268691593805,
        "lon": 24.958761529759155
      },
      {
        "stationId": "109",
        "name": "Hertanmäenkatu",
        "bikesAvailable": 0,
        "spacesAvailable": 19,
        "realtime": true,
        "lat": 60.20232751643,
        "lon": 24.9226300335
      }
    ]
  }
}
"""#
}

#endif
