using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2_T
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //DataBaseAllDataContext dataAll = new DataBaseAllDataContext();
            //IEnumerable<Drug> drug = from p in dataAll.Drugs
            //                                 where p.ID == 1
            //                                 select p;
            //Console.WriteLine(drug);
            //Drug d = drug.ElementAtOrDefault(0);
            //Label1.Text = d.Unit;
        }

        protected void LinqDataSource2_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReportTest.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReportTest2.aspx");
        }
    }
}