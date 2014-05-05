using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Assignment2_T
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            checkLogin();
            getDataFormService();
        }

        protected void getDataFormService()
        {
            //DataService.WebServiceNewSoapClient ws = new DataService.WebServiceNewSoapClient();
            //var list = ws.returnData();
            //List<Hospital> a = list.Cast<Hospital>().ToList();
            //DataBaseAllDataContext da = new DataBaseAllDataContext();
         
            //foreach (Hospital h1 in a)
            //{
            //    int i = 0;
            //    foreach (Hospital h2 in da.Hospitals)
            //    {
            //        if (h1.ID == h2.ID)
            //        {
            //            h2.Name = h1.Name;
            //            h2.Address = h1.Address;
            //            h2.License = h1.License;
            //            i = 1;
            //        }
            //    }

            //    if (i == 0)
            //    {
            //        da.Hospitals.InsertOnSubmit(h1);
            //    }
            //}

            //da.SubmitChanges();


        }

        protected void checkLogin()
        {
            if (Session["username"] != null)
            {
                LoginID.Visible = false;
                LogoutButton.Visible = true;
                ProfileButton.Visible = true;
                ProfileButton.Text = "" + Session["username"];
            }
            else
            {
                LogoutButton.Visible = false;
                ProfileButton.Visible = false;
            }

        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {

        }

        protected bool LogIn(String username, String password)
        {
            DataBaseAllDataContext dataAll = new DataBaseAllDataContext();

            var checkUser = dataAll.Users.SingleOrDefault(c => c.UserAcc == username);

            if (checkUser != null)
            {
                if (checkUser.Password == password)
                {
                    return true;
                }
                LoginID.FailureText = "Your password is not correct !!";
                return false;
            }
            else
            {
                LoginID.FailureText = "Your username is not correct !!";
                return false;
            }
        }

        protected void Login_Authenticate(object sender, AuthenticateEventArgs e)
        {
            String username = LoginID.UserName;
            String password = LoginID.Password;

            if (LogIn(username, password))
            {
                e.Authenticated = true; 
                 DataBaseAllDataContext dataAll = new DataBaseAllDataContext();
                var checkUser = dataAll.Users.SingleOrDefault(c => c.UserAcc == username);
                Session["Username"] = username;
                Session["role"] = checkUser.Role;
                Debug.WriteLine(Session["Username"]);
                Debug.WriteLine(Session["role"]);
            }
           
           

        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            LoginID.Visible = true;
            LogoutButton.Visible = false;
            ProfileButton.Visible = false;
            Response.Write("<script LANGUAGE='JavaScript' >document.location='" +
               ResolveClientUrl("~/Home.aspx") + "';</script>");
        }

        protected void ProfileButton_Click(object sender, EventArgs e)
        {

        }
    }
}