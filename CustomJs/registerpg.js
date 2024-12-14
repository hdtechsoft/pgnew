
function validateregform() {
    debugger;
    var submitform = true;
    var dateonlypending = true;

    var x = document.getElementById("err_txtconfpassmismatch");
    x.style.display = "none";

    val = document.getElementById("txtconfpass").value;
    field = "err_" + "txtconfpass";
    x = document.getElementById(field);
    if (val == "") {
        //x.style.display = "block";         
        let orgField = document.getElementById("txtconfpass")
        orgField.style.borderColor = "red";
        document.getElementById("txtconfpass").focus();
        submitform = false;
    }
    else {
        x.style.display = "none";
    }

    val = document.getElementById("txtpass").value;
    field = "err_" + "txtpass";
    x = document.getElementById(field);

    if (val == "") {
        // x.style.display = "block";
        var orgField = document.getElementById("txtpass")
        orgField.style.borderColor = "red";
        document.getElementById("txtpass").focus();
        submitform = false;
    }
    else {
        //x.style.display = "none";
    }


    val = document.getElementById("txtloginid").value;
    field = "err_" + "txtloginid";
    x = document.getElementById(field);
    if (val == "") {
        //x.style.display = "block";
        var orgField = document.getElementById("txtloginid")
        orgField.style.borderColor = "red";
        document.getElementById("txtloginid").focus();
        submitform = false;
    }
    else {
        //x.style.display = "none";
    }


    val = document.getElementById("txtNeetRollNo").value;
    field = "err_" + "txtNeetRollNo";
    x = document.getElementById(field);

    if (val == "") {
        //x.style.display = "block";
        var orgField = document.getElementById("txtNeetRollNo")
        orgField.style.borderColor = "red";

        document.getElementById("txtNeetRollNo").focus();
        submitform = false;
    }
    else {
        //x.style.display = "none";
    }


    val = document.getElementById("txtMedicalCouncilNumber").value;
    field = "err_" + "txtMedicalCouncilNumber";
    x = document.getElementById(field);

    if (val == "") {
        //x.style.display = "block";
        var orgField = document.getElementById("txtMedicalCouncilNumber")
        orgField.style.borderColor = "red";

        document.getElementById("txtMedicalCouncilNumber").focus();
        submitform = false;
    }
    else {
        //x.style.display = "none";
    }
       

    if (document.getElementById("hd_gender").value == "") {
        field = "err_" + "rdogender";
        x = document.getElementById(field);
        //x.style.display = "block";
        //var orgField = document.getElementById("rdo_Male")
        //orgField.style.borderColor = "red";
        //document.getElementById("hd_gender").focus();

        var orgField = document.getElementById("genderRow")
        //orgField.style.borderColor = "red";
        orgField.style.border = "1px solid red";
        document.getElementById("genderRow").focus();
        submitform = false;


        document.getElementById("rdo_Male").focus();

    }
    else {
        /* field = "err_" + "rdogender";
         x = document.getElementById(field);
         x.style.display = "none";*/
    }



    val = document.getElementById("datepicker").value;
    field = "err_" + "datepicker";
    x = document.getElementById(field);

    if (val == "") {
        //x.style.display = "block";
        var orgField = document.getElementById("datepicker")
        orgField.style.borderColor = "red";

        //document.getElementById("datepicker").focus();
        //submitform = false;
        dateonlypending = false;
    }
    else {
        //  x.style.display = "none";
        // change the format to mm/dd/yyyy
        debugger;
        var strarr = val.split("/");
        var str2 = strarr[1] + "/" + strarr[0] + "/" + strarr[2]
        document.getElementById("hd_datepicker").value = str2
    }

    val = document.getElementById("txtemail").value;
    field = "err_" + "txtemail";
    x = document.getElementById(field);
    if (val == "") {
        x.innerHTML = "Should not be blank";
        var orgField = document.getElementById("txtemail")
        orgField.style.borderColor = "red";
        //x.style.display = "block";

        document.getElementById("txtemail").focus();
        submitform = false;
    }
    else {

        if (ValidateEmail(val) == false) {
            var field = "err_" + id;
            var x = document.getElementById(field);
            x.innerHTML = "Not a valid email address."
            x.style.display = "block";
            document.getElementById("txtemail").focus();
            submitform = false;
        }

        //x.style.display = "none";
        x.style.borderColor = "#cccccc";
    }


    val = document.getElementById("txtmobile").value;
    field = "err_" + "txtmobile";
    x = document.getElementById(field);

    if (val == "") {
        //x.style.display = "block";
        var orgField = document.getElementById("txtmobile")
        orgField.style.borderColor = "red";
        submitform = false;
        document.getElementById("txtmobile").focus();
    }
    else {
        //x.style.display = "none";
    }

    var val = document.getElementById("txtname").value;
    var field = "err_" + "txtname";
    var x = document.getElementById(field);

    if (val == "") {
        //x.style.display = "block";        
        var orgField = document.getElementById("txtname")
        orgField.style.borderColor = "red";

        document.getElementById("txtname").focus();
        submitform = false;
    }
    else {
        //x.style.display = "none";
    }


    // #########################

    if ((submitform == true) && (dateonlypending == false)) {
        document.getElementById("datepicker").focus();
        submitform = false;
    }

    var passval = document.getElementById("txtpass").value;
    var confpassval = document.getElementById("txtconfpass").value;

    if (passval != "") {
        if ((passval.length) <= 6) {
            alert("Password length should be minimum 6 characters");
            submitform = false;
        }
    }

    if (passval != confpassval) {
        submitform = false;
        x = document.getElementById("err_txtconfpassmismatch");
        x.style.display = "block";
        document.getElementById("txtconfpass").focus();
    }




    if (submitform == true) {
        window.scrollTo(0, 0);
        showloading("0");
        document.getElementById("hd_submitfor").value = "Registration"
        document.getElementById("form1").action = "registerpg.aspx";
        document.getElementById("form1").method = "post";
        document.getElementById("form1").submit();
    }

    // txtloginid
    //alert(submitform);

}

