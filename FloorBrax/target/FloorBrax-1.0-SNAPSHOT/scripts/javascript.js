$( function() {
        $( "#datepicker" ).datepicker();
        } );

var date = "";

function toEdit() {
    document.getElementById("save").hidden = false;
    document.getElementById("edit").hidden = true;
    document.getElementById("order_num").disabled = false;
    document.getElementById("datepicker").disabled = false;
    document.getElementById("details").disabled = false;
    document.getElementById("status").hidden = false;
    document.getElementById("statusDis").hidden = true;
    document.getElementById("status").value = document.getElementById("statusDis").value;
    document.getElementById("installer").hidden = false;
    document.getElementById("installerDis").hidden = true;
    document.getElementById("installer").value = document.getElementById("installerDis").value;

    document.getElementById("upload").hidden = false;
    document.getElementById("clickToSee").hidden = true;
    document.getElementById("rowService").hidden = true;
    document.getElementById("rowserviceEdit").hidden = false;
    document.getElementById("subdivision").hidden = false;
    document.getElementById("sub").hidden = true;
    document.getElementById("subdivision").value = document.getElementById("sub").value;
    setDate();
    document.getElementById("order_num").style.color = "black";
    document.getElementById("statusDis").style.color = '#ff0000';
    document.getElementById("addedInfo").hidden = true;
    document.getElementById("addedMessage").hidden = true;
}

function printFunction(){
    window.print();
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
            console.log("lou");
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
    document.getElementById("extraCost").value = "$" + extraCost + ".00";
}

function checkBench() {
    if (document.getElementById("bench").checked) {
        extraText += "Bench +$100\r\n";
        extraCost += 100;
    } else {
        extraText = extraText.replace("Bench\r\n", "");
        extraCost -= 100;
    }
    document.getElementById("extraCost").value = "$" + extraCost + ".00";
}

function addExtraLeave() {

    if (document.getElementById("addedExtraCost").value === "0") {
        extraCost -= extra;

    } else {
        extra = parseInt(document.getElementById("addedExtraCost").value);
        extraCost += extra;
    }

    document.getElementById("extraCost").value = "$" + extraCost + ".00";
}

function addExtraEntry() {
    if (document.getElementById("addedExtraCost").value !== "0") {
        document.getElementById("addedExtraCost").value = 0;
    }
}

function onChangeSelect() {
    var selected = document.getElementById("service");
    var serviceSelected = selected.options[selected.selectedIndex].text;
    document.getElementById("soapniche").disabled = (serviceSelected === "Shower" || serviceSelected === "Shower Surround") ? false : true;
    document.getElementById("bench").disabled = (serviceSelected === "Shower" || serviceSelected === "Shower Surround") ? false : true;
    document.getElementById("sqf").disabled = (serviceSelected === "Tile Floor" || serviceSelected === "Hardwood Floor") ? false : true;
    document.getElementById("sqf").disabled = (serviceSelected === "Tile Floor" || serviceSelected === "Hardwood Floor") ? false : true;
    document.getElementById("sqfDitra").disabled = (serviceSelected === "Tile Floor") ? false : true;
}

function getService() {
    var service = document.getElementById("service");
    var serviceSelected = service.options[service.selectedIndex].text;
    var options = "";
    var copyOfServices = "";

    document.getElementById(serviceSelected).disabled = true;

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

    document.getElementById("ec").value = extraCost;

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

    document.getElementById("servicesPlaceholder").value = copyOfServices;

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
        document.getElementById("sftPH").value = '';
        document.getElementById("sftDPH").value = '';
    }
    if (serviceSelected === "Hardwood Floor") {
        document.getElementById("sftHPH").value = '';
    }

    listOfServices.splice(service.selectedIndex, 1);
    service.remove(service.selectedIndex);
    var copyOfServices = "";
    for (var i = 0; i < listOfServices.length; i++) {
        copyOfServices += "%" + listOfServices[i] + "%";
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