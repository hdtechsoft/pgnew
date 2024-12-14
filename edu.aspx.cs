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

public partial class pg_edu : System.Web.UI.Page
{

    Class1 cls = new Class1();
    AppData ap = new AppData();

    public string usrnameforhdr;
    public string usr_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadMasterData();
        }
    }

    protected void LoadMasterData()
    {
        DataSet ds = new DataSet();
        Clspmcgovt clsgovt = new Clspmcgovt();
        DataTable dtStateMst = new DataTable();
        DataTable dtStudiedUnder = new DataTable();
        DataTable dtCourse = new DataTable();
        string connstr = ap.dbConnStr;
        ds = clsgovt.fnGetPgEduMasters(Convert.ToInt32(ap.CourseApplyForPG), connstr);
        
        if (ds.Tables.Count > 0)
        {
            dtStateMst = ds.Tables[0];
            ddlUgStudiedAt.DataSource = dtStateMst;
            ddlUgStudiedAt.DataTextField = "state_name";
            ddlUgStudiedAt.DataValueField = "state_cd";
            ddlUgStudiedAt.DataBind();
        }
        if (ds.Tables.Count > 1)
        {
            dtStudiedUnder = ds.Tables[1];
            ddlUgStudiedUnder.DataSource = dtStudiedUnder;
            ddlUgStudiedUnder.DataTextField = "quotaname";
            ddlUgStudiedUnder.DataValueField = "quotaid";
            ddlUgStudiedUnder.DataBind();


            ddlUndergoingStudiedUnder.DataSource = dtStudiedUnder;
            ddlUndergoingStudiedUnder.DataTextField = "quotaname";
            ddlUndergoingStudiedUnder.DataValueField = "quotaid";
            ddlUndergoingStudiedUnder.DataBind();

            ddlCompletedStudiedUnder.DataSource = dtStudiedUnder;
            ddlCompletedStudiedUnder.DataTextField = "quotaname";
            ddlCompletedStudiedUnder.DataValueField = "quotaid";
            ddlCompletedStudiedUnder.DataBind();

            ddlDiscontinueStudiedUnder.DataSource = dtStudiedUnder;
            ddlDiscontinueStudiedUnder.DataTextField = "quotaname";
            ddlDiscontinueStudiedUnder.DataValueField = "quotaid";
            ddlDiscontinueStudiedUnder.DataBind();            
        }
        if (ds.Tables.Count >2)
        {
            dtCourse = ds.Tables[2];
        }
        if (dtCourse.Rows.Count>0)
        {
            ddlCompletedCourse.DataSource = dtCourse;
            ddlCompletedCourse.DataTextField = "course_name";
            ddlCompletedCourse.DataValueField = "course_id";
            ddlCompletedCourse.DataBind();


            ddlUndergoingCourse.DataSource = dtCourse;
            ddlUndergoingCourse.DataTextField = "course_name";
            ddlUndergoingCourse.DataValueField = "course_id";
            ddlUndergoingCourse.DataBind();

            ddlDiscontinueCourse.DataSource = dtCourse;
            ddlDiscontinueCourse.DataTextField = "course_name";
            ddlDiscontinueCourse.DataValueField = "course_id";
            ddlDiscontinueCourse.DataBind();
        }
        

    }

    protected void buttSave_Click(object sender, EventArgs e)
    {
        
        string usr_id = string.Empty; string perm_medical_council_number = string.Empty;
        string cmri_complete_date = string.Empty; string mbbs_finalyear_reg_no = string.Empty; string ug_studied_at = string.Empty;
        int mbbs_finalyear_noofattempts, year_of_registration,  ug_studied_under;
        string name_of_medical_college = string.Empty;
        string name_of_university = string.Empty;
        string undergoing_pg = string.Empty; 
        int undergoing_name_of_course, undergoing_course_under, undergoing_year_of_completion;
        string completed_pg = string.Empty; 
        int completed_name_of_course ,completed_course_under ,completed_year_of_completion ;
        string discontinued_pg = string.Empty; ;
        int discontinued_name_of_course, discontinued_course_under;
        string discontinued_date = string.Empty;
        string completed_deploma= string.Empty;
        string completed_deploma_name_of_course = string.Empty;
        int completed_deploma_duration_years;
        string completed_deploma_date = string.Empty;
        string percentile_scored_NEET_pg = string.Empty; ;

        cmri_complete_date = Convert.ToString(hd_mbbsCompletedDate.Value);
        mbbs_finalyear_reg_no = txtFinalYearRegNo.Text;
        mbbs_finalyear_noofattempts = Convert.ToInt32(txtNoOfAttempts.Text);
        year_of_registration = Convert.ToInt32(txtRegistrationYear.Text);
        ug_studied_at = Convert.ToString(ddlUgStudiedAt.SelectedValue);
        ug_studied_under = Convert.ToInt32(ddlUgStudiedUnder.SelectedValue);
        name_of_medical_college = txtMedCollegeName.Text;
        name_of_university = txtMedUniversityName.Text;

        undergoing_pg = "No";
        undergoing_name_of_course = 0;
        undergoing_year_of_completion = 0;
        undergoing_course_under = 0;
        if (chkUnderGoingPG.Checked==true)
        {
            undergoing_pg = "Yes";
            undergoing_name_of_course = Convert.ToInt32(ddlUndergoingCourse.SelectedValue);
            undergoing_course_under = Convert.ToInt32(ddlUndergoingStudiedUnder.SelectedValue);
            undergoing_year_of_completion = Convert.ToInt32(txtUndergoingCompletionYear.Text);
        }

        completed_pg = "No";
        completed_name_of_course = 0;
        completed_course_under = 0;
        completed_year_of_completion = 0;
        if (chkCompletedPG.Checked == true)
        {
            completed_pg = "Yes";
            completed_name_of_course = Convert.ToInt32(ddlCompletedCourse.SelectedValue);
            completed_course_under = Convert.ToInt32(ddlCompletedStudiedUnder.SelectedValue);
            completed_year_of_completion = Convert.ToInt32(txtCompletedYear.Text);
        }

        discontinued_pg = "No";
        discontinued_name_of_course = 0;
        discontinued_course_under = 0;
        if (chkDiscontinuePG.Checked == true)
        {
            discontinued_pg = "Yes";
            discontinued_name_of_course = Convert.ToInt32(ddlDiscontinueCourse.SelectedValue);
            discontinued_course_under = Convert.ToInt32(ddlDiscontinueStudiedUnder.SelectedValue);
            discontinued_date = Convert.ToString(hd_pgDiscontinueDate.Value);
        }

        completed_deploma = "No";
        completed_deploma_duration_years = 0;
        if (chkCompletedDiploma.Checked==true)
        {
            completed_deploma = "Yes";
            completed_deploma_name_of_course = txtDiplomaCourseName.Text;
            completed_deploma_duration_years = Convert.ToInt32(txtDiplomaDurationYear.Text);
            completed_deploma_date = Convert.ToString(hd_diplomaCompletedDate.Value);
        }
        percentile_scored_NEET_pg = txtNeetPgPercentlle.Text;

        Clspmcgovt clsgovt = new Clspmcgovt();

        DataTable dt = new DataTable();
        dt = clsgovt.fnSetUserEduInfoPg(Convert.ToInt32(ap.CourseApplyForPG), usr_id, perm_medical_council_number, cmri_complete_date
           , mbbs_finalyear_reg_no, mbbs_finalyear_noofattempts, year_of_registration, ug_studied_at, ug_studied_under, name_of_medical_college
           , name_of_university, undergoing_pg, undergoing_name_of_course, undergoing_course_under, undergoing_year_of_completion, completed_pg, completed_name_of_course,
           completed_course_under, completed_year_of_completion, discontinued_pg, discontinued_name_of_course, discontinued_course_under,
           discontinued_date, completed_deploma, completed_deploma_name_of_course, completed_deploma_duration_years, completed_deploma_date, percentile_scored_NEET_pg, ap.dbConnStr);

        if (dt.Rows.Count > 0)
        {
            if (Convert.ToString(dt.Rows[0]["ErrorCode"]) == "0")
            {
                // Success : Move to Special Reservation
                //createcookie(p_usr_id);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MoveToService()", true);

            }
        }


    }
}