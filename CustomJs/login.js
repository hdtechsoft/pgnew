function loginauthbyOtp() {
    var returnstatus;
    returnstatus = true;
    debugger;
    if (document.getElementById("txtOTP").value == "") {
        let x = document.getElementById("txtOTP");
        x.style.borderColor = "red";
        document.getElementById("txtOTP").focus();
        returnstatus = false;
    }
    return returnstatus;
}

function fnCheckMobileOtpClicked()
{
    if (document.getElementById("txtDateOfBirth"))
    {
        // Mobile Clicked
        //alert("Mobile OTP already clicked");
        return false;
    }
    else
    {
        // Move to Mobile OTP

        //alert("Move to Mobile OTP");
        return true;
    }    
}

function fnCheckUserIdClicked()
{
    if (document.getElementById("txtloginusrid")) {
        // Mobile Clicked
        //alert("User ID already clicked");
        return false;
    }
    else {
        // Move to Mobile OTP
        //alert("Move to User ID");
        return true;
    }
}




function fnValidateOtpInputFields() {
    var returnstatus;
    returnstatus = true;
    if (document.getElementById("txtDateOfBirth").value == "") {
        let x = document.getElementById("txtDateOfBirth");
        x.style.borderColor = "red";
        document.getElementById("txtDateOfBirth").focus();
        returnstatus = false;
    }

    if (document.getElementById("txtMobileNo").value == "") {
        let x = document.getElementById("txtMobileNo");
        x.style.borderColor = "red";
        document.getElementById("txtMobileNo").focus();
        returnstatus = false;
    }
    return returnstatus;
       
}



function MoveToPersonalInfo() {
    showloading("0");
    document.getElementById("form1").action = "pinfo.aspx";
    document.getElementById("form1").method = "post";
    document.getElementById("form1").submit();
}
function MoveToCollegePreferencePage() {
    document.getElementById("hd_submitfor").value = "ViewApplication";
    document.getElementById("form1").action = "usrcollsel.aspx";
    document.getElementById("form1").method = "post";
    document.getElementById("form1").submit();
}
function MoveToSubmitPage() {
    document.getElementById("hd_submitfor").value = "ViewApplication";
    document.getElementById("form1").action = "apppreview.aspx";
    document.getElementById("form1").method = "post";
    document.getElementById("form1").submit();
}
function MoveToReportPage() {
    document.getElementById("hd_submitfor").value = "";
    document.getElementById("form1").action = "genericrpt.aspx";
    document.getElementById("form1").method = "post";
    document.getElementById("form1").submit();
}


function focusonloginauth(obj, e) {
    var e = (typeof event != 'undefined') ? window.event : e;// IE : Moz
    if (e.keyCode == 13) {
        loginauth();
    }
}
function chktrustyempty(thiss) {

    let x = document.getElementById(thiss.id);
    if (x.value != "") {
        x.style.borderColor = "#cccccc";
    }
}

function loginauth() {

    var returnstatus;
    returnstatus = true;

    document.getElementById("labLoginError").innerHTML = "";
    if (document.getElementById("loginpassword").value == "") {

        /*var errx = "_loginpassword"
        x = document.getElementById(errx);
        x.style.display = "block";
        */
        let x = document.getElementById("loginpassword");
        x.style.borderColor = "red";

        document.getElementById("loginpassword").focus();
        returnstatus = false;
    }
    else {
        /*var errx = "_loginpassword"
        x = document.getElementById(errx);
        x.style.display = "none";
        */

    }


    if (document.getElementById("txtloginusrid").value == "") {
        /*var errx = "_loginusrid"
        x = document.getElementById(errx);
        x.style.display = "block";
        */
        let x = document.getElementById("txtloginusrid");
        x.style.borderColor = "red";
        document.getElementById("txtloginusrid").focus();
        returnstatus = false;
    }
    else {
        /*var errx = "_txtloginusrid"
        x = document.getElementById(errx);
        x.style.display = "none";
        */
    }


    if (returnstatus == true) {
        showloading("0");
        document.getElementById("hd_submitfor").value = "LoginAuth";
        document.getElementById("form1").action = "login.aspx";
        document.getElementById("form1").method = "post";
        document.getElementById("form1").submit();
    }
}

function resetloginwindow() {



    document.getElementById("txtloginusrid").value = "";
    document.getElementById("loginpassword").value = "";
    document.getElementById("labLoginError").innerHTML = "";

    let x = document.getElementById("loginpassword");
    x.style.borderColor = "#cccccc";

    let x1 = document.getElementById("txtloginusrid");
    x1.style.borderColor = "#cccccc";


    /*
    let x1 = document.getElementById("_txtloginusrid");
    x1.style.display = "none";
    let x2 = document.getElementById("_loginpassword")
    x2.style.display = "none";
    let x3 = document.getElementById("labLoginError");
    x3.style.display = "none";
    */
    document.getElementById("txtloginusrid").focus();
}