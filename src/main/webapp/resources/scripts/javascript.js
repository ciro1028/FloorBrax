$( function() {
        $( "#datepicker" ).datepicker();
        } );

var date = "";

function selectFieldForSearch(field){
	if(field === "range"){
		document.getElementById("dateRangeField").hidden = false;
		document.getElementById("valueToPass").hidden = true;
		document.getElementById("valueToPass").required = false;
		
	} else {
		document.getElementById("dateRangeField").hidden = true;
		document.getElementById("valueToPass").hidden = false;
	}
}


function selectSearch(){
	
	var result = document.getElementById("selectCheck").value;
	switch(result){
		case "num":
			document.getElementById("ordernumber").setAttribute("class", "btn btn-outline-danger active");
			document.getElementById("num").setAttribute("checked", "");
			break;
		case "range":
			document.getElementById("dateRangeField").hidden = false;
			document.getElementById("valueToPass").hidden = true;
			document.getElementById("valueToPass").required = false;
			document.getElementById("rang").setAttribute("class", "btn btn-outline-danger active");
			document.getElementById("ordernumber").checked = true;
			break;
		case "installer":
			document.getElementById("inst").setAttribute("class", "btn btn-outline-danger active");
			break;
		case "service":
			document.getElementById("svc").setAttribute("class", "btn btn-outline-danger active");
			break;
		case "subdivision":
			document.getElementById("sub").setAttribute("class", "btn btn-outline-danger active");
			break;
		default:
			document.getElementById("ordernumber").setAttribute("class", "btn btn-outline-danger active");
			document.getElementById("num").setAttribute("checked", "");
			break;	
	}
}

function selectSubId(){
	var sub = document.getElementById("subdivision");
    var subSelected = sub.options[sub.selectedIndex].text;
    var id = "";
    for(i = 0; i < 5; i++){
    	if (subSelected.charAt(i) !== " "){
    		id += subSelected.charAt(i);
    	} else {
    		break;
    	}
    }
	document.getElementById("subId").value = id;
}

function formatDate(){
	var date = document.getElementById("datepicker").value;
	var dateArray = date.split("/");
	var formattedDate = dateArray[2] + "/";
	formattedDate += dateArray[0] + "/";
    formattedDate += dateArray[1];
    document.getElementById("date").value = formattedDate;
}

function selectInstallerId(){
	var installer = document.getElementById("installer");
    var installerSelected = installer.options[installer.selectedIndex].text;
    var id = "";
    for(i = 0; i < 5; i++){
    	if (installerSelected.charAt(i) !== " "){
    		id += installerSelected.charAt(i);
    	} else {
    		break;
    	}
    }
	document.getElementById("installerId").value = id;
}

function enablePicUpload(){
	var name = document.getElementById("orderNum").value
	if(name !== ""){
		document.getElementById("file").disabled = false;
	} else {
		document.getElementById("file").disabled = true;
	}
	document.getElementById("userId").value = document.getElementById("user").innerHTML;
}

function toEdit() {
    document.getElementById("save").hidden = (document.getElementById("save").hidden) ? false : true;
    document.getElementById("edit").hidden = (document.getElementById("edit").hidden) ? false : true;
    document.getElementById("cancel").hidden = (document.getElementById("cancel").hidden) ? false : true;
    document.getElementById("print").hidden = (document.getElementById("print").hidden) ? false : true;
    document.getElementById("order_num").disabled = false;
    document.getElementById("datepicker").disabled = false;
    document.getElementById("detailsShow").hidden = true;
    document.getElementById("details").hidden = false;
    document.getElementById("editOrder").value = "true";
    document.getElementById("details").innerHtml = document.getElementById("detailsShow").innerHtml;
    document.getElementById("status").hidden = (document.getElementById("status").hidden) ? false : true;
    document.getElementById("statusDis").hidden = (document.getElementById("statusDis").hidden) ? false : true;
    document.getElementById("status").value = document.getElementById("statusDis").value;
    document.getElementById("installer").hidden = (document.getElementById("installer").hidden) ? false : true;
    document.getElementById("installerDis").hidden = (document.getElementById("installerDis").hidden) ? false : true;
    document.getElementById("installer").value = document.getElementById("installerDis").value;

    document.getElementById("upload").hidden = (document.getElementById("upload").hidden) ? false : true;
    document.getElementById("clickToSee").hidden = (document.getElementById("clickToSee").hidden) ? false : true;
    document.getElementById("rowService").hidden = (document.getElementById("rowService").hidden) ? false : true;
    document.getElementById("rowserviceEdit").hidden = (document.getElementById("rowserviceEdit").hidden) ? false : true;
    document.getElementById("subdivision").hidden = (document.getElementById("subdivision").hidden) ? false : true;
    document.getElementById("sub").hidden = (document.getElementById("sub").hidden) ? false : true;
    document.getElementById("subdivision").value = document.getElementById("sub").value;
    setDate();
    document.getElementById("order_num").style.color = "black";
    document.getElementById("statusDis").style.color = '#ff0000';
    document.getElementById("addedInfo").hidden = (document.getElementById("addedInfo").hidden) ? false : true;
    document.getElementById("addedMessage").hidden = (document.getElementById("addedMessage").hidden) ? false : true;
}

