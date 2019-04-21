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
        "name": "Mellstenintie",
        "bikesAvailable": 13,
        "realtime": true,
        "lat": 60.154941,
        "lon": 24.773993
      },
      {
        "name": "Mäkitorpantie",
        "bikesAvailable": 8,
        "realtime": true,
        "lat": 60.22892599719876,
        "lon": 24.96355034325867
      },
      {
        "name": "Toppelundintie",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.159601,
        "lon": 24.782536
      },
      {
        "name": "Maistraatintori",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.19890671373,
        "lon": 24.92486532113
      },
      {
        "name": "Siltavoudintie",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.23370685633967,
        "lon": 24.96539507775229
      },
      {
        "name": "Esterinportti",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.1975724,
        "lon": 24.9267808
      },
      {
        "name": "Oulunkylän asema",
        "bikesAvailable": 12,
        "realtime": true,
        "lat": 60.22869895434673,
        "lon": 24.967608606305625
      },
      {
        "name": "Westendintie",
        "bikesAvailable": 11,
        "realtime": true,
        "lat": 60.158194,
        "lon": 24.791754
      },
      {
        "name": "Rautatieläisenkatu",
        "bikesAvailable": 12,
        "realtime": true,
        "lat": 60.2014382,
        "lon": 24.9332721
      },
      {
        "name": "Kirkkoherrantie",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.22493036511101,
        "lon": 24.972819375145058
      },
      {
        "name": "Toppelundinportti",
        "bikesAvailable": 22,
        "realtime": true,
        "lat": 60.1624471,
        "lon": 24.7848628
      },
      {
        "name": "Veturitori",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.19970941415,
        "lon": 24.93520368471
      },
      {
        "name": "Otto Brandtin tie",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.23178406584145,
        "lon": 24.978138919040457
      },
      {
        "name": "Linnakepolku",
        "bikesAvailable": 5,
        "realtime": true,
        "lat": 60.1637,
        "lon": 24.790132
      },
      {
        "name": "Ratapihantie",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.19701384571,
        "lon": 24.93588683501
      },
      {
        "name": "Katariina Saksilaisen katu",
        "bikesAvailable": 17,
        "realtime": true,
        "lat": 60.217214807977534,
        "lon": 24.984420078358692
      },
      {
        "name": "Venttiilikuja",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.1942095,
        "lon": 24.941578
      },
      {
        "name": "Hernepellontie",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.224212141004635,
        "lon": 24.98860011548657
      },
      {
        "name": "Linnanmäki",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.1911411,
        "lon": 24.9401593
      },
      {
        "name": "Aulangontie",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.23030192663912,
        "lon": 24.998533819860555
      },
      {
        "name": "Brahen puistikko",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.1896706,
        "lon": 24.9481024
      },
      {
        "name": "Pihlajamäki",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.234578571034135,
        "lon": 25.010313905081038
      },
      {
        "name": "Fleminginkatu",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.1895417,
        "lon": 24.9521601
      },
      {
        "name": "Viikin tiedepuisto",
        "bikesAvailable": 6,
        "realtime": true,
        "lat": 60.227520671727405,
        "lon": 25.010062061139756
      },
      {
        "name": "Gebhardinaukio",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.1907096,
        "lon": 24.9568729
      },
      {
        "name": "Viikin normaalikoulu",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.227495295832895,
        "lon": 25.02761893353016
      },
      {
        "name": "Mäkelänkatu",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.1896352,
        "lon": 24.9635596
      },
      {
        "name": "Agronominkatu",
        "bikesAvailable": 15,
        "realtime": true,
        "lat": 60.2340530100318,
        "lon": 25.032857400999006
      },
      {
        "name": "Vilhonvuorenkatu",
        "bikesAvailable": 14,
        "realtime": true,
        "lat": 60.1864633,
        "lon": 24.9678718
      },
      {
        "name": "Von Daehnin katu",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.23033717886547,
        "lon": 25.04356806988234
      },
      {
        "name": "Kaivopuisto",
        "bikesAvailable": 18,
        "realtime": true,
        "lat": 60.15544479382098,
        "lon": 24.950292889690314
      },
      {
        "name": "Lintulahdenkatu",
        "bikesAvailable": 19,
        "realtime": true,
        "lat": 60.1837182,
        "lon": 24.9621936
      },
      {
        "name": "Mustikkamaa",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.181861779166056,
        "lon": 24.992037110168354
      },
      {
        "name": "Laivasillankatu",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.160959094315416,
        "lon": 24.95634747175871
      },
      {
        "name": "Näkinsilta",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.179765,
        "lon": 24.9554618
      },
      {
        "name": "Relanderinaukio",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.18588749805257,
        "lon": 25.00601922389024
      },
      {
        "name": "Kapteeninpuistikko",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.1581892,
        "lon": 24.9449274
      },
      {
        "name": "Isoisänsilta",
        "bikesAvailable": 23,
        "realtime": true,
        "lat": 60.18265182058,
        "lon": 24.98179260578
      },
      {
        "name": "Kulosaaren metroasema",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.188950088551046,
        "lon": 25.006566530899704
      },
      {
        "name": "Viiskulma",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.1609859,
        "lon": 24.9417758
      },
      {
        "name": "Arielinkatu",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.18479903388,
        "lon": 24.97864799006
      },
      {
        "name": "Tupasaarentie",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.187998177032696,
        "lon": 25.015391648483803
      },
      {
        "name": "Sepänkatu",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.1579483,
        "lon": 24.9362853
      },
      {
        "name": "Kalasataman metroasema",
        "bikesAvailable": 35,
        "realtime": true,
        "lat": 60.18755649,
        "lon": 24.9770684
      },
      {
        "name": "Haakoninlahdenkatu",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.168868558353665,
        "lon": 25.020860955309665
      },
      {
        "name": "Hietalahdentori",
        "bikesAvailable": 26,
        "realtime": true,
        "lat": 60.1622251,
        "lon": 24.9297099
      },
      {
        "name": "Teurastamo",
        "bikesAvailable": 19,
        "realtime": true,
        "lat": 60.1896994,
        "lon": 24.9711926
      },
      {
        "name": "Gunillantie",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.171980271468335,
        "lon": 25.032968849816825
      },
      {
        "name": "Designmuseo",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.1631032,
        "lon": 24.94596
      },
      {
        "name": "Päijänteentie",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.1920576,
        "lon": 24.9642238
      },
      {
        "name": "Isosaarentie",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.17549032254954,
        "lon": 25.044900705939895
      },
      {
        "name": "Vanha kirkkopuisto",
        "bikesAvailable": 10,
        "realtime": true,
        "lat": 60.1652883,
        "lon": 24.9391499
      },
      {
        "name": "Pernajantie",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.1942342,
        "lon": 24.9579931
      },
      {
        "name": "Erottajan aukio",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.166911666820425,
        "lon": 24.944134928807944
      },
      {
        "name": "Reiherintie",
        "bikesAvailable": 10,
        "realtime": true,
        "lat": 60.167730503345986,
        "lon": 25.047496264887712
      },
      {
        "name": "Teollisuuskatu",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.193486,
        "lon": 24.9487524
      },
      {
        "name": "Laajasalon ostoskeskus",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.18009213610057,
        "lon": 25.05188370479307
      },
      {
        "name": "Kasarmitori",
        "bikesAvailable": 8,
        "realtime": true,
        "lat": 60.1650171805,
        "lon": 24.94947287873
      },
      {
        "name": "Elimäenkatu",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.1962627,
        "lon": 24.9476186
      },
      {
        "name": "Humalniementie",
        "bikesAvailable": 8,
        "realtime": true,
        "lat": 60.18374384938291,
        "lon": 25.053037859101934
      },
      {
        "name": "Unioninkatu",
        "bikesAvailable": 23,
        "realtime": true,
        "lat": 60.1674573,
        "lon": 24.9510227
      },
      {
        "name": "Hollolantie",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.19588479865,
        "lon": 24.95453389981
      },
      {
        "name": "Tammisalon aukio",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.19164687919301,
        "lon": 25.06118417092495
      },
      {
        "name": "Kanavaranta",
        "bikesAvailable": 11,
        "realtime": true,
        "lat": 60.168384,
        "lon": 24.9583814
      },
      {
        "name": "Paavalinpuisto",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.1974886,
        "lon": 24.9614385
      },
      {
        "name": "Agnetankuja",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.187234122757424,
        "lon": 25.036412289626025
      },
      {
        "name": "Merisotilaantori",
        "bikesAvailable": 18,
        "realtime": true,
        "lat": 60.1678703,
        "lon": 24.9755341
      },
      {
        "name": "Haukilahdenkatu",
        "bikesAvailable": 20,
        "realtime": true,
        "lat": 60.1985314,
        "lon": 24.9676708
      },
      {
        "name": "Laivalahden puistotie",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.18795810306132,
        "lon": 25.031385306773423
      },
      {
        "name": "Senaatintori",
        "bikesAvailable": 6,
        "realtime": true,
        "lat": 60.1691278,
        "lon": 24.9526414
      },
      {
        "name": "Velodrominrinne",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.2010614,
        "lon": 24.9440506
      },
      {
        "name": "Herttoniemen ranta",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.190210145879014,
        "lon": 25.026065710136564
      },
      {
        "name": "Ritarikatu",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.17110664588,
        "lon": 24.95555819284
      },
      {
        "name": "Sofianlehdonkatu",
        "bikesAvailable": 8,
        "realtime": true,
        "lat": 60.2032721,
        "lon": 24.9513636
      },
      {
        "name": "Margareetankuja",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.19100958139025,
        "lon": 25.037070035460086
      },
      {
        "name": "Liisanpuistikko",
        "bikesAvailable": 24,
        "realtime": true,
        "lat": 60.1741822,
        "lon": 24.9613747
      },
      {
        "name": "Arabian kauppakeskus",
        "bikesAvailable": 21,
        "realtime": true,
        "lat": 60.2027912,
        "lon": 24.9666128
      },
      {
        "name": "Abraham Wetterin tie",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.19270789626325,
        "lon": 25.042580274921047
      },
      {
        "name": "Varsapuistikko",
        "bikesAvailable": 9,
        "realtime": true,
        "lat": 60.1731029,
        "lon": 24.9494791
      },
      {
        "name": "Arabiankatu",
        "bikesAvailable": 9,
        "realtime": true,
        "lat": 60.20649156514502,
        "lon": 24.977079011778606
      },
      {
        "name": "Petter Wetterin tie",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.19313762536413,
        "lon": 25.031111942585127
      },
      {
        "name": "Porthania",
        "bikesAvailable": 9,
        "realtime": true,
        "lat": 60.16986222858,
        "lon": 24.9481463998
      },
      {
        "name": "Kaironkatu",
        "bikesAvailable": 12,
        "realtime": true,
        "lat": 60.21003424069,
        "lon": 24.97656317933
      },
      {
        "name": "Rautatientori / itä",
        "bikesAvailable": 27,
        "realtime": true,
        "lat": 60.1708236,
        "lon": 24.9425268
      },
      {
        "name": "Herttoniemen metroasema",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.194614624348006,
        "lon": 25.02887208274608
      },
      {
        "name": "Verkatehtaanpuisto",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.2137007,
        "lon": 24.9797283
      },
      {
        "name": "Asentajanpuisto",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.19912713758262,
        "lon": 25.042592465753465
      },
      {
        "name": "Kaisaniemenpuisto",
        "bikesAvailable": 35,
        "realtime": true,
        "lat": 60.17319894172505,
        "lon": 24.943301000681707
      },
      {
        "name": "Intiankatu",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.2078582,
        "lon": 24.9676383
      },
      {
        "name": "Siilitien metroasema",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.20596244959136,
        "lon": 25.04516115672629
      },
      {
        "name": "Töölönlahdenkatu",
        "bikesAvailable": 54,
        "realtime": true,
        "lat": 60.1729435,
        "lon": 24.939284
      },
      {
        "name": "Koskelantie",
        "bikesAvailable": 9,
        "realtime": true,
        "lat": 60.208749,
        "lon": 24.9465139
      },
      {
        "name": "Herttoniemen kirkko",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.19844295116548,
        "lon": 25.032112127941765
      },
      {
        "name": "Rautatientori / länsi",
        "bikesAvailable": 13,
        "realtime": true,
        "lat": 60.1706061,
        "lon": 24.9397601
      },
      {
        "name": "Kuikkarinne",
        "bikesAvailable": 8,
        "realtime": true,
        "lat": 60.15708560052,
        "lon": 24.86930605276
      },
      {
        "name": "Eränkävijäntori",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.204561663649095,
        "lon": 25.033597412211737
      },
      {
        "name": "Kiasma",
        "bikesAvailable": 53,
        "realtime": true,
        "lat": 60.1712579,
        "lon": 24.9374279
      },
      {
        "name": "Käpyläntie",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.2139043,
        "lon": 24.9588108
      },
      {
        "name": "Siilitie 9",
        "bikesAvailable": 11,
        "realtime": true,
        "lat": 60.20947670530612,
        "lon": 25.037482215660486
      },
      {
        "name": "Mannerheimintie",
        "bikesAvailable": 19,
        "realtime": true,
        "lat": 60.1690724,
        "lon": 24.9394195
      },
      {
        "name": "Pohjolankatu",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.213421,
        "lon": 24.9437964
      },
      {
        "name": "Siilitie 13",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.215063371665806,
        "lon": 25.04379377901174
      },
      {
        "name": "Narinkka",
        "bikesAvailable": 15,
        "realtime": true,
        "lat": 60.1700844,
        "lon": 24.9351212
      },
      {
        "name": "Pohjolanaukio",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.2172043,
        "lon": 24.9544112
      },
      {
        "name": "Roihupelto",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.20923460018434,
        "lon": 25.05617408732242
      },
      {
        "name": "Kampin metroasema",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.1686095,
        "lon": 24.9305373
      },
      {
        "name": "Käpylän asema",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.2208057097763,
        "lon": 24.9479290250383
      },
      {
        "name": "Porolahden koulu",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.19553971683871,
        "lon": 25.053580944057305
      },
      {
        "name": "Eerikinkatu",
        "bikesAvailable": 25,
        "realtime": true,
        "lat": 60.1673332,
        "lon": 24.9357851
      },
      {
        "name": "Juhana Herttuan tie",
        "bikesAvailable": 5,
        "realtime": true,
        "lat": 60.2184427,
        "lon": 24.9664619
      },
      {
        "name": "Peukaloisentie",
        "bikesAvailable": 8,
        "realtime": true,
        "lat": 60.1987054995554,
        "lon": 25.05854933123242
      },
      {
        "name": "Lastenlehto",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.1658121,
        "lon": 24.927021
      },
      {
        "name": "Toinen linja",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.183164,
        "lon": 24.9441949
      },
      {
        "name": "Baana",
        "bikesAvailable": 11,
        "realtime": true,
        "lat": 60.164088,
        "lon": 24.9225658
      },
      {
        "name": "Gallen-Kallelan tie",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.206142,
        "lon": 24.840699
      },
      {
        "name": "Elfvik",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.203852,
        "lon": 24.8231
      },
      {
        "name": "Laajalahden keskus",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.203892,
        "lon": 24.80493
      },
      {
        "name": "Majurinkulma",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.210735,
        "lon": 24.824954
      },
      {
        "name": "Yhdyskunnankuja",
        "bikesAvailable": 9,
        "realtime": true,
        "lat": 60.212508,
        "lon": 24.819549
      },
      {
        "name": "Tulisuontie",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.202072986712835,
        "lon": 25.060046596074795
      },
      {
        "name": "Töölönlahden puisto",
        "bikesAvailable": 33,
        "realtime": true,
        "lat": 60.1766793,
        "lon": 24.9338701
      },
      {
        "name": "Prinsessantie",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.206340232662725,
        "lon": 25.060092333540833
      },
      {
        "name": "Itämerentori",
        "bikesAvailable": 50,
        "realtime": true,
        "lat": 60.1635309,
        "lon": 24.9145165
      },
      {
        "name": "Marjaniementie",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.20432489166999,
        "lon": 25.07606935994523
      },
      {
        "name": "Marian Sairaala",
        "bikesAvailable": 27,
        "realtime": true,
        "lat": 60.1680998,
        "lon": 24.9220763
      },
      {
        "name": "Kauppakartanonkuja",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.207097461138005,
        "lon": 25.07915481461614
      },
      {
        "name": "Eläinmuseo",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.171870055373205,
        "lon": 24.931223405177413
      },
      {
        "name": "Voikukantie",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.20899759942336,
        "lon": 25.086782105520793
      },
      {
        "name": "Kauppakorkeakoulu",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.1711591,
        "lon": 24.924961
      },
      {
        "name": "Itäkeskuksen metroasema",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.20960066552812,
        "lon": 25.07596801515546
      },
      {
        "name": "Kansallismuseo",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.1739641,
        "lon": 24.9329875
      },
      {
        "name": "Puotinharju",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.21249416558419,
        "lon": 25.08232209439382
      },
      {
        "name": "Cygnauksenkatu",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.174063715,
        "lon": 24.92822758053
      },
      {
        "name": "Marjaniemi",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.20360955659899,
        "lon": 25.086296156701028
      },
      {
        "name": "Apollonkatu",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.1760798,
        "lon": 24.9223942
      },
      {
        "name": "Puotilantie",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.209059633662385,
        "lon": 25.100426060233303
      },
      {
        "name": "Töölönkatu",
        "bikesAvailable": 6,
        "realtime": true,
        "lat": 60.1775598,
        "lon": 24.9283272
      },
      {
        "name": "Puotinkylän kartano",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.21250990784526,
        "lon": 25.10619874297898
      },
      {
        "name": "Töölöntori",
        "bikesAvailable": 10,
        "realtime": true,
        "lat": 60.1791231,
        "lon": 24.9249114
      },
      {
        "name": "Ooppera",
        "bikesAvailable": 20,
        "realtime": true,
        "lat": 60.1825529,
        "lon": 24.926687
      },
      {
        "name": "Kirjurinkuja",
        "bikesAvailable": 10,
        "realtime": true,
        "lat": 60.215751,
        "lon": 24.826368
      },
      {
        "name": "Upseerinkatu",
        "bikesAvailable": 20,
        "realtime": true,
        "lat": 60.216067,
        "lon": 24.819396
      },
      {
        "name": "Komentajankatu",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.216222,
        "lon": 24.821932
      },
      {
        "name": "Säteri",
        "bikesAvailable": 5,
        "realtime": true,
        "lat": 60.213443,
        "lon": 24.811572
      },
      {
        "name": "Puotilan ostoskeskus",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.21270057142605,
        "lon": 25.095559512793297
      },
      {
        "name": "Puotilan metroasema",
        "bikesAvailable": 12,
        "realtime": true,
        "lat": 60.21482071331432,
        "lon": 25.09112452769074
      },
      {
        "name": "Hakaniemen metroasema",
        "bikesAvailable": 20,
        "realtime": true,
        "lat": 60.17810631604,
        "lon": 24.95218124892
      },
      {
        "name": "Eteläesplanadi",
        "bikesAvailable": 21,
        "realtime": true,
        "lat": 60.16723083051,
        "lon": 24.94746581951
      },
      {
        "name": "Karhulantie",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.218601478441435,
        "lon": 25.10232484990167
      },
      {
        "name": "Ympyrätalo",
        "bikesAvailable": 14,
        "realtime": true,
        "lat": 60.180863,
        "lon": 24.9494
      },
      {
        "name": "Leppäsuonaukio",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.16957343209,
        "lon": 24.92659049777
      },
      {
        "name": "Alakiventie",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.21985096601641,
        "lon": 25.077470244052627
      },
      {
        "name": "Haapaniemenkatu",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.18310658307554,
        "lon": 24.95518082169317
      },
      {
        "name": "Lehtisaarentie",
        "bikesAvailable": 8,
        "realtime": true,
        "lat": 60.18147257752,
        "lon": 24.85053677106
      },
      {
        "name": "Myllypuron metroasema",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.22408646778726,
        "lon": 25.075395792228694
      },
      {
        "name": "Karhupuisto",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.1842833,
        "lon": 24.9526763
      },
      {
        "name": "Orpaanporras",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.22356519670723,
        "lon": 25.0654218381558
      },
      {
        "name": "Sörnäisten metroasema",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.188038054266826,
        "lon": 24.96089210621247
      },
      {
        "name": "Mamsellimyllynkatu",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.21825196984328,
        "lon": 25.05910387617357
      },
      {
        "name": "Brahen kenttä",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.1868618,
        "lon": 24.9509168
      },
      {
        "name": "Diakoniapuisto",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.1862877,
        "lon": 24.9418576
      },
      {
        "name": "Vanha Kauppahalli",
        "bikesAvailable": 37,
        "realtime": true,
        "lat": 60.16673071893,
        "lon": 24.95350466638
      },
      {
        "name": "Mastokatu",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.1647545,
        "lon": 24.9674861
      },
      {
        "name": "Annankatu",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.16345894291,
        "lon": 24.94177084206
      },
      {
        "name": "Säterinrinne",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.214193,
        "lon": 24.805613
      },
      {
        "name": "Nokkala",
        "bikesAvailable": 24,
        "realtime": true,
        "lat": 60.147974,
        "lon": 24.754344
      },
      {
        "name": "Säterinniitty",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.214666,
        "lon": 24.800486
      },
      {
        "name": "Matinlahdenranta",
        "bikesAvailable": 27,
        "realtime": true,
        "lat": 60.151041,
        "lon": 24.754196
      },
      {
        "name": "Rummunlyöjänkatu",
        "bikesAvailable": 14,
        "realtime": true,
        "lat": 60.217261,
        "lon": 24.806279
      },
      {
        "name": "Ratsutori",
        "bikesAvailable": 12,
        "realtime": true,
        "lat": 60.217311,
        "lon": 24.812419
      },
      {
        "name": "Nuottaniementie",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.147921,
        "lon": 24.741546
      },
      {
        "name": "Leppävaaranaukio",
        "bikesAvailable": 37,
        "realtime": true,
        "lat": 60.218869,
        "lon": 24.813885
      },
      {
        "name": "Sepetlahdentie",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.152343,
        "lon": 24.741234
      },
      {
        "name": "Melkonkuja",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.1498127,
        "lon": 24.8861094
      },
      {
        "name": "Itälahdenkatu",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.15066,
        "lon": 24.8812502
      },
      {
        "name": "Heikkilänaukio",
        "bikesAvailable": 12,
        "realtime": true,
        "lat": 60.1540763,
        "lon": 24.8793159
      },
      {
        "name": "Heikkiläntie",
        "bikesAvailable": 13,
        "realtime": true,
        "lat": 60.156817,
        "lon": 24.8850653
      },
      {
        "name": "Gyldenintie",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.1583842,
        "lon": 24.8766658
      },
      {
        "name": "Puistokaari",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.16169596138,
        "lon": 24.85986626853
      },
      {
        "name": "Luoteisväylä",
        "bikesAvailable": 14,
        "realtime": true,
        "lat": 60.1654485,
        "lon": 24.8601992
      },
      {
        "name": "Lauttasaaren ostoskeskus",
        "bikesAvailable": 16,
        "realtime": true,
        "lat": 60.1603306,
        "lon": 24.8815441
      },
      {
        "name": "Lauttasaarensilta",
        "bikesAvailable": 12,
        "realtime": true,
        "lat": 60.1615512,
        "lon": 24.8926386
      },
      {
        "name": "Salmisaarenranta",
        "bikesAvailable": 20,
        "realtime": true,
        "lat": 60.16478138043,
        "lon": 24.90096080349
      },
      {
        "name": "Leppävaarankäytävä",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.220254,
        "lon": 24.813437
      },
      {
        "name": "Matinkartanontie",
        "bikesAvailable": 22,
        "realtime": true,
        "lat": 60.156258,
        "lon": 24.752489
      },
      {
        "name": "Läkkitori",
        "bikesAvailable": 25,
        "realtime": true,
        "lat": 60.221019,
        "lon": 24.813109
      },
      {
        "name": "Matinkyläntie",
        "bikesAvailable": 5,
        "realtime": true,
        "lat": 60.155689,
        "lon": 24.744978
      },
      {
        "name": "Mestarinkatu",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.222183,
        "lon": 24.816382
      },
      {
        "name": "Tiistiläntie",
        "bikesAvailable": 8,
        "realtime": true,
        "lat": 60.156755,
        "lon": 24.737664
      },
      {
        "name": "Muurarinkuja",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.223769,
        "lon": 24.812271
      },
      {
        "name": "Tiistinkallio",
        "bikesAvailable": 11,
        "realtime": true,
        "lat": 60.153737,
        "lon": 24.729112
      },
      {
        "name": "Postipuun koulu",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.223827,
        "lon": 24.826396
      },
      {
        "name": "Etuniementie",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.160645,
        "lon": 24.724835
      },
      {
        "name": "Porkkalankatu",
        "bikesAvailable": 9,
        "realtime": true,
        "lat": 60.1632493,
        "lon": 24.905336
      },
      {
        "name": "Länsisatamankatu",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.1589276,
        "lon": 24.909692
      },
      {
        "name": "Messitytönkatu",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.1610901,
        "lon": 24.9158734
      },
      {
        "name": "Jätkäsaarenlaituri",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.1619311,
        "lon": 24.9214896
      },
      {
        "name": "Tyynenmerenkatu",
        "bikesAvailable": 21,
        "realtime": true,
        "lat": 60.1565255,
        "lon": 24.9217464
      },
      {
        "name": "Hylkeenpyytäjänkatu",
        "bikesAvailable": 32,
        "realtime": true,
        "lat": 60.15352968178976,
        "lon": 24.93125406706023
      },
      {
        "name": "Ehrenströmintie",
        "bikesAvailable": 11,
        "realtime": true,
        "lat": 60.155309,
        "lon": 24.9591271
      },
      {
        "name": "Perämiehenkatu",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.15997725117,
        "lon": 24.93383428634
      },
      {
        "name": "Albertinkatu",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.1618359,
        "lon": 24.9368179
      },
      {
        "name": "Kalevankatu",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.1656962,
        "lon": 24.9314323
      },
      {
        "name": "Gransinmäki",
        "bikesAvailable": 11,
        "realtime": true,
        "lat": 60.222154,
        "lon": 24.804898
      },
      {
        "name": "Hauenkalliontie",
        "bikesAvailable": 14,
        "realtime": true,
        "lat": 60.161138,
        "lon": 24.756272
      },
      {
        "name": "Hanasaari",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.16582,
        "lon": 24.840319
      },
      {
        "name": "Nelikkotie",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.161588,
        "lon": 24.74663
      },
      {
        "name": "Keilalahti",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.171524,
        "lon": 24.827467
      },
      {
        "name": "Leppävaaran urheilupuisto",
        "bikesAvailable": 10,
        "realtime": true,
        "lat": 60.224943,
        "lon": 24.800971
      },
      {
        "name": "Suomenlahdentie",
        "bikesAvailable": 17,
        "realtime": true,
        "lat": 60.160015,
        "lon": 24.741294
      },
      {
        "name": "Westendinasema",
        "bikesAvailable": 6,
        "realtime": true,
        "lat": 60.168266,
        "lon": 24.805758
      },
      {
        "name": "Leppävaaran uimahalli",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.226379,
        "lon": 24.804735
      },
      {
        "name": "Piispansilta",
        "bikesAvailable": 26,
        "realtime": true,
        "lat": 60.162403,
        "lon": 24.738416
      },
      {
        "name": "Golfpolku",
        "bikesAvailable": 6,
        "realtime": true,
        "lat": 60.168143,
        "lon": 24.796136
      },
      {
        "name": "Vallikatu",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.228463,
        "lon": 24.813871
      },
      {
        "name": "Piispanportti",
        "bikesAvailable": 10,
        "realtime": true,
        "lat": 60.165603,
        "lon": 24.732688
      },
      {
        "name": "Revontulentie",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.171551,
        "lon": 24.802938
      },
      {
        "name": "Sammonpuistikko",
        "bikesAvailable": 9,
        "realtime": true,
        "lat": 60.1731473,
        "lon": 24.9224112
      },
      {
        "name": "Hietaniemenkatu",
        "bikesAvailable": 11,
        "realtime": true,
        "lat": 60.17261154618,
        "lon": 24.91127964812
      },
      {
        "name": "Eteläinen Hesperiankatu",
        "bikesAvailable": 30,
        "realtime": true,
        "lat": 60.17558787407832,
        "lon": 24.915662751685453
      },
      {
        "name": "Kesäkatu",
        "bikesAvailable": 8,
        "realtime": true,
        "lat": 60.1792967,
        "lon": 24.9132504
      },
      {
        "name": "Rajasaarentie",
        "bikesAvailable": 16,
        "realtime": true,
        "lat": 60.183137,
        "lon": 24.911127
      },
      {
        "name": "Korjaamo",
        "bikesAvailable": 6,
        "realtime": true,
        "lat": 60.1838677,
        "lon": 24.9198371
      },
      {
        "name": "Olympiastadion",
        "bikesAvailable": 19,
        "realtime": true,
        "lat": 60.1845055,
        "lon": 24.9249741
      },
      {
        "name": "Nordenskiöldinaukio",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.18523632967096,
        "lon": 24.91724984112588
      },
      {
        "name": "Messeniuksenkatu",
        "bikesAvailable": 8,
        "realtime": true,
        "lat": 60.1878352,
        "lon": 24.9180102
      },
      {
        "name": "Uimastadion",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.1892172,
        "lon": 24.9292286
      },
      {
        "name": "Vallipolku",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.227827,
        "lon": 24.819614
      },
      {
        "name": "Friisilänaukio",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.162842,
        "lon": 24.721367
      },
      {
        "name": "Sateentie",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.173424,
        "lon": 24.810688
      },
      {
        "name": "Linnuntie",
        "bikesAvailable": 9,
        "realtime": true,
        "lat": 60.234401,
        "lon": 24.813954
      },
      {
        "name": "Avaruuskatu",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.168971,
        "lon": 24.724908
      },
      {
        "name": "Hakalehto",
        "bikesAvailable": 10,
        "realtime": true,
        "lat": 60.173567,
        "lon": 24.79139
      },
      {
        "name": "Kutsuntatie",
        "bikesAvailable": 15,
        "realtime": true,
        "lat": 60.230453,
        "lon": 24.824561
      },
      {
        "name": "Kuunkatu",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.172673,
        "lon": 24.726025
      },
      {
        "name": "Oravannahkatori",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.175769,
        "lon": 24.792559
      },
      {
        "name": "Painiitty",
        "bikesAvailable": 16,
        "realtime": true,
        "lat": 60.235089,
        "lon": 24.831397
      },
      {
        "name": "Ruomelantie",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.174524,
        "lon": 24.729314
      },
      {
        "name": "Länsituuli",
        "bikesAvailable": 6,
        "realtime": true,
        "lat": 60.175358,
        "lon": 24.802049
      },
      {
        "name": "Tuulimäki",
        "bikesAvailable": 8,
        "realtime": true,
        "lat": 60.174144,
        "lon": 24.806051
      },
      {
        "name": "Itäportti",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.174914,
        "lon": 24.738122
      },
      {
        "name": "Tapionaukio",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.176168,
        "lon": 24.805825
      },
      {
        "name": "Jäähalli",
        "bikesAvailable": 6,
        "realtime": true,
        "lat": 60.1894025,
        "lon": 24.9205978
      },
      {
        "name": "Stenbäckinkatu",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.1883091,
        "lon": 24.9123717
      },
      {
        "name": "Töölöntulli",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.19095693226663,
        "lon": 24.912827135427882
      },
      {
        "name": "Meilahden sairaala",
        "bikesAvailable": 6,
        "realtime": true,
        "lat": 60.1902195,
        "lon": 24.9083351
      },
      {
        "name": "Paciuksenkatu",
        "bikesAvailable": 5,
        "realtime": true,
        "lat": 60.19120215596817,
        "lon": 24.899910050364525
      },
      {
        "name": "Jalavatie",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.1934696,
        "lon": 24.905889
      },
      {
        "name": "Kuusitie",
        "bikesAvailable": 12,
        "realtime": true,
        "lat": 60.1952452,
        "lon": 24.9018997
      },
      {
        "name": "Kustaankatu",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.1882752174,
        "lon": 24.95597593163
      },
      {
        "name": "Kiskontie",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.1989402,
        "lon": 24.9012997
      },
      {
        "name": "Tilkanvierto",
        "bikesAvailable": 17,
        "realtime": true,
        "lat": 60.1975329,
        "lon": 24.899261
      },
      {
        "name": "Mäkkylän asema",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.220467,
        "lon": 24.83939
      },
      {
        "name": "Komeetankatu",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.167216,
        "lon": 24.735969
      },
      {
        "name": "Kulttuuriaukio",
        "bikesAvailable": 9,
        "realtime": true,
        "lat": 60.177588,
        "lon": 24.803942
      },
      {
        "name": "Kalkkipellonmäki",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.220551,
        "lon": 24.833536
      },
      {
        "name": "Auringonkatu",
        "bikesAvailable": 15,
        "realtime": true,
        "lat": 60.171548,
        "lon": 24.731472
      },
      {
        "name": "Ahertajantie",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.17875,
        "lon": 24.797984
      },
      {
        "name": "Piispankallio",
        "bikesAvailable": 8,
        "realtime": true,
        "lat": 60.168441,
        "lon": 24.743532
      },
      {
        "name": "Mäntyviita",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.178702,
        "lon": 24.810974
      },
      {
        "name": "Ruutikatu",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.223377,
        "lon": 24.820635
      },
      {
        "name": "Lystimäki",
        "bikesAvailable": 9,
        "realtime": true,
        "lat": 60.172814,
        "lon": 24.745666
      },
      {
        "name": "Otsolahti",
        "bikesAvailable": 10,
        "realtime": true,
        "lat": 60.178655,
        "lon": 24.817423
      },
      {
        "name": "Tiurintie",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.204582,
        "lon": 24.814794
      },
      {
        "name": "Lystimäensilta",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.17471,
        "lon": 24.752442
      },
      {
        "name": "Keilaniemi (M)",
        "bikesAvailable": 8,
        "realtime": true,
        "lat": 60.175233,
        "lon": 24.82895
      },
      {
        "name": "Paciuksenkaari",
        "bikesAvailable": 6,
        "realtime": true,
        "lat": 60.1944475,
        "lon": 24.8911179
      },
      {
        "name": "Seurasaari",
        "bikesAvailable": 14,
        "realtime": true,
        "lat": 60.188399,
        "lon": 24.8847362
      },
      {
        "name": "Saunalahdentie",
        "bikesAvailable": 8,
        "realtime": true,
        "lat": 60.1926305828,
        "lon": 24.87922144235
      },
      {
        "name": "Torpanranta",
        "bikesAvailable": 17,
        "realtime": true,
        "lat": 60.1948358,
        "lon": 24.8713963
      },
      {
        "name": "Laajalahden aukio",
        "bikesAvailable": 12,
        "realtime": true,
        "lat": 60.19793090756802,
        "lon": 24.876221716500662
      },
      {
        "name": "Munkkiniemen aukio",
        "bikesAvailable": 8,
        "realtime": true,
        "lat": 60.1967196,
        "lon": 24.8840917
      },
      {
        "name": "Huopalahdentie",
        "bikesAvailable": 23,
        "realtime": true,
        "lat": 60.1996653,
        "lon": 24.8836209
      },
      {
        "name": "Ulvilantie",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.2038803,
        "lon": 24.8708833
      },
      {
        "name": "Muusantori",
        "bikesAvailable": 14,
        "realtime": true,
        "lat": 60.2071193,
        "lon": 24.8559544
      },
      {
        "name": "Suurpellonaukio",
        "bikesAvailable": 19,
        "realtime": true,
        "lat": 60.184596,
        "lon": 24.744131
      },
      {
        "name": "Keilaranta",
        "bikesAvailable": 11,
        "realtime": true,
        "lat": 60.178762,
        "lon": 24.835132
      },
      {
        "name": "Betonimies",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.180027,
        "lon": 24.831804
      },
      {
        "name": "Lukutori",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.187052,
        "lon": 24.742571
      },
      {
        "name": "Tekniikantie",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.180806,
        "lon": 24.824747
      },
      {
        "name": "Innopoli",
        "bikesAvailable": 9,
        "realtime": true,
        "lat": 60.185096,
        "lon": 24.81422
      },
      {
        "name": "Hagalundinpuisto",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.18363,
        "lon": 24.817403
      },
      {
        "name": "Aalto-yliopisto (M), Tietotie",
        "bikesAvailable": 5,
        "realtime": true,
        "lat": 60.184987,
        "lon": 24.820099
      },
      {
        "name": "Aalto-yliopisto (M), Korkeakouluaukio",
        "bikesAvailable": 19,
        "realtime": true,
        "lat": 60.184312,
        "lon": 24.826671
      },
      {
        "name": "Otaranta",
        "bikesAvailable": 29,
        "realtime": true,
        "lat": 60.18483,
        "lon": 24.837133
      },
      {
        "name": "Sähkömies",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.188499,
        "lon": 24.829985
      },
      {
        "name": "Jämeräntaival",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.188118,
        "lon": 24.835033
      },
      {
        "name": "Maarinranta",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.187261,
        "lon": 24.810199
      },
      {
        "name": "Tietäjä",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.189143,
        "lon": 24.807083
      },
      {
        "name": "Metsänneidonpolku",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.186731,
        "lon": 24.806152
      },
      {
        "name": "Kalevalantie",
        "bikesAvailable": 17,
        "realtime": true,
        "lat": 60.184765,
        "lon": 24.804022
      },
      {
        "name": "Louhentori",
        "bikesAvailable": 16,
        "realtime": true,
        "lat": 60.18715,
        "lon": 24.796959
      },
      {
        "name": "Pohjankulma",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.18288,
        "lon": 24.794014
      },
      {
        "name": "Koivu-Mankkaa",
        "bikesAvailable": 11,
        "realtime": true,
        "lat": 60.182976,
        "lon": 24.78576
      },
      {
        "name": "Länsiterminaali",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.150395628620245,
        "lon": 24.915862667368163
      },
      {
        "name": "Mankkaanlaaksontie",
        "bikesAvailable": 15,
        "realtime": true,
        "lat": 60.188706,
        "lon": 24.780478
      },
      {
        "name": "Länsisatamankuja",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.15693191359567,
        "lon": 24.912200440174857
      },
      {
        "name": "Merihaka",
        "bikesAvailable": 13,
        "realtime": true,
        "lat": 60.17806592826971,
        "lon": 24.958452215046275
      },
      {
        "name": "Mankkaanaukio",
        "bikesAvailable": 22,
        "realtime": true,
        "lat": 60.194599,
        "lon": 24.769021
      },
      {
        "name": "Opastinsilta",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.199235425819,
        "lon": 24.937826370875783
      },
      {
        "name": "A.I. Virtasen aukio",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.205674609517686,
        "lon": 24.962367446681693
      },
      {
        "name": "Ilmalan asema",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.206626437691405,
        "lon": 24.922219888430064
      },
      {
        "name": "Ruskeasuon varikko",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.20767995961701,
        "lon": 24.898667890628126
      },
      {
        "name": "Vanha Viertotie",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.211075296273414,
        "lon": 24.881660254358646
      },
      {
        "name": "Valimotie",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.215922235436786,
        "lon": 24.87646479282845
      },
      {
        "name": "Takomotie",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.21785454213256,
        "lon": 24.870539572354964
      },
      {
        "name": "Tapiolan urheilupuisto",
        "bikesAvailable": 27,
        "realtime": true,
        "lat": 60.177749,
        "lon": 24.784654
      },
      {
        "name": "Pajamäki",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.218807358014985,
        "lon": 24.85566795479381
      },
      {
        "name": "Urheilupuisto (M)",
        "bikesAvailable": 7,
        "realtime": true,
        "lat": 60.17465,
        "lon": 24.779428
      },
      {
        "name": "Haagan tori",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.21227524113252,
        "lon": 24.899551136356806
      },
      {
        "name": "Tunnelitie",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.21661653745581,
        "lon": 24.89954369574049
      },
      {
        "name": "Tontunmäentie",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.176107,
        "lon": 24.769667
      },
      {
        "name": "Huopalahden asema",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.218088561019165,
        "lon": 24.89505934373838
      },
      {
        "name": "Valimon asema",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.22229427877046,
        "lon": 24.875870912746144
      },
      {
        "name": "Olarinluoma",
        "bikesAvailable": 17,
        "realtime": true,
        "lat": 60.180848,
        "lon": 24.760606
      },
      {
        "name": "Pitäjänmäen asema",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.22431428805152,
        "lon": 24.85863812462164
      },
      {
        "name": "Jännetie",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.226769960915966,
        "lon": 24.85354095884256
      },
      {
        "name": "Niittymaa",
        "bikesAvailable": 36,
        "realtime": true,
        "lat": 60.171127,
        "lon": 24.775913
      },
      {
        "name": "Marttila",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.227143233822176,
        "lon": 24.873227365442304
      },
      {
        "name": "Pohjois-Haagan asema",
        "bikesAvailable": 8,
        "realtime": true,
        "lat": 60.230151499496536,
        "lon": 24.88312884546424
      },
      {
        "name": "Näyttelijäntie",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.23285213757895,
        "lon": 24.887434554817386
      },
      {
        "name": "Niittykumpu (M)",
        "bikesAvailable": 16,
        "realtime": true,
        "lat": 60.170758,
        "lon": 24.763184
      },
      {
        "name": "Ida Aalbergin tie",
        "bikesAvailable": 6,
        "realtime": true,
        "lat": 60.229408823326075,
        "lon": 24.892011409257975
      },
      {
        "name": "Haukilahdenkatu",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.166481,
        "lon": 24.772708
      },
      {
        "name": "Teljäntie",
        "bikesAvailable": 8,
        "realtime": true,
        "lat": 60.20969562580255,
        "lon": 24.868739477207995
      },
      {
        "name": "Thalianaukio",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.22534052315868,
        "lon": 24.894792651160333
      },
      {
        "name": "Munkkivuoren ostoskeskus",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.2059946,
        "lon": 24.8798291
      },
      {
        "name": "Huovitie",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.22197553556329,
        "lon": 24.903286646676616
      },
      {
        "name": "Haukilahdenaukio",
        "bikesAvailable": 15,
        "realtime": true,
        "lat": 60.162396,
        "lon": 24.775882
      },
      {
        "name": "Hämeenlinnanväylä",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.22746939884859,
        "lon": 24.906443561905945
      },
      {
        "name": "Vihdintie",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.208925,
        "lon": 24.8895209
      },
      {
        "name": "Vesakkotie",
        "bikesAvailable": 2,
        "realtime": true,
        "lat": 60.22794236805671,
        "lon": 24.926564764263762
      },
      {
        "name": "Hauenkallio",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.162477,
        "lon": 24.767831
      },
      {
        "name": "Kriikunakuja",
        "bikesAvailable": 9,
        "realtime": true,
        "lat": 60.2056785,
        "lon": 24.8916817
      },
      {
        "name": "Maunula",
        "bikesAvailable": 11,
        "realtime": true,
        "lat": 60.231319869075655,
        "lon": 24.935048840096293
      },
      {
        "name": "Tilkantori",
        "bikesAvailable": 6,
        "realtime": true,
        "lat": 60.2028392,
        "lon": 24.8934761
      },
      {
        "name": "Lepolantie",
        "bikesAvailable": 24,
        "realtime": true,
        "lat": 60.23910894200569,
        "lon": 24.92859501499382
      },
      {
        "name": "Haukilahdenranta",
        "bikesAvailable": 23,
        "realtime": true,
        "lat": 60.158048,
        "lon": 24.769864
      },
      {
        "name": "Korppaanmäentie",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.2034735,
        "lon": 24.8989297
      },
      {
        "name": "Kylävoudintie",
        "bikesAvailable": 3,
        "realtime": true,
        "lat": 60.22440378465167,
        "lon": 24.952561243589713
      },
      {
        "name": "Tenholantie",
        "bikesAvailable": 0,
        "realtime": true,
        "lat": 60.2024393,
        "lon": 24.9054609
      },
      {
        "name": "Kustaankartano",
        "bikesAvailable": 4,
        "realtime": true,
        "lat": 60.23039170479448,
        "lon": 24.94838914079226
      },
      {
        "name": "Radiokatu",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.20444389917,
        "lon": 24.91794928954
      },
      {
        "name": "Käskynhaltijantie",
        "bikesAvailable": 1,
        "realtime": true,
        "lat": 60.23268691593805,
        "lon": 24.958761529759155
      },
      {
        "name": "Hertanmäenkatu",
        "bikesAvailable": 1,
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
