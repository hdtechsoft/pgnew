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

function fnSetBorder(idd, mode) {
    if (mode == 0) {
        document.getElementById(idd).style["boxShadow"] = "5px 3px 5px green";
    }
    if (mode == 1) {
        document.getElementById(idd).style["boxShadow"] = "5px 3px 5px red";
    }
}


function validatePersonalInfo() {
    debugger;
    var submitform = true;
    var item = "issueddate"
    if (document.getElementById(item)) {
        var val = document.getElementById(item).value;
        var field = "err_" + "issueddate";
        var x = document.getElementById(field);
        if (val == "") {
            //x.style.display = "block";
            fnSetBorder(item, 1);
            submitform = false;
            document.getElementById(field).focus();
        }
        else {
            //x.style.display = "none";
            fnSetBorder(item, 0);
            // change the format to mm/dd/yyyy
            debugger;
            var strarr = val.split("/");
            var str2 = strarr[1] + "/" + strarr[0] + "/" + strarr[2]
            document.getElementById("hd_datepicker").value = str2
        }
    }

    item = "txtissuedtaluk"
    if (document.getElementById(item)) {
        val = document.getElementById(item).value;
        field = "err_" + item;
        x = document.getElementById(field);
        if (val == "") {
            //x.style.display = "block";
            fnSetBorder(item, 1);
            submitform = false;
            document.getElementById(item).focus();
        }
        else {
            //x.style.display = "none";
            fnSetBorder(item, 0);
        }
    }

    item = "txtissuedby"
    if (document.getElementById(item)) {
        val = document.getElementById(item).value;
        field = "err_" + item;
        x = document.getElementById(field);
        if (val == "") {
            //x.style.display = "block";
            fnSetBorder(item, 1);
            submitform = false;
            document.getElementById(item).focus();
        }
        else {
            //x.style.display = "none";
            fnSetBorder(item, 0);
        }
    }

    item = "txtcertificateno"
    if (document.getElementById(item)) {
        val = document.getElementById(item).value;
        field = "err_" + item;
        x = document.getElementById(field);
        if (val == "") {
            //x.style.display = "block";
            fnSetBorder(item, 1);
            submitform = false;
            document.getElementById(item).focus();
        }
        else {
            //x.style.display = "none";
            fnSetBorder(item, 0);
        }
    }

    //item = "txtsubcaste"
    //val = document.getElementById(item).value;
    //field = "err_" + item;
    //x = document.getElementById(field);
    //if (val == "") {
    //    x.style.display = "block";
    //    submitform = false;
    //    document.getElementById(item).focus();
    //}
    //else {
    //    x.style.display = "none";
    //}

    //item = "txtsubcaste"
    //val = document.getElementById(item).value;
    //field = "err_" + item;
    //x = document.getElementById(field);
    //if (val == "") {
    //    x.style.display = "block";
    //    submitform = false;
    //    document.getElementById(item).focus();
    //}
    //else {
    //    x.style.display = "none";
    //}

    //item = "ddlsubcaste"
    //var e = document.getElementById(item);
    //var ddlcommunityId = e.options[e.selectedIndex].value;
    //field = "err_" + item;
    //x = document.getElementById(field);
    //if (ddlcommunityId == 0) {
    //    x.style.display = "block";
    //    submitform = false;
    //    document.getElementById(item).focus();
    //}
    //else {
    //    //document.getElementById("hd_communityId").value = ddlcommunityId
    //    x.style.display = "none";
    //}


    item = "hd_subcasteId";
    x = document.getElementById("err_ddlsubcaste");
    if (document.getElementById(item).value == "") {
        //x.style.display = "block";
        fnSetBorder(item, 1);
        submitform = false;
    }
    else {
        //x.style.display = "none";
        fnSetBorder(item, 0);
    }


    item = "ddlcommunity"
    var e = document.getElementById(item);
    var ddlcommunityId = e.options[e.selectedIndex].value;
    field = "err_" + item;
    x = document.getElementById(field);
    if (ddlcommunityId == 0) {
        //x.style.display = "block";
        fnSetBorder(item, 1);
        submitform = false;
        document.getElementById(item).focus();
    }
    else {
        document.getElementById("hd_communityId").value = ddlcommunityId
        //x.style.display = "none";
        fnSetBorder(item, 0);
    }

    //txtPermanentAddress
    item = "txtPermanentAddress";
    var val = document.getElementById(item).value;
    var field = "err_" + item;
    var x = document.getElementById(field);
    debugger;
    if (val == "") {
        //x.style.display = "block";
        fnSetBorder(item, 1);
        submitform = false;
        window.scrollTo(0, 250);
        document.getElementById("txtPermanentAddress").focus();
    }
    else {
        //x.style.display = "none";
        fnSetBorder(item, 0);
    }

    //txtCommunicationAddress
    item = "txtCommunicationAddress";
    var val = document.getElementById(item).value;
    var field = "err_" + item;
    var x = document.getElementById(field);
    debugger;
    if (val == "") {
        //x.style.display = "block";
        fnSetBorder(item, 1);
        submitform = false;
        window.scrollTo(0, 250);
        document.getElementById("txtCommunicationAddress").focus();
    }
    else {
        //x.style.display = "none";
        fnSetBorder(item, 0);
    }


    item = "ddlnativity"
    var e = document.getElementById(item);
    var ddlnativityId = e.options[e.selectedIndex].value;
    field = "err_" + item;
    x = document.getElementById(field);
    if (ddlnativityId == 0) {

        //x.style.display = "block";
        fnSetBorder(item, 1);
        submitform = false;
        window.scrollTo(0, 250);
        document.getElementById(item).focus();
    }
    else {
        document.getElementById("hd_nativityId").value = ddlnativityId
        //x.style.display = "none";
        fnSetBorder(item, 0);
    }



    item = "ddlmothertongue";
    var e = document.getElementById(item);
    var ddlmothertongueId = e.options[e.selectedIndex].value;
    field = "err_" + item;
    x = document.getElementById(field);
    //x.style.display = "block";
    fnSetBorder(item, 1);
    if (ddlmothertongueId == 0) {

        submitform = false;
        document.getElementById(item).focus();
    }
    else {
        document.getElementById("hd_mothertongueId").value = ddlmothertongueId
        //x.style.display = "none";
        fnSetBorder(item, 0);
    }
    item = "ddlmothertongue";
    e = document.getElementById(item);
    if (e.options[e.selectedIndex].text == "Others") {
        if (document.getElementById("txtmtname").value == "") {

            x = document.getElementById("err_mtname");
            //x.style.display = "block";
            fnSetBorder(item, 1);
            submitform = false;
            window.scrollTo(0, 250);
            document.getElementById("txtmtname").focus();

        }
    }

    // ddlreligion
    item = "ddlreligion";
    var e = document.getElementById(item);
    var ddlreligionId = e.options[e.selectedIndex].value;
    field = "err_" + item;
    x = document.getElementById(field);
    if (ddlreligionId == 0) {

        //x.style.display = "block";
        fnSetBorder(item, 1);
        submitform = false;
        window.scrollTo(0, 250);
        document.getElementById(item).focus();
    }
    else {
        document.getElementById("hd_religionId").value = ddlreligionId
        //x.style.display = "none";
        fnSetBorder(item, 0);
    }

    // ddlnationality
    item = "ddlnationality";
    var e = document.getElementById(item);
    var ddlnationalityId = e.options[e.selectedIndex].value;
    field = "err_" + item;
    x = document.getElementById(field);
    if (ddlnationalityId == 0) {

        //x.style.display = "block";
        fnSetBorder(item, 1);
        submitform = false;
        window.scrollTo(0, 250);
        document.getElementById(item).focus();
    }
    else {
        document.getElementById("hd_nationalityId").value = ddlnationalityId
        //x.style.display = "none";
        fnSetBorder(item, 0);
    }

    // ddlschooling
    item = "ddlPlaceOfBirth";
    var e = document.getElementById(item);
    var ddlschoolingId = e.options[e.selectedIndex].value;
    field = "err_" + item;
    x = document.getElementById(field);
    if (ddlschoolingId == 0) {

        //x.style.display = "block";
        fnSetBorder(item, 1);
        submitform = false;
        window.scrollTo(0, 250);
        document.getElementById(item).focus();

    }
    else {
        document.getElementById("hd_PlaceOfBirth").value = ddlschoolingId;
        //x.style.display = "none";
        fnSetBorder(item, 0);
    }


    //txtparentname
    item = "txtparentname";
    var val = document.getElementById(item).value;
    var field = "err_" + item;
    var x = document.getElementById(field);
    debugger;
    if (val == "") {
        //x.style.display = "block";
        fnSetBorder(item, 1);
        submitform = false;
        window.scrollTo(0, 250);
        document.getElementById("txtparentname").focus();
    }
    else {
        //x.style.display = "none";
        fnSetBorder(item, 0);
    }


    //txtAltMobileNo
    item = "txtAltMobileNo";
    var val = document.getElementById(item).value;
    var field = "err_" + item;
    var x = document.getElementById(field);
    debugger;
    if (val == "") {
        //x.style.display = "block";
        fnSetBorder(item, 1);
        submitform = false;
        window.scrollTo(0, 0);
        document.getElementById("txtAltMobileNo").focus();
    }
    else {
        //x.style.display = "none";
        fnSetBorder(item, 0);
    }


    item = "ddlmothertongue";
    e = document.getElementById(item);
    if (e.options[e.selectedIndex].text != "Others") {
        document.getElementById("txtmtname").value = "";
    }





    if (submitform == true) {
        showloading("0");
        window.scrollTo(0, 0);
        document.getElementById("hd_submitfor").value = "PersonalInfoSubmit"
        document.getElementById("form1").action = "pinfo.aspx";
        document.getElementById("form1").target = "_self"
        document.getElementById("form1").method = "post";
        document.getElementById("form1").submit();
    }


}
function fntxtfocus(x) {

    /// x.style.background = "#fdf9e9";
    //  x.style.border = "1px solid #ccc";
    x.style.border = "1px solid #ccc";
}
function fntxtonblur(x) {
    x.style.background = "white";
    id = x.id;
    var val = document.getElementById(id).value;
    var field = "err_" + x.id
    var x = document.getElementById(field);
    if (val == "") {
        //  x.style.display = "block";
        fnSetBorder(id, 1) // Red
    }
    else {
        //        x.style.display = "none";
        fnSetBorder(id, 0) // Green
    }
}
function fnddlonchange(ddl) {

    ddl.style.background = "white";
    id = ddl.id;
    var e = document.getElementById(id);
    var ddlId = e.options[e.selectedIndex].value;
    var field = "err_" + id;
    var x = document.getElementById(field);
    if (ddlId == 0) {
        //x.style.display = "block";
        fnSetBorder(id, 1) // Red
        submitform = false;
    }
    else {
        //x.style.display = "none";
        fnSetBorder(id, 0) // Green
    }
}

