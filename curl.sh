#!/bin/sh

# https://digitransit.fi/en/developers/apis/1-routing-api/bicycling/

read -r -d '' QUERY <<EOF 
{
  bikeRentalStations {
    name
    stationId
  }
}
EOF

curl -v \
    -X POST \
    -H "Content-Type: application/graphql" \
    -d "$QUERY" \
    'https://api.digitransit.fi/routing/v1/routers/hsl/index/graphql'