function rdogenderclick(a) {
    document.getElementById("hd_gender").value = a

    var orgField = document.getElementById("genderRow")
    orgField.style.border = "0px solid";


    /*field = "err_" + "rdogender";
    x = document.getElementById(field);
    x.style.display = "none";*/
}

function ValidateEmail(mail) {
    var mailformat = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    if (mail.match(mailformat)) {
        return true;
    }
    else {
        document.getElementById("err_txtemail").innerHTML = "Not a valid email adddress.";
        return false;
    }
}

function isNumber(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;

    return true;
}
function fn_touppercase() {
    let currval = document.getElementById("txtname").value
    currval = currval.toUpperCase()
    document.getElementById("txtname").value = currval;
}


function fntxtonblur(x) {

    let givenField = document.getElementById(x.id)
    var val = document.getElementById(x.id).value;
    if (val == "") {
        givenField.style.borderColor = "red";
    }
    else {
        givenField.style.borderColor = "#cccccc";
    }

    /*
    x.style.background = "white";
    id = x.id;
    var val = document.getElementById(id).value;
    var field = "err_" + x.id
    var x = document.getElementById(field);
    if (val == "") {
        x.style.display = "block";
    }
    else {
        x.style.display = "none";
    }*/
}

function fnmobonblur(x) {

    x.style.background = "white";
    id = x.id;
    var val = document.getElementById(id).value;
    var field = "err_" + x.id
    var givenField = document.getElementById(id)
    document.getElementById(field).innerHTML = "Should not be blank";
    // Check for data
    var x = document.getElementById(field);


    if (val == "") {
        //x.style.display = "block";
        givenField.style.borderColor = "red";
        return;
    }
    else {
        x.style.display = "none";
    }

    // Check no number
    var validnum = true;
    var str = "";
    if (val != "") {
        for (var i = 0; i < val.length; i++) {
            valnew = val[i]
            if (parseInt(valnew) >= 0) {

            }
            else {
                validnum = false;
            }
            //  str = val.substring(i, 0);

        }
        if (validnum == false) {
            x.style.display = "block";
            x.innerHTML = "Not a valid Mobile Number";
            document.getElementById(id).focus();

        }
        // Check for length should be 10 digit
        if (val.length != 10) {
            x.style.display = "block";
            x.innerHTML = "Not a valid Mobile Number";
            // document.getElementById(id).focus();
        }
    }
}
function fntxtemailonblur(x) {

    x.style.background = "white";
    id = x.id;
    var givenField = document.getElementById(id)
    var val = document.getElementById(id).value;
    if (val != "") {
        var field = "err_" + id;
        var x = document.getElementById(field);
        x.style.display = "none";
        if (ValidateEmail(val) == false) {
            var field = "err_" + id;
            var x = document.getElementById(field);
            x.innerHTML = "Not a valid email address."
            x.style.display = "block";
        }
    }
    else {
        //x.style.display = "block";
        givenField.style.borderColor = "red";
    }
}
function fnddlonchange(ddl) {

    ddl.style.background = "white";
    id = ddl.id;
    var givenField = document.getElementById(id)
    var e = document.getElementById(id);
    var ddlId = e.options[e.selectedIndex].value;
    var field = "err_" + id;
    var x = document.getElementById(field);
    if (ddlId == 0) {
        //x.style.display = "block";
        givenField.style.borderColor = "red";
        submitform = false;
    }
    else {
        //x.style.display = "none";
        givenField.style.borderColor = "#cccccc";
    }
}