function printFunction(){
    var restorePage = document.body.innerHTML;
    document.getElementById("buttons").hidden = true;
    document.getElementById("one").hidden = false;
    var printcontent = document.getElementById("zero").innerHTML + document.getElementById("one").innerHTML + document.getElementById("two").innerHTML + document.getElementById("three").innerHTML; 
    
    document.body.innerHTML = printcontent;
    window.print();
    document.body.innerHTML = restorePage;
    document.getElementById("one").hidden = true;
    document.getElementById("buttons").hidden = false;
}

function printFunctionInstaller(){
    var restorePage = document.body.innerHTML;
    document.getElementById("buttons").hidden = true;
    document.getElementById("one").hidden = false;
    document.getElementById("printButton").hidden = true;
    var printcontent = document.getElementById("zero").innerHTML + document.getElementById("one").innerHTML + 
            document.getElementById("two").innerHTML + document.getElementById("three").innerHTML + 
            document.getElementById("four").innerHTML + document.getElementById("five").innerHTML; 
    
    document.body.innerHTML = printcontent;
    window.print();
    document.body.innerHTML = restorePage;
    document.getElementById("one").hidden = true;
    document.getElementById("buttons").hidden = false;
    document.getElementById("printButton").hidden = false;
}

$('.port-item').click(function(){
  $('.collapse').collapse('hide');
});
$(document).on('click', '[data-toggle="lightbox"]', function(event) {
            event.preventDefault();
            $(this).ekkoLightbox();
});

function setPending() {
    if (document.getElementById("statusDis").value === "Pending") {
        document.getElementById("statusDis").style.color = '#ff0000';
    } else {
        document.getElementById("statusDis").class = "blue";
    }
}

function setDate() {
    var value = document.getElementById("datepicker").value;
    var date = new Date(value);
    var options = {
        weekday: "long",
        year: "numeric",
        month: "short",
        day: "numeric",
        hour: "2-digit",
        minute: "2-digit"
    };

    document.getElementById("datepicker").value = date.toLocaleDateString("en-US");
}

function getStatus() {
    var orders = document.getElementById("orders_num").value;
    var ordersArray = orders.split("%");
    
    for (var i = 0; i < ordersArray.length - 1; i++) {
        var currentStatus = document.getElementById(ordersArray[i] + "&").innerHTML;
        if (currentStatus === "Pending") {
            document.getElementById(ordersArray[i] + "&").style.color = "red";
            document.getElementById(ordersArray[i] + "*").innerHTML = "Mark as Completed";
        } else {
            document.getElementById(ordersArray[i] + "&").style.color = "green";
            document.getElementById(ordersArray[i] + "*").innerHTML = "Mark as Pending";
        }
    }
}

var serviceText = "";
var listOfServices = [];
var extraText = "";
var extraCost = 0;
var extra = 0;

function checkNiche() {
    if (document.getElementById("soapniche").checked) {
        extraText += "Soap Niche +$100\r\n";
        extraCost += 100;
    } else {
        extraText = extraText.replace("Soap Niche\r\n", "");
        extraCost -= 100;
    }
    document.getElementById("extraCost").value = extraCost;
}

function checkBench() {
    if (document.getElementById("bench").checked) {
        extraText += "Bench +$100\r\n";
        extraCost += 100;
    } else {
        extraText = extraText.replace("Bench\r\n", "");
        extraCost -= 100;
    }
    document.getElementById("extraCost").value = extraCost;
}

function addExtraLeave() {

    if (document.getElementById("addedExtraCost").value === "0") {
        extraCost -= extra;

    } else {
        extra = parseInt(document.getElementById("addedExtraCost").value);
        extraCost += extra;
    }

    document.getElementById("extraCost").value = extraCost;
}

