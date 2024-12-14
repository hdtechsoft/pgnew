
function fnSetDropdownValue(id, valueToSelect) {    
    let element = document.getElementById(id);
    element.value = valueToSelect;
}



function fnSetBorder(idd, mode) {
    if (mode == 0) {
        document.getElementById(idd).style["boxShadow"] = "5px 3px 5px green";
    }
    if (mode == 1) {
        document.getElementById(idd).style["boxShadow"] = "5px 3px 5px red";
    }
}
function fntxtonblur(x) {
    x.style.background = "white";
    id = x.id;
    var val = document.getElementById(id).value;
     
    if (val == "") {
        //  x.style.display = "block";
        fnSetBorder(id, 1) // Red
    }
    else {
        //        x.style.display = "none";
        fnSetBorder(id, 0) // Green
    }
}

function fnCheckIsNumeric(x) {

    let item = x.id;
    let val = document.getElementById(item).value;
  
    if (parseInt(val)>=0) {    
        
    }
    else {
        document.getElementById(item).value = "";
        fnSetBorder(item, 1);
    }

}
function fnOnKeyUp(idd) {
    if (document.getElementById(idd).value != "") {
        fnSetBorder(idd, 0)
    }
    else {
        fnSetBorder(idd, 1)
    }
}
function fnOnKeyUpddl(idd) {
    var e = document.getElementById(idd);
    var ddlvalue = e.options[e.selectedIndex].value;
    if (ddlvalue == 0) {
        fnSetBorder(idd, 1)
    }
    else {
        fnSetBorder(idd, 0)
    }
}

