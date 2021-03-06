# Powershell Azure Function Stock Data

Stock Data + an Interactive Grid - data and web page served from PowerShell Azure Functions.

![](/images/GetStockData.png)

> Try the version deployed in Azure https://powershell-stockdata.azurewebsites.net/api/StockDataView

## Check out [Awesome Powershell Azure Functions](https://github.com/dfinke/awesome-powershell-azure-functions)

# Some Prerequisites

- You need am IEX token, setup one here https://iexcloud.io/docs/api/#introduction
    - set "IEXToken" in `local.settings.json` for local testing and in the `Application Settings` in the Azure portal.
- [Install .NET Core SDK 2.2+](https://dotnet.microsoft.com/download) (required by Azure Functions Core Tools and available on all supported platforms).
- Install version 2.x of the [Azure Functions Core Tools](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local#v2).

# How To Run

1. `git clone https://github.com/dfinke/powershell-azure-function-stockdata.git`
1. cd `powershell-azure-function-stockdata`
1. `func start --cors *`
1. Paste into a browser `http://localhost:7071/api/StockDataView`