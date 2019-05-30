# Powershell Azure Function Stock Data

Stock Data + an Interactive Grid - served from PowerShell Azure Functions.

Check out [Awesome Powershell Azure Functions](https://github.com/dfinke/awesome-powershell-azure-functions)

# Some Prerequisites

- [Install .NET Core SDK 2.2+](https://dotnet.microsoft.com/download) (required by Azure Functions Core Tools and available on all supported platforms).
- Install version 2.x of the [Azure Functions Core Tools](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local#v2).

# How To Run

1. `git clone https://github.com/dfinke/powershell-azure-function-stockdata.git`
1. cd `powershell-azure-function-helloworld`
1. `func start --cors *`
1. Paste into a browser `http://localhost:7071/api/StockDataView`