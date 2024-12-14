<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="pinfo.aspx.cs" Inherits="pg_pinfo" %>

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

    <script src="CustomJs/pinfo.js?1=10"></script>
    <script type="text/javascript">
        function fnscrolldown() {
            //  window.scrollTo(0, screen.height)
        }

        function formatdatetoddmmyy() {

            var val = document.getElementById("hd_datepicker").value;
            //var strarr = val.split("/");
            //var str2 = strarr[1] + "/" + strarr[0] + "/" + strarr[2]           
            document.getElementById("hd_datepicker").value = val

            if (document.getElementById("issueddate")) {
                document.getElementById("issueddate").value = val
            }

            var e = document.getElementById("ddlmothertongue");
            if (e.options[e.selectedIndex].text == "Others") { // Selected Otheres
                var x2 = document.getElementById("spanothermt");
                x2.style.display = "block";
            }

            let subcasteid = document.getElementById("hd_subcasteId").value;
            let ide = "spn" + subcasteid;
            if (document.getElementById(ide)) {
                let seletedtxt = document.getElementById(ide).innerHTML;
                document.getElementById("divlab_subcaste").innerHTML = seletedtxt;
            }
            fnscrolldown();
        }
 
        function isNumber(evt, field) {
            var iKeyCode = (evt.which) ? evt.which : evt.keyCode
            if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
                return false;
            debugger;
            var id = field.ID;
            var id = "errmsg_" + id
            var x = document.getElementById(id);
            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }


            return true;
        }
        function fnSubmit() {
            var x = document.getElementById("errmsg_txthscrollno");
            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
            document.getElementById("txthscrollno").focus();
        }
       
      

        function fnsubcasteindclick(subcasteid) {
            debugger;
            document.getElementById("hd_subcasteId").value = subcasteid;
            let ide = "spn" + subcasteid;
            document.getElementById("_" + subcasteid).checked = true;
            let seletedtxt = document.getElementById(ide).innerHTML;
            document.getElementById("divlab_subcaste").innerHTML = seletedtxt;

            clearAllLiBackgrounds();

            // set current background
            ide = "href_" + subcasteid;
            if (document.getElementById(ide)) {
                let x1 = document.getElementById(ide);
                x1.style.backgroundColor = "#c9f99a";
            }
            

        }

        function clearAllLiBackgrounds() {

            // Declare variables
            let input, filter, ul, li, a, i, txtValue;
            input = document.getElementById('myInput');
            filter = input.value.toUpperCase();
            ul = document.getElementById("myUL");
            li = ul.getElementsByTagName('li');

            let idd;
            let xl;
            // Loop through all list items, and hide those who don't match the search query
            for (i = 0; i < li.length; i++) {
                a = li[i].getElementsByTagName("a")[0];
                idd = a.id;
                if (document.getElementById(idd)) {
                    x1 = document.getElementById(idd);
                    x1.style.backgroundColor = "#e3effb";
                }
            }
        }    

    </script>
    <script src="CustomJs/generic.js"></script>
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
           <!-- SubCasteModal -->
     <div class="modal" style="display:none" id="SubCasteModal" role="dialog" data-backdrop="static">
         <div class="modal-dialog" role="document" style="max-width: 60%; min-height: 300px">
             <div class="modal-content">
                 <div class="modal-header">
                     <h5 class="modal-title">Sub Caste List</h5>
                        <button type="button" onclick="closesubcastemodal()" class="btn btn-primary">Select & Close</button>
                    <%-- <button type="button" class="close" data-dismiss="modal" onclick="javascript:closesubcastemodal()" aria-label="Close">
                         <span aria-hidden="true">&times;</span>
                     </button>--%>
                 </div>
                    <div >                      
                        
                        <input type="text" id="myInput" onkeyup="fnfilterSubCaste()" placeholder="Search for yours ..."/> 
                             
                 </div>
                 <div class="modal-body">                          
                       <div>
                         
                                <asp:Literal ID="lit_subcastlist" runat="server"/>
                         
                      </div>
                 </div>
                 <div style="text-align: center; background-color: #a2a9b1; padding-top: 5px; padding-bottom: 5px;">
                  <%--   <button type="button" onclick="closesubcastemodal()" class="btn btn-primary">Select & Close</button>--%>
                 </div>
             </div>
         </div>
     </div>

      
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

                                        <div class="d-flex flex-wrap col-lg 3 col-md-6 col-sm-12 col-xs-12">
                                            <div style="width: 50%">
                                                <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px">
                                                    <asp:Label ID="Label1" CssClass="control-label" runat="server" Text="Label">NAME OF THE APPLICANT</asp:Label><br />
                                                    <span><b>
                                                        <asp:Label ID="lab_name" runat="server" Text=""></asp:Label></b></span>
                                                </div>
                                            </div>
                                            <div class="p-2 bd-highlight">
                                                <asp:Label ID="Label2" CssClass="control-label" runat="server" Text="DATE OF BIRTH"></asp:Label><div>
                                                    <span><b>
                                                        <asp:Label ID="lab_dob" runat="server" Text=""></asp:Label></b></span>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="d-flex flex-wrap col-lg 3 col-md-6 col-sm-12 col-xs-12">
                                            <div style="width: 50%">
                                                <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px">
                                                    <asp:Label ID="Label11" CssClass="control-label" runat="server" Text="Label"> PERMANENT MEDICAL COUNCIL NUMBER</asp:Label><br />
                                                    <span><b>
                                                        <asp:Label ID="lab_permmcnumber" runat="server" Text="" /></b></span>
                                                </div>
                                            </div>
                                            <div class="p-2 bd-highlight">
                                                <asp:Label ID="Label20" CssClass="control-label" runat="server" Text="Label">NEET PG 2024 ROLL NO</asp:Label><div>
                                                    <span><b>
                                                        <asp:Label ID="lab_neetpgrollno" runat="server" Text="" /></b></span>
                                                </div>
                                            </div>
                                        </div>

                                        
                                        <div class="d-flex flex-wrap col-lg 3 col-md-6 col-sm-12 col-xs-12">
                                            <div style="width: 50%">
                                                <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px">
                                                    <asp:Label ID="Label7" CssClass="control-label" runat="server" Text="Label">EMAIL ADDRESS</asp:Label><br />
                                                    <span><b>
                                                        <asp:Label ID="lab_emailaddress" runat="server" Text="" /></b></span>
                                                </div>
                                            </div>
                                            <div class="p-2 bd-highlight">
                                                <asp:Label ID="Label8" CssClass="control-label" runat="server" Text="Label">ALTERNATIVE MOBILE NO.</asp:Label><div>
                                                 <asp:TextBox  runat="server" Width="200px" class="boxBorder"  onblur="fntxtonblur(this)" name="txtAltMobileNo"  ID="txtAltMobileNo"  ></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                     <%--   <div class="d-flex flex-wrap col-lg 3 col-md-6 col-sm-12 col-xs-12">
                                            <div style="width: 50%">
                                                <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px">
                                                    <asp:Label ID="Label7" CssClass="control-label" runat="server" Text="Label">NEET ROLL NO</asp:Label><br />
                                                    <span><b>
                                                        <asp:Label ID="lab_neetrollno" runat="server" Text="" /></b></span>
                                                </div>
                                            </div>
                                            <div class="p-2 bd-highlight">
                                                <asp:Label ID="Label8" CssClass="control-label" runat="server" Text="Label">GENDER</asp:Label><div>
                                                    <span><b>
                                                        <asp:Label ID="lab_gender" runat="server" Text="" /></b></span>
                                                </div>
                                            </div>
                                        </div>--%>


                                 

                                    <div class="d-flex flex-wrap col-lg 3 col-md-6 col-sm-12 col-xs-12">
                                        <div style="width: 50%">
                                            <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px">
                                                <asp:Label ID="Label13" CssClass="control-label" runat="server" Text="Label">NAME OF THE PARENT/GUARDIAN</asp:Label><br />
                                                <asp:TextBox runat="server" class="boxBorder" Width="250px" name="txtparentname" MaxLength="50" placeholder="Name of the Parent/Guardian" ID="txtparentname" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                                <span style="color: red; display: none" id="err_txtparentname">Should not be blank</span>
                                            </div>
                                        </div>
                                        <div class="p-2 bd-highlight">
                                            <div>
                                                <asp:Label ID="Label15" CssClass="control-label" runat="server" Text="PLACE OF BIRTH"></asp:Label>
                                                <div>
                                                    <asp:DropDownList ID="ddlPlaceOfBirth" class="boxBorder" runat="server" onchange="fnddlonchange(this)" Width="200px"></asp:DropDownList>
                                                    <span style="color: red; display: none" id="err_PlaceOfBirth">Select Scooling</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>



                                    <div class="d-flex flex-wrap col-lg 3 col-md-6 col-sm-12 col-xs-12">
                                        <div style="width: 50%">
                                            <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px">
                                                <asp:Label ID="Label9" CssClass="control-label" runat="server"> NATIONALITY</asp:Label><br />
                                                <asp:DropDownList ID="ddlnationality" class="boxBorder" onchange="fnddlonchange(this)" runat="server" Width="250px"></asp:DropDownList>
                                                <span style="color: red; display: none" id="err_ddlnationality">Select Nationality</span>
                                            </div>
                                        </div>
                                        <div class="p-2 bd-highlight">
                                            <asp:Label ID="Label10" CssClass="control-label" runat="server" Text="Label">RELIGION</asp:Label><div>
                                                <asp:DropDownList ID="ddlreligion" class="boxBorder" onchange="fnddlonchange(this)" runat="server" Width="200px"></asp:DropDownList>
                                                <span style="color: red; display: none" id="err_ddlreligion">Select Religion</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-wrap col-lg 3 col-md-6 col-sm-12 col-xs-12">
                                        <div style="width: 50%">
                                            <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px">
                                                <asp:Label ID="Label5" CssClass="control-label" runat="server" Text="Label"> MOTHERE TONGUE</asp:Label><br />
                                                <asp:DropDownList ID="ddlmothertongue" class="boxBorder" onchange="fnddlmtonchange(this)" runat="server" Width="250px"></asp:DropDownList>
                                                <span style="color: red; display: none" id="err_ddlmothertongue">Select Mother Tongue</span>
                                            </div>
                                        </div>
                                        <div class="p-2 bd-highlight">
                                            
                                            <asp:Label ID="Label6" CssClass="control-label" runat="server" Text="Label">NATIVITY</asp:Label><div>                                                 
                                                <asp:DropDownList ID="ddlnativity" AutoPostBack="true" OnSelectedIndexChanged="ddlnativity_SelectedIndexChanged" class="boxBorder" onchange="fnddlonchangeNativity(this)" runat="server" Width="200px"></asp:DropDownList>
                                                <span style="color: red; display: none" id="err_ddlnativity">Select Nativity</span>
                                           
                                            </div>
                                             
                                        </div>
                                    </div>

                                      <div class="d-flex flex-wrap col-lg 3 col-md-6 col-sm-12 col-xs-12">
                                        <div style="width: 50%">
                                            <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px">
                                                <asp:Label ID="Label19" CssClass="control-label" runat="server"> PERMANET ADDRESS</asp:Label><br />
                                                <asp:TextBox  runat="server" Width="350px" name="txtidentmarks"  class="boxBorder" onblur="fntxtonblur(this)"  TextMode="MultiLine" Height="50px"  ID="txtPermanentAddress"  ></asp:TextBox>
                                                
                                            </div>
                                        </div>
                                        <div class="p-2 bd-highlight">
                                            <asp:Label ID="Label21" CssClass="control-label" runat="server" Text="Label">COMMUNICATION ADDRESS</asp:Label>
                                            <input type="checkbox" id="chkCopyAddress" title="Same as PERMANET ADDRESS" onclick="fnCopyAddress()" />
                                            <div>
                                                <asp:TextBox  runat="server" Width="350px" name="txtidentmarks"  class="boxBorder" onblur="fntxtonblur(this)"  TextMode="MultiLine" Height="50px"  ID="txtCommunicationAddress"  ></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="d-flex flex-wrap col-lg 3 col-md-6 col-sm-12 col-xs-12">
                                        <div id="spanothermt" style="width: 50%; display: none">
                                            <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px">
                                                <asp:TextBox runat="server" CssClass="txtborder" Width="250px" MaxLength="100" name="txtmtname" placeholder="Specify Mother Tongue" ID="txtmtname" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                                <span style="color: red; display: none" id="err_txtmtname">Specify Mother Tongue</span>
                                            </div>
                                        </div>
                                        <div class="p-2 bd-highlight">
                                        </div>
                                    </div>

                                     
                                      </div>
                                  

                                    
                                       <div class="panel panel-info" style="margin-bottom: 0px">
                                        <div class="panel-heading" style="font-size: 20px">
                                            <span style="padding: 20px;font-weight:500">SPECIAL RESERVATION</span>
                                        </div>
                                            <div class="row"  style="padding:18px">

                                                <div class="col-6">
                                                    <asp:Label ID="Label22" CssClass="control-label" runat="server" Text="ARE YOU ORTHOPAEDICALLY PHYSICALLY DISABLED?"></asp:Label>
                                                </div>
                                                <div class="col-6">
                                                    <asp:DropDownList ID="ddl_PhysicallyDisabled" class="boxBorder"    runat="server" Width="200px"></asp:DropDownList>
                                                </div>

                                                  <div class="col-6">
                                                    <asp:Label ID="Label24" CssClass="control-label" runat="server" Text="ARE YOU CLAIM FOR CMC 20% CHRISTIAN MINORITY.?"></asp:Label>
                                                </div>
                                                <div class="col-6">
                                                    <asp:DropDownList id="ddl_CliamChristianMinority" class="boxBorder"  runat="server" Width="200px"></asp:DropDownList>
                                                </div>
                                           
                                         

                                    </div>
                                           </div>

                                       <div class="panel panel-info" style="margin-bottom: 0px">
                                        <div class="panel-heading" style="font-size: 20px">
                                            <span style="padding: 20px;font-weight:500">COMMUNITY INFORMATION</span>
                                        </div>
                                        <div class="panel-body"  style="padding-top:6px">
                                            <div class="d-flex flex-wrap col-lg 3 col-md-6 col-sm-12 col-xs-12">
                                                <div style="width: 30%">
                                                    <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px">
                                                        <asp:Label ID="Label12" CssClass="control-label" runat="server" Text="Label">COMMUNITY</asp:Label><br />
                                                        <asp:DropDownList ID="ddlcommunity" class="boxBorder" AutoPostBack="true" OnSelectedIndexChanged="ddlcommunity_SelectedIndexChanged" onchange="fnddlonchangeCommunity(this)" runat="server" Width="200px"></asp:DropDownList>
                                                        <span style="color: red; display: none" id="err_ddlcommunity">Select Community</span>
                                                    </div>
                                                   <%-- <div id="loaderdivCommunity" class="loader" style="display:none"></div>--%>
                                                </div>
                                                                                             
                                            </div>
                                            <div class="d-flex flex-wrap col-lg 3 col-md-6 col-sm-12 col-xs-12">
                                                    <div class="p-2 bd-highlight" style="width: 95%">
                                                    <asp:Label ID="Label14" CssClass="control-label" runat="server" Text="Label">SUB CASTE WITH CODE</asp:Label><div>
                                                        <div id="divlab_subcaste"  class="boxBorder" runat="server" style="border:1px solid #cccccc;" onclick="opensubcastemodal()">-- Select Sub Caste --</div>
                                                        
                                                        <%--<asp:TextBox runat="server" CssClass="txtborder" MaxLength="50" Width="200px" ReadOnly="true" placeholder="Sub Caste" name="txtsubcaste" ID="txtsubcaste" onfocus="opensubcastemodal()" ></asp:TextBox>
                                                         <asp:DropDownList ID="ddlsubcaste" CssClass="txtborder" onchange="fnddlonchange(this)" runat="server" Width="200px"></asp:DropDownList>--%>
                                                        <span style="color: red; display: none" id="err_ddlsubcaste">Select Sub Caste</span>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div id="trCertificateInfo" runat="server" >
                                            <div   class="d-flex flex-wrap col-lg 3 col-md-6 col-sm-12 col-xs-12">
                                                 <div style="width:20%" class="p-2 bd-highlight">
                                                    <asp:Label ID="Label3" CssClass="control-label" runat="server" Text="Label">CERTIFICATE NO.</asp:Label><div>
                                                        <asp:TextBox runat="server" Width="160px" MaxLength="50" class="boxBorder" placeholder="Certificate No." name="txtcertificateno" ID="txtcertificateno" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                                        <span style="color: red; display: none" id="err_txtcertificateno">Should not be blank</span>
                                                    </div>
                                                </div>
                                                <div style="width:20%">
                                                    <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px">
                                                        <asp:Label ID="Label4" CssClass="control-label" runat="server" Text="Label">ISSUED BY</asp:Label><br />
                                                        <asp:TextBox runat="server" class="boxBorder" MaxLength="100" Width="160px" placeholder="Issued by" name="txtissuedby" ID="txtissuedby" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                                        <span style="color: red; display: none" id="err_txtissuedby">Should not be blank</span>
                                                    </div>
                                                </div>
                                                <div class="p-2 bd-highlight" style="width:20%">
                                                    <asp:Label ID="Label16" CssClass="control-label" runat="server" Text="Label">ISSUED TALUK</asp:Label><div>
                                                        <asp:TextBox runat="server" class="boxBorder" MaxLength="50" Width="160px" placeholder="Issued Taluk" name="txtissuedtaluk" ID="txtissuedtaluk" onblur="fntxtonblur(this)" onfocus="fntxtfocus(this)"></asp:TextBox>
                                                        <span style="color: red; display: none" id="err_txtissuedtaluk">Should not be blank</span>
                                                    </div>
                                                </div>
                                                  <div class="p-2 bd-highlight" style="width:20%">
                                                    <asp:Label ID="Label18" CssClass="control-label" runat="server" Text="Label">COMM DISTRICT</asp:Label><div>
                                                        <asp:DropDownList ID="ddlcommdistrict" class="boxBorder" AutoPostBack="false" onchange="fnddlonchange(this)" runat="server" Width="160px"></asp:DropDownList>
                                                        <span style="color: red; display: none" id="err_ddlcommdistrict">Select Community</span>
                                                    </div>
                                                </div>
                                                <div class="p-2 bd-highlight"  style="width:20%">
                                                    <asp:Label ID="Label17" CssClass="control-label" runat="server" Text="Label">ISSUED DATE</asp:Label><div>
                                                        <input type="text" class="boxBorder"   placeholder="Pick Issued date" onblur="fntxtonblur(this)" readonly size="15px"  id="issueddate" name="issueddate" />
                                                        <span style="color: red; display: none" id="err_issueddate">Select Issue Date</span>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                                </div>
                                        </div>
                                    </div>

                                    <div style="text-align: center; background-color: #dcebfb; padding-top: 5px; padding-bottom: 5px;">
                                        <button type="button" id="buttPersonalInfoSave" onclick="validatePersonalInfo()" class="btn btn-primary">Save & Continue
                                              <i class="fa fa-arrow-right"></i>
                                        </button>
                                      <%--  <button type="button" class="btn btn-secondary" data-dismiss="modal">Clear</button>--%>
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

            $("#issueddate").datepicker({
                // dateFormat : 'dd, MM, yy',
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy',
                maxDate: 0,
                yearRange: '1970:' + new Date().getFullYear().toString(),
                onSelect: function (dateText, inst) {
                    document.getElementById("err_issueddate").innerHTML = "";
                    if (document.getElementById("issueddate").value != "") { fnSetBorder("issueddate", 0) }
                }
            });

            //alert($('#datepicker').text);
        });
    </script>
        <script>
    // Selecting the iframe element
            var iframe = document.getElementById("headerIframe");
    
    // Adjusting the iframe height onload event
    iframe.onload = function(){
     //   iframe.style.height = iframe.contentWindow.document.body.scrollHeight + 'px';        
    }
    </script>

           <script type="text/javascript">
      
            var val = document.getElementById("hd_datepicker").value;
            //var strarr = val.split("/");
               //var str2 = strarr[1] + "/" + strarr[0] + "/" + strarr[2]  
           
            //document.getElementById("hd_datepicker").value = val
            if (document.getElementById("issueddate")) {
                if (val == "01/01/1900") {
                    document.getElementById("issueddate").value = "";
                }
                else 
                {
                    document.getElementById("issueddate").value = val;
                }
            }

            var e = document.getElementById("ddlmothertongue");
            if (e.options[e.selectedIndex].text == "Others") { // Selected Otheres
                var x2 = document.getElementById("spanothermt");
                x2.style.display = "block";
            }

            
            document.getElementById("txtparentname").onkeyup = function () { fnOnKeyUp("txtparentname"); };
            document.getElementById("txtAltMobileNo").onkeyup = function () { fnOnKeyUp("txtAltMobileNo"); };

            if (document.getElementById("txtPermanentAddress")) {
                document.getElementById("txtPermanentAddress").onkeyup = function () { fnOnKeyUp("txtPermanentAddress"); };
            }

            if (document.getElementById("txtCommunicationAddress")) {
                document.getElementById("txtCommunicationAddress").onkeyup = function () { fnOnKeyUp("txtCommunicationAddress"); };
            }
               
           // var e1 = document.getElementById("ddlcommunity");
            if (document.getElementById("txtcertificateno")) {
                document.getElementById("txtcertificateno").onkeyup = function () { fnOnKeyUp("txtcertificateno"); };
            }
            if (document.getElementById("txtissuedby")) {
                document.getElementById("txtissuedby").onkeyup = function () { fnOnKeyUp("txtissuedby"); };
            }
            if (document.getElementById("txtissuedtaluk")) {
                document.getElementById("txtissuedtaluk").onkeyup = function () { fnOnKeyUp("txtissuedtaluk"); };
            }
            if (document.getElementById("issueddate")) {
                document.getElementById("issueddate").onkeyup = function () { fnOnKeyUp("issueddate"); };
            }
                




           // document.getElementById("ddlschooling").onchange = function () { fnOnKeyUpddl("ddlschooling"); };
            
            function resetBorderColor() {
                if (document.getElementById("txtparentname").value != "") { fnSetBorder("txtparentname", 0) }
                var e = document.getElementById("ddlPlaceOfBirth");
                if (document.getElementById("ddlPlaceOfBirth").options[e.selectedIndex].value != 0) { fnSetBorder("ddlPlaceOfBirth", 0) }
                e = document.getElementById("ddlnationality");
                if (document.getElementById("ddlnationality").options[e.selectedIndex].value != 0) { fnSetBorder("ddlnationality", 0) }
                e = document.getElementById("ddlreligion");
                if (document.getElementById("ddlreligion").options[e.selectedIndex].value != 0) { fnSetBorder("ddlreligion", 0) }
                e = document.getElementById("ddlmothertongue");
                if (document.getElementById("ddlmothertongue").options[e.selectedIndex].value != 0) { fnSetBorder("ddlmothertongue", 0) }
                e = document.getElementById("ddlnativity");
                if (document.getElementById("ddlnativity").options[e.selectedIndex].value != 0) { fnSetBorder("ddlnativity", 0) }
                e = document.getElementById("ddlcommunity");
                if (document.getElementById("ddlcommunity").options[e.selectedIndex].value != 0) { fnSetBorder("ddlcommunity", 0) }
                if (document.getElementById("divlab_subcaste").innerHTML != "-- Select Sub Caste --") { fnSetBorder("divlab_subcaste", 0) }


                if (document.getElementById("txtAltMobileNo").value != "") { fnSetBorder("txtAltMobileNo", 0) }
              

                if (document.getElementById("ddl_PhysicallyDisabled")) {
                    fnSetBorder("ddl_PhysicallyDisabled", 0)
                }

                if (document.getElementById("ddl_CliamChristianMinority")) {
                    fnSetBorder("ddl_CliamChristianMinority", 0)
                }

                if (document.getElementById("txtPermanentAddress")) {
                    if (document.getElementById("txtPermanentAddress").value != "") {
                        fnSetBorder("txtPermanentAddress", 0);
                    }
                }

                if (document.getElementById("txtCommunicationAddress")) {
                    if (document.getElementById("txtCommunicationAddress").value != "") {
                        fnSetBorder("txtCommunicationAddress", 0);
                    }
                }   


                if (document.getElementById("txtcertificateno")) {
                    if (document.getElementById("txtcertificateno").value !="") {
                        fnSetBorder("txtcertificateno", 0);
                    }
                }
                if (document.getElementById("txtissuedby")) {
                    if (document.getElementById("txtissuedby").value != "") {
                        fnSetBorder("txtissuedby", 0);
                    }
                }
                if (document.getElementById("txtissuedtaluk")) {
                    if (document.getElementById("txtissuedtaluk").value != "") {
                        fnSetBorder("txtissuedtaluk", 0);
                    }
                }
                if (document.getElementById("issueddate")) {
                    if (document.getElementById("issueddate").value != "") {
                        fnSetBorder("issueddate", 0);
                    }
                }
                
                if (document.getElementById("ddlcommdistrict")) {
                    e = document.getElementById("ddlcommdistrict");
                    if (document.getElementById("ddlcommdistrict").options[e.selectedIndex].value != 0) { fnSetBorder("ddlcommdistrict", 0) }
                }
              

                 
            }
            // atlast resetting border box color
            resetBorderColor();
          // showloading(0);
    </script>
           <script>
        window.addEventListener('scroll', function() {
            var myDiv = document.querySelector('.myMenuItems');
            var scrollTop = window.scrollY || document.documentElement.scrollTop;
            myDiv.style.top = (10 + scrollTop) + 'px'; // Adjust as needed
        });
    </script>

</body>
</html>
