using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2_T
{
    public partial class LabOrder1 : System.Web.UI.Page
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

            if (ViewState["state"] == null || ViewState["state"].Equals("load"))
            {
                TableAddDrugG.Visible = false;
                GridDrugG.Visible = true;
            }
            else if (ViewState["state"].Equals("add"))
            {
                TableAddDrugG.Visible = true;
                GridDrugG.Visible = false;
            }
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
                items.Add(new ListItem("Lab Order ID", "DrugName"));
                items.Add(new ListItem("Medical Service ID", "GenericName"));
                items.Add(new ListItem("Result", "Price"));
                DropSearch.Items.AddRange(items.ToArray());

                List<ListItem> items3 = new List<ListItem>();
                items3.Add(new ListItem("ID", "ID"));
                items3.Add(new ListItem("Doctor ID", "DrugGroupName"));
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
                String quantity = Quantity.Text;
                int idpre = Convert.ToInt32(PresID.Text);
                int iddrug = Convert.ToInt32(DrugID.Text);
                var drug = new LabOrderDetail() { LabOrderID = idpre, MedicalServiceID = iddrug, Result = quantity };
                DataBaseAllDataContext dataAll = new DataBaseAllDataContext();
                dataAll.LabOrderDetails.InsertOnSubmit(drug);
                dataAll.SubmitChanges();
                GridDrug.DataBind();
            }
        }

        protected void AddNewDrug_ClickG(object sender, EventArgs e)
        {
            if (IsValid)
            {
                TableAddDrugG.Visible = false;
                int iddoctor = Convert.ToInt32(DoctorID.Text);
                DateTime dat = DateTime.Parse(date.Text);
                var drug = new LabOrder() { DoctorID = iddoctor, Date = dat };
                DataBaseAllDataContext dataAll = new DataBaseAllDataContext();
                dataAll.LabOrders.InsertOnSubmit(drug);
                dataAll.SubmitChanges();
                GridDrugG.DataBind();
                TableAddDrugG.Visible = false;
                GridDrugG.Visible = true;
                ViewState["state"] = "load";
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
            foreach (Doctor dg in ctx.Doctors)
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
        public static string[] getPreIDlist(string prefixText)
        {
            List<string> result = new List<string>();
            var ctx = new DataBaseAllDataContext();
            foreach (LabOrder dg in ctx.LabOrders)
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
        public static string[] getDrugIDlist(string prefixText)
        {
            List<string> result = new List<string>();
            var ctx = new DataBaseAllDataContext();
            foreach (MedicalService dg in ctx.MedicalServices)
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
            foreach (LabOrderDetail dg in ctx.LabOrderDetails)
            {
                if (dg.LabOrderID.ToString().Contains(prefixText))
                {
                    result.Add(dg.LabOrderID.ToString() + "---LabOrder ID Field");
                }

            }
            foreach (LabOrderDetail dg in ctx.LabOrderDetails)
            {

                if (dg.MedicalServiceID.ToString().Contains(prefixText))
                {
                    result.Add(dg.MedicalServiceID.ToString() + "---MedicalServiceID Field");
                }

            }

            foreach (LabOrderDetail dg in ctx.LabOrderDetails)
            {

                if (dg.Result.ToString().Contains(prefixText))
                {
                    result.Add(dg.Result.ToString() + "---Result Field");
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
            foreach (LabOrder dg in ctx.LabOrders)
            {
                if (dg.DoctorID.ToString().Contains(prefixText))
                {
                    result.Add(dg.DoctorID.ToString() + "---Doctor ID Field");
                }

            }
            foreach (LabOrder dg in ctx.LabOrders)
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
                    IEnumerable<LabOrder> Drug = from p in dataAll.LabOrders
                                                 where p.ID == seach
                                                 select p;

                    e.Result = Drug;
                }

            }
            else if (searchCate.Equals("DrugGroupName"))
            {
                int seach = Convert.ToInt32(searchString);
                IEnumerable<LabOrder> Drug = from p in dataAll.LabOrders
                                             where p.DoctorID == seach
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
                int id = Convert.ToInt32(searchString);
                IEnumerable<LabOrderDetail> Drug = from p in dataAll.LabOrderDetails
                                                   where p.LabOrderID == id
                                                   select p;

                e.Result = Drug;
            }
            else if (searchCate.Equals("GenericName"))
            {
                int id = Convert.ToInt32(searchString);
                IEnumerable<LabOrderDetail> Drug = from p in dataAll.LabOrderDetails
                                                   where p.MedicalServiceID == id
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
                    IEnumerable<LabOrderDetail> Drug = from p in dataAll.LabOrderDetails
                                                       where p.ID == id
                                                       select p;

                    e.Result = Drug;
                }

            }

            else if (searchCate.Equals("Price"))
            {
                if (SearchText.Text == null || SearchText.Text.Equals(""))
                {

                }
                else
                {

                    IEnumerable<LabOrderDetail> Drug = from p in dataAll.LabOrderDetails
                                                       where p.Result.Contains(searchString)
                                                       select p;

                    e.Result = Drug;
                }
            }

        }

        protected void ChangeContent_Click(object sender, EventArgs e)
        {
            if (ChangeContent.Text.Equals("Lab Order Detail"))
            {
                ChangeContent.Text = "Lab Order";
                ViewState["Drug"] = "DG";
                DrugCotent.Visible = false;
                DrugCotentG.Visible = true;
                TableAddDrugG.Visible = false;
                GridDrugG.Visible = true;
            }
            else if (ChangeContent.Text.Equals("Lab Order"))
            {
                ChangeContent.Text = "Lab Order Detail";
                ViewState["Drug"] = "D";
                DrugCotent.Visible = true;
                DrugCotentG.Visible = false;
                GridDrugG.Visible = true;
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

        protected void Calendar_SelectionChanged(object sender, System.EventArgs e)
        {
            date.Text = Calendar.SelectedDate.ToShortDateString();
        }

    }
}