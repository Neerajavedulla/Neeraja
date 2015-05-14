<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Mvcproject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="Scripts/jquery-1.11.0.min.js"></script>   
    <script src="Scripts/jquery-1.7.1.min.js"></script>
    <link href="kendo/styles/kendo.common.min.css" rel="stylesheet"/>
    <link href="kendo/styles/kendo.default.min.css" rel="stylesheet"/>
     <script src="kendo/js/kendo.all.min.js"></script>

 <%--<link href="http://cdn.kendostatic.com/2014.2.716/styles/kendo.common.min.css" rel="stylesheet" />
    <link href="http://cdn.kendostatic.com/2014.2.716/styles/kendo.default.min.css" rel="stylesheet" />
    <link href="http://cdn.kendostatic.com/2014.2.716/styles/kendo.dataviz.min.css" rel="stylesheet" />
    <link href="http://cdn.kendostatic.com/2014.2.716/styles/kendo.dataviz.default.min.css" rel="stylesheet" />
 <script src="http://cdn.kendostatic.com/2014.2.716/js/angular.min.js"></script>

   <script src="http://cdn.kendostatic.com/2014.2.716/js/jquery.min.js"></script>
    <script src="http://cdn.kendostatic.com/2014.2.716/js/kendo.all.min.js"></script>--%>
	
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
        .k-floatwrap, .k-slider-items, .k-grid-toolbar {
        display: -webkit-box;}
    </style>
    <script>
        $(document).ready(function () {

            var viewModel = new kendo.observable({
                isVisible: true,
                onSave: function (e) {                   
                    kendoConsole.log("event :: save(" + kendo.stringify(e.values, null, 4) + ")");
                },
                products : new kendo.data.DataSource({
                   
                    schema: {
                        model: {
                            id: "EmpID"
                        }
                    },
                    batch: true,
                    transport: {
                        read: {
                            url: "http://localhost:50252/api/Employee",
                            dataType: "json"
                        },
                       
                    }
                })
            });          
            kendo.bind($("#example"), viewModel);
          
           
            $("nav > ul").kendoMenu({ orientation: "vertical" });

            var carsViewModel = new kendo.observable(
                {

                    name: "Audi",
                    model: "A8",
                    cost: 200000,
                    pictureUrl: "http://d3403mtifmmdhn.cloudfront.net/new_experience_touts/images/49/original/1MYCO_A8_Photos_Tout_13TDI_A8b002x_r8_RGB.jpg?1342493775"
                });
         
         
           // var viewHome = new kendo.View("#home");
            var viem = new kendo.View("#home", {model:viewModel});
            var viewCars = new kendo.View("#myCars", { model: carsViewModel });
            var viewAboutMe = new kendo.View("#aboutMe");

            var layout = new kendo.Layout("<section id='content'></section>");

            layout.render($("#application"));

            $("#showHome").on("click", function () {
                layout.showIn("#content", viem);
                //layout.showIn("#content", viewHome);
            });
            $("#showCars").on("click", function () {
                layout.showIn("#content", viewCars);
            });
            $("#showAboutme").on("click", function () {
                layout.showIn("#content", viewAboutMe);
            });

            var router = new kendo.Router();
            //router.route("/", function () {
            //    layout.showIn("#content", viewHome);
            //});
            //router.route("/mycars", function () {
            //    layout.showIn("#content", viewCars);
            //});
            router.route("/aboutme", function () {
                layout.showIn("#content", viewAboutMe);
            });

            $(function () {
                router.start();
            });

        });

    </script>
       <script type="text/kendo-tmpl" id="home">
            <h4>Add or update a record</h4>
            <div data-role="grid"
                 date-scrollable="true"
                 data-editable="true"               
                 data-toolbar="['create', 'save']"
                 data-columns="[
                                 { 'field': 'EmpID', 'width': 270 },
                                 { 'field': 'Location' },
                              ]"
                data-bind="source: products,
                            visible: isVisible,
                            events: {
                              save: onSave
                            }"
                 style="width: 480px; height: 200px"></div>
       </script>
   
        <script type="text/kendo-tmpl" id="myCars">
    <div>
        <img id="carPicture" data-bind="attr: { src: pictureUrl}" />
        <div id="Name" data-bind="text: name"></div>
        <div id="Name" data-bind="text: model"></div>
        <div id="Name" data-bind="text: cost"></div>
    </div>
        </script>
        <script type="text/kendo-tmpl" id="aboutMe">
            <div >Hi guys I'm Simeon Nenov :))<br />
        You can visit my blog at <a href="http://ssnenov.wordpress.com">http://ssnenov.wordpress.com</a>
        </div>

        </script>
    <script>     
          
</script>

  
</head>
<body>
    <form id="form1" runat="server">
       <div id="example"></div>
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
  
 
    </form>
</body>
</html>
