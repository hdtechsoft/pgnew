using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using pmcdll;
using pmcgovtdll;

public partial class pg_login : System.Web.UI.Page
{

    AppData ap = new AppData();
    public string courseid;
    public string p_dob;

    protected void Page_Load(object sender, EventArgs e)
    {
        string submitfor = "";
        string p_usr_id = "";
        string p_password = "";
        if (!Page.IsPostBack)
        {
            buttByUserId.BackColor = System.Drawing.Color.AliceBlue;
            buttByMobile.BackColor = System.Drawing.Color.White;
            buttLoginbyOTP.Visible = false;
            OTPInputpanel.Visible = false;

            labLoginError.Text = "";
            labLoginErrorbyOTP.Text = "";

        }
        else
        {
            try
            {
                submitfor = Request.Form["hd_submitfor"].ToString();
                DataTable dt = new DataTable();
                //Response.Write(submitfor);
                if (submitfor == "LoginAuth")
                {
                    p_usr_id = Request.Form["txtloginusrid"].ToString();
                    hd_loginusrid.Value = p_usr_id;

                    loginusrname.Value = "";
                    p_password = Request.Form["loginpassword"].ToString();
                    string connStr = ap.dbConnStr;
                    string errcode = "", submitstatus = "", errmessage = "";
                    Class1 cls = new Class1();
                    dt = cls.auth_user_login(p_usr_id, p_password, Convert.ToInt32(ap.CourseApplyForPG), connStr);
                    if (dt.Rows.Count > 0)
                    {
                        errcode = Convert.ToString(dt.Rows[0]["ErrorCode"]);


                        if (errcode == "-1")
                        {
                            //
                        }
                        errmessage = dt.Rows[0]["ErrorMessage"].ToString();
                        submitstatus = Convert.ToString(dt.Rows[0]["SubmittedStatus"]);

                        if (errcode == "0" && submitstatus == "No")
                        {
                            // Success; redirect to page1                        
                            //div_successregmsg.Visible = true;
                            loginusrid.Value = p_usr_id;
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MoveToPersonalInfo()", true);
                        }
                        else if (errcode == "0" && submitstatus == "Yes")
                        {
                            loginusrid.Value = p_usr_id;
                            // if College  Preference is enabled then show the College Preference Page
                            if (ap.CurrentActivityMbbsBds == "3") //College Selection Preferences
                            {
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MoveToCollegePreferencePage()", true);
                            }
                            else
                            {
                                // else
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MoveToSubmitPage()", true);
                            }
                        }
                        else if (errcode == "0" && errmessage == "Valid Admin User")
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MoveToReportPage()", true);
                        }
                        else
                        {
                            labLoginError.Text = "User Id/Password does not exists";
                            // Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MoveToPersonalInfo()", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error in Postback Event" + ex.Message.ToString());
                Response.Write("<BR>Error in Postback Event" + ex.InnerException.Message.ToString());
            }
        }
    }

    protected void buttByUserId_Click(object sender, EventArgs e)
    {
        try
        {
            buttByUserId.BackColor = System.Drawing.Color.AliceBlue;
            buttByMobile.BackColor = System.Drawing.Color.White;
            divUserId.Visible = true;
            divMobile.Visible = false;
            txtloginusrid.Focus();
        }
        catch (Exception ex)
        {
            Response.Write("Error in buttByUserId_Click  " + ex.Message.ToString());
        }
    }

    protected void buttByMobile_Click(object sender, EventArgs e)
    {
        try
        {
            buttByMobile.BackColor = System.Drawing.Color.AliceBlue;
            buttByUserId.BackColor = System.Drawing.Color.White;
            divUserId.Visible = false;
            divMobile.Visible = true;
            OTPInputpanel.Visible = false;
            txtMobileNo.Focus();
        }
        catch (Exception ex)
        {
            Response.Write("Error in buttByMobile_Click  " + ex.Message.ToString());
        }

    }

    protected void fnShowOTPtoEnter()
    {
        try
        {
            buttSendOTP.Visible = false;
            buttLoginbyOTP.Visible = true;
            OTPInputpanel.Visible = true;

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction1", "fnStartResendOTPTimer()", true);
        }
        catch (Exception ex)
        {
            Response.Write("Error in fnShowOTPtoEnter " + ex.Message.ToString());
        }
    }

    protected void buttSendOTP_Click(object sender, EventArgs e)
    {
        labLoginErrorbyOTP.Text = "";
        string errcode, errmessage, submitstatus;
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        Clspmcgovt clsgovt = new Clspmcgovt();
        try
        {
            ds = clsgovt.fnGenerateOTPforLogin(txtMobileNo.Text, txtDateOfBirth.Text, Convert.ToInt32(ap.CourseApplyForPG), ap.dbConnStr);
            if (ds.Tables.Count > 0)
            {
                dt = ds.Tables[0];
            }
            if (dt.Rows.Count > 0)
            {
                errcode = Convert.ToString(dt.Rows[0]["ErrorCode"]);
                errmessage = dt.Rows[0]["ErrorMessage"].ToString();
                submitstatus = Convert.ToString(dt.Rows[0]["SubmittedStatus"]);
                hd_submitstatus.Value = submitstatus;
                loginusrname.Value = "";

                if (errcode == "-1")
                {
                    //
                }


                if (errcode == "0" && submitstatus == "No")
                {
                    hd_loginusrid.Value = dt.Rows[0]["orgusrid"].ToString();
                    //txtloginusrid.Text = hd_loginusrid.Value;
                    loginusrid.Value = hd_loginusrid.Value;
                    hd_submitfor.Value = "LoginAuthOTP";

                    // Success; redirect to page1                 
                    // Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MoveToPersonalInfo()", true);
                    // show the panel to enter OTP 
                    hd_otp.Value = dt.Rows[0]["loginotp"].ToString();
                    txtOTP.Text = hd_otp.Value;
                    fnShowOTPtoEnter();
                }
                else if (errcode == "0" && submitstatus == "Yes")
                {
                    hd_loginusrid.Value = dt.Rows[0]["orgusrid"].ToString();
                    //txtloginusrid.Text = hd_loginusrid.Value;
                    loginusrid.Value = hd_loginusrid.Value;
                    hd_submitfor.Value = "LoginAuthOTP";
                    // show the panel to enter OTP 
                    hd_otp.Value = dt.Rows[0]["loginotp"].ToString();
                    txtOTP.Text = hd_otp.Value;
                    fnShowOTPtoEnter();

                    /*// if College  Preference is enabled then show the College Preference Page
                    if (ap.CurrentActivityMbbsBds == "3") //College Selection Preferences
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MoveToCollegePreferencePage()", true);
                    }
                    else
                    {
                        // else
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MoveToSubmitPage()", true);
                    }*/
                }
                /* else if (errcode == "0" && errmessage == "Valid Admin User")
                 {
                     Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MoveToReportPage()", true);
                 }*/
                else
                {
                    labLoginErrorbyOTP.Text = "Mobile No and Date of Birth does not exists.";
                    // Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MoveToPersonalInfo()", true);
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("Error in buttSendOTP_Click " + ex.Message.ToString());
        }



    }

    protected void buttLoginbyOTP_Click(object sender, EventArgs e)
    {
        try
        {

            if (hd_otp.Value == txtOTP.Text)
            {
                // Entered Correct OTP
                if (hd_submitstatus.Value == "Yes")
                {
                    if (ap.CurrentActivityMbbsBds == "3") //College Selection Preferences
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MoveToCollegePreferencePage()", true);
                    }
                    else
                    {
                        // else
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MoveToSubmitPage()", true);
                    }
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MoveToPersonalInfo()", true);
                }
            }
            else
            {
                labLoginErrorbyOTP.Text = "OTP is not valid, please enter corret OTP.";
            }
        }
        catch (Exception ex)
        {
            Response.Write("Error in buttLoginbyOTP_Click " + ex.Message.ToString());
        }
    }

    protected void buttResendOTP_Click(object sender, EventArgs e)
    {
        // Again call the Message OPT sending function with the same generated OPT
        txtOTP.Text = hd_otp.Value;
        buttResendOTP.Enabled = false;
    }

}