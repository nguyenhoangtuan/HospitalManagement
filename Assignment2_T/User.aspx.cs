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
    public partial class User1 : System.Web.UI.Page
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
          
        }

        protected void loadList()
        {
            if (ViewState["loadList"] == null || ViewState["loadList"].Equals("notdone"))
            {
                List<ListItem> items = new List<ListItem>();
                items.Add(new ListItem("ID", "ID"));
                items.Add(new ListItem("UserAcc", "Name"));
                items.Add(new ListItem("Password", "Address"));
                items.Add(new ListItem("Role", "License"));
                DropSearch.Items.AddRange(items.ToArray());

                ViewState["loadList"] = "done";
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


        protected void AddNewDrug_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                TableAddDrug.Visible = false;
                String name = DrugName.Text;
                int gender = Convert.ToInt32(GenderDrop.SelectedValue);
                String address = Unit.Text;
             

                var drug = new User() { UserAcc = name, Role = gender, Password = address};
                DataBaseAllDataContext dataAll = new DataBaseAllDataContext();
                dataAll.Users.InsertOnSubmit(drug);
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
            foreach (User dg in ctx.Users)
            {
                if (dg.UserAcc.Contains(prefixText))
                {
                    result.Add(dg.UserAcc + "---UserAcc Field");
                }
            }
            foreach (User dg in ctx.Users)
            {
                if (dg.Password.Contains(prefixText))
                {
                    result.Add(dg.Password + "---Password Field");
                }
            }
            foreach (User dg in ctx.Users)
            {
                if (dg.Role.ToString().Contains(prefixText))
                {
                    result.Add(dg.Role.ToString() + "---Role Field");
                }
            }
            foreach (User dg in ctx.Users)
            {
                if (dg.ID.ToString().Contains(prefixText))
                {
                    result.Add(dg.ID.ToString() + "---ID Field");
                }
            }
            return result.ToArray();
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
                IEnumerable<User> Drug = from p in dataAll.Users
                                           where p.UserAcc.Contains(searchString)
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
                    IEnumerable<User> Drug = from p in dataAll.Users
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
                    IEnumerable<User> Drug = from p in dataAll.Users
                                               where p.Password.Contains(searchString)
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
                    IEnumerable<User> Drug = from p in dataAll.Users
                                               where p.Role.ToString().Contains(searchString)
                                               select p;
                    e.Result = Drug;
                }
            }
        }


    }
}