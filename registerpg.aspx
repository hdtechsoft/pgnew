<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="registerpg.aspx.cs" Inherits="pg_registerpg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <script src="jquery/3.4.1/jquery.slim.min.js"></script>
    <script src="bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
     <link href="bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <%--<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">--%>
    <link href="jquery/UI/1.12.1/jquery-ui.css" rel="stylesheet" />
    <link href="CustomCss/StyleSheet.css" rel="stylesheet" />
       <script src="CustomJs/registerpg.js?1=3"></script>
    <script src="CustomJs/generic.js"></script>
    <link href="CustomCss/Loader.css?1=1" rel="stylesheet" />
    <style>
        /*::placeholder {
  color: #e2adad;
  font-size: 1.0em;
}*/

        .fixedElement {
   /*  background-color: #c0c0c0;*/
    position:fixed;
    top:0;
    width:100%;
    z-index:100;
}
        .tooltip-inner {
    white-space:pre;
    max-width:none;
}

    </style>

        <script type="text/javascript">
        function fntxtfocus(x) {
            
           /// x.style.background = "#fdf9e9";
          //  x.style.border = "1px solid #ccc";
            x.style.border = "1px solid #ccc";
        }

        function fnreassigndob()
        {
              document.getElementById("hd_datepicker").value = "<%=p_dob%>";
            //changing display format to dd/mm/yy
            let val = "<%=p_dob%>";
            let strarr = val.split("/");
            let str2 = strarr[1] + "/" + strarr[0] + "/" + strarr[2]
            document.getElementById("datepicker").value = str2

           
        }
 
            function tabE(obj, e) {
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

            function focusonloginauth(obj,e)
            {
                var e = (typeof event != 'undefined') ? window.event : e;// IE : Moz
                if (e.keyCode == 13) {
                    loginauth();
                }
            }

            function isNumber_v1(obj, e) {

                var e = (typeof event != 'undefined') ? window.event : e;// IE : Moz 
                if (e.keyCode == 13) {
                    var ele = document.forms[0].elements;
                    for (var i = 0; i < ele.length; i++) {
                        var q = (i == ele.length - 1) ? 0 : i + 1;// if last element : if any other 
                        if (obj == ele[i]) { ele[q].focus(); break }
                    }
                    return false;
                }


                let charCode = (obj.which) ? obj.which : event.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;

                return true;
            }
  
            function fnplusonepassno()
            {
                //alert("DFDF")
            }
        </script>
 
    
     

</head>
<body  >
    <form id="form1" runat="server">

            <!-- Header -->
    <div class="fixedElement"  style="height:120px;overflow:hidden; border-color:red">
          <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top" style="background-color: #496c8e !important; padding:0px">
  <div class="container">
    <a class="navbar-brand" href="#">
    <img src="Images/tnlogo2.png" alt=""/> 
          
        </a>
       <div class="collapse navbar-collapse" id="navbarResponsive">
            
       </div>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
       <div class="collapse navbar-collapse" id="navbarResponsive">

       </div>
    <div class="collapse navbar-collapse" id="navbarResponsive">
              <div class="navbar-nav mr-auto mt-2 mt-lg-0" >
                        <span class="small" style="font-size:15px;text-align: center; color: white;font-weight:600">
                            GOVERNMENT OF TAMIL NADU
                            <br />
                            SELECTION COMMITTEE, DIRECTORATE OF MEDICAL EDUCATION
                            <br />
                            <b>ADMISSION TO TAMILNADU PG</b>
                            <br />
                            APPLICATION FORM FOR GOVT. QUOTA SEATS IN GOVT. COLLEGES AND
                            <br />
                            GOVT. QUOTA SEATS IN SELF-FINANCING COLLEGES FOR <%=acadamicyear %> SESSION
                            <br />
                        </span>
                    </div>
      <ul class="navbar-nav ml-auto">
         <li class="nav-item active">                   
         <a  class="nav-link" href="home.aspx">Home
                <span class="sr-only">(current)</span>
              </a>
        </li>
        <li class="nav-item">
          <a    class="nav-link" href="home.aspx">About</a>
        </li>
        <li class="nav-item">
         <%-- <a class="nav-link" href="#">Login</a>LogInModal--%>
            <%--<span class="nav-link" style="cursor:pointer" data-toggle="modal" data-target="#LogInModal">LogIn </span>--%>
            <span class="" style="cursor:pointer;">
                 <a   class="nav-link"  style="color:#ffc107" href="login.aspx">LogIn</a>
            </span>

        </li>
        <li class="nav-item">
         <%-- <a class="nav-link"  href="#"><span data-toggle="modal" data-target="#SignInModal"></span>Sign In</a>--%>
         <%--   <span class="nav-link" style="cursor:pointer" data-toggle="modal" data-target="#SignInModal">Sign In </span>--%>
            
        </li>
      </ul>
    </div>
  </div>
</nav>
        </div>
       
       <%--  <div id="loadertextdiv" class="loading-text" style="display:none">Loading Please Wait ...</div>
                <div id="loaderdiv" class="loader" style="display:none"></div>--%>
         <div id="loaderdiv" class="loader" style="display:none"></div>
        <div id="opacitydiv" style="opacity:unset;">
            <!-- Page Content -->
           <div style="min-height: 300px; margin-top:120px;">
        <div style="margin-top: 10px;">
            <div >         
                <div class="row" style="margin-right:0px;margin-left:0px;">
                     <div class="col-12 welcomecss" style="text-align:center;margin-top:20px">
                     USER REGISTRATION                     
                     </div>

                    <div runat="server" visible="false" id="div_successregmsg" class="col-12" style="text-align: center; color: #2826da; font-weight: 600;">
                        Hi
                        <asp:Label ID="lab_usrname" Style="font-size: 20px; color: #ef648e" runat="server" Text=""></asp:Label>, you have been successfully registered<br />
                       
                          <%--<span style="cursor: pointer" data-toggle="modal" data-target="#LogInModal">LOGIN </span>--%>
                          <a   class="welcomecss"  style="color:#3d6d8c"  href="login.aspx"> <u>Click here to LogIn</u></a>
                    </div>

                    <div class="col-12" runat="server"   id="div_SignInError" style="margin-top: 0px; margin-right: 0px; margin-left: 0px;text-align:center">
                        <div style="text-align: center">
                            <asp:Label ID="labSignInError" Style="color: red; font-size: 18px;" CssClass="control-label" runat="server" />&nbsp;
                        </div>
                    </div>
                </div>  
                
                <div class="row" style="margin-right:0px;margin-left:0px"> 
                      

                        <div class="col-2">
                            <div class="panel panel-primary w100p">
                           
                                <div class="panel-body">

                                </div>
                            </div>
                        </div>
                        <div class="col-8">
                            <div class="panel panel-primary w100p">
                              
                                <div class="panel-body" runat="server" id="MainDiv">

                                    <div class="row" style="margin-right: 0px; margin-left: 0px">

                                        <div data-target="#perinfodiv" class="btn btn-info" style="background-color: #3d6d8c; width: 100%; text-align: left;">
                                            Personal Information
                       
                                        </div>


                                        <div id="perinfodiv" style="width: 100%; border: 1px solid #3d6d8c; margin-left: 0px; border-radius: 5px; padding: 20px;" class="collapse show">
                                            <div class="row" style="margin-bottom: 2px;">
                                                <div class="col-6">
                                                    <asp:Label ID="Label1" CssClass="control-label" runat="server" Text="Label"> Name of the Applicant</asp:Label>
                                                </div>
                                                <div class="col-6">
                                                    <asp:Label ID="Label2" CssClass="control-label" runat="server" Text="Label">Mobile</asp:Label>
                                                </div>
                                            </div>

                                            <div class="row" style="margin-bottom: 2px;">
                                                <div class="col-6">
                                                    <asp:TextBox runat="server" Width="250px" placeholder="Name" MaxLength="50" onkeypress="return tabE(this,event)" name="txtname" ID="txtname" onkeyup="fn_touppercase()" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                                    <br>
                                                    <span style="color: red; display: none" id="err_txtname">Should not be blank</span>
                                                </div>
                                                <div class="col-md-6 control-label">
                                                    (+91)<asp:TextBox runat="server" Width="250px" placeholder="Mobile No." name="txtmobile" ID="txtmobile" MaxLength="10" onkeypress="return isNumber_v1(this,event)" onblur="fnmobonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                                    <br>
                                                    <span style="color: red; display: none" id="err_txtmobile">Should not be blank</span>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-bottom: 1px;">
                                                <div class="col-md-6"></div>
                                                <div class="col-md-6"></div>
                                            </div>
                                            <div class="row" style="margin-bottom: 1px;">
                                                <div class="col-md-6">
                                                    <asp:Label ID="Label3" CssClass="control-label" runat="server" Text="Label">Email</asp:Label>
                                                </div>
                                                <div class="col-md-6">
                                                    <asp:Label ID="Label4" CssClass="control-label" runat="server" Text="Label">Date of Birth (DD/MM/YYYY)</asp:Label>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-bottom: 3px;">
                                                <div class="col-6">
                                                    <asp:TextBox runat="server" Width="250px" MaxLength="50" placeholder="Email Address" name="txtemail" ID="txtemail" onkeypress="return tabE(this,event)" onblur="fntxtemailonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                                    <span style="color: red; display: none" id="err_txtemail"></span>
                                                </div>
                                                <div class="col-6">
                                                    <input type="text" placeholder="Pick the date" readonly id="datepicker" />
                                                    <br>
                                                    <span style="color: red; display: none" id="err_datepicker">Should not be blank</span>
                                                </div>
                                            </div>

                                            <div class="row" style="margin-bottom: 1px;">
                                                <div class="col-md-6">
                                                    <asp:Label ID="Label14" CssClass="control-label" runat="server" Text="Label">Gender</asp:Label>
                                                </div>
                                                <div class="col-md-6"></div>
                                            </div>
                                            <div class="row" style="margin-bottom: 3px;margin-left:0px;padding-left:0px">
                                                <div class="col-5 align-content-between" id="genderRow">
                                                    <input type="radio" style="cursor: pointer !important;" onkeypress="return tabE(this,event)" name="browser" onclick="rdogenderclick(this.value)" runat="server" id="rdo_Male" value="Male" />&nbsp;<label style="cursor: pointer!important;margin-top:6px" for="rdo_Male">Male&nbsp;&nbsp;</label>
                                                    <input type="radio" style="cursor: pointer!important;" onkeypress="return tabE(this,event)" name="browser" onclick="rdogenderclick(this.value)" runat="server" id="rdo_Female" value="Female" />&nbsp;<label style="cursor: pointer!important;" for="rdo_Female">Female&nbsp;&nbsp;</label>
                                                    <input type="radio" style="cursor: pointer!important;" onkeypress="return tabE(this,event)" name="browser" onclick="rdogenderclick(this.value)" runat="server" id="rdo_TransGender" value="Transgender" />&nbsp<label style="cursor: pointer!important;" for="rdo_TransGender">Transgender</label>
                                                    <span style="color: red; display: none" id="err_rdogender">Select Gender</span>
                                                </div>
                                                <div class="col-7">
                                                </div>
                                            </div>


                                        </div>

                                    </div>

                                    <div data-target="#eduinfodiv" class="btn btn-info" style="background-color: #3d6d8c; width: 100%; text-align: left;">
                                        Educational Information
                        
                                    </div>
                                    <div id="eduinfodiv" style="width: 100%; border: 1px solid #3d6d8c; margin-left: 0px; border-radius: 5px; padding: 20px;"
                                        class="collapse show">
                                    
                                      

                                        <div class="row" style="margin-bottom: 5px;">
                                            <div class="col-md-6">
                                                <asp:Label ID="Label15" CssClass="control-label" runat="server" Text="Label">Permanent Medical Council Number</asp:Label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="Label16" CssClass="control-label" runat="server" Text="Label">NEET PG 2024 ROLL NO</asp:Label>
                                            </div>
                                        </div>
                                        <div class="row" style="margin-bottom: 5px;">
                                            <div class="col-md-6">
                                                <asp:TextBox runat="server" ID="txtMedicalCouncilNumber" onkeypress="return tabE(this,event)" MaxLength="20" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                               
                                            </div>
                                            <div class="col-md-6">
                                                <asp:TextBox runat="server" ID="txtNeetRollNo" onkeypress="return tabE(this,event)" MaxLength="12" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                                <br />
                                                <span style="color: red; display: none" id="err_txtneetmarks">Should not be blank</span>

                                            </div>

                                        </div>
                                        <div class="row" style="margin-bottom: 5px;">
                                            <div class="col-md-6"></div>
                                            <div class="col-md-6"></div>
                                        </div>

                                    </div>

                                    <div data-target="#logininfodiv" class="btn btn-info" style="background-color: #3d6d8c; width: 100%; text-align: left;">
                                        Login Information
                          
                                    </div>
                                    <div id="logininfodiv" style="width: 100%; border: 1px solid #3d6d8c; margin-left: 0px; border-radius: 5px; padding: 20px;"
                                        class="collapse show">
                                        <div class="row" style="margin-bottom: 5px;">
                                            <div class="col-md-4">
                                                <asp:Label ID="Label9" CssClass="control-label" runat="server" Text="Label">Login Id</asp:Label>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:Label ID="Label10" CssClass="control-label" runat="server" Text="Label">Password</asp:Label>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:Label ID="Label11" CssClass="control-label" runat="server" Text="Label">Confirm Password</asp:Label>
                                            </div>
                                        </div>

                                        <div class="row" style="margin-bottom: 5px;">
                                            <div class="col-4">
                                                <asp:TextBox runat="server" onkeypress="return tabE(this,event)" ID="txtloginid" placeholder="Login Id" MaxLength="12" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                                <span style="color: red; display: none;" id="err_txtloginid">Should not be empty</span>
                                            </div>
                                            <div class="col-4">
                                                <asp:TextBox runat="server" onkeypress="return tabE(this,event)" ID="txtpass" onkeyup="javascript:fnCheckPwdStrength()" placeholder="Password" MaxLength="12" Style="margin: 4px 0; display: inline-block; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box;" TextMode="Password" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                                <%-- <asp:TextBox runat="server" onkeypress="return tabE(this,event)"  data-toggle="tooltip" data-html="true" data-placement="top"  title="first tooltip<br>Test<br>test"  ID="txtpass" onkeyup="javascript:fnCheckPwdStrength()" placeholder="Password" MaxLength="12" Style="margin: 4px 0; display: inline-block; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box;" TextMode="Password" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>--%>


                                                <div style="display: none;" id="pwdStrength">
                                                    <small class="text-muted">Password Strength : <span id="pwdStrengthText" class="text-muted"></span></small>
                                                    <span style="border: 4px solid yellow; display: none; width: 30%;" id="pwdStrengthYellow"></span>
                                                    <span style="border: 4px solid orange; display: none; width: 30%;" id="pwdStrengthOrange"></span>
                                                    <span style="border: 4px solid red; display: none; width: 30%;" id="pwdStrengthRed"></span>
                                                </div>


                                            </div>
                                            <div class="col-4">
                                                <asp:TextBox runat="server" ID="txtconfpass" placeholder="Confirm Password" MaxLength="12" Style="margin: 4px 0; display: inline-block; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box;" TextMode="Password" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>

                                                <span style="color: red; display: none" id="err_txtconfpass">Should not be blank</span>
                                                <span style="color: red; display: none" id="err_txtconfpassmismatch">Confirm password does not match</span>
                                            </div>
                                        </div>
                                        <div class="row" style="margin-bottom: 5px;">
                                            <div class="col-4">
                                            </div>
                                            <div class="col-8">
                                                <span style="color: green;">
                                                    <small>> Password length between 6 to 12 characters<br />
                                                    </small>
                                                    <small>> Password should contain alphabets, numbers & special characters</small>
                                                </span>
                                            </div>
                                        </div>


                                    </div>



                                    <div style="text-align: center; background-color: #3d6d8c; padding-top: 5px; padding-bottom: 5px;">
                                        <button type="button" onclick="validateregform()" class="btn btn-primary">Submit</button>
                                        <button type="button" onclick="resetform()" class="btn btn-secondary">Reset</button>
                                    </div>
                                </div>
                            <div class="panel-body" runat="server" id="div_SignInSuccess" visible="false">
                                <div class="row">
                                    <div class="col-12" style="text-align: center">
                                        <asp:Label ID="labSignInSuccess" Style="color: red; font-size: 18px;" CssClass="control-label" runat="server" />&nbsp;
                                    </div>
                                </div>
                            </div>
                                
                                 </div>
                        </div>
                        <div class="col-2">
                                    <div class="panel panel-primary w100p">
                                      <%--  <div class="panel-heading">
                                            <i class="glyphicon glyphicon-link"></i>&nbsp;Announcements
                                        </div>--%>
                                        <div class="panel-body">

                                        


                                        </div>
                                    </div>
                                </div>
                      
                       

                </div>
            </div>
              
        </div>
    </div>
   </div>
          <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top" style="background-color: #496c8e!important">
  <div class="container">
    <span class="small" style="text-align:center; color:white">Website <br />
                    www.tnmedicalselection.org <br />
                    www.tnhealth.org 
         </span>
       <div class="collapse navbar-collapse" >
            
       </div>
    <div class="collapse navbar-collapse" >

       </div> 
      
    <div class="collapse navbar-collapse" >
         <span class="small" style="text-align:center; color:white">Email <br />
                    mbbsbds2020enquiry@gmail.com <br />
                    Contact No. <br />
                    044-2836 1674 / 044-2986 2045 / 044-2836<br />
             0675 / 044-2836 0674 / 044-2836 4884
         </span>
         <div class="collapse navbar-collapse" >

       </div> 
       <span class="small" style="text-align:center; color:white">Contact <br />
                    DIRECTORATE OF MEDICAL EDUCATION (DME), <br />
                    Selection Committee <br />
                    #162, Periyar E.V.R. High Road,<br />
                    Kilpauk, Chennai-600010   
         </span>
    </div>
  </div>
</nav>
        <asp:HiddenField ID="hd_gender" runat="server"/>
        <asp:HiddenField ID="hd_qualify_exam" runat="server" />
        <asp:HiddenField ID="hd_datepicker" runat="server" />        
        <asp:HiddenField ID="hd_qualified_year" runat="server" />
        <asp:HiddenField ID="hd_submitfor" runat="server" />
         <asp:HiddenField ID="loginusrname" runat="server" />
        <asp:HiddenField ID="hd_loginusrid" runat="server" />
        
    
    </form>
    <script>
        $('#more').click(function () {
            if ($('button span').hasClass('glyphicon-chevron-down')) {
                $('#more').html('<span class="fa fa-bar-chart-o"></span> Less Info');
            }
            else {
                $('#more').html('<span class="glyphicon glyphicon-minus"></span> More Info');
            }
        });
        $(function () {
           
            $("#datepicker").datepicker({
               // dateFormat : 'dd, MM, yy',
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy',
                maxDate: 0,
                yearRange: '1960:2005',
                //yearRange: '1980:' + new Date().getFullYear().toString(),                
                onSelect: function (dateText, inst) {
                    document.getElementById("err_datepicker").innerHTML = "";
                    var orgField = document.getElementById("datepicker")
                    orgField.style.borderColor = "#cccccc";
                }
            }); 

            
            //alert($('#datepicker').text);
        });
    </script>
      
      
     <script>
      
            
         /// $("#LogInModal").modal()

         if (document.getElementById("hd_submitfor").value == "LoginAuth") {
             var x = document.getElementById("LogInModal");
             x.style.display = "block";
         }
         if (document.getElementById("hd_submitfor").value == "Registration") {
             var x = document.getElementById("SignInModal");
             x.style.display = "block";
         }
         
           function closeloginmodal()
         {
               resetloginwindow();
               //document.getElementById("loginusrid").value = "";
               //document.getElementById("loginpassword").value = "";
                let x = document.getElementById("LogInModal");
                x.style.display = "none";
           }
     //       showloading(0);
       
      
    /*           $(document).ready(function () {
               $('[data-toggle="tooltip"]').tooltip();
           });  */
    </script>
</body>

   
</html>
