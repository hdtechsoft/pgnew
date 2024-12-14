function submitapp() {
    if (confirm('Are you sure you want to Submit the application? \nYou cannot edit the application once submitted')) {
        // Save it!               

        document.getElementById("hd_submitfor").value = "SubmitApplication";
        document.getElementById("form1").action = "appsubmit.aspx";
        document.getElementById("form1").method = "post";
        document.getElementById("form1").target = "_self"
        document.getElementById("form1").submit();
    } else {
        // Do nothing!
        return false;
    }
}

function showloading(t1) {
    var x = document.getElementById("loaderdiv");
    var ops = document.getElementById("opacitydiv");



    if (t1 == "0") {
        x.style.display = "block";
        ops.style.opacity = "0.6";

        if (document.getElementById("loadertextdiv")) {
            var y = document.getElementById("loadertextdiv");
            y.style.display = "block";
        }
    }
    if (t1 == "1") {
        x.style.display = "none";
        ops.style.opacity = "unset";

        if (document.getElementById("loadertextdiv")) {
            var y = document.getElementById("loadertextdiv");
            y.style.display = "none";
        }
    }
}