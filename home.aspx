<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="pg_home" %>

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
    <style>
        /*::placeholder {
  color: #e2adad;
  font-size: 1.0em;
}*/
    </style>

      
    <script src="CustomJs/home.js"></script>
    <script src="CustomJs/generic.js"></script>
    <link href="CustomCss/Loader.css?1=1" rel="stylesheet" />
    
     

</head>
<body  >
    <form id="form1" runat="server">

            <!-- Header -->
   
          <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top" style="background-color: #496c8e!important">
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
                <span class="" style="text-align:center; color:white"><b>GOVERNMENT OF TAMIL NADU <br />
                     DIRECTORATE OF MEDICAL EDUCATION <br />
                    SELECTION COMMITTEE <br />
                    ADMISSION TO TAMILNADU PG COURSES 2025-2026</b></span>
      <ul class="navbar-nav ml-auto">
         <li class="nav-item active">                   
         <a onclick="MovetoStaticPage('home.aspx'); return false;" class="nav-link" href="#">Home
                <span class="sr-only">(current)</span>
              </a>
        </li>
        <li class="nav-item">
          <a  onclick="MovetoStaticPage('home.aspx'); return false;" class="nav-link" href="#">About</a>
        </li>
        <li class="nav-item">
         <%-- <a class="nav-link" href="#">Login</a>LogInModal--%>
            <%--<span class="nav-link" style="cursor:pointer" data-toggle="modal" data-target="#LogInModal">LogIn </span>--%>
            <span class="" style="cursor:pointer;">
                 <a  onclick="MovetoStaticPage('home.aspx'); return false;" class="nav-link"  style="color:#ffc107" href="login.aspx">LogIn</a>
            </span>

        </li>
        <li class="nav-item">
         <%-- <a class="nav-link"  href="#"><span data-toggle="modal" data-target="#SignInModal"></span>Sign In</a>--%>
             <a   class="nav-link"  style="color:#ffc107" href="registerpg.aspx">Register</a>
            
        </li>
      </ul>
    </div>
  </div>
