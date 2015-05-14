<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Mvcproject.WebForm2" %>

<!DOCTYPE html>
<html>
<head>
    <base href="http://demos.telerik.com/kendo-ui/grid/mvvm">
    <style>html { font-size: 12px; font-family: Arial, Helvetica, sans-serif; }</style>
    <title></title>
    <link href="http://cdn.kendostatic.com/2014.2.716/styles/kendo.common.min.css" rel="stylesheet" />
    <link href="http://cdn.kendostatic.com/2014.2.716/styles/kendo.default.min.css" rel="stylesheet" />
    <link href="http://cdn.kendostatic.com/2014.2.716/styles/kendo.dataviz.min.css" rel="stylesheet" />
    <link href="http://cdn.kendostatic.com/2014.2.716/styles/kendo.dataviz.default.min.css" rel="stylesheet" />
    <script src="http://cdn.kendostatic.com/2014.2.716/js/jquery.min.js"></script>
    <script src="http://cdn.kendostatic.com/2014.2.716/js/angular.min.js"></script>
    <script src="http://cdn.kendostatic.com/2014.2.716/js/kendo.all.min.js"></script>
	<link rel="stylesheet" href="../content/shared/styles/examples-offline.css">
	<script src="../content/shared/js/console.js"></script>
     <style>
        body {
            background-color: #DDDDDD;
        }

        header {
            text-align: center;
            border-radius: 20px;
            background-color: #FFFFFF;
            min-height: 60px;
        }

        #application {
            border-radius: 20px;
            background-color: #FFFFFF;
            margin-right: 170px;
            min-height: 350px;
        }

            #application > div {
                margin-left: 20px;
                margin-top: 20px;
            }

        nav {
            width: 150px;
            float: right;
            background-color: #FFFFFF;
            border-radius: 0px 20px 0px 20px;
            min-height: 100px;
        }

            nav ul {
                margin-left: auto !important;
                margin-right: auto !important;
                width: 120px;
                margin-top: 20px !important;
                margin-bottom: 20px !important;
                border: none !important;
            }

        #carPicture {
            display: inline-block;
            width: 150px;
            float: left;
        }

        #content {
            padding-top: 15px;
        }
    </style>
</head>
<body>
      <script type="text/kendo-tmpl" id="home">
     <div id="example">
    <div class="demo-section k-header">
        <div class="box-col">
            <h4>Add or update a record</h4>
            <div data-role="grid"
                 date-scrollable="true"
                 data-editable="true"
                 data-toolbar="['create', 'save']"
                 data-columns="[
                                 { 'field': 'ProductName', 'width': 270 },
                                 { 'field': 'UnitPrice' },
                              ]"
                 data-bind="source: products,
                            visible: isVisible,
                            events: {
                              save: onSave
                            }"
                ></div>
        </div>
      
    </div>
   </div>
   </script>
      <script>
          var viewModel = kendo.observable({
              isVisible: true,
              onSave: function (e) {
                  kendoConsole.log("event :: save(" + kendo.stringify(e.values, null, 4) + ")");
              },
              products: new kendo.data.DataSource({
                  schema: {
                      model: {
                          id: "ProductID"
                      }
                  },
                  batch: true,
                  transport: {
                      read: {
                          //url: "http://demos.telerik.com/kendo-ui/service/products",
                          dataType: "jsonp",
                      },
                    
                      }
                  
              })
          });
          kendo.bind($("#example"), viewModel);
          var viem = new kendo.View("#home", { model: viewModel });
          var layout = new kendo.Layout("<section id='content'></section>");
          layout.render($("#application"));
          
          $("#showHome").on("click", function () {
              alert("hiiii");
              layout.showIn("#content", viem);
          });
</script>
    
      <div id="section">

            <nav>
                <ul>
                    <li><a id="showHome" href="#">home</a></li>
                    <li><a id="showCars" href="#">myCars</a></li>
                    <li><a id="showAboutme" href="#">aboutMe</a></li>
                </ul>

            </nav>

            <div id="application">
            </div>
        </div>
     
 

</body>
</html>