function fnddlonchangeCommunity(ddl) {

    ddl.style.background = "white";
    id = ddl.id;
    var e = document.getElementById(id);
    var ddlId = e.options[e.selectedIndex].value;
    var field = "err_" + id;
    var x = document.getElementById(field);
    if (ddlId == 0) {
        //x.style.display = "block";
        fnSetBorder(id, 1) // Red
        
    }
    else {
        //x.style.display = "none";
        fnSetBorder(id, 0) // Green
    }
    showloading(0);
   
    
}

function showloadingCommunity(t1) {
    var x = document.getElementById("loaderdivCommunity");
    var ops = document.getElementById("opacitydiv");
    if (t1 == "0") {
        x.style.display = "block";
        ops.style.opacity = "0.6";
    }
    if (t1 == "1") {
        x.style.display = "none";
        ops.style.opacity = "unset";
    }
}

function fnddlonchangeNativity(ddl) {

    ddl.style.background = "white";
    id = ddl.id;
    var e = document.getElementById(id);
    var ddlId = e.options[e.selectedIndex].value;
    var field = "err_" + id;
    var x = document.getElementById(field);
    if (ddlId == 0) {
        //x.style.display = "block";
        fnSetBorder(id, 1) // Red
        submitform = false;
    }
    else {
        //x.style.display = "none";
        fnSetBorder(id, 0) // Green
    }
    showloading(0);
}

