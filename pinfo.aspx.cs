using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Text;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using pmcdll;
using pmcgovtdll;

public partial class pg_pinfo : System.Web.UI.Page
{
    Class1 cls = new Class1();
    AppData ap = new AppData();
    Clspmcgovt clsgovt = new Clspmcgovt();

    public string personalinfo, splresinfo, paymentinfo, schoolinfo, academicinfo, additionalinfo, patialupload, uploadinfo;
    public string eduinfo, serviceinfo, proforma, partialupload;
    public string usrnameforhdr;
    protected void Page_Load(object sender, EventArgs e)
    {

        NameValueCollection nvc = Request.Form;
       
        string sloginusrid = string.Empty;
        string sloginusrname = string.Empty;
        string p_parentname, p_scooling, p_nationality, p_religion, p_mothertongue, p_otheremothertongue, p_nativity, p_community, p_subcaste, p_certificateno, p_issuedby, p_issuedtaluk, p_issueddt;
        string submitfor = "";
        try
        {
            sloginusrid = Request.Form["loginusrid"].ToString();
            //usrnameforhdr = sloginusrid;
            usrnameforhdr = Request.Form["loginusrname"].ToString();
            submitfor = Request.Form["hd_submitfor"].ToString();
        }
        catch (Exception ex)
        {
            Response.Redirect("errpage.aspx?id=" + sloginusrid);
            Response.End();
        }
        //p_subcaste = Convert.ToString(ddlsubcaste.SelectedValue);
        p_subcaste = Convert.ToString(hd_subcasteId.Value);
        getApplicationCurrStatus(sloginusrid);

        if (!Page.IsPostBack)
        {
            DataSet ds = new DataSet();
            DataTable dtUsrMst = new DataTable();
            DataTable dtEdu = new DataTable();
            DataTable dtPersonal = new DataTable();
            DataTable dtAddInfo = new DataTable();
            DataTable dtSplRes = new DataTable();

            sloginusrid = Request.Form["loginusrid"].ToString();
            loginusrid.Value = sloginusrid;
            //Response.Write(sloginusrid);
            string connstr = ap.dbConnStr;
            ds = clsgovt.fnGetUserDtlPG(sloginusrid, Convert.ToInt32(ap.CourseApplyForPG), connstr);
            if (ds.Tables.Count > 0 )
            {
                dtUsrMst = ds.Tables[0];
            }

            if (ds.Tables.Count > 1)
            {
                dtEdu = ds.Tables[1];
            }
            if (ds.Tables.Count > 2)
            {
                dtPersonal = ds.Tables[2];
            }
            if (ds.Tables.Count > 3)
            {
                dtAddInfo = ds.Tables[3];
            }
            if (ds.Tables.Count > 4)
            {
                dtSplRes = ds.Tables[4];
            }

            
            get_subcaste(0);
            get_commDistrictMst();
            LoadYesNoDropdown();
            if (dtUsrMst.Rows.Count > 0)
            {
                lab_name.Text = Convert.ToString(dtUsrMst.Rows[0]["usr_name"].ToString());
                usrnameforhdr = lab_name.Text;                
                loginusrname.Value = Convert.ToString(dtUsrMst.Rows[0]["usr_name"].ToString());
                lab_dob.Text = Convert.ToString(dtUsrMst.Rows[0]["dob"].ToString());                
                       
                lab_emailaddress.Text = Convert.ToString(dtUsrMst.Rows[0]["email_addr"].ToString());
                //  txtAltMobileNo.Text = Convert.ToString(dt.Rows[0]["mobile_no"].ToString());
            }

            if (dtEdu.Rows.Count > 0)
            {
                lab_permmcnumber.Text = Convert.ToString(dtEdu.Rows[0]["perm_medical_council_number"].ToString());
                lab_neetpgrollno.Text = Convert.ToString(dtEdu.Rows[0]["neet_pg_rollno"].ToString());
            }
            if (dtAddInfo.Rows.Count > 0)
            {
                txtAltMobileNo.Text = Convert.ToString(dtAddInfo.Rows[0]["alternativephoneno"].ToString());
                txtCommunicationAddress.Text = Convert.ToString(dtAddInfo.Rows[0]["address_comm"].ToString());
                txtPermanentAddress.Text = Convert.ToString(dtAddInfo.Rows[0]["address_permanent"].ToString());
            }
            

            loadalldropdowns();
            loaduserpersonaldtl(dtPersonal);
            if (dtSplRes.Rows.Count > 0)
            {
                ddl_CliamChristianMinority.SelectedValue = Convert.ToString(dtSplRes.Rows[0]["christian_minority"].ToString());
                ddl_PhysicallyDisabled.SelectedValue = Convert.ToString(dtSplRes.Rows[0]["physically_disabled"].ToString());
            }
        }
        else
        {
            // txtparentname
            string physically_disabled, christian_minority;
            Int32 communitydistrict = 0;
            physically_disabled = ddl_PhysicallyDisabled.SelectedValue;
            christian_minority = ddl_CliamChristianMinority.SelectedValue;

            sloginusrid = Request.Form["loginusrid"].ToString();
            p_parentname = Request.Form["txtparentname"].ToString();
           // p_scooling = Request.Form["hd_schoolingId"].ToString();

            p_nationality = Request.Form["hd_nationalityId"].ToString();
            p_religion = Request.Form["hd_religionId"].ToString();
            p_mothertongue = Request.Form["hd_mothertongueId"].ToString();
            p_otheremothertongue = Request.Form["txtmtname"].ToString();
            p_nativity = Request.Form["hd_nativityId"].ToString();
            p_community = Request.Form["hd_communityId"].ToString();
            //p_subcaste = Request.Form["txtsubcaste"].ToString(); 
            p_certificateno = "";
            p_issuedby = "";
            p_issuedtaluk = "";
            p_issueddt = "";
            if (Convert.ToInt32(ddlcommdistrict.SelectedValue) >= 0)
            {
                communitydistrict = Convert.ToInt32(ddlcommdistrict.SelectedValue);
            }
            if (!string.IsNullOrEmpty(nvc["txtcertificateno"]))
            {
                p_certificateno = Request.Form["txtcertificateno"].ToString();
                p_issueddt = Request.Form["hd_datepicker"].ToString();
            }
            if (!string.IsNullOrEmpty(nvc["txtissuedby"]))
            {
                p_issuedby = Request.Form["txtissuedby"].ToString();
            }
            if (!string.IsNullOrEmpty(nvc["txtissuedtaluk"]))
            {
                p_issuedtaluk = Request.Form["txtissuedtaluk"].ToString();
            }
            if (p_community == "1")   // if OC
            {
                communitydistrict = 0;
            }


            // Response.End();
            //Response.Write("<br>p_parentname : " + p_parentname.ToString());
            //Response.Write("<br>p_scooling : " + p_scooling.ToString());
            //Response.Write("<br>p_nationality : " + p_nationality.ToString());
            //Response.Write("<br>p_religion : " + p_religion.ToString());
            //Response.Write("<br>p_mothertongue : " + p_mothertongue.ToString());
            //Response.Write("<br>p_nativity : " + p_nativity.ToString());
            //Response.Write("<br>p_community : " + p_community.ToString());          
            //Response.Write("<br>p_subcaste : " + p_subcaste.ToString());
            //Response.Write("<br>p_certificateno : " + p_certificateno.ToString());
            //Response.Write("<br>p_issuedby : " + p_issuedby.ToString());
            //Response.Write("<br>p_issuedtaluk : " + p_issuedtaluk.ToString());
            //Response.Write("<br>p_issueddt : " + p_issueddt.ToString());

            string connstr = ap.dbConnStr;
            DataTable dt = new DataTable();
            if (submitfor == "PersonalInfoSubmit")
            {
                dt = clsgovt.set_usr_personal_dtl_pg(sloginusrid, Convert.ToInt32(ap.CourseApplyForPG), p_parentname, ddlPlaceOfBirth.SelectedValue, p_nationality, p_religion, p_mothertongue, p_otheremothertongue,
                    p_nativity, p_community, p_subcaste, p_certificateno, p_issuedby, p_issuedtaluk, p_issueddt, communitydistrict,txtAltMobileNo.Text,txtPermanentAddress.Text, txtCommunicationAddress.Text, physically_disabled, christian_minority, connstr);
                if (dt.Rows.Count > 0)
                {
                    if (Convert.ToString(dt.Rows[0]["ErrorCode"]) == "0")
                    {
                        // Success : Move to Special Reservation
                        //createcookie(p_usr_id);
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MoveToEducational()", true);

                    }
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction3", "formatdatetoddmmyy();", true);

            }
            

        }



    }

    protected void LoadYesNoDropdown()
    {
        DataTable dtnoofattemptNeet = new DataTable();
        DataTable dtnoofattemptHSC = new DataTable();
        DataColumn dtColumn;
        DataRow myDataRow;

        dtColumn = new DataColumn();
        dtColumn.DataType = typeof(string);
        dtColumn.ColumnName = "Col1";
        dtnoofattemptNeet.Columns.Add(dtColumn);

        dtColumn = new DataColumn();
        dtColumn.DataType = typeof(string);
        dtColumn.ColumnName = "Col2";
        dtnoofattemptNeet.Columns.Add(dtColumn);

        myDataRow = dtnoofattemptNeet.NewRow();
        myDataRow["Col1"] = "Yes";
        myDataRow["Col2"] = "Yes";
        dtnoofattemptNeet.Rows.Add(myDataRow);

        myDataRow = dtnoofattemptNeet.NewRow();
        myDataRow["Col1"] = "No";
        myDataRow["Col2"] = "No";
        dtnoofattemptNeet.Rows.Add(myDataRow);

        ddl_PhysicallyDisabled.DataSource = dtnoofattemptNeet;
        ddl_PhysicallyDisabled.DataTextField = "Col2";
        ddl_PhysicallyDisabled.DataValueField = "Col1";
        ddl_PhysicallyDisabled.DataBind();


        ddl_CliamChristianMinority.DataSource = dtnoofattemptNeet;
        ddl_CliamChristianMinority.DataTextField = "Col2";
        ddl_CliamChristianMinority.DataValueField = "Col1";
        ddl_CliamChristianMinority.DataBind();

        // default set to No

        ddl_PhysicallyDisabled.SelectedValue = "No";
        ddl_CliamChristianMinority.SelectedValue = "No";

    }

    protected void get_commDistrictMst()
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        string connstr = ap.dbConnStr;
        ds = cls.get_comm_distmst(0, connstr);
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
        }
        ddlcommdistrict.DataSource = dt;
        ddlcommdistrict.DataTextField = "district_name";
        ddlcommdistrict.DataValueField = "district_id";
        ddlcommdistrict.DataBind();


    }

    public void getApplicationCurrStatus(string usr_id)
    {
        DataTable dt = new DataTable();

        string courseid = ap.CourseApplyForPG;
        string connstr = ap.dbConnStr;
        dt = clsgovt.get_application_current_status_pg(usr_id, courseid, connstr);

       
        if (dt.Rows.Count > 0)
        {
            personalinfo = dt.Rows[0]["personalinfo"].ToString();
            eduinfo = dt.Rows[0]["eduinfo"].ToString();
            serviceinfo = dt.Rows[0]["serviceinfo"].ToString();
            proforma = dt.Rows[0]["proforma"].ToString();
            partialupload = dt.Rows[0]["partialupload"].ToString();
            uploadinfo = dt.Rows[0]["uploadinfo"].ToString(); 
            paymentinfo = dt.Rows[0]["paymentinfo"].ToString();

        }
        // schoolinfo = "Yes";
        if (personalinfo == "Yes")
        {
            //splresinfo = "Yes";
            leftnav_perinfo.Style.Add("color", "white");
            leftnav_perinfoTickIcon.Visible = true;
            leftnav_eduinfo.Style.Add("color", "white");
        }
        else
        {
            leftnav_perinfo.Style.Add("color", "white");
        }
        if (eduinfo == "Yes")
        {
            leftnav_eduinfo.Style.Add("color", "white");
            leftnav_eduinfoTickIcon.Visible = true;
            leftnav_service.Style.Add("color", "white");
            //leftnav_payment.Style.Add("color", "white");
        }
        //if (paymentinfo == "Yes")
        //{
        //    leftnav_payment.Style.Add("color", "white");
        //    leftnav_school.Style.Add("color", "white");
        //}
        if (serviceinfo == "Yes")
        {
            leftnav_service.Style.Add("color", "white");
            leftnav_serviceTickIcon.Visible = true;
            //leftnav_academic.Style.Add("color", "white");
            leftnav_proformainfo.Style.Add("color", "white");
        }
        //if (academicinfo == "Yes")
        //{
        //    leftnav_academic.Style.Add("color", "white");
        //    leftnav_addinfo.Style.Add("color", "white");
        //}
      
        if (uploadinfo == "Yes")
        {
            leftnav_upload.Style.Add("color", "white");
            leftnav_uploadTickIcon.Visible = true;
            leftnav_apppreview.Style.Add("color", "white");
            leftnav_print.Style.Add("color", "white");
            leftnav_submit.Visible = true;
            //leftnav_print.Style.Add("cursor", "pointer");
        }
        else
        {

        }


    }


    public void loaduserpersonaldtl(DataTable  dt)
    {
       
        string connstr = ap.dbConnStr;      
        if (dt.Rows.Count > 0)
        {
            txtparentname.Text = Convert.ToString(dt.Rows[0]["parent_name"]);
            ddlPlaceOfBirth.SelectedValue = dt.Rows[0]["place_of_birth"].ToString();
            ddlnationality.SelectedValue = dt.Rows[0]["nationality"].ToString();
            ddlreligion.SelectedValue = dt.Rows[0]["religion"].ToString();
            ddlmothertongue.SelectedValue = dt.Rows[0]["mothertongue"].ToString();
            txtmtname.Text = dt.Rows[0]["othermothertongue"].ToString();
            ddlnativity.SelectedValue = dt.Rows[0]["nativity"].ToString();
            ddlcommunity.SelectedValue = dt.Rows[0]["community"].ToString();
            //txtsubcaste.Text = dt.Rows[0]["subcaste"].ToString();
            hd_subcasteId.Value = dt.Rows[0]["subcaste"].ToString();
            get_subcaste(Convert.ToInt32(ddlcommunity.SelectedValue));

            ddlcommdistrict.SelectedValue = dt.Rows[0]["communitydistrict"].ToString();

            //ddlsubcaste.SelectedValue = dt.Rows[0]["subcaste"].ToString();
            trCertificateInfo.Visible = true;
            if (Convert.ToInt32(ddlcommunity.SelectedValue) == 1)   // if OC
            {
                trCertificateInfo.Visible = false;
            }
            txtcertificateno.Text = dt.Rows[0]["certificateno"].ToString();
            txtissuedby.Text = dt.Rows[0]["issuedby"].ToString();
            txtissuedtaluk.Text = dt.Rows[0]["issuedtaluk"].ToString();
            hd_datepicker.Value = dt.Rows[0]["issueddt"].ToString();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "formatdatetoddmmyy()", true);

            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction2", "fnenableothermothertongue()", true);


        }
    }
    public void Loadddlmothertongue()
    {
        DataTable dt = new DataTable();
        string connstr = ap.dbConnStr;
        dt = cls.get_mtoungue_mst(connstr);
        ddlmothertongue.DataSource = dt;
        ddlmothertongue.DataTextField = "mother_tongue";
        ddlmothertongue.DataValueField = "mother_tongue_id";
        ddlmothertongue.DataBind();
    }
    public void Loadddlreligion()
    {
        DataTable dt = new DataTable();
        string connstr = ap.dbConnStr;
        dt = cls.get_religion_mst(connstr);
        ddlreligion.DataSource = dt;
        ddlreligion.DataTextField = "religion_name";
        ddlreligion.DataValueField = "religion_id";
        ddlreligion.DataBind();
    }
    public void Loadddlnationality()
    {
        DataTable dt = new DataTable();
        string connstr = ap.dbConnStr;
        dt = cls.get_nationality_mst(connstr);
        ddlnationality.DataSource = dt;
        ddlnationality.DataTextField = "nationality";
        ddlnationality.DataValueField = "nationality_id";
        ddlnationality.DataBind();
    }
    public void Loadddlcommunity()
    {
        DataTable dt = new DataTable();
        string connstr = ap.dbConnStr;
        dt = cls.get_community_mst(connstr);
        ddlcommunity.DataSource = dt;
        ddlcommunity.DataTextField = "community_name";
        ddlcommunity.DataValueField = "community_id";
        ddlcommunity.DataBind();
    }
    public void Loadddlnativity()
    {
        DataTable dt = new DataTable();
        string connstr = ap.dbConnStr;
        dt = clsgovt.get_state_mst(connstr);
        ddlnativity.DataSource = dt;
        ddlnativity.DataTextField = "state_name";
        ddlnativity.DataValueField = "state_cd";
        ddlnativity.DataBind();



        ddlPlaceOfBirth.DataSource = dt;
        ddlPlaceOfBirth.DataTextField = "state_name";
        ddlPlaceOfBirth.DataValueField = "state_cd";
        ddlPlaceOfBirth.DataBind();

    }
  

    private void loadalldropdowns()
    {

        Loadddlmothertongue();
        Loadddlreligion();
        Loadddlnationality();
        Loadddlcommunity();
        Loadddlnativity();
        //loadddlschooling();

        //ddlnationality.Items.Insert(0, new ListItem("Select Nationality", "0"));
        //ddlnationality.Items.Insert(1, new ListItem("Indian", "IND"));
        //ddlnationality.Items.Insert(2, new ListItem("OCI", "OCI"));
        //ddlnationality.Items.Insert(3, new ListItem("PIO", "PIO"));
        //ddlnationality.Items.Insert(4, new ListItem("Others", "Others"));

        //ddlreligion.Items.Insert(0, new ListItem("Select Religion", "0"));
        //ddlreligion.Items.Insert(1, new ListItem("CHIRSTIAN", "1"));
        //ddlreligion.Items.Insert(2, new ListItem("HINDUISM", "2"));
        //ddlreligion.Items.Insert(3, new ListItem("ISLAM", "3"));
        //ddlreligion.Items.Insert(4, new ListItem("JAINISM", "4"));
        //ddlreligion.Items.Insert(5, new ListItem("SIKHISM", "5"));
        //ddlreligion.Items.Insert(6, new ListItem("OTHERS", "6"));


        //ddlmothertongue.Items.Insert(0, new ListItem("Select Mother Tongue", "0"));
        //ddlmothertongue.Items.Insert(1, new ListItem("TAMIL", "1"));
        //ddlmothertongue.Items.Insert(2, new ListItem("TELUGU", "2"));
        //ddlmothertongue.Items.Insert(3, new ListItem("MALAYALAM", "3"));
        //ddlmothertongue.Items.Insert(4, new ListItem("KANNADA", "4"));
        //ddlmothertongue.Items.Insert(5, new ListItem("HINDI", "5"));
        //ddlmothertongue.Items.Insert(4, new ListItem("URDU", "6"));
        //ddlmothertongue.Items.Insert(6, new ListItem("OTHERS", "7"));


        //ddlnativity.Items.Insert(0, new ListItem("Select Nativity", "0"));
        //ddlnativity.Items.Insert(1, new ListItem("TAMILNADU", "1"));
        //ddlnativity.Items.Insert(2, new ListItem("OTHERES", "2"));

        //ddlschooling.Items.Insert(0, new ListItem("Select Schooling", "0"));
        //ddlschooling.Items.Insert(1, new ListItem("TAMILNADU", "1"));
        //ddlschooling.Items.Insert(2, new ListItem("PARTLY TAMILNADU", "2"));


        //ddlcommunity.Items.Insert(0, new ListItem("Select Community", "0"));
        //ddlcommunity.Items.Insert(1, new ListItem("OC", "OC"));
        //ddlcommunity.Items.Insert(2, new ListItem("BC", "BC"));
        //ddlcommunity.Items.Insert(3, new ListItem("BCM", "BCM"));
        //ddlcommunity.Items.Insert(4, new ListItem("MBC/DNC", "MBCDNC"));
        //ddlcommunity.Items.Insert(5, new ListItem("SC", "SC"));
        //ddlcommunity.Items.Insert(4, new ListItem("SCA", "SCA"));
        //ddlcommunity.Items.Insert(6, new ListItem("ST", "ST"));
    }



    protected void get_subcaste(int commid)
    {
        DataTable dt = new DataTable();
        string connstr = ap.dbConnStr;
        dt = cls.get_sub_caste(commid, connstr);
        //ddlsubcaste.DataSource = dt;
        //ddlsubcaste.DataTextField = "sub_caste_name";
        //ddlsubcaste.DataValueField = "sub_caste_id";
        //ddlsubcaste.DataBind();
        //ddlsubcaste.Focus();

        int subcasteid = 0;
        if (hd_subcasteId.Value != "")
        {
            subcasteid = Convert.ToInt32(hd_subcasteId.Value);
        }
        StringBuilder sb = new StringBuilder();
        string scname = "";
        int scid = 0;
        sb.Append("<table style='margin - bottom: 0rem; width:100%'><tr><td><ul id='myUL'>");
        foreach (DataRow row in dt.Rows)
        {
            scname = Convert.ToString(row["sub_caste_name"]);
            scid = Convert.ToInt32(row["sub_caste_id"]);
            if (scid > 0)
            {
                if (scid == subcasteid)
                {
                    sb.Append("<li   onclick='javascript:fnsubcasteindclick(" + scid + ")' ><a href='#' id=href_" + Convert.ToString(scid) + "><table><tr><td><input type='radio' checked id=_" + Convert.ToString(scid) + " name='subcastelist' ></td><td  style='cursor:pointer;padding-left:10px' ><span id='spn" + Convert.ToString(scid) + "'>" + scname + "</span></td></tr></table></a></li>");
                }
                else
                {
                    sb.Append("<li onclick='javascript:fnsubcasteindclick(" + scid + ")' ><a href='#' id=href_" + Convert.ToString(scid) + "><table><tr><td><input type='radio' id=_" + Convert.ToString(scid) + " name='subcastelist' ></td><td  style='cursor:pointer;padding-left:10px' ><span id='spn" + Convert.ToString(scid) + "'>" + scname + "</span></td></tr></table></a></li>");
                }
            }
        }
        sb.Append("</ul></td></tr></table>");


        lit_subcastlist.Text = sb.ToString();

    }


    protected void ddlnativity_SelectedIndexChanged(object sender, EventArgs e)
    {
        string nativityid = Convert.ToString(ddlnativity.SelectedValue);

        DataTable dt = new DataTable();
        string connstr = ap.dbConnStr;

        dt = cls.get_community_mst_by_nativity(nativityid, connstr);
        ddlcommunity.DataSource = dt;
        ddlcommunity.DataTextField = "community_name";
        ddlcommunity.DataValueField = "community_id";
        ddlcommunity.DataBind();

        if (nativityid != "TN")
        {
            // Clear the selected sub caste 
            //document.getElementById("divlab_subcaste").innerHTML = seletedtxt;
            // Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", ";document.getElementById('trCertificateInfo').style.display = 'none';", true);
        }
        else
        {
            // Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", ";document.getElementById('trCertificateInfo').style.display = 'block';", true);
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "; window.scrollTo(0, 250);", true);


    }
    protected void ddlcommunity_SelectedIndexChanged(object sender, EventArgs e)
    {
        int commid = Convert.ToInt32(ddlcommunity.SelectedValue);
        hd_subcasteId.Value = "";
        divlab_subcaste.InnerHtml = "-- Select Sub Caste --";
        get_subcaste(commid);
        //txtcertificateno.Focus();
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", ";window.scrollTo(0, screen.height);", true);

        string nativityid = Convert.ToString(ddlnativity.SelectedValue);

        if (commid == 1)
        {
            // Disable the certificate field
            txtcertificateno.Text = "";
            txtissuedby.Text = "";
            txtissuedtaluk.Text = "";
            trCertificateInfo.Visible = false;
        }
        else
        {
            trCertificateInfo.Visible = true;
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction4", "document.getElementById('issueddate').value='';", true);
        }

        if (nativityid != "TN")
        {
            // Clear the selected sub caste 
            // document.getElementById("divlab_subcaste").innerHTML = seletedtxt;

        }
        // Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction5", "window.scrollTo(0, screen.height);", true);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction5", "window.scrollTo(0,500);", true);
        /*
      // if OC


           if (commid == 1) // OC is 1
           { 
               Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "fnhideCertificateInfo()", true);
           }
           else
           {
               Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "window.scrollTo(0, screen.height);document.getElementById('trCertificateInfo').style.display = 'block';", true);
           }
       */

    }
}