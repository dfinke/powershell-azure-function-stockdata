﻿param($Request, $TriggerMetadata)

$html = @"
<html>

<head>
    <link href="https://unpkg.com/tabulator-tables@4.2.7/dist/css/tabulator.min.css" rel="stylesheet">

    <script type="text/javascript" src="https://unpkg.com/tabulator-tables@4.2.7/dist/js/tabulator.min.js"></script>
    <script src="https://unpkg.com/vue/dist/vue.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"> </script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            new Vue({
                el: '#sg1',
                data: {
                    symbols: "msft,ibm",
                    table: ""
                },
                methods: {
                    getStockData: function () {
                        var url = '/api/StockData?symbols=' + this.symbols;
                        axios.get(url)
                            .then(response => {
                                this.table = new Tabulator("#table", {
                                    data: response.data,
                                    autoColumns: true,
                                });

                            });
                    }
                }
            })
        })
    </script>
</head>

<body>
    <div id="sg1">
        <b>Symbols</b>: <input type="text" name="symbols" v-model="symbols">
        <button v-on:click="getStockData">Get Stock Data</button>
        <br>
        <br>
        <br>
        <div id="table"></div>
    </div>
</body>

</html>
"@

Push-OutputBinding -Name Response -Value @{
    StatusCode  = "ok"
    ContentType = "text/html"
    Body        = $html
}