function fnddlmtonchange(ddl) {

    ddl.style.background = "white";
    id = ddl.id;
    var e = document.getElementById(id);
    var ddlId = e.options[e.selectedIndex].value;
    var field = "err_" + id;
    var x = document.getElementById(field);
    if (ddlId == 0) {
        //x.style.display = "block";
        fnSetBorder(id, 1) // Red
        submitform = false;
        var x2 = document.getElementById("spanothermt");
        x2.style.display = "none";
    }
    else {
        var x2 = document.getElementById("spanothermt");
        if (e.options[e.selectedIndex].text == "Others") { // Selected Otheres

            x2.style.display = "block";
            document.getElementById("txtmtname").focus();
        }
        else {

            //x2.style.display = "none";
            fnSetBorder(id, 0) // Green
        }
        //x.style.display = "none";
        fnSetBorder(id, 0) // Green
    }
}



function MoveToEducational() {
    showloading("0");
    document.getElementById("form1").action = "edu.aspx";
    document.getElementById("form1").method = "post";
    document.getElementById("form1").target = "_self"
    document.getElementById("form1").submit();
}
 

function closesubcastemodal() {
    $('html').css('overflow', 'scroll');
    let x2 = document.getElementById("SubCasteModal");
    x2.style.display = "none";
    let x3 = document.getElementById("err_ddlsubcaste");
    let subcaste = document.getElementById("hd_subcasteId").value;
    if (subcaste != "") {
        x3.style.display = "none";
    }
    if (document.getElementById("txtcertificateno")) {
        document.getElementById("txtcertificateno").focus();
    }
    else {
        document.getElementById("buttPersonalInfoSave").focus();
    }
    if (document.getElementById("divlab_subcaste").innerHTML != "-- Select Sub Caste --") { fnSetBorder("divlab_subcaste", 0) }
}
function opensubcastemodal() {

    let item = "ddlcommunity"
    let e = document.getElementById(item);
    let ddlcommunityId = e.options[e.selectedIndex].value;
    field = "err_" + item;
    x = document.getElementById(field);
    if (ddlcommunityId == 0) {
        x.style.display = "block";
        document.getElementById(item).focus();
        return false;
    }
    else {
        document.getElementById("hd_communityId").value = ddlcommunityId
        x.style.display = "none";
    }


    window.scrollTo(0, 0)
    let x2 = document.getElementById("SubCasteModal");
    x2.style.display = "block";
    $('html').css('overflow', 'hidden');
}

