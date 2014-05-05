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
    public partial class Prescription1 : System.Web.UI.Page
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
                items.Add(new ListItem("Prescription ID", "DrugName"));
                items.Add(new ListItem("Drug ID", "GenericName"));
                items.Add(new ListItem("Quanlity", "Price"));
                items.Add(new ListItem("Dose", "Unit"));
                items.Add(new ListItem("Instruction", "Group ID"));
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
                int quantity = Convert.ToInt32(Quantity.Text);
                int dose = Convert.ToInt32(Dose.Text);
                int idpre = Convert.ToInt32(PresID.Text);
                int iddrug = Convert.ToInt32(DrugID.Text);
                String intruc = Instruction.Text;
                var drug = new PrescriptionDetail() { PrescripID = idpre, DrugID = iddrug, Dose = dose, Quantity = quantity, Instruction = intruc };
                DataBaseAllDataContext dataAll = new DataBaseAllDataContext();
                dataAll.PrescriptionDetails.InsertOnSubmit(drug);
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
                var drug = new Prescription() { DoctorID = iddoctor, Date = dat };
                DataBaseAllDataContext dataAll = new DataBaseAllDataContext();
                dataAll.Prescriptions.InsertOnSubmit(drug);
                dataAll.SubmitChanges();
                GridDrugG.DataBind();
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
            foreach (Prescription dg in ctx.Prescriptions)
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
            foreach (Drug dg in ctx.Drugs)
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
            foreach (PrescriptionDetail dg in ctx.PrescriptionDetails)
            {
                if (dg.PrescripID.ToString().Contains(prefixText))
                {
                    result.Add(dg.PrescripID.ToString() + "---Presciption ID Field");
                }

            }
            foreach (PrescriptionDetail dg in ctx.PrescriptionDetails)
            {

                if (dg.DrugID.ToString().Contains(prefixText))
                {
                    result.Add(dg.DrugID.ToString() + "---Drug ID Field");
                }

            }
            foreach (PrescriptionDetail dg in ctx.PrescriptionDetails)
            {

                if (dg.Quantity.ToString().Contains(prefixText))
                {
                    result.Add(dg.Quantity.ToString() + "---Quantity Field");
                }

            }
            foreach (PrescriptionDetail dg in ctx.PrescriptionDetails)
            {

                if (dg.Dose.ToString().Contains(prefixText))
                {
                    result.Add(dg.Dose.ToString() + "---Dose Field");
                }
            }
            foreach (PrescriptionDetail dg in ctx.PrescriptionDetails)
            {

                if (dg.Instruction.ToString().Contains(prefixText))
                {
                    result.Add(dg.Instruction.ToString() + "---Instruction Field");
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
            foreach (Prescription dg in ctx.Prescriptions)
            {
                if (dg.DoctorID.ToString().Contains(prefixText))
                {
                    result.Add(dg.DoctorID.ToString() + "---Doctor ID Field");
                }

            }
            foreach (Prescription dg in ctx.Prescriptions)
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
                    IEnumerable<Prescription> Drug = from p in dataAll.Prescriptions
                                                     where p.ID == seach
                                                     select p;

                    e.Result = Drug;
                }

            }
            else if (searchCate.Equals("DrugGroupName"))
            {
                int seach = Convert.ToInt32(searchString);
                IEnumerable<Prescription> Drug = from p in dataAll.Prescriptions
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
                IEnumerable<PrescriptionDetail> Drug = from p in dataAll.PrescriptionDetails
                                                       where p.PrescripID == id
                                                       select p;

                e.Result = Drug;
            }
            else if (searchCate.Equals("GenericName"))
            {
                int id = Convert.ToInt32(searchString);
                IEnumerable<PrescriptionDetail> Drug = from p in dataAll.PrescriptionDetails
                                                       where p.DrugID == id
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
                    IEnumerable<PrescriptionDetail> Drug = from p in dataAll.PrescriptionDetails
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
                    int id = Convert.ToInt32(searchString);
                    IEnumerable<PrescriptionDetail> Drug = from p in dataAll.PrescriptionDetails
                                                           where p.Dose == id
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
                    int id = Convert.ToInt32(searchString);
                    IEnumerable<PrescriptionDetail> Drug = from p in dataAll.PrescriptionDetails
                                                           where p.Quantity == id
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
                    IEnumerable<PrescriptionDetail> Drug = from p in dataAll.PrescriptionDetails
                                                           where p.Instruction.Contains(searchString)
                                                           select p;
                    e.Result = Drug;
                }

            }
        }

        protected void ChangeContent_Click(object sender, EventArgs e)
        {
            if (ChangeContent.Text.Equals("Prescription Detail"))
            {
                ChangeContent.Text = "Prescription";
                ViewState["Drug"] = "DG";
                DrugCotent.Visible = false;
                DrugCotentG.Visible = true;
                TableAddDrugG.Visible = false;
                GridDrugG.Visible = true;
            }
            else if (ChangeContent.Text.Equals("Prescription"))
            {
                ChangeContent.Text = "Prescription Detail";
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