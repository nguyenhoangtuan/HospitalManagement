using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Assignment2_T
{
    /// <summary>
    /// Summary description for AssiService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class AssiService : System.Web.Services.WebService
    {
        [WebMethod]
        public String
            check()
        {
            return "chekc";
        }

        [WebMethod]
        public MyHospital[] reutrnHos()
        {
            DataBaseAllDataContext db = new DataBaseAllDataContext();
            var hospitalList = db.Hospitals.ToArray();
            MyHospital[] mh = new MyHospital[hospitalList.Length];


            for (int i = 0; i < hospitalList.Length; i++)
            {
                mh[i] = new MyHospital();
                mh[i].ID = hospitalList[i].ID;
                mh[i].Name = hospitalList[i].Name;
                mh[i].Address = hospitalList[i].Address;
                mh[i].License = hospitalList[i].License;

            }
            return mh;
        }

        [WebMethod]
        public MyDoctor[] reutrnDoc()
        {
            DataBaseAllDataContext db = new DataBaseAllDataContext();
            var doctorList = db.Doctors.ToArray();
            MyDoctor[] mh = new MyDoctor[doctorList.Length];

            for (int i = 0; i < doctorList.Length; i++)
            {
                mh[i] = new MyDoctor();
                mh[i].ID = doctorList[i].ID;
                mh[i].Name = doctorList[i].Name;
                mh[i].Address = doctorList[i].Address;
                mh[i].License = doctorList[i].License;
                mh[i].date = doctorList[i].DoB;
                mh[i].Gender = doctorList[i].Gender;

            }
            return mh;
        }

    }

    [Serializable()]
    public class MyHospital{
        public String Name { get; set; }

        public String Address { get; set; }

        public int ID { get; set; }

        public String License { get; set; }

    }

    [Serializable()]
    public class MyDoctor
    {
        public String Name { get; set; }

        public String Address { get; set; }

        public int ID { get; set; }

        public int Gender { get; set; }

        public DateTime date { get; set; }

        public String License { get; set; }

    }
}