function MovetoPage(page, leftnav) {
    var field = "leftnav_" + leftnav;
    x = document.getElementById(field);
    if (x.style.color == "") {
        return false;
    }
    window.scrollTo(0, 0);
    showloading("0");
    document.getElementById("hd_submitfor").value = "View";
    document.getElementById("form1").action = page;
    document.getElementById("form1").method = "post";
    document.getElementById("form1").target = "_self"
    document.getElementById("form1").submit();
}

function tabE(obj, e) { //  think not in use
    debugger;
    var e = (typeof event != 'undefined') ? window.event : e;// IE : Moz 

    if (e.keyCode == 13) {
        var ele = document.forms[0].elements;
        for (var i = 0; i < ele.length; i++) {
            var q = (i == ele.length - 1) ? 0 : i + 1;// if last element : if any other 
            if (obj == ele[i]) { ele[q].focus(); break }
        }
        return false;
    }
}

function fnfilterSubCaste() {
    // Declare variables
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById('myInput');
    filter = input.value.toUpperCase();
    ul = document.getElementById("myUL");
    li = ul.getElementsByTagName('li');

    // Loop through all list items, and hide those who don't match the search query
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}

function PrintApplication(printpage, leftnav) {
    //window.open(printpage + "?u=john3", '', 'height=800, width=800');
    var field = "leftnav_" + leftnav;
    x = document.getElementById(field);
    if (x.style.color == "") {
        return false;
    }
    document.getElementById("form1").action = printpage;
    document.getElementById("form1").method = "post";
    document.getElementById("form1").target = "_blank"
    document.getElementById("form1").submit();
}

function fnCopyAddress() {
    if (document.getElementById("chkCopyAddress")) {
        if (document.getElementById("chkCopyAddress").checked == true) {
            document.getElementById("txtCommunicationAddress").value = document.getElementById("txtPermanentAddress").value;
            fnOnKeyUp("txtCommunicationAddress");
        }
    }
}