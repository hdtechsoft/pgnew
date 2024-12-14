<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="pg_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <script src="jquery/3.4.1/jquery.slim.min.js"></script>
    <script src="bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
     <link href="bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
     
    <link href="jquery/UI/1.12.1/jquery-ui.css" rel="stylesheet" />
    <link href="CustomCss/StyleSheet.css" rel="stylesheet" />

    <script src="CustomJs/login.js?1=1"></script>
    <script src="CustomJs/generic.js"></script>
    <link href="CustomCss/Loader.css?1=1" rel="stylesheet" />

    <style>
        .padlft20 {
            padding-left: 20px;
        }

        .txtrightAlign {
            text-align: right;
        }

        .UsrupdFile {
            position: relative;
            overflow: hidden;
            margin: 10px;
        }

            .UsrupdFile input.upload {
                position: absolute;
                top: 0;
                right: 0;
                margin: 0;
                padding: 0;
                font-size: 20px;
                cursor: pointer;
                opacity: 0;
                filter: alpha(opacity=0);
            }
              .txtcolorwhite{
            color:#fff;
        }

              .myForm {
  min-width: 500px;
  position: absolute;
  text-align: center;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 2.5rem
}
@media (max-width: 500px) {
  .myForm {
    min-width: 90%;
  }
}



 
        
        #myInput {
  background-image: url('/pmcdin/images/searchicon.png'); /* Add a search icon to input */
  background-position: 10px 12px; /* Position the search icon */
  background-repeat: no-repeat; /* Do not repeat the icon image */
  width: 100%; /* Full-width */
  font-size: 16px; /* Increase font-size */
  padding: 12px 20px 12px 40px; /* Add some padding */
  border: 1px solid #ddd; /* Add a grey border */
  margin-bottom: 12px; /* Add some space below the input */
}


#myUL {
  /* Remove default list styling */
  list-style-type: none;
  padding: 0;
  margin: 0;
}

#myUL li a {
  border: 1px solid #ddd; /* Add a border to all links */
  margin-top: -1px; /* Prevent double borders */
   background-color: #e3effb; /*Grey background color */
  padding: 12px; /* Add some padding */
  text-decoration: none; /* Remove default text underline */
  font-size: 18px; /* Increase the font-size */
  color: black; /* Add a black text color */
  display: block; /* Make it into a block element to fill the whole list */

}
 

#myUL li a:hover:not(.header) {
  background-color: #c9f99a; /* Add a hover effect to all links, except for headers */
  cursor:pointer
}
.radio-label {
   display: inline-block;
    vertical-align: top;
    margin-right: 3%;
}
.radio-input {
   display: inline-block;
    vertical-align: top;
}


    </style>
