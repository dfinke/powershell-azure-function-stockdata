param($Request, $TriggerMetadata)

Push-OutputBinding -Name Response -Value @{
    StatusCode  = "ok"
    ContentType = "text/html"
    Body        = Get-Content -Raw "$PSScriptRoot\index.html"
}