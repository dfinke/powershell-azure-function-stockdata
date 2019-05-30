﻿param($Request, $TriggerMetadata)

$symbols = $Request.Query.symbols
if (!$symbols) { $symbols = "msft,ibm,aapl,xom,ge,nflx" }

$data = Invoke-RestMethod "https://api.iextrading.com/1.0/stock/market/batch?symbols=$($symbols)&types=quote&last=1"

$data = $(
    foreach ($name in $data.psobject.Properties.name) {
        $data.$name.quote
    }
) | Select-Object Symbol, CompanyName, Sector, Open, Close, High, Low, YTDChange | ConvertTo-Json

Push-OutputBinding -Name Response -Value @{
    StatusCode = "ok"
    Body       = $data
}