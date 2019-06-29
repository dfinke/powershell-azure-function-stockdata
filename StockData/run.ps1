param($Request, $TriggerMetadata)

$token = $env:iextoken
if (!$token) {
    $msg = "You need am IEX token, setup one here https://iexcloud.io/docs/api/#introduction"
    Write-Error $msg

    Push-OutputBinding -Name Response -Value @{
        StatusCode = "badrequest"
        Body       = $msg
    }
    return
}

$symbols = $Request.Query.symbols
if (!$symbols) { $symbols = "msft,ibm,aapl,xom,ge,nflx" }

$baseurl = "https://cloud.iexapis.com/v1"
$data = Invoke-RestMethod "$baseurl/stock/market/batch?symbols=$($symbols)&types=quote&last=1&token=$($token)"

$result = @()
foreach ($name in $data.psobject.Properties.name) {
    # $result += $data.$name.quote |Select-Object Symbol, CompanyName, Open, Close, High, Low, YTDChange, AvgTotalVolume

    $current = $data.$name.quote
    $result += [PSCustomObject][Ordered]@{
        Symbol                 = $current.Symbol
        'Company Name'         = $current.CompanyName
        Open                   = $current.Open
        Close                  = $current.Close
        High                   = $current.High
        Low                    = $current.Low
        'YTD Change'           = $current.YTDChange
        'Average Total Volume' = $current.AvgTotalVolume
    }
}

Push-OutputBinding -Name Response -Value @{
    StatusCode = "ok"
    Body       = $result
}