function addExtraEntry() {
    if (document.getElementById("addedExtraCost").value !== "0") {
        document.getElementById("addedExtraCost").value = 0;
    }
}

function onChangeSelect() {
    var selected = document.getElementById("service");
    var serviceSelected = selected.options[selected.selectedIndex].text;
    document.getElementById("sqftDiv").hidden = (serviceSelected === "Tile Floor" || serviceSelected === "Hardwood Floor") ? false : true;
    document.getElementById("sqfDitraDiv").hidden = (serviceSelected === "Tile Floor") ? false : true;
    document.getElementById("showerExtras").hidden = (serviceSelected === "Shower" || serviceSelected === "Shower Surround") ? false : true;
}

function getService() {
    var service = document.getElementById("service");
    var serviceSelected = service.options[service.selectedIndex].text;
    var options = "";
    var copyOfServices = "";

    if(serviceSelected !== ""){
    	document.getElementById(serviceSelected).disabled = true;
    }
    

    serviceText = serviceSelected + "\r\n";
    listOfServices.push(serviceText);

    for (var i = 0; i < listOfServices.length; i++) {
        options += "<option value='" + i + "'>" + listOfServices[i] + "</option>";
    }

    document.getElementById("listOfServices").innerHTML = options;
    if (document.getElementById("addedExtraCost").value !== "0") {
        document.getElementById("details").innerHTML =
            extraText + "\r\n" + document.getElementById("addedExtraDesc").value + " +$" +
            document.getElementById("addedExtraCost").value;
    } else {
        document.getElementById("details").innerHTML =
            extraText + "\r\n" + document.getElementById("addedExtraDesc").value;
    }

    for (var i = 0; i < listOfServices.length; i++) {
        copyOfServices += listOfServices[i] + "%";
    }

    if (serviceSelected === "Tile Floor") {
        document.getElementById("sftPH").value = document.getElementById("sqf").value;
        document.getElementById("sftDPH").value = document.getElementById("sqfDitra").value;
    }

    if (serviceSelected === "Hardwood Floor") {
        document.getElementById("sftHPH").value = document.getElementById("sqf").value;
    }

    document.getElementById("servicesPlaceholder").value += copyOfServices;

    serviceText = "";
    options = "";
    document.getElementById("soapniche").checked = false;
    document.getElementById("bench").checked = false;
    document.getElementById("option0").selected = true;
    document.getElementById("sqf").value = '';
    document.getElementById("sqfDitra").value = '';
    document.getElementById("sqf").disabled = true;
    document.getElementById("sqfDitra").disabled = true;
}



function removeService() {
    var service = document.getElementById("listOfServices");
    var serviceSelected = service.options[service.selectedIndex].text;

    document.getElementById(serviceSelected).disabled = false;
    if (serviceSelected === "Tile Floor") {
        document.getElementById("sftPH").value = '0';
        document.getElementById("sftDPH").value = '0';
    }
    if (serviceSelected === "Hardwood Floor") {
        document.getElementById("sftHPH").value = '0';
    }

    listOfServices.splice(service.selectedIndex, 1);
    service.remove(service.selectedIndex);
    var copyOfServices = "";
    for (var i = 0; i < listOfServices.length; i++) {
        copyOfServices += "%" + listOfServices[i] + "%";
    }
    
    var newServices = document.getElementById("servicesPlaceholder").value;
    var svcArray = newServices.split("%");
    for(var i = 0; i < svcArray.length; i++){
    	if(svcArray[i] === serviceSelected){
    		svcArray[i] = "";
    		break
    	}
    }
    
    for(var i = 0; i < svcArray.length; i++){
    	if(svcArray[i] !== ""){
    		copyOfServices += svcArray[i] + "%";
    	}
    }
    

    document.getElementById("servicesPlaceholder").value = copyOfServices;
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode !== 46 && charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

function showAll() {
    document.getElementById("allServices").hidden = (document.getElementById("allServices").hidden) ? false : true;
}

$(function() {
    var start = moment().subtract(29, 'days');
    var end = moment();

    function cb(start, end) {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
    }

    $('#reportrange').daterangepicker({
        startDate: start,
        endDate: end,
        ranges: {
           'Today': [moment(), moment()],
           'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
           'Last 7 Days': [moment().subtract(6, 'days'), moment()],
           'Last 30 Days': [moment().subtract(29, 'days'), moment()],
           'This Month': [moment().startOf('month'), moment().endOf('month')],
           'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        }
    }, cb);

    cb(start, end);

});