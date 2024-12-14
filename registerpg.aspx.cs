using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
//using pmcdll;
using pmcgovtdll;

public partial class pg_registerpg : System.Web.UI.Page
{
    //Class1 cls = new Class1();

    AppData ap = new AppData();
    public string courseid;
    public string p_dob;
    string submitfor = "";
    public string acadamicyear = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string p_name, p_mobile, p_email, p_usr_id, p_password, perm_medical_council_number, neet_pg_rollno, p_gender;
        DataTable dt = new DataTable();
        if (!Page.IsPostBack)
        {
           
        }
        else
        {
            labSignInError.Text = "";
            labSignInError.Visible = false;
            div_successregmsg.Visible = false;
            submitfor = Request.Form["hd_submitfor"].ToString();

            courseid = Convert.ToString(ap.CourseApplyForPG);
            if (submitfor == "Registration")
            {
                p_name = Request.Form["txtname"].ToString();
                p_mobile = Request.Form["txtmobile"].ToString();
                p_email = Request.Form["txtemail"].ToString();
                p_dob = Request.Form["hd_datepicker"].ToString();                
                p_gender = Request.Form["hd_gender"].ToString();               
                p_usr_id = Request.Form["txtloginid"].ToString();
                p_password = Request.Form["txtpass"].ToString();
                perm_medical_council_number = txtMedicalCouncilNumber.Text;
                neet_pg_rollno = txtNeetRollNo.Text;
                string connStr = ap.dbConnStr;
                Clspmcgovt clgovt = new Clspmcgovt();
                //dt = clgovt.set_user_reg(courseid, p_name, p_mobile, p_email, p_dob, p_gender, p_qualifyexam, p_hscrollno, p_neetrollno, p_neetmarks, p_qualifiedyear, p_usr_id, p_password, connStr);
                dt = clgovt.set_user_reg_pg(p_usr_id, Convert.ToInt32(courseid), p_name, p_gender, p_password, p_mobile, p_email, p_dob, perm_medical_council_number, neet_pg_rollno,  connStr);
                if (dt.Rows.Count > 0)
                {
                    if (Convert.ToString(dt.Rows[0]["ErrorCode"]) == "0")   // Success
                    {
                        MainDiv.Visible = false;
                        div_SignInSuccess.Visible = true;
                        div_successregmsg.Visible = true;
                        lab_usrname.Text = p_name.ToUpper();
                        //labSignInSuccess.Text = Convert.ToString(dt.Rows[0]["ErrorMessage"]);
                        labSignInSuccess.Text = "";
                        hd_submitfor.Value = "";
                        txtname.Text = "";
                        txtmobile.Text = "";
                        txtemail.Text = "";
                        txtloginid.Text = "";
                        txtpass.Text = "";
                        txtconfpass.Text = "";
                    }
                    else
                    {
                        labSignInError.Text = Convert.ToString(dt.Rows[0]["ErrorMessage"]);
                        labSignInError.Visible = true;
                        if (p_gender == "Transgender")
                        {
                            rdo_TransGender.Checked = true;
                        }
                        else if (p_gender == "Female")
                        {
                            rdo_Female.Checked = true;
                        }
                        else if (p_gender == "Male")
                        {
                            rdo_Male.Checked = true;
                        }

                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction1", "fnreassigndob()", true);
                    }
                }
            }

        }
        acadamicyear = ap.academicYear;
    }
   
 

}