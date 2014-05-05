using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2_T
{
    public partial class ICD1 : System.Web.UI.Page
    {
        public String state;

        protected void Page_Load(object sender, EventArgs e)
        {

            checkLoginRole();
            if (ViewState["Drug"] == null || ViewState["Drug"].Equals("D"))
            {
                TableAddDrug.Visible = false;
                GridDrug.Visible = true;
                DrugCotentG.Visible = false;
            }
            else if (ViewState["Drug"].Equals("DG"))
            {
                GridDrugG.Visible = true;
                TableAddDrugG.Visible = false;
                DrugCotent.Visible = false;
            }

            state = "load";
            if (ViewState["state"] == null)
            {
                state = "load";
            }
            else
            {
                state = (String)ViewState["state"];
            }
            loadList();
         
            DetalItem.Visible = false;
        }
        protected void checkLoginRole()
        {
            if (Session["role"] == null || Session["role"].Equals(""))
            {
                Response.Write("<script LANGUAGE='JavaScript' >document.location='" +
              ResolveClientUrl("~/Home.aspx") + "';</script>");
            }
            else
            {
                Debug.WriteLine(Session["role"]);
                if (Session["role"].ToString().Equals("2"))
                {
                    AddDrugButton.Visible = false;
                    LinqDataSourceDrug.EnableDelete = false;
                    LinqDataSourceDrug.EnableUpdate = false;
                    AddDrugButtonG.Visible = false;
                    LinqDataSource1.EnableUpdate = false;
                    LinqDataSource1.EnableDelete = false;

                }
                else if (Session["role"].ToString().Equals("1"))
                {
                    AddDrugButton.Visible = true;
                    LinqDataSourceDrug.EnableDelete = true;
                    LinqDataSourceDrug.EnableUpdate = true;
                    AddDrugButtonG.Visible = true;
                    LinqDataSource1.EnableUpdate = true;
                    LinqDataSource1.EnableDelete = true;
                }
            }
        }
        protected void loadList()
        {
            if (ViewState["loadList"] == null || ViewState["loadList"].Equals("notdone"))
            {
                List<ListItem> items = new List<ListItem>();
                items.Add(new ListItem("ID", "ID"));
                items.Add(new ListItem("Name", "DrugName"));
                items.Add(new ListItem("Code", "Unit"));
                items.Add(new ListItem("ICD Chapter", "Group ID"));
                DropSearch.Items.AddRange(items.ToArray());


              
                List<ListItem> items3 = new List<ListItem>();
                items3.Add(new ListItem("ID", "ID"));
                items3.Add(new ListItem("ICD Chapter Name", "DrugGroupName"));
                DropSearchG.Items.AddRange(items3.ToArray());

                ViewState["loadList"] = "done";
            }


        }

        protected void GridDrug_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void AddDrugButton_Click(object sender, EventArgs e)
        {
            if (state.Equals("load"))
            {
                TableAddDrug.Visible = true;
                GridDrug.Visible = false;
                ViewState["state"] = "add";
            }
            else if (state.Equals("add"))
            {
                TableAddDrug.Visible = false;
                GridDrug.Visible = true;
                ViewState["state"] = "load";
            }
        }

        protected void AddDrugButton_ClickG(object sender, EventArgs e)
        {
            if (state.Equals("load"))
            {
                TableAddDrugG.Visible = true;
                GridDrugG.Visible = false;
                ViewState["state"] = "add";
            }
            else if (state.Equals("add"))
            {
                TableAddDrugG.Visible = false;
                GridDrugG.Visible = true;
                ViewState["state"] = "load";
            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {

        }

        protected void AddNewDrug_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                TableAddDrug.Visible = false;
                System.Threading.Thread.Sleep(2000);
                String name = DrugName.Text;
                String code = GenName.Text;
                
                int idgrup = Convert.ToInt32(GroupID.Text);

                var drug = new ICD() { Name = name, Code = code, ICDChapter = idgrup };
                DataBaseAllDataContext dataAll = new DataBaseAllDataContext();
                dataAll.ICDs.InsertOnSubmit(drug);
                dataAll.SubmitChanges();
                GridDrug.DataBind();
            }
        }

        protected void AddNewDrug_ClickG(object sender, EventArgs e)
        {
            if (IsValid)
            {
                TableAddDrugG.Visible = false;
                String name = DrugNameG.Text;
                var drug = new ICDChapter() { Name = name };
                DataBaseAllDataContext dataAll = new DataBaseAllDataContext();
                dataAll.ICDChapters.InsertOnSubmit(drug);
                dataAll.SubmitChanges();
                GridDrugG.DataBind();
            }
        }

       

        protected void DropDownCat_SelectedIndexChangedG(object sender, EventArgs e)
        {

        }

        protected void ActiveSearch_Click(object sender, EventArgs e)
        {
            GridDrug.DataBind();
        }

        protected void ActiveSearch_ClickG(object sender, EventArgs e)
        {
            GridDrugG.DataBind();
        }


        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] getGroupIDlist(string prefixText)
        {
            List<string> result = new List<string>();
            var ctx = new DataBaseAllDataContext();
            foreach (ICDChapter dg in ctx.ICDChapters)
            {
                if (dg.ID.ToString().Contains(prefixText))
                {
                    result.Add(dg.ID.ToString());
                }
            }
            return result.ToArray();
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] getAutoList(string prefixText)
        {
            List<string> result = new List<string>();
            var ctx = new DataBaseAllDataContext();
            foreach (ICD dg in ctx.ICDs)
            {
                if (dg.Name.Contains(prefixText))
                {
                    result.Add(dg.Name + "---Name Field");
                }

            }
            foreach (ICD dg in ctx.ICDs)
            {

                if (dg.Code.Contains(prefixText))
                {
                    result.Add(dg.Code + "---Code Field");
                }

            }
            
            foreach (ICD dg in ctx.ICDs)
            {

                if (dg.ICDChapter.ToString().Contains(prefixText))
                {
                    result.Add(dg.ICDChapter.ToString() + "---ICD Chapter Field");
                }
            }
            foreach (ICD dg in ctx.ICDs)
            {

                if (dg.ID.ToString().Contains(prefixText))
                {
                    result.Add(dg.ID.ToString() + "---ID Field");
                }
            }


            return result.ToArray();
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] getAutoListG(string prefixText)
        {
            List<string> result = new List<string>();
            var ctx = new DataBaseAllDataContext();
            foreach (ICDChapter dg in ctx.ICDChapters)
            {
                if (dg.Name.Contains(prefixText))
                {
                    result.Add(dg.Name + "---Name Field");
                }

            }
            foreach (ICDChapter dg in ctx.ICDChapters)
            {

                if (dg.ID.ToString().Contains(prefixText))
                {
                    result.Add(dg.ID.ToString() + "---ID Field");
                }
            }


            return result.ToArray();
        }




        protected void LinqDataSourceDrug_SelectingG(object sender, LinqDataSourceSelectEventArgs e)
        {
            DataBaseAllDataContext dataAll = new DataBaseAllDataContext();
            String searchCate = DropSearchG.SelectedValue;
            String searchString = "";

            if (SearchText.Text != null || !SearchText.Text.Equals(""))
            {
                String[] lines = Regex.Split(SearchTextG.Text, "---");
                searchString = lines[0];
            }


            if (searchCate.Equals("ID"))
            {
                if (SearchTextG.Text == null || SearchTextG.Text.Equals(""))
                {

                }
                else
                {
                    int seach = Convert.ToInt32(searchString);
                    IEnumerable<ICDChapter> Drug = from p in dataAll.ICDChapters
                                                  where p.ID == seach
                                                  select p;

                    e.Result = Drug;
                }

            }
            else if (searchCate.Equals("DrugGroupName"))
            {
                IEnumerable<ICDChapter> Drug = from p in dataAll.ICDChapters
                                              where p.Name.Contains(searchString)
                                              select p;

                e.Result = Drug;
            }
        }

        protected void LinqDataSourceDrug_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            DataBaseAllDataContext dataAll = new DataBaseAllDataContext();
            String searchCate = DropSearch.SelectedValue;
            String searchString = "";

            if (SearchText.Text != null || !SearchText.Text.Equals(""))
            {
                String[] lines = Regex.Split(SearchText.Text, "---");
                searchString = lines[0];
            }

            if (searchCate.Equals("DrugName"))
            {
                IEnumerable<ICD> Drug = from p in dataAll.ICDs
                                         where p.Name.Contains(searchString)
                                         select p;

                e.Result = Drug;
            }
            else if (searchCate.Equals("ID"))
            {
                if (SearchText.Text == null || SearchText.Text.Equals(""))
                {

                }
                else
                {
                    int id = Convert.ToInt32(searchString);
                    IEnumerable<ICD> Drug = from p in dataAll.ICDs
                                             where p.ID == id
                                             select p;

                    e.Result = Drug;
                }

            }
            
            else if (searchCate.Equals("Unit"))
            {
                if (SearchText.Text == null || SearchText.Text.Equals(""))
                {

                }
                else
                {

                    IEnumerable<ICD> Drug = from p in dataAll.ICDs
                                             where p.Code.Contains(searchString)
                                             select p;

                    e.Result = Drug;
                }

            }
            else if (searchCate.Equals("Group ID"))
            {
                if (SearchText.Text == null || SearchText.Text.Equals(""))
                {

                }
                else
                {
                    int text = Convert.ToInt32(searchString);
                    IEnumerable<ICD> Drug = from p in dataAll.ICDs
                                             where p.ICDChapter == text
                                             select p;

                    e.Result = Drug;
                }

            }
        }

        protected void ChangeContent_Click(object sender, EventArgs e)
        {
            if (ChangeContent.Text.Equals("ICD"))
            {
                ChangeContent.Text = "ICD Chapter";
                ViewState["Drug"] = "DG";
                DrugCotent.Visible = false;
                DrugCotentG.Visible = true;
                TableAddDrugG.Visible = false;
            }
            else if (ChangeContent.Text.Equals("ICD Chapter"))
            {
                ChangeContent.Text = "ICD";
                ViewState["Drug"] = "D";
                DrugCotent.Visible = true;
                DrugCotentG.Visible = false;
            }
        }

        protected void CloseViewDetail_Click(object sender, EventArgs e)
        {
            DetalItem.Visible = false;
        }

        protected void Detail_Click(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            int index = gvRow.RowIndex;
            Label label = GridDrug.Rows[index].FindControl("ViewID") as Label;
            var lblId = label.Text;
            DetalItem.Visible = true;
            IDtext.Text = lblId;

        }
    }
}