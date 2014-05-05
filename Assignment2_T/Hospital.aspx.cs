using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2_T
{
    public partial class Hospital1 : System.Web.UI.Page
    {

        public String state;

        protected void Page_Load(object sender, EventArgs e)
        {
            checkLoginRole();
            loadList();
            state = "load";
            if (ViewState["state"] == null)
            {
                state = "load";
            }
            else
            {
                state = (String)ViewState["state"];
            }

            if (ViewState["state"] == null || ViewState["state"].Equals("load"))
            {
                TableAddDrug.Visible = false;
                GridDrug.Visible = true;
            }
            else if (ViewState["state"].Equals("add"))
            {
                TableAddDrug.Visible = true;
                GridDrug.Visible = false;
            }

            DetalItem.Visible = false;

            if (Session["update"] == null || Session["update"].ToString().Equals(""))
            {

            }
            else
            {
                var service = new ServiceReference.AssiServiceSoapClient();
                service.check();


                GridDrug.DataSource = service.reutrnHos();
                GridDrug.DataBind();

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
                    LinqDataSource.EnableDelete = false;
                    LinqDataSource.EnableUpdate = false;
                }
                else if (Session["role"].ToString().Equals("1"))
                {
                    AddDrugButton.Visible = true;
                    LinqDataSource.EnableDelete = true;
                    LinqDataSource.EnableUpdate = true;
                }
            }
        }

        protected void loadList()
        {
            if (ViewState["loadList"] == null || ViewState["loadList"].Equals("notdone"))
            {
                List<ListItem> items = new List<ListItem>();
                items.Add(new ListItem("ID", "ID"));
                items.Add(new ListItem("Name", "Name"));
                items.Add(new ListItem("Address", "Address"));
                items.Add(new ListItem("License", "License"));
                DropSearch.Items.AddRange(items.ToArray());

                ViewState["loadList"] = "done";
            }


        }


        protected void AddNewDrug_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                TableAddDrug.Visible = false;
                String name = DrugName.Text;
                String address = Unit.Text;
                String license = GroupID.Text;

                var drug = new Hospital() { Name = name, Address = address, License = license };
                DataBaseAllDataContext dataAll = new DataBaseAllDataContext();
                dataAll.Hospitals.InsertOnSubmit(drug);
                dataAll.SubmitChanges();

                ViewState["state"] = "load";
                GridDrug.DataBind();
                TableAddDrug.Visible = false;
                GridDrug.Visible = true;
            }
        }

        protected void ActiveSearch_Click(object sender, EventArgs e)
        {
            GridDrug.DataBind();
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] getAutoList(string prefixText)
        {
            List<string> result = new List<string>();
            var ctx = new DataBaseAllDataContext();
            foreach (Hospital dg in ctx.Hospitals)
            {
                if (dg.Name.Contains(prefixText))
                {
                    result.Add(dg.Name + "---Name Field");
                }
                
            }
            foreach (Hospital dg in ctx.Hospitals)
            {
               
                if (dg.Address.Contains(prefixText))
                {
                    result.Add(dg.Address + "---Address Field");
                }
               
            }
            foreach (Hospital dg in ctx.Hospitals)
            {
               
                if (dg.License.Contains(prefixText))
                {
                    result.Add(dg.License + "---License Field");
                }
               
            }
            foreach (Hospital dg in ctx.Hospitals)
            {
               
                if (dg.ID.ToString().Contains(prefixText))
                {
                    result.Add(dg.ID.ToString() + "---ID Field");
                }
            }
            return result.ToArray();
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

        protected void GridView_SelectedIndexChanged(object sender, EventArgs e)
        {

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


            if (searchCate.Equals("Name"))
            {
                IEnumerable<Hospital> Drug = from p in dataAll.Hospitals
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
                    IEnumerable<Hospital> Drug = from p in dataAll.Hospitals
                                               where p.ID == id
                                               select p;

                    e.Result = Drug;
                }

            }
            else if (searchCate.Equals("Address"))
            {
                if (SearchText.Text == null || SearchText.Text.Equals(""))
                {

                }
                else
                {
                    IEnumerable<Hospital> Drug = from p in dataAll.Hospitals
                                               where p.Address.Contains(searchString)
                                               select p;
                    e.Result = Drug;
                }

            }
            else if (searchCate.Equals("License"))
            {
                if (SearchText.Text == null || SearchText.Text.Equals(""))
                {
                }
                else
                {
                    IEnumerable<Hospital> Drug = from p in dataAll.Hospitals
                                               where p.License.Contains(searchString)
                                               select p;
                    e.Result = Drug;
                }
            }

            if (Session["update"] == null || Session["update"].ToString().Equals(""))
            {

            }
            else
            {
               
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

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            GridDrug.DataBind();
        }
    }
}