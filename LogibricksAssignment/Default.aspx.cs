using System;
using System.Data;
using System.IO;
using System.Data.OleDb;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Common;
using System.Web.UI.WebControls;

namespace LogibricksAssignment
{
    public partial class _Default : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridview();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            refreshdata();
        }

        public void refreshdata()
        {
            string CS = ConfigurationManager.ConnectionStrings["SqlCom"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select * from ComapnyTable", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                con.Open();
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }


        }


        private void BindGridview()
        {
            string CS = ConfigurationManager.ConnectionStrings["SqlCom"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spGetCompanyAllDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string CurrentFilePath = Path.GetFullPath(FileUpload1.PostedFile.FileName);
            string path = string.Concat(Server.MapPath("~/UploadFile/" + FileUpload1.FileName));
            FileUpload1.SaveAs(path);

            string excelConnectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path);
            OleDbConnection connection = new OleDbConnection(excelConnectionString);

            OleDbCommand command = new OleDbCommand("select * from [Sheet1$]", connection);

            connection.Open();

            // Create DbDataReader to Data Worksheet

            DbDataReader dr = command.ExecuteReader();

            // Bulk Copy to SQL Server 

            SqlBulkCopy bulkInsert = new SqlBulkCopy(ConfigurationManager.ConnectionStrings["SqlCom"].ConnectionString);

            bulkInsert.DestinationTableName = "CompanyTable";
            bulkInsert.ColumnMappings.Add("SrNo", "SrNo");
            bulkInsert.ColumnMappings.Add("ComapnyName", "CompanyName");
            bulkInsert.ColumnMappings.Add("TurnoverAmt", "TurnoverAmt");
            bulkInsert.ColumnMappings.Add("GSTIN", "GSTIN");
            bulkInsert.ColumnMappings.Add("Sdate", "Sdate");
            bulkInsert.ColumnMappings.Add("Edate", "Edate");
            bulkInsert.ColumnMappings.Add("Email", "Email");
            bulkInsert.ColumnMappings.Add("Contact", "Contact");
            bulkInsert.WriteToServer(dr);
            BindGridview();

        }
    }
}