function fnShowUnderGoingPG()
{
    var x = document.getElementById("UndergoingPGCourse");
    if (document.getElementById("chkUnderGoingPG").checked==true)
    {                
        x.style.display = "block";
    }
    else 
    {
        x.style.display = "none";

        fnSetDropdownValue('ddlUndergoingCourse', '0');
        fnSetBorder("ddlUndergoingCourse", 1);

        fnSetDropdownValue('ddlUndergoingStudiedUnder', '0');
        fnSetBorder("ddlUndergoingStudiedUnder", 1);

        document.getElementById("txtUndergoingCompletionYear").value = "";
        fnSetBorder("txtUndergoingCompletionYear", 1);
        
        
    }
}
function fnShowCompletedPG() {
    var x = document.getElementById("CompletedPGCourse");
    if (document.getElementById("chkCompletedPG").checked == true) {
        x.style.display = "block";
    }
    else {
        x.style.display = "none";

        fnSetDropdownValue('ddlCompletedCourse', '0');
        fnSetBorder("ddlCompletedCourse", 1);

        fnSetDropdownValue('ddlCompletedStudiedUnder', '0');
        fnSetBorder("ddlCompletedStudiedUnder", 1);

        document.getElementById("txtCompletedYear").value = "";
        fnSetBorder("txtCompletedYear", 1);

    }
}
function fnShowDiscontinuePG()
{
    var x = document.getElementById("DiscontinuedPGCourse");
    if (document.getElementById("chkDiscontinuePG").checked == true) {
        x.style.display = "block";
    }
    else {
        x.style.display = "none";

        fnSetDropdownValue('ddlDiscontinueCourse', '0');
        fnSetBorder("ddlDiscontinueCourse", 1);

        fnSetDropdownValue('ddlDiscontinueStudiedUnder', '0');
        fnSetBorder("ddlDiscontinueStudiedUnder", 1);

        document.getElementById("pgDiscontinueDate").value = "";
        fnSetBorder("pgDiscontinueDate", 1);

    }
}
function fnShowchkCompletedDiploma()
{
    var x = document.getElementById("CompletedDeploma");
    if (document.getElementById("chkCompletedDiploma").checked == true) {
        x.style.display = "block";
    }
    else {
        x.style.display = "none";
        document.getElementById("txtDiplomaDurationYear").value = "";
        document.getElementById("txtDiplomaCourseName").value = "";
        document.getElementById("diplomaCompletedDate").value = "";

        
    }
}
function fnvalidateEducationalInfo()
{
    //  chkCompletedDiploma

    var submitform;
    var item = "";
    submitform = true;

        /************************************   COMPLETED ANY DIPLOMA ? *******************************************/
            if (document.getElementById("chkCompletedDiploma").checked == true)
            {
                //diplomaCompletedDate         
                item = "diplomaCompletedDate";
                var val = document.getElementById(item).value;             
                if (val == "") {            
                    fnSetBorder(item, 1);
                    submitform = false;
                    window.scrollTo(0, 550);
                    //document.getElementById("diplomaCompletedDate").focus();
                }
                else {
                    fnSetBorder(item, 0);
                    // assing mm/dd/yyyy to hd_diplomaCompletedDate
                    var strarr = val.split("/");
                    var str2 = strarr[1] + "/" + strarr[0] + "/" + strarr[2]
                    document.getElementById("hd_diplomaCompletedDate").value = str2

                }

                //txtDiplomaCourseName         
                item = "txtDiplomaCourseName";
                var val = document.getElementById(item).value;
                if (val == "") {
                    fnSetBorder(item, 1);
                    submitform = false;
                    window.scrollTo(0, 550);
                    document.getElementById("txtDiplomaCourseName").focus();
                }
                else {
                    fnSetBorder(item, 0);
                }

                //txtDiplomaDurationYear
                item = "txtDiplomaDurationYear";
                var val = document.getElementById(item).value;
                if (val == "") {
                    fnSetBorder(item, 1);
                    submitform = false;
                    window.scrollTo(0, 550);
                    document.getElementById("txtDiplomaDurationYear").focus();
                }
                else {
                    fnSetBorder(item, 0);
                }
            }

        /*************************   DID YOU DISCONTINUE ANY PG OR ITS EQUIVALENT COURSES ?   *****************************/
            if (document.getElementById("chkDiscontinuePG").checked == true)
            {                
                item = "pgDiscontinueDate";
                var val = document.getElementById(item).value;
                if (val == "") {
                    fnSetBorder(item, 1);
                    submitform = false;
                    window.scrollTo(0, 600);
                }
                else {
                    fnSetBorder(item, 0);
                    // assing mm/dd/yyyy to hd_pgDiscontinueDate
                    var strarr = val.split("/");
                    var str2 = strarr[1] + "/" + strarr[0] + "/" + strarr[2]
                    document.getElementById("hd_pgDiscontinueDate").value = str2

                }

                item = "ddlDiscontinueStudiedUnder";                
                var e = document.getElementById(item);
                var ddlval = e.options[e.selectedIndex].value;                
                if (ddlval == 0) { 
                    fnSetBorder(item, 1);
                    submitform = false;
                    window.scrollTo(0, 600);
                    document.getElementById(item).focus();
                }
                else {                    
                    fnSetBorder(item, 0);
                }

                item = "ddlDiscontinueCourse";
                var e = document.getElementById(item);
                var ddlval = e.options[e.selectedIndex].value;
                if (ddlval == 0) {
                    fnSetBorder(item, 1);
                    submitform = false;
                    window.scrollTo(0, 600);
                    document.getElementById(item).focus();
                }
                else {
                    fnSetBorder(item, 0);
                }

            }

        /*************************   ARE YOU COMPLETED ANY PG OR ITS EQUIVALENT COURSES ?  *****************************/
            if (document.getElementById("chkCompletedPG").checked == true)
            {
                item = "txtCompletedYear";
                var val = document.getElementById(item).value;
                if (val == "") {
                    fnSetBorder(item, 1);
                    submitform = false;
                    window.scrollTo(0, 400);
                    document.getElementById(item).focus();                    
                }
                else {
                    fnSetBorder(item, 0);
                }

                item = "ddlCompletedStudiedUnder";
                var e = document.getElementById(item);
                var ddlval = e.options[e.selectedIndex].value;
                if (ddlval == 0) {
                    fnSetBorder(item, 1);
                    submitform = false;
                    window.scrollTo(0, 400);
                    document.getElementById(item).focus();
                }
                else {
                    fnSetBorder(item, 0);
                }

                item = "ddlCompletedCourse";
                var e = document.getElementById(item);
                var ddlval = e.options[e.selectedIndex].value;
                if (ddlval == 0) {
                    fnSetBorder(item, 1);
                    submitform = false;
                    window.scrollTo(0, 400);
                    document.getElementById(item).focus();
                }
                else {
                    fnSetBorder(item, 0);
                }
            }

        /*************************   ARE YOU UNDERGOING ANY PG OR ITS EQUIVALENT COURSES ?  *****************************/
            if (document.getElementById("chkUnderGoingPG").checked == true)
            {
                item = "txtUndergoingCompletionYear";
                var val = document.getElementById(item).value;
                if (val == "") {
                    fnSetBorder(item, 1);
                    submitform = false;
                    window.scrollTo(0, 400);
                    document.getElementById(item).focus();
                }
                else {
                    fnSetBorder(item, 0);
                }

                item = "ddlUndergoingStudiedUnder";
                var e = document.getElementById(item);
                var ddlval = e.options[e.selectedIndex].value;
                if (ddlval == 0) {
                    fnSetBorder(item, 1);
                    submitform = false;
                    window.scrollTo(0, 400);
                    document.getElementById(item).focus();
                }
                else {
                    fnSetBorder(item, 0);
                }

                item = "ddlUndergoingCourse";
                var e = document.getElementById(item);
                var ddlval = e.options[e.selectedIndex].value;
                if (ddlval == 0) {
                    fnSetBorder(item, 1);
                    submitform = false;
                    window.scrollTo(0, 400);
                    document.getElementById(item).focus();
                }
                else {
                    fnSetBorder(item, 0);
                }


            }

        /*************************   NOW regular Inputs  *****************************/

            item = "txtNeetPgPercentlle";
            var val = document.getElementById(item).value;
            if (val == "") {
                fnSetBorder(item, 1);
                submitform = false;
                window.scrollTo(0, 400);
                document.getElementById(item).focus();
            }
            else {
                fnSetBorder(item, 0);
            }

            item = "txtRegistrationYear";
            var val = document.getElementById(item).value;
            if (val == "") {
                fnSetBorder(item, 1);
                submitform = false;
                window.scrollTo(0, 400);
                document.getElementById(item).focus();
            }
            else {
                fnSetBorder(item, 0);
            }

            item = "txtMedUniversityName";
            var val = document.getElementById(item).value;
            if (val == "") {
                fnSetBorder(item, 1);
                submitform = false;
                window.scrollTo(0, 400);
                document.getElementById(item).focus();
            }
            else {
                fnSetBorder(item, 0);
            }

            item = "txtMedCollegeName";
            var val = document.getElementById(item).value;
            if (val == "") {
                fnSetBorder(item, 1);
                submitform = false;
                window.scrollTo(0, 400);
                document.getElementById(item).focus();
            }
            else {
                fnSetBorder(item, 0);
            }

            item = "ddlUgStudiedUnder";
            var e = document.getElementById(item);
            var ddlval = e.options[e.selectedIndex].value;
            if (ddlval == 0) {
                fnSetBorder(item, 1);
                submitform = false;
                window.scrollTo(0, 200);
                document.getElementById(item).focus();
            }
            else {
                fnSetBorder(item, 0);
            }

            item = "ddlUgStudiedAt";
            var e = document.getElementById(item);
            var ddlval = e.options[e.selectedIndex].value;
            if (ddlval == 0) {
                fnSetBorder(item, 1);
                submitform = false;
                window.scrollTo(0, 200);
                document.getElementById(item).focus();
            }
            else {
                fnSetBorder(item, 0);
            }


            item = "txtNoOfAttempts";
            var val = document.getElementById(item).value;
            if (val == "") {
                fnSetBorder(item, 1);
                submitform = false;
                window.scrollTo(0, 0);
                document.getElementById(item).focus();
            }
            else {
                fnSetBorder(item, 0);
            }

            item = "txtFinalYearRegNo";
            var val = document.getElementById(item).value;
            if (val == "") {
                fnSetBorder(item, 1);
                submitform = false;
                window.scrollTo(0, 0);
                document.getElementById(item).focus();
            }
            else {
                fnSetBorder(item, 0);
            }

            item = "mbbsCompletedDate";
            var val = document.getElementById(item).value;
            if (val == "") {
                fnSetBorder(item, 1);
                submitform = false;
                window.scrollTo(0, 0);
                document.getElementById(item).focus();
            }
            else {
                fnSetBorder(item, 0);
                // assing mm/dd/yyyy to hd_mbbsCompletedDate
                var strarr = val.split("/");
                var str2 = strarr[1] + "/" + strarr[0] + "/" + strarr[2]
                document.getElementById("hd_mbbsCompletedDate").value = str2

            }

            
            return true;
    

}