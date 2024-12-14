<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="template.aspx.cs" Inherits="pg_template" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Personal Information</title>

    <script src="jquery/3.4.1/jquery.slim.min.js"></script> 
    <script src="bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>    
    <link href="bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    
    <!-- for calander -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

    <!-- Side Nav Bar -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
     
    <link href="CustomCss/StyleSheet.css" rel="stylesheet" />
    <link href="CustomCss/Loader.css" rel="stylesheet" />
       <style>
        
        #myInput {
 /*background-image: url('/pmcdin/images/searchicon.png'); *//* Add a search icon to input */
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

 

.boxBorder {
    box-shadow:5px 3px 5px #e51313;
}
 
.fixedElement {
   /*  background-color: #c0c0c0;*/
    position:fixed;
    top:0;
    width:100%;
    z-index:100;
}
 
   .container {
            
        }

        .sticky {
            position: fixed;
            top: 145px;
            
           
          
            padding-bottom: 20px;
        }
            .myMenuItems {
            position: absolute;
           /*  top: 100px; Initial position */
           width:92%;
        }
    </style>

</head>

   <body>
        <!-- Header -->
       <div class="fixedElement"  style="height:120px;overflow:hidden; border-color:red">
        <iframe src="header.html?usrid=<%=usrnameforhdr%>" id="headerIframe"  style=" overflow: hidden;" title="Personal Info Header"></iframe>
           </div>

 <form id="form1" runat="server">
    <div  style="margin-top:120px">
          
     
       <div id="loaderdiv" class="loader" style="display:none">
           
       </div>
        <div id="opacitydiv" style="opacity:unset;">
        <!-- Page Content -->
        <div  style="min-height: 300px;">
            <div class="row " style="margin-left: 0px; width: 100%">
                <div class="col-md-3 sidebar" style="background-color: #405f7d;">
                   
                    
                         <div class="myMenuItems">
                        <a class="d-flex justify-content-between" onclick="MovetoPage('pinfo.aspx','perinfo'); return false;" href="#1">
                            <span id="leftnav_perinfo" runat="server"><i class="fa fa fa-user"></i>&nbsp;Personal Information</span>
                            <i id="leftnav_perinfoTickIcon" visible="false" runat="server" class="fa fa-check" style="color: #ffbf35; font-size: 1.5em; margin-top: 1px" aria-hidden="true"></i>
                        </a>
                        <a class="d-flex justify-content-between" onclick="MovetoPage('edu.aspx','eduinfo'); return false;" href="#2">
                            <span id="leftnav_eduinfo" runat="server"><i class="fa fa-graduation-cap" aria-hidden="true"></i>&nbsp;Education Information</span>
                            <i id="leftnav_eduinfoTickIcon" visible="false" runat="server" class="fa fa-check" style="color: #ffbf35; font-size: 1.5em; margin-top: 1px" aria-hidden="true"></i>
                        </a>
                        <a class="d-flex justify-content-between" onclick="MovetoPage('service.aspx','service'); return false;" href="#4">
                            <span id="leftnav_service" runat="server"><i class="fa fa-user-md" aria-hidden="true"></i>&nbsp;Service Information</span>
                            <i id="leftnav_serviceTickIcon" visible="false" runat="server" class="fa fa-check" style="color: #ffbf35; font-size: 1.5em; margin-top: 1px" aria-hidden="true"></i>
                        </a>
                        <a class="d-flex justify-content-between" onclick="MovetoPage('proforma.aspx','proformainfo'); return false;" href="#6">
                            <span id="leftnav_proformainfo" runat="server"><i class="fa fa-plus-square" aria-hidden="true"></i>&nbsp;Proforma </span>
                            <i id="leftnav_proformainfoTickIcon" visible="false" runat="server" class="fa fa-check" style="color: #ffbf35; font-size: 1.5em; margin-top: 1px" aria-hidden="true"></i>
                        </a>
                        <a class="d-flex justify-content-between" onclick="MovetoPage('upld.aspx','upload'); return false;" href="#7">
                            <span id="leftnav_upload" runat="server"><i class="fa fa-upload" aria-hidden="true"></i>&nbsp;Documents Upload</span>
                            <i id="leftnav_uploadTickIcon" visible="false" runat="server" class="fa fa-check" style="color: #ffbf35; font-size: 1.5em; margin-top: 1px" aria-hidden="true"></i>
                        </a>

                        <a onclick="MovetoPage('apppreview.aspx','apppreview'); return false;" href="#7"><span id="leftnav_apppreview" runat="server"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;Application Preview</span></a>
                        <a onclick="PrintApplication('appprint.aspx','print'); return false;" href="#7"><span id="leftnav_print" runat="server"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;Print / Download</span></a>
                        <span id="leftnav_submit" runat="server" visible="false">
                            <button type="button" onclick="javascript:submitapp()" class="btn btn-success">
                                <i class="fa fa-save"></i>&nbsp;&nbsp; Submit Your Application
                            </button>
                        </span>
                    </div>
                        
                    </div>

                <div class="col-md-9 col-md-offset-1" style="margin-top: 10px;"><!-- removed after complete max-width: 100%-->
                    <div class="md-whiteframe-24dp ">
                        
                        <div class="container" style="padding-top:12px">
                            <div class="panel-group" style="margin-bottom: 10px">
                                <div class="panel panel-info">
                                    <div class="panel-heading" style="font-size: 20px">
                                        <span style="padding: 20px;font-weight:600">PERSONAL INFORMATION</span>
                                    </div>
                                    <div class="panel-body" style="padding-top:7px">
  
                                      </div>
                                   
                                  
                                    <div style="text-align: center; background-color: #dcebfb; padding-top: 5px; padding-bottom: 5px;">
                                        <button type="button" id="buttPersonalInfoSave" onclick="validatePersonalInfo()" class="btn btn-primary">Save & Continue
                                              <i class="fa fa-arrow-right"></i>
                                        </button>
                                   
                                    </div>
                                    <br />
                                </div>

                            </div>



                        </div>
                    </div>

                </div>
            </div>
        </div>
            </div>
        <!-- Footer-->
        <div  style="height:120px;overflow:hidden; border-color:red">
        <iframe src="footer.html" style="border-width:0px !important; overflow: hidden;" title="Personal Info Header"></iframe>
           </div>


        <asp:HiddenField ID="hd_PlaceOfBirth" runat="server" />
        <asp:HiddenField ID="hd_nationalityId" runat="server" />
        <asp:HiddenField ID="hd_religionId" runat="server" />
        <asp:HiddenField ID="hd_mothertongueId" runat="server" />
        <asp:HiddenField ID="hd_nativityId" runat="server" />
        <asp:HiddenField ID="hd_communityId" runat="server" />
        <asp:HiddenField ID="hd_subcasteId" runat="server" />
        <asp:HiddenField ID="hd_datepicker" runat="server" />
        <asp:HiddenField ID="hd_submitfor" runat="server" Value="" />
        <asp:HiddenField ID="loginusrid" runat="server" />
        <asp:HiddenField ID="loginusrname" runat="server" />
       </div>
    </form>
          

</body>
</html>