function fnCheckPwdStrength() {
    let txtVal = document.getElementById("txtpass").value;

    let mainDiv = document.getElementById("pwdStrength");
    mainDiv.style.display = "none";

    let yellowDiv = document.getElementById("pwdStrengthYellow");
    yellowDiv.style.display = "none";

    let orangeDiv = document.getElementById("pwdStrengthOrange");
    orangeDiv.style.display = "none";

    let redDiv = document.getElementById("pwdStrengthRed");
    redDiv.style.display = "none";

    document.getElementById("pwdStrengthText").innerHTML = "";


    if (txtVal == "") {

        return false;
    }
    if (txtVal != "") {

        let mainDiv = document.getElementById("pwdStrength");
        mainDiv.style.display = "inline-block";

        document.getElementById("pwdStrengthText").innerHTML = "";


        if (txtVal.search(/[a-z]/i) < 0) {
            // alert("Your password must contain at least one letter.");
            // Yellow          

        }
        let yellowDiv = document.getElementById("pwdStrengthYellow");
        yellowDiv.style.display = "inline-block";
        document.getElementById("pwdStrengthText").innerHTML = "Weak";

        if (txtVal.search(/(?=.*\d)/i) < 0) {    //Digits
            // alert("Your password must contain at least one digits.");
            // Yellow
        }
        else {

            // if no text 
            if (txtVal.search(/[a-z]/i) < 0) {
                let yellowDiv = document.getElementById("pwdStrengthYellow");
                yellowDiv.style.display = "inline-block";
                document.getElementById("pwdStrengthText").innerHTML = "Weak";
            }
            else {

                let orangeDiv = document.getElementById("pwdStrengthOrange");
                orangeDiv.style.display = "inline-block";
                document.getElementById("pwdStrengthText").innerHTML = "Normal";
            }
        }

        var regex = /^[A-Za-z0-9 ]+$/;
        var isValid = regex.test(txtVal);
        if (!isValid) {
            //alert("Contains Special Characters.");

            // if no Numbers then Normal
            if (txtVal.search(/(?=.*\d)/i) < 0) {
                let orangeDiv = document.getElementById("pwdStrengthOrange");
                orangeDiv.style.display = "inline-block";
                document.getElementById("pwdStrengthText").innerHTML = "Normal";
            }
            else {

                let redDiv = document.getElementById("pwdStrengthRed");
                redDiv.style.display = "inline-block";
                document.getElementById("pwdStrengthText").innerHTML = "Strong";
            }



        } else {
            //alert("Does not contain Special Characters.");
        }



    }

}

function resetform() {
    document.getElementById("txtname").value = "";
    document.getElementById("txtmobile").value = "";
    document.getElementById("txtemail").value = "";
    document.getElementById("datepicker").value = ""; 
     
    document.getElementById("txtloginid").value = "";
    document.getElementById("txtpass").value = "";
    document.getElementById("txtconfpass").value = "";

    //document.getElementById("err_txtname").innerHTML = "";
    document.getElementById("err_txtmobile").innerHTML = "";
    document.getElementById("err_txtemail").innerHTML = "";
    document.getElementById("err_datepicker").innerHTML = "";

  
    document.getElementById("err_txtloginid").innerHTML = "";
    //document.getElementById("err_txtpass").innerHTML = "";
    document.getElementById("err_txtconfpass").innerHTML = "";

    var orgField = document.getElementById("txtname")
    orgField.style.borderColor = "#cccccc";

    orgField = document.getElementById("txtmobile")
    orgField.style.borderColor = "#cccccc";

    orgField = document.getElementById("txtemail")
    orgField.style.borderColor = "#cccccc";

    orgField = document.getElementById("datepicker")
    orgField.style.borderColor = "#cccccc";

    orgField = document.getElementById("txtMedicalCouncilNumber")
    orgField.style.borderColor = "#cccccc";

    orgField = document.getElementById("txtNeetRollNo")
    orgField.style.borderColor = "#cccccc";    

    orgField = document.getElementById("genderRow")
    orgField.style.border = "0px solid";

    orgField = document.getElementById("txtloginid")
    orgField.style.borderColor = "#cccccc";

    orgField = document.getElementById("txtpass")
    orgField.style.borderColor = "#cccccc";
     
     

    orgField = document.getElementById("txtconfpass")
    orgField.style.borderColor = "#cccccc";

    document.getElementById("txtname").focus();

    /*
    document.getElementById("txtname").value = "test198001";
    document.getElementById("txtmobile").value = "9444685550";
    document.getElementById("txtemail").value = "john.l.kennedy@gmail.com";
    document.getElementById("datepicker").value = "";
    document.getElementById("txthscrollno").value = "HSC1234";
    document.getElementById("txtneetrollno").value = "NT2025261001";
    document.getElementById("txtneetmarks").value = "750.68";
    document.getElementById("ddlqualifyexams").selectedIndex = 0
    document.getElementById("ddlqualifiedyear").selectedIndex = 0
    document.getElementById("txtloginid").value = "test198001";
    document.getElementById("txtpass").value = "test@1234";
    document.getElementById("txtconfpass").value = "test@1234";
    */

}