</head>
<body>
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
                    ADMISSION TO TAMILNADU MBBS/BDS COURSES 2025-2026</b></span>
      <ul class="navbar-nav ml-auto">
         <li class="nav-item active">                   
         <a  class="nav-link" href="home.aspx">Home
                <span class="sr-only">(current)</span>
              </a>
        </li>
        <li class="nav-item">
          <a  onclick="MovetoStaticPage('home.aspx'); return false;" class="nav-link" href="#">About</a>
        </li>
        <li class="nav-item">
         <%-- <a class="nav-link" href="#">Login</a>LogInModal--%>
              <a   class="nav-link"  style="color:#ffc107" href="login.aspx">Login</a>
        </li>
        <li class="nav-item">
         <%-- <a class="nav-link"  href="#"><span data-toggle="modal" data-target="#SignInModal"></span>Sign In</a>--%>
              <a   class="nav-link"  style="color:#ffc107" href="register.aspx">Register</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
       
           <div id="loaderdiv" class="loader" style="display:none"></div>
              <div id="opacitydiv" style="opacity:unset;">
                     <div style="min-height: 300px; margin-top: 10px;">
        <div style="margin-top: 10px;">
            <div class="top20  ">         
                <div class="row" style="margin-right:0px;margin-left:0px">
                     <div class="col-md-12 welcomecss" style="text-align:center">
                         Welcome to the 2025-2026 Academic Year                         
                     </div>
                   
                  <%--    <div runat="server" visible="false" id="div_successregmsg" class="col-md-12" style="text-align:center;color: #2826da;font-weight:600;">
                         Hi <asp:Label ID="lab_usrname" style="font-size:30px;color:#ef648e" runat="server" Text=""></asp:Label>, you have been successfully registered<br />
                          Click here to 
                          <span style="cursor:pointer" data-toggle="modal" data-target="#LogInModal">LOGIN </span>
                     </div>--%>
                     </div>
                </div>  
                <div class="row" style="margin-right:0px;margin-left:0px"> 
                         

                        <div class="col-4">
                            <div class="panel panel-primary w100p">
                                <div class="panel-heading  text-center welcomecss">
                                    <i class="glyphicon glyphicon-link"></i>&nbsp;Quick Links
                                </div>
                                <div class="panel-body">
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <br />
                           <div class="text-center welcomecss" style="background-color: #3d6d8c;color: white;">
                               USER LOGIN
                           </div>
                            <div class="panel panel-primary w100p" style="border:0px">
                                <div class="panel-heading">

                                     <!-- Nav tabs -->
                                    <ul class="nav nav-tabs" style="border:1px solid #00a2b6;height:45px">
                                        <li class="nav-item" style="width:50%; ">
                                            <%--<a class="nav-link active" style="padding-right:0px" id="hrefbyUserId" data-toggle="tab" href="#byUserId">User Id</a>--%>
                                           
                                            <asp:Button ID="buttByUserId" OnClick="buttByUserId_Click" OnClientClick="javascript:return fnCheckUserIdClicked()"  style="color:blue;border:0px" Width="100%" Height="100%" runat="server" Text="User ID" />
                                            
                                        </li>
                                        <li class="nav-item" style="width:50%">
                                            <%--<a class="nav-link" data-toggle="tab" id="hrefbyMobile" href="#byMobile">Mobile</a>--%>
                                            <asp:Button ID="buttByMobile" OnClick="buttByMobile_Click" OnClientClick="javascript:return fnCheckMobileOtpClicked()" style="color:blue;border:0px" Width="100%" Height="100%" runat="server" Text="Mobile OTP" />
                                        </li>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" runat="server" visible="true" style="padding-left: 0px; padding-right: 0px;" id="divUserId">
                                            <div style="border: 1px solid #37a1b7; padding: 15px;">
                                                <div class="form-group" style="margin-top: 10px;">
                                                    <span style="font-weight:500" >User Id</span>
                                                    <asp:TextBox runat="server" CssClass="form-control" onkeyup="javascript:chktrustyempty(this)" placeholder="User Id" name="txtloginusrid" MaxLength="12" ID="txtloginusrid"></asp:TextBox>
                                                    <span id="_txtloginusrid" style="display: none; color: red">Required</span>
                                                </div>
                                                <div class="form-group">
                                                   <span style="font-weight:500" >Password</span>
                                                    <asp:TextBox runat="server" CssClass="form-control" onkeyup="javascript:chktrustyempty(this)" Style="border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box;" onkeypress="return focusonloginauth(this,event)" MaxLength="12" TextMode="Password" placeholder="Password" name="loginpassword" ID="loginpassword"></asp:TextBox>
                                                    <span id="_loginpassword" style="display: none; color: red">Required</span>
                                                </div>
                                                <div class="form-group text-center">
                                                    <button type="button" onclick="loginauth()" class="btn btn-primary">LOGIN</button>
                                                    <button type="button" onclick="resetloginwindow()" class="btn btn-secondary">CLEAR</button>
                                                </div>
                                                <div class="form-group text-center" id="eInvalidLogin" runat="server">
                                                    <span class="text-danger"><b>
                                                        <asp:Label ID="labLoginError" Style="color: red; font-size: 18px;" CssClass="control-label" runat="server" />
                                                    </b></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane  active"  runat="server" visible="false" style="padding-left:0px; padding-right: 0px;" id="divMobile">
                                             <div style="border: 1px solid #37a1b7; padding: 15px;">
                                                 <div class="form-group">
                                                    <span style="font-weight:500" >Registered Mobile No.</span>  
                                                     <table><tr><td>
                                                         (+91)
                                                  </td>
                                                         <td><asp:TextBox runat="server" CssClass="form-control" onkeyup="javascript:chktrustyempty(this)" Style="border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box;width:295px" onkeypress="return focusonloginauth(this,event)" MaxLength="12"  placeholder="Mobile No." ID="txtMobileNo"></asp:TextBox></td>

                                                            </tr></table>                                                  
                                                  
                                                </div>
                                                  <div class="form-group">
                                                   <span style="font-weight:500" >Date of Birth</span>
                                                    <asp:TextBox runat="server" CssClass="form-control" style="width:295px; margin-top:10px;margin-left:45px" placeholder="DD/MM/YYYY" onkeyup="javascript:chktrustyempty(this)" name="txtDateOfBirth" MaxLength="12" ID="txtDateOfBirth"></asp:TextBox>                                                                                                         
                                                </div>
                                              

                                                  <div class="form-group" runat="server" id="OTPInputpanel" style="margin-top: 10px;">
                                                       <span style="font-weight:500" >Enter OTP received in your Registered Mobile No.</span> 
                                                    
                                                    <asp:TextBox runat="server" CssClass="form-control" onkeyup="javascript:chktrustyempty(this)"  Width="95px" MaxLength="12" ID="txtOTP"></asp:TextBox>                                                                                                         
                                                       <span class="small" style="padding-left:15px;color:orange" id="timerSpan"></span>
                                                       <asp:Button ID="buttResendOTP" CssClass="btn btn-primary" OnClick="buttResendOTP_Click" Enabled="false" runat="server" Text="Resend OTP" />
                                                      
                                                </div>

                                                <div class="form-group text-center"  style="margin-top: 10px;">
                                                    <asp:Button ID="buttSendOTP" CssClass="btn btn-primary" OnClick="buttSendOTP_Click" OnClientClick="javascript:return fnValidateOtpInputFields()" runat="server" Text="Send OTP" />
                                                    <asp:Button ID="buttLoginbyOTP" CssClass="btn btn-primary" OnClick="buttLoginbyOTP_Click" OnClientClick="javascript:return loginauthbyOtp()" runat="server" Text="Login" />
                                                    
                                                    <button type="button" onclick="resetloginwindowforOtp()" class="btn btn-secondary">CLEAR</button>
                                                </div>
                                                <div class="form-group text-center" id="eInvalidLoginbyOTP" runat="server">
                                                    <span class="text-danger"><b>
                                                        <asp:Label ID="labLoginErrorbyOTP" Style="color: red; font-size: 18px;" CssClass="control-label" runat="server" />
                                                    </b></span>
                                                </div>
                                               </div>
                                            </div>
                                        </div>
                                    </div>
                                        
                                   
                                </div>
                                <div class="panel-body">
                                </div>
                            </div>
                      
                        <div class="col-4">
                                    <div class="panel panel-primary w100p">
                                        <div class="panel-heading  text-center welcomecss">
                                            <i class="glyphicon glyphicon-link"></i>&nbsp;Announcements
                                        </div>
                                        <div class="panel-body">
                                        </div>
                                    </div>
                                </div>
                      
                       

                </div>
            </div>
              
        </div>
    </div>
             

        <asp:HiddenField ID="hd_submitfor" runat="server" />
        <asp:HiddenField ID="loginusrname" runat="server" />
        <asp:HiddenField ID="hd_loginusrid" runat="server" />
        <asp:HiddenField ID="hd_otp" runat="server" />
        <asp:HiddenField ID="hd_submitstatus" runat="server" />
        <asp:HiddenField ID="loginusrid" runat="server" />
        <script type="text/javascript">
            //document.getElementById("loginusrid").focus();


            function dispOTPtimerCount(secondsCnt) {
                
                /* var seconds = secondsCnt;
                 let el = document.getElementById('timerSpan');
                 if (document.getElementById('timerSpan')) {
                     seconds -= 1;
                     el.innerText = "" + seconds.toString();
                     if (seconds > 0) {
                         //dispOTPtimerCount(seconds);
                         seconds = 0;
                         setInterval(dispOTPtimerCount(seconds), 1000);
                     }
                 }
             }
             dispOTPtimerCount(25);*/

                //setTimeout(dispOTPtimerCount(20), 1000);

            }

                var seconds = 120;


                function incrementSeconds() {
                    if (document.getElementById('timerSpan')) {
                        seconds -= 1;                        
                        document.getElementById('timerSpan').innerText = "Resend OTP in " + seconds.toString() + " seconds";
                        if (seconds == 0) {
                            document.getElementById("buttResendOTP").disabled = false;
                        }
                        if (seconds < 0) {
                            document.getElementById('timerSpan').innerText = ""
                        }
                    }
                }
               


                function fnStartResendOTPTimer()
                {
                    if (document.getElementById("buttResendOTP")) {
                        document.getElementById("buttResendOTP").disabled = true;
                        var cancel = setInterval(incrementSeconds, 1000);
                    }
                }
              


          
        </script>
    </form>
</body>
</html>
