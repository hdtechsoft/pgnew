<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="edu.aspx.cs" Inherits="pg_edu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Educational Information</title>

    <script src="jquery/3.4.1/jquery.slim.min.js"></script> 
    <script src="bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>    
    <link href="bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    
    <!-- for calander -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

    <!-- Side Nav Bar -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="CustomJs/edu.js"></script>
    <link href="CustomCss/StyleSheet.css" rel="stylesheet" />
    <link href="CustomCss/Loader.css" rel="stylesheet" />
       <style>
       
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
             .ChkBoxClass input {width:20px; height:20px;vertical-align:middle;}
    </style>

</head>

   <body>
        <!-- Header -->
     

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
                                        <span style="padding: 20px;font-weight:600">EDUCATIONAL INFORMATION</span>
                                    </div>
                                    <div class="panel-body" style="padding-top:7px">

                                        <div class="row" style="margin-left: 0px; margin-right: 0px">
                                             <div class=" col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px">
                                                    <asp:Label ID="Label1" CssClass="control-label" runat="server" Text="PERMANENT MEDICAL COUNCIL NUMBER"></asp:Label><br />
                                                    <span><b>
                                                        <asp:Label ID="lab_name" runat="server" Text="2024150252"></asp:Label></b></span>
                                                </div>
                                            </div>
                                              <div class=" col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                <div class="p-2 bd-highlight">
                                                    <asp:Label ID="Label2" CssClass="control-label" runat="server" Text="DATE OF COMPLETED/ COMPLETION OF CRMI"></asp:Label><div>
                                                        <input type="text" class="boxBorder"   placeholder="Pick the date" onblur="fntxtonblur(this)" readonly size="15px"  id="mbbsCompletedDate" name="mbbsCompletedDate" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row" style="margin-left: 0px; margin-right: 0px">
                                             <div class=" col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px">
                                                    <asp:Label ID="Label3" CssClass="control-label" runat="server" Text="MBBS FINAL YEAR REGISTER NUMBER"></asp:Label><br />
                                                     <asp:TextBox runat="server" Width="200px" class="boxBorder" onblur="fntxtonblur(this)" name="txtFinalYearRegNo" ID="txtFinalYearRegNo"></asp:TextBox>
                                                </div>
                                            </div>
                                              <div class=" col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                <div class="p-2 bd-highlight">
                                                    <asp:Label ID="Label5" CssClass="control-label" runat="server" Text="NO. OF ATTEMPTS IN FINAL YEAR MBBS"></asp:Label><div>
                                                        <asp:TextBox runat="server"  onkeypress="return event.charCode >= 48 && event.charCode <= 57" MaxLength="2"  Width="100px" class="boxBorder" onblur="javascript:fnCheckIsNumeric(this)" name="txtNoOfAttempts" ID="txtNoOfAttempts"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                          
                                      
                                         <div class="row" style="margin-left: 0px; margin-right: 0px">
                                             <div class=" col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px">
                                                    <asp:Label ID="Label6" CssClass="control-label" runat="server" Text="UG STUDIED AT"></asp:Label><br />
                                                    <asp:DropDownList ID="ddlUgStudiedAt" class="boxBorder" onchange="fnOnKeyUpddl('ddlUgStudiedAt')" runat="server" Width="200px"></asp:DropDownList>
                                                </div>
                                            </div>
                                              <div class=" col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                <div class="p-2 bd-highlight">
                                                    <asp:Label ID="Label7" CssClass="control-label" runat="server" Text="UG STUDIED UNDER"></asp:Label><div>
                                                        <asp:DropDownList ID="ddlUgStudiedUnder" class="boxBorder" onchange="fnOnKeyUpddl('ddlUgStudiedUnder')" runat="server" Width="200px"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                          <div class="row" style="margin-left: 0px; margin-right: 0px">
                                             <div class=" col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px">
                                                    <asp:Label ID="Label8" CssClass="control-label" runat="server" Text="NAME OF THE MEDICAL COLLEGE"></asp:Label><br />
                                                     <asp:TextBox runat="server" Width="350px" class="boxBorder" onblur="fntxtonblur(this)" name="txtMedCollegeName" ID="txtMedCollegeName"></asp:TextBox>
                                                </div>
                                            </div>
                                              <div class=" col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                <div class="p-2 bd-highlight">
                                                    <asp:Label ID="Label9" CssClass="control-label" runat="server" Text="NAME OF THE UNIVERSITY"></asp:Label><div>
                                                        <asp:TextBox runat="server" Width="350px" class="boxBorder" onblur="fntxtonblur(this)" name="txtMedUniversityName" ID="txtMedUniversityName"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                         <div class="row" style="margin-left: 0px; margin-right: 0px">
                                             <div class=" col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px">
                                                    <asp:Label ID="Label4" CssClass="control-label" runat="server" Text="YEAR OF REGISTRATION"></asp:Label><br />
                                                     <asp:TextBox runat="server"  onkeypress="return event.charCode >= 48 && event.charCode <= 57" MaxLength="4"  onblur="javascript:fnCheckIsNumeric(this)"  Width="200px" class="boxBorder"   name="txtRegistrationYear" ID="txtRegistrationYear"></asp:TextBox>
                                                </div>
                                            </div>
                                              <div class=" col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                  <div class="p-2 bd-highlight">
                                                    <asp:Label ID="Label24" CssClass="control-label" runat="server" Text="PERCENTILE SCORED IN NEET PG 2024"></asp:Label><div>
                                                        <asp:TextBox runat="server" Width="200px" class="boxBorder" onkeypress="return ((event.charCode >= 48 && event.charCode <= 57) || event.charCode == 46)"  MaxLength="5" onblur="fntxtonblur(this)" name="txtNeetPgPercentlle" ID="txtNeetPgPercentlle"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                          <div class="row" style="margin-left: 0px; margin-right: 0px;align-items:center">
                                             <div class="col-7">
                                                <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px;display:inline-block">
                                                    <span class="control-label">
                                                        ARE YOU <span class="badge badge-warning">UNDERGOING ANY PG</span> OR ITS EQUIVALENT COURSES ?
                                                    </span>
                                                     
                                                </div>
                                            </div>   
                                               <div class="col-5 pl-0"><span>
                                                    <asp:CheckBox ID="chkUnderGoingPG" onclick="javascript:return fnShowUnderGoingPG()" runat="server" CssClass="ChkBoxClass" />
                                                   </span>
                                                </div>                                         
                                        </div>
                                        <div id="UndergoingPGCourse" style="display:none">
                                            <div class="row" style="margin-left: 0px; margin-right: 0px">
                                                <div class="col-2">
                                                </div>
                                               <div class="col-5 text-right">
                                                    <div style="margin-bottom: 0px; margin-top: 4px">
                                                        <asp:Label ID="Label14" CssClass="control-label" runat="server" Text="NAME OF THE COURSE - UNDERGOING"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="col-5 pl-0">
                                                    <div style="margin-bottom: 0px;">
                                                        <asp:DropDownList ID="ddlUndergoingCourse" class="boxBorder" onchange="fnOnKeyUpddl('ddlUndergoingCourse')" runat="server" Width="200px"></asp:DropDownList>
                                                    </div>
                                                </div>

                                            </div>                                            
                                            <div class="row" style="margin-left: 0px; margin-right: 0px">
                                               <div class="col-2">
                                                </div>
                                                <div class="col-5 text-right">
                                                    <div style="margin-bottom: 0px; margin-top: 4px">
                                                        <asp:Label ID="Label12" CssClass="control-label" runat="server" Text="UNDERGOING COURSE SELECTED UNDER"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="col-5 pl-0">
                                                    <div style="margin-bottom: 0px;">
                                                             <asp:DropDownList ID="ddlUndergoingStudiedUnder" class="boxBorder" onchange="fnOnKeyUpddl('ddlUndergoingStudiedUnder')" runat="server" Width="200px"></asp:DropDownList>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row" style="margin-left: 0px; margin-right: 0px">
                                               <div class="col-2">
                                                </div>
                                                <div class="col-5 text-right">
                                                    <div style="margin-bottom: 0px; margin-top: 4px">
                                                        <asp:Label ID="Label11" CssClass="control-label" runat="server" Text="YEAR OF COMPLETION"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="col-5 pl-0">
                                                    <div  style="margin-bottom: 0px;">
                                                        <asp:TextBox runat="server"  onkeypress="return event.charCode >= 48 && event.charCode <= 57" MaxLength="4"  onblur="javascript:fnCheckIsNumeric(this)"  Width="200px" class="boxBorder"   name="txtUndergoingCompletionYear" ID="txtUndergoingCompletionYear"></asp:TextBox>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row border border-secondary" style="margin-left: 0px; margin-right: 0px;margin-top:10px;"> 
                                          
                                            </div>
                                        </div>
                                         <div class="row" style="margin-left: 0px; margin-right: 0px;align-items:center">
                                             <div class="col-7">
                                                <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px;display:inline-block">
                                                   
                                                       <span class="control-label">
                                                       ARE YOU <span class="badge badge-warning">COMPLETED ANY PG</span> OR ITS EQUIVALENT COURSES ?
                                                    </span>
                                                     
                                                </div>
                                            </div>
                                                <div class="col-5 pl-0"><span>
                                                    <asp:CheckBox ID="chkCompletedPG" onclick="javascript:return fnShowCompletedPG()" runat="server" CssClass="ChkBoxClass" />
                                                   </span>
                                                </div>                                               
                                        </div>
                                        <div id="CompletedPGCourse" style="display:none">
                                            <div class="row" style="margin-left: 0px; margin-right: 0px">
                                                <div class="col-2">
                                                </div>
                                                 <div class="col-5 text-right">
                                                    <div class=" bd-highlight form-group" style="margin-bottom: 0px; margin-top: 4px">
                                                        <asp:Label ID="Label15" CssClass="control-label" runat="server" Text="NAME OF THE COURSE - COMPLETED"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="col-5 pl-0">
                                                    <div class=" bd-highlight form-group" style="margin-bottom: 0px;">
                                                        <asp:DropDownList ID="ddlCompletedCourse" class="boxBorder" onchange="fnOnKeyUpddl('ddlCompletedCourse')" runat="server" Width="200px"></asp:DropDownList>
                                                    </div>
                                                </div>

                                            </div>                                            
                                            <div class="row" style="margin-left: 0px; margin-right: 0px">
                                                 <div class="col-2">
                                                </div>
                                                <div class="col-5 text-right">
                                                    <div class=" bd-highlight form-group" style="margin-bottom: 0px; margin-top: 4px">
                                                        <asp:Label ID="Label16" CssClass="control-label" runat="server" Text="COMPLETED COURSE SELECTED UNDER"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="col-5 pl-0">
                                                    <div class=" bd-highlight form-group" style="margin-bottom: 0px;">
                                                            <asp:DropDownList ID="ddlCompletedStudiedUnder" class="boxBorder" onchange="fnOnKeyUpddl('ddlCompletedStudiedUnder')" runat="server" Width="200px"></asp:DropDownList>                                                
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row" style="margin-left: 0px; margin-right: 0px">
                                                <div class="col-2">
                                                </div>
                                                <div class="col-5 text-right">
                                                    <div class=" bd-highlight form-group" style="margin-bottom: 0px; margin-top: 4px">
                                                        <asp:Label ID="Label17" CssClass="control-label" runat="server" Text="YEAR OF COMPLETED"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="col-5 pl-0">
                                                    <div class=" bd-highlight form-group" style="margin-bottom: 0px;">
                                                        <asp:TextBox runat="server"  onkeypress="return event.charCode >= 48 && event.charCode <= 57" MaxLength="4"  onblur="javascript:fnCheckIsNumeric(this)"  Width="200px" class="boxBorder"   name="txtCompletedYear" ID="txtCompletedYear"></asp:TextBox>
                                                    </div>
                                                </div>

                                            </div>
                                              <div class="row border border-secondary" style="margin-left: 0px; margin-right: 0px;margin-top:10px;">                                           
                                        </div>

                                        </div>

                                        <div class="row" style="margin-left: 0px; margin-right: 0px;align-items:center">
                                            <div class="col-7">
                                                <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px; display: inline-block">
                                                    <asp:Label ID="Label18" CssClass="control-label" runat="server" Text=""></asp:Label>
                                                    <span class="control-label">DID YOU <span class="badge badge-warning">DISCONTINUE ANY PG</span> OR ITS EQUIVALENT COURSES ?
                                                    </span>
                                                      </div>
                                            </div>
                                             <div class="col-5 pl-0"><span>
                                                    <asp:CheckBox ID="chkDiscontinuePG" onclick="javascript:return fnShowDiscontinuePG()" runat="server" CssClass="ChkBoxClass" />
                                                   </span>
                                                </div> 
                                        </div>

                                         <div id="DiscontinuedPGCourse" style="display:none">
                                            <div class="row" style="margin-left: 0px; margin-right: 0px">
                                                <div class="col-2">
                                                </div>
                                                 <div class="col-5 text-right">
                                                    <div class=" bd-highlight form-group" style="margin-bottom: 0px; margin-top: 4px">
                                                        <asp:Label ID="Label19" CssClass="control-label" runat="server" Text="NAME OF THE COURSE - DISCONTINUED"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="col-5 pl-0">
                                                    <div class=" bd-highlight form-group" style="margin-bottom: 0px;">
                                                        <asp:DropDownList ID="ddlDiscontinueCourse" class="boxBorder" onchange="fnOnKeyUpddl('ddlDiscontinueCourse')" runat="server" Width="200px"></asp:DropDownList>
                                                    </div>
                                                </div>

                                            </div>                                            
                                            <div class="row" style="margin-left: 0px; margin-right: 0px">
                                                 <div class="col-2">
                                                </div>
                                                <div class="col-5 text-right">
                                                    <div class=" bd-highlight form-group" style="margin-bottom: 0px; margin-top: 4px">
                                                        <asp:Label ID="Label20" CssClass="control-label" runat="server" Text="DISCONTINUED COURSE SELECTED UNDER"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="col-5 pl-0">
                                                    <div class=" bd-highlight form-group" style="margin-bottom: 0px;">
                                                        <asp:DropDownList ID="ddlDiscontinueStudiedUnder" class="boxBorder" onchange="fnOnKeyUpddl('ddlDiscontinueStudiedUnder')" runat="server" Width="200px"></asp:DropDownList>                                                
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row" style="margin-left: 0px; margin-right: 0px">
                                                <div class="col-2">
                                                </div>
                                                <div class="col-5 text-right">
                                                    <div class=" bd-highlight form-group" style="margin-bottom: 0px; margin-top: 4px">
                                                        <asp:Label ID="Label21" CssClass="control-label" runat="server" Text="DATE OF DISCONTINUATION"></asp:Label>
                                                       
                                                    </div> <small> ( Required if PG discontinued )</small>
                                                </div>
                                                <div class="col-5 pl-0">
                                                    <div class=" bd-highlight form-group" style="margin-bottom: 0px;">
                                                        <input type="text" class="boxBorder"   placeholder="Pick the date" onblur="fntxtonblur(this)" readonly size="15px"  id="pgDiscontinueDate" name="pgDiscontinueDate" />
                                                    </div>
                                                </div>

                                            </div>
                                              <div class="row border border-secondary" style="margin-left: 0px; margin-right: 0px;margin-top:10px;">                                           
                                        </div>

                                        </div>

                                        <div class="row" style="margin-left: 0px; margin-right: 0px;align-items:center">
                                            <div class="col-7">
                                                <div class="p-2 bd-highlight form-group" style="margin-bottom: 0px; display: inline-block">
                                                    <asp:Label ID="Label10" CssClass="control-label" runat="server" Text=""></asp:Label>
                                                    <span class="control-label">COMPLETED ANY DIPLOMA ?
                                                    </span>
                                                      </div>
                                            </div>
                                             <div class="col-5 pl-0"><span>
                                                    <asp:CheckBox ID="chkCompletedDiploma" onclick="javascript:return fnShowchkCompletedDiploma()" runat="server" CssClass="ChkBoxClass" />
                                                   </span>
                                                </div> 
                                        </div>

                                         <div id="CompletedDeploma" style="display:none">
                                            <div class="row" style="margin-left: 0px; margin-right: 0px">
                                                <div class="col-2">
                                                </div>
                                                 <div class="col-5 text-right">
                                                    <div class=" bd-highlight form-group" style="margin-bottom: 0px; margin-top: 4px">
                                                        <asp:Label ID="Label13" CssClass="control-label" runat="server" Text="DURATION OF DIPLOMA (IN YEARS)"></asp:Label>
                                                    </div>
                                                      
                                                </div>
                                                <div class="col-5 pl-0">
                                                    <div class=" bd-highlight form-group" style="margin-bottom: 0px;">
                                                        <asp:TextBox runat="server"  onkeypress="return event.charCode >= 48 && event.charCode <= 57" MaxLength="1"  onblur="javascript:fnCheckIsNumeric(this)"  Width="200px" class="boxBorder"   name="txtDiplomaDurationYear" ID="txtDiplomaDurationYear"></asp:TextBox>
                                                    </div>
                                                </div>

                                            </div>                                            
                                            <div class="row" style="margin-left: 0px; margin-right: 0px">
                                                 <div class="col-2">
                                                </div>
                                                <div class="col-5 text-right">
                                                    <div class=" bd-highlight form-group" style="margin-bottom: 0px; margin-top: 4px">
                                                        <asp:Label ID="Label22" CssClass="control-label" runat="server" Text="NAME OF THE DIPLOMA COURSE"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="col-5 pl-0">
                                                    <div class=" bd-highlight form-group" style="margin-bottom: 0px;">
                                                        <asp:TextBox runat="server" Width="200px" class="boxBorder" onblur="fntxtonblur(this)" name="txtDiplomaCourseName" ID="txtDiplomaCourseName"></asp:TextBox>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row" style="margin-left: 0px; margin-right: 0px">
                                                <div class="col-2">
                                                </div>
                                                <div class="col-5 text-right">
                                                    <div class=" bd-highlight form-group" style="margin-bottom: 0px; margin-top: 4px">
                                                        <asp:Label ID="Label23" CssClass="control-label" runat="server" Text="DATE OF COMPLETION OF DIPLOMA"></asp:Label>
                                                       
                                                    </div> 
                                                </div>
                                                <div class="col-5 pl-0">
                                                    <div class=" bd-highlight form-group" style="margin-bottom: 0px;">
                                                           <input type="text" class="boxBorder"   placeholder="Pick the date" onblur="fntxtonblur(this)" readonly size="15px"  id="diplomaCompletedDate" name="diplomaCompletedDate" />
                                                    </div>
                                                </div>

                                            </div>
                                              <div class="row border border-secondary" style="margin-left: 0px; margin-right: 0px;margin-top:10px;">                                           
                                        </div>

                                        </div>



                                     

                                          
                                                  </div>
                                         </div>

                                      


                                        </div>
                                      </div>
                                   
                                  
                                    <div style="text-align: center; background-color: #dcebfb; padding-top: 5px; padding-bottom: 5px;">
                                        <button type="button" id="buttPersonalInfoSave" onclick="javascript:return fnvalidateEducationalInfo()" class="btn btn-primary">Save & Continue
                                              <i class="fa fa-arrow-right"></i>
                                        </button>
                                        <asp:Button ID="buttSave" CssClass="btn btn-primary" runat="server" OnClick="buttSave_Click" OnClientClick="javascript:return fnvalidateEducationalInfo()" Text="Save & Continue" />
                                   
                                    </div>
                                    <br />
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


     
        
        <asp:HiddenField ID="hd_datepicker" runat="server" />
        <asp:HiddenField ID="hd_submitfor" runat="server" Value="" />
        <asp:HiddenField ID="loginusrid" runat="server" />
        <asp:HiddenField ID="loginusrname" runat="server" />
     
     <asp:HiddenField ID="hd_mbbsCompletedDate" runat="server" />
     <asp:HiddenField ID="hd_pgDiscontinueDate" runat="server" />
     <asp:HiddenField ID="hd_diplomaCompletedDate" runat="server" />
     
        
     <script>
         $(function () {

             $("#mbbsCompletedDate").datepicker({
                 // dateFormat : 'dd, MM, yy',
                 changeMonth: true,
                 changeYear: true,
                 dateFormat: 'dd/mm/yy',
                 maxDate: 0,
                 yearRange: '1970:' + new Date().getFullYear().toString(),
                 onSelect: function (dateText, inst) {                     
                     if (document.getElementById("mbbsCompletedDate").value != "") { fnSetBorder("mbbsCompletedDate", 0) }
                 }
             });

             $("#pgDiscontinueDate").datepicker({
                 // dateFormat : 'dd, MM, yy',
                 changeMonth: true,
                 changeYear: true,
                 dateFormat: 'dd/mm/yy',
                 maxDate: 0,
                 yearRange: '1970:' + new Date().getFullYear().toString(),
                 onSelect: function (dateText, inst) {
                     if (document.getElementById("pgDiscontinueDate").value != "") { fnSetBorder("pgDiscontinueDate", 0) }
                 }
             });

             $("#diplomaCompletedDate").datepicker({
                 // dateFormat : 'dd, MM, yy',
                 changeMonth: true,
                 changeYear: true,
                 dateFormat: 'dd/mm/yy',
                 maxDate: 0,
                 yearRange: '1970:' + new Date().getFullYear().toString(),
                 onSelect: function (dateText, inst) {
                     if (document.getElementById("diplomaCompletedDate").value != "") { fnSetBorder("diplomaCompletedDate", 0) }
                 }
             });


             


             //alert($('#datepicker').text);
         });

         if (document.getElementById("txtFinalYearRegNo")) {
             document.getElementById("txtFinalYearRegNo").onkeyup = function () { fnOnKeyUp("txtFinalYearRegNo"); };
         }

         if (document.getElementById("txtNoOfAttempts")) {
             document.getElementById("txtNoOfAttempts").onkeyup = function () { fnOnKeyUp("txtNoOfAttempts"); };
         }

         if (document.getElementById("txtMedCollegeName")) {
             document.getElementById("txtMedCollegeName").onkeyup = function () { fnOnKeyUp("txtMedCollegeName"); };
         }
         if (document.getElementById("txtMedUniversityName")) {
             document.getElementById("txtMedUniversityName").onkeyup = function () { fnOnKeyUp("txtMedUniversityName"); };
         }

         if (document.getElementById("txtRegistrationYear")) {
             document.getElementById("txtRegistrationYear").onkeyup = function () { fnOnKeyUp("txtRegistrationYear"); };
         }
         if (document.getElementById("txtRegistrationYear")) {
             document.getElementById("txtRegistrationYear").onkeyup = function () { fnOnKeyUp("txtRegistrationYear"); };
         }
         if (document.getElementById("txtNeetPgPercentlle")) {
             document.getElementById("txtNeetPgPercentlle").onkeyup = function () { fnOnKeyUp("txtNeetPgPercentlle"); };
         }

         if (document.getElementById("txtUndergoingCompletionYear")) {
             document.getElementById("txtUndergoingCompletionYear").onkeyup = function () { fnOnKeyUp("txtUndergoingCompletionYear"); };
         }
         if 
             (document.getElementById("txtCompletedYear")) {
             document.getElementById("txtCompletedYear").onkeyup = function () { fnOnKeyUp("txtCompletedYear"); };
         }
         if 
             (document.getElementById("txtDiplomaCourseName")) {
             document.getElementById("txtDiplomaCourseName").onkeyup = function () { fnOnKeyUp("txtDiplomaCourseName"); };
         }
         
         if (document.getElementById("txtDiplomaDurationYear")) {
             document.getElementById("txtDiplomaDurationYear").onkeyup = function () { fnOnKeyUp("txtDiplomaDurationYear"); };
         }

         
         

         var e = document.getElementById("ddlUgStudiedAt");
         if (document.getElementById("ddlUgStudiedAt").options[e.selectedIndex].value != 0) { fnSetBorder("ddlUgStudiedAt", 0) }

         var e = document.getElementById("ddlUgStudiedUnder");
         if (document.getElementById("ddlUgStudiedUnder").options[e.selectedIndex].value != 0) { fnSetBorder("ddlUgStudiedUnder", 0) }

         

     </script>

           <script>
        window.addEventListener('scroll', function() {
            var myDiv = document.querySelector('.myMenuItems');
            var scrollTop = window.scrollY || document.documentElement.scrollTop;
            myDiv.style.top = (10 + scrollTop) + 'px'; // Adjust as needed
        });
    </script>

    </form>
          

</body>
</html>

