using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2_T
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected bool LogIn(String username , String password)
        {
            DataBaseAllDataContext dataAll = new DataBaseAllDataContext();

            var checkUser = dataAll.Users.SingleOrDefault(c=> c.UserAcc == username);

            //IEnumerable<User> user = from p in dataAll.Users
            //                         where p.UserAcc == username 
            //                         && p.Password == password
            //                         select p;

            if (checkUser != null)
            {
                if (checkUser.Password == password) {
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

            if (LogIn(username, password)) {
                e.Authenticated = true;
                Session["Username"] = username;
            }

            
        }
    }
}