</nav>
       
       <%--  <div id="loadertextdiv" class="loading-text" style="display:none">Loading Please Wait ...</div>
                <div id="loaderdiv" class="loader" style="display:none"></div>--%>
         <div id="loaderdiv" class="loader" style="display:none"></div>
        <div id="opacitydiv" style="opacity:unset;">
            <!-- Page Content -->
           <div style="min-height: 300px; margin-top: 10px;">
        <div style="margin-top: 10px;">
            <div class="top20  ">         
                <div class="row" style="margin-right:0px;margin-left:0px">
                     <div class="col-md-12 welcomecss" style="text-align:center">
                         Welcome to the 2025-2026 Academic Year                         
                     </div>
                    <div class="col-md-12" style="text-align:center">
                         Use the below steps to submit your application successfully
                     </div>
                      <div runat="server" visible="false" id="div_successregmsg" class="col-md-12" style="text-align:center;color: #2826da;font-weight:600;">
                         Hi <asp:Label ID="lab_usrname" style="font-size:30px;color:#ef648e" runat="server" Text=""></asp:Label>, you have been successfully registered<br />
                          Click here to 
                          <span style="cursor:pointer" data-toggle="modal" data-target="#LogInModal">LOGIN </span>
                     </div>
                    
                </div>  
                <div class="row" style="margin-right:0px;margin-left:0px"> 
                        <div class="col-md-1">

                        </div>

                        <div class="col-md-2">
                            <div class="panel panel-primary w100p">
                                <div class="panel-heading">
                                    <i class="glyphicon glyphicon-link"></i>&nbsp;Quick Links
                                </div>
                                <div class="panel-body">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="panel panel-primary w100p">
                                <div class="panel-heading">
                                    <img style="width:98%;" src="Images/Flow_v1.jpg" /> 
                                </div>
                                <div class="panel-body">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                                    <div class="panel panel-primary w100p">
                                        <div class="panel-heading">
                                            <i class="glyphicon glyphicon-link"></i>&nbsp;Announcements
                                        </div>
                                        <div class="panel-body">
                                        </div>
                                    </div>
                                </div>
                       <div class="col-md-1">

                       </div>
                       

                </div>
            </div>
              
        </div>
    </div>

          <!-- User Registration Modal -->
          <div class="modal" tabindex="-1" id="SignInModal" role="dialog"  data-backdrop="static">
              <div class="modal-dialog" role="document" style="max-width:60%;min-height:400px">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title">Registration</h5>
                    <button type="button" class="close" data-dismiss="modal" onclick="javascript:closesigninmodal()" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                   <div class="row" runat="server" id="div_SignInError" style="position:relative; margin-right:0px;margin-left:0px">
                       <div class="col-md-12" style="text-align:center">
                       <asp:Label ID="labSignInError" style="color: red;font-size: 18px;" CssClass="control-label" runat="server"/>&nbsp;
                           </div>
                   </div>
                  
                       <div class="row" style="margin-right:0px;margin-left:0px">
                       <%--<a href="#perinfodiv" class="btn btn-info" style="background-color:#5d85ab; width: 100%;text-align: left;margin-bottom: 12px;"  data-toggle="collapse">Personal Information</a> 
                          <div id="perinfodiv" style="width:95%;margin-left:20px" class="collapse">--%>
                        
                      
                        <div data-target="#perinfodiv" class="btn btn-info" style="background-color:#5d85ab; width:100%;text-align: left;margin-bottom: 12px;">Personal Information
                           <%-- <i class="fa fa-arrow"></i>--%>
                        </div>
                        
                           <!--    <div id="eduinfodiv" style="width: 95%; margin-left: 20px; margin-bottom: 15px; border-radius: 5px; background-color: #f2f2f2; padding: 20px;"
                          class="collapse show">
                          <div class="row" style="margin-bottom: 5px;">
                               -->
                          <div id="perinfodiv" style="width: 95%; margin-left: 20px; margin-bottom: 15px; border-radius: 5px; background-color: #f2f2f2; padding: 20px;" class="collapse show">
                               <div class="row" style="margin-bottom: 2px;" >
                               <div class="col-md-6">
                                   <asp:Label ID="Label1" CssClass="control-label" runat="server" Text="Label"> Name (As in 12th Mark Sheet)</asp:Label></div>
                               <div class="col-md-6"> <asp:Label ID="Label2" CssClass="control-label" runat="server" Text="Label">Mobile</asp:Label></div>
                               </div>
                                <div class="row"  style="margin-bottom: 2px;"  >
                               <div class="col-md-6">  <asp:TextBox runat="server" Width="250px" placeholder="Name" MaxLength="50" onkeypress="return tabE(this,event)" name="txtname" ID="txtname" onkeyup="fn_touppercase()" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                 <br><span style="color:red;display:none" id="err_txtname">Should not be blank</span>
                               </div>
                               <div class="col-md-6">  <asp:TextBox runat="server"  Width="250px" placeholder="Mobile No." name="txtmobile" ID="txtmobile" MaxLength="10" onkeypress="return isNumber_v1(this,event)"   onblur="fnmobonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                    <br><span style="color:red;display:none" id="err_txtmobile">Should not be blank</span>
                               </div>
                               </div>
                               <div class="row"  style="margin-bottom: 1px;"  >
                               <div class="col-md-6"></div>
                               <div class="col-md-6"></div>
                               </div>
                               <div class="row"  style="margin-bottom:1px;"  >
                               <div class="col-md-6"> <asp:Label ID="Label3" CssClass="control-label" runat="server" Text="Label">Email</asp:Label></div>
                               <div class="col-md-6"> <asp:Label ID="Label4" CssClass="control-label" runat="server" Text="Label">Date of Birth (DD/MM/YYYY)</asp:Label></div>
                               </div>
                                <div class="row"  style="margin-bottom: 3px;"  >
                               <div class="col-md-6">  <asp:TextBox runat="server"  Width="250px" MaxLength="50"  placeholder="Email Address" name="txtemail" ID="txtemail"  onkeypress="return tabE(this,event)" onblur="fntxtemailonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                   <span style="color:red;display:none" id="err_txtemail"></span>
                               </div>
                               <div class="col-md-6">  <input type="text"  placeholder="Pick the date" readonly  id="datepicker"  />
                                   <br><span style="color:red;display:none" id="err_datepicker">Should not be blank</span> 
                               </div>
                               </div>

                                 <div class="row"  style="margin-bottom:1px;"  >
                               <div class="col-md-6"> <asp:Label ID="Label14" CssClass="control-label" runat="server" Text="Label">Gender</asp:Label></div>
                               <div class="col-md-6"></div>
                               </div>
                                <div class="row"  style="margin-bottom: 3px;"  >
                               <div class="col-md-6" > 
                                  <input type="radio" style="cursor:pointer !important;" onkeypress="return tabE(this,event)" name="browser" onclick="rdogenderclick(this.value)" runat="server" id="rdo_Male" value="Male"/>&nbsp;<label style="cursor:pointer!important;" for="rdo_Male">Male&nbsp;&nbsp;</label> 
                                  <input type="radio" style="cursor:pointer!important;" onkeypress="return tabE(this,event)" name="browser" onclick="rdogenderclick(this.value)" runat="server" id="rdo_Female"  value="Female"/>&nbsp;<label style="cursor:pointer!important;" for="rdo_Female">Female&nbsp;&nbsp;</label> 
                                  <input type="radio" style="cursor:pointer!important;" onkeypress="return tabE(this,event)" name="browser" onclick="rdogenderclick(this.value)" runat="server" id="rdo_TransGender" value="Transgender"/>&nbsp<label style="cursor:pointer!important;" for="rdo_TransGender">Transgender</label>  
                                    <span style="color:red;display:none" id="err_rdogender">Select Gender</span>
                               </div>
                               <div class="col-md-6">  
                               </div>
                               </div>

                            <%--   <div class="row"  style="margin-bottom:5px;"  >
                               <div class="col-md-6"></div>
                               <div class="col-md-6"> </div>
                               </div>--%>
                           
                            </div>
                           
                           </div>
                           <div data-target="#eduinfodiv" class="btn btn-info" style="background-color:#5d85ab; width:100%;text-align: left;margin-bottom: 12px;">Educational Information
                          <%--  <i class="fa fa-arrow"></i>--%>
                        </div>
                      <div id="eduinfodiv" style="width: 95%; margin-left: 20px; margin-bottom: 15px; border-radius: 5px; background-color: #f2f2f2; padding: 20px;"
                          class="collapse show">
                          <div class="row" style="margin-bottom: 5px;">
                              <div class="col-md-6"> <asp:Label ID="Label5" CssClass="control-label" runat="server" Text="Label">Whether +1 Passed</asp:Label></div>
                              <div class="col-md-6"> <asp:Label ID="Label6" CssClass="control-label" runat="server" Text="Label">Qualifying Examination</asp:Label></div>
                          </div>
                          <div class="row" style="margin-bottom: 5px;">
                              <div class="col-md-6" >
                                  <asp:RadioButton ID="RadioButton1" style="cursor:pointer" onkeypress="return tabE(this,event)" Checked="true" runat="server" GroupName="plusonepassed" />&nbsp;<label style="cursor:pointer" for="RadioButton1">Yes</label>
                                  &nbsp;
                                     <asp:RadioButton ID="RadioButton2" style="cursor:pointer" onkeypress="return tabE(this,event)" runat="server" GroupName="plusonepassed" />&nbsp;<label style="cursor:pointer" for="RadioButton2">No</label>
                              </div>
                              <div class="col-md-6">
                                  <asp:DropDownList ID="ddlqualifyexams"  onkeypress="return tabE(this,event)" onchange="fnddlonchange(this)" runat="server"></asp:DropDownList>
                                  <br /><span style="color:red;display:none"  id="err_ddlqualifyexams">Select Qualifying Examination</span>
                              </div>
                          </div>
                          <div class="row" style="margin-bottom: 5px;">
                              <div class="col-md-6"></div>
                              <div class="col-md-6"></div>
                          </div>
                          <div class="row" style="margin-bottom: 5px;">
                              <div class="col-md-6"> <asp:Label ID="Label7" CssClass="control-label" runat="server" Text="Label">HSC Roll Number</asp:Label></div>
                              <div class="col-md-6"> <asp:Label ID="Label8" CssClass="control-label" runat="server" Text="Label">Qualified Year</asp:Label></div>
                          </div>
                          <div class="row" style="margin-bottom: 5px;">
                              <div class="col-md-6">
                                  <asp:TextBox runat="server" ID="txthscrollno"  placeholder="HSC Roll No"  onkeypress="return tabE(this,event)" MaxLength="12" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                   <br /><span style="color:red;display:none" id="err_txthscrollno">Should not be blank</span>
                              </div>
                              <div class="col-md-6">
                                   <asp:DropDownList ID="ddlqualifiedyear"   onkeypress="return tabE(this,event)" onchange="fnddlonchange(this)" runat="server"></asp:DropDownList><br />
                                  <span style="color:red;display:none" id="err_ddlqualifiedyear">Select Qualified Year</span>
                              </div>
                             
                          </div>

                              <div class="row" style="margin-bottom: 5px;">
                              <div class="col-md-6"> <asp:Label ID="Label15" CssClass="control-label" runat="server" Text="Label">NEET Roll Number</asp:Label></div>
                              <div class="col-md-6"> <asp:Label ID="Label16" CssClass="control-label" runat="server" Text="Label">NEET Marks</asp:Label></div>
                          </div>
                          <div class="row" style="margin-bottom: 5px;">
                              <div class="col-md-6">
                                  <asp:TextBox runat="server" ID="txtneetrollno"  onkeypress="return tabE(this,event)" placeholder="NEET Roll No" MaxLength="12" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                   <br /><span style="color:red;display:none" id="err_txtneetrollno">Should not be blank</span>
                              </div>
                              <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtneetmarks"  onkeypress="return tabE(this,event)" placeholder="NEET Obtained Marks" MaxLength="12" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                   <br /><span style="color:red;display:none" id="err_txtneetmarks">Should not be blank</span>
                              
                              </div>
                             
                          </div>
                          <div class="row" style="margin-bottom: 5px;">
                              <div class="col-md-6"></div>
                              <div class="col-md-6"> </div>
                          </div>

                      </div>

                          <div data-target="#logininfodiv" class="btn btn-info" style="background-color:#5d85ab; width:100%;text-align: left;margin-bottom: 12px;">Login Information
                           <%-- <i class="fa fa-arrow"></i>--%>
                        </div>
                      <div id="logininfodiv" style="width: 95%; margin-left: 20px; margin-bottom: 15px; border-radius: 5px; background-color: #f2f2f2; padding: 20px;"
                          class="collapse show">
                               <div class="row" style="margin-bottom: 5px;">
                               <div class="col-md-4"> <asp:Label ID="Label9" CssClass="control-label" runat="server" Text="Label">Login Id</asp:Label></div>
                               <div class="col-md-4"> <asp:Label ID="Label10" CssClass="control-label" runat="server" Text="Label">Password</asp:Label></div>
                               <div class="col-md-4"> <asp:Label ID="Label11" CssClass="control-label" runat="server" Text="Label">Confirm Password</asp:Label></div>
                               </div>
                                 <div class="row" style="margin-bottom: 5px;">
                               <div class="col-md-4">  <asp:TextBox runat="server"  onkeypress="return tabE(this,event)" ID="txtloginid" placeholder="Login Id" MaxLength="12" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                    <br><span style="color:red;display:none" id="err_txtloginid">Should not be blank</span>
                               </div>
                               <div class="col-md-4">  <asp:TextBox runat="server"  onkeypress="return tabE(this,event)" ID="txtpass" placeholder="Password"  MaxLength="12" style="margin: 4px 0; display: inline-block; border:1px solid #ccc; border-radius:4px;box-sizing:border-box;" TextMode="Password" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                    <br><span style="color:red;display:none" id="err_txtpass">Should not be blank</span>
                               </div>
                               <div class="col-md-4">  <asp:TextBox runat="server" ID="txtconfpass" placeholder="Confirm Password"  MaxLength="12" style="margin: 4px 0; display: inline-block; border:1px solid #ccc; border-radius:4px;box-sizing:border-box;" TextMode="Password" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                    <br><span style="color:red;display:none" id="err_txtconfpass">Should not be blank</span>
                                   <span style="color:red;display:none" id="err_txtconfpassmismatch">Confirm password does not match</span>
                               </div>
                               </div>
                          

                           </div>

                    
                     
                      
                  </div>
                  <div  style="text-align:center;  background-color:#88a8c7;padding-top: 5px;padding-bottom: 5px;">
                    <button type="button" onclick="validateform()" class="btn btn-primary">Submit</button>
                    <button type="button" onclick="closesigninmodal()" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div> 

      
        </div>
          <!-- Footer-->
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
       
      
    </script>
</body>

   
</html>

