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
    public partial class Visit1 : System.Web.UI.Page
    {
        public String state;

        protected void Page_Load(object sender, EventArgs e)
        {
            //GridViewLabOrderDetail.Visible = false;
            loadList();
            //TableAddDrug.Visible = true;
            //GridDrug.Visible = false;
            checkLoginRole();
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

            if (IDHospital.Text.Equals(""))
            {
                DetailsView1.Visible = false;
            }

            if (ViewState["AddHos"] == null || ViewState["AddHos"].Equals("false"))
            {
                AddHospitalDiv.Visible = false;
            }
            else
            {
                AddHospitalDiv.Visible = true;
            }

            if (IDDoctor.Text.Equals(""))
            {
                DetailsView2.Visible = false;
            }

            if (ViewState["AddDoc"] == null || ViewState["AddDoc"].Equals("false"))
            {
                AddDoctorDiv.Visible = false;
            }
            else
            {
                AddDoctorDiv.Visible = true;
            }

            if (IDPatient.Text.Equals(""))
            {
                DetailsView3.Visible = false;
            }

            if (ViewState["AddPat"] == null || ViewState["AddPat"].Equals("false"))
            {
                AddPatientDiv.Visible = false;
            }
            else
            {
                AddPatientDiv.Visible = true;
            }


            if (IDICD.Text.Equals(""))
            {
                DetailsView4.Visible = false;
            }

            if (ViewState["AddICD"] == null || ViewState["AddICD"].Equals("false"))
            {
                AddICDDiv.Visible = false;
            }
            else
            {
                AddICDDiv.Visible = true;
            }

            if (IDLabOrder.Text.Equals(""))
            {
                DetailsView5.Visible = false;
            }

            if (ViewState["AddLabOrder"] == null || ViewState["AddLabOrder"].Equals("false"))
            {
                AddLabOrderDiv.Visible = false;
            }
            else
            {
                AddLabOrderDiv.Visible = true;
            }

            if (IDPrescription.Text.Equals(""))
            {
                DetailsView6.Visible = false;
            }

            if (ViewState["AddPrescription"] == null || ViewState["AddPrescription"].Equals("false"))
            {
                AddPrescriptionDiv.Visible = false;
            }
            else
            {
                AddPrescriptionDiv.Visible = true;
            }

            //TableAddDrug.Visible = true;
            //GridDrug.Visible = false;

            checkditVisit();
        }

        protected void checkditVisit()
        {
            if (Session["editVisitID"] == null || Session["editVisitID"].ToString().Equals(""))
            {

            }
            else
            {
                IDPatient.Text = Session["editVisitID"].ToString();

                IDEdit.Text = "";

                TableAddDrug.Visible = true;
                GridDrug.Visible = false;
                ViewState["state"] = "add";

                DetailsView3.Visible = true;
                AddPatientButton.Visible = false;
            }
             

        }

        protected void loadList()
        {
            if (ViewState["loadList"] == null || ViewState["loadList"].Equals("notdone"))
            {
                
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
            Response.Redirect("Patient.aspx");
          //  Response.Write("<script LANGUAGE='JavaScript' >document.location='" +ResolveClientUrl("~/Patient.aspx") + "';</script>");

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

        protected void ClearRecord(object sender, EventArgs e)
        {
            Price.Text = "";
            OutCome.Text = "";
            IDHospital.Text = "";
            IDDoctor.Text = "";
            IDPatient.Text = "";
            IDICD.Text = "";
            IDLabOrder.Text = "";
            IDPrescription.Text = "";
            IDEdit.Text = "";

            DetailsView1.Visible = false;
            AddHospitalButton.Visible = true;
            DetailsView2.Visible = false;
            AddDoctorButton.Visible = true;
            DetailsView3.Visible = false;
            AddPatientButton.Visible = true;
            DetailsView4.Visible = false;
            AddICDButton.Visible = true;
            DetailsView5.Visible = false;
            AddLabOrderButton.Visible = true;
            DetailsView6.Visible = false;
            AddPrescriptionButton.Visible = true;

            Session["editVisitID"] = "";
            TableAddDrug.Visible = false;
            GridDrug.Visible = true;
            ViewState["state"] = "load";



        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] getAutoListHos(string prefixText)
        {
            var ctx = new DataBaseAllDataContext();
            IEnumerable<String> Drug1 = from p in ctx.Visits
                                       join h in ctx.Hospitals on p.HospitalID equals h.ID
                                       where h.Name.Contains(prefixText)
                                       select h.Name;
            return Drug1.ToArray();
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] getAutoListHos1(string prefixText)
        {
            var ctx = new DataBaseAllDataContext();
            IEnumerable<String> Drug1 = from p in ctx.Visits
                                        join h in ctx.Hospitals on p.HospitalID equals h.ID
                                        where h.Name.Contains(prefixText)
                                        select h.Name;
            return Drug1.ToArray();
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] getAutoListPat(string prefixText)
        {
            var ctx = new DataBaseAllDataContext();
            IEnumerable<String> Drug3 = from p in ctx.Visits
                                       join h in ctx.Patients on p.PatientID equals h.ID
                                       where h.Name.Contains(prefixText)
                                       select h.Name;
            return Drug3.ToArray();
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] getAutoListDoc(string prefixText)
        {
            var ctx = new DataBaseAllDataContext();
            IEnumerable<String> Drug2 = from p in ctx.Visits
                                        join h in ctx.Doctors on p.DoctorID equals h.ID
                                        where h.Name.Contains(prefixText)
                                       select h.Name;
            return Drug2.ToArray();
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] getAutoListICD(string prefixText)
        {
            var ctx = new DataBaseAllDataContext();
            IEnumerable<String> Drug4 = from p in ctx.Visits
                                        join h in ctx.ICDs on p.ICDID equals h.ID
                                        where h.Name.Contains(prefixText)
                                       select h.Name;
            return Drug4.ToArray();
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] getAutoListID(string prefixText)
        {
            List<string> result = new List<string>();
            var ctx = new DataBaseAllDataContext();
            foreach (Visit dg in ctx.Visits)
            {
                if (dg.ID.ToString().Contains(prefixText))
                {
                    result.Add(dg.ID.ToString());
                }
            }

            return result.ToArray();
        }



        protected void AddNewDrug_Click(object sender, EventArgs e)
        {


            if (IsValid)
            {
                TableAddDrug.Visible = false;

                DateTime dob = DateTime.Parse(Price.Text);
                String outcome = OutCome.Text;

                int hospitalID = Convert.ToInt32(IDHospital.Text);
                int doctorID = Convert.ToInt32(IDDoctor.Text);
                int patientID = Convert.ToInt32(IDPatient.Text);
                int ICDId = Convert.ToInt32(IDICD.Text);
                int labID = Convert.ToInt32(IDLabOrder.Text);
                int preID = Convert.ToInt32(IDPrescription.Text);

                if (IDEdit.Text == null || IDEdit.Text.Equals(""))
                {
                    var drug = new Visit()
                    {
                        Date = dob,
                        DoctorID = doctorID,
                        PatientID = patientID,
                        HospitalID = hospitalID,
                        ICDID = ICDId,
                        LabID = labID,
                        PrescripID = preID,
                        Outcome = outcome
                    };
                    DataBaseAllDataContext dataAll = new DataBaseAllDataContext();
                    dataAll.Visits.InsertOnSubmit(drug);
                    dataAll.SubmitChanges();

                    ViewState["state"] = "load";
                    GridDrug.DataBind();
                    TableAddDrug.Visible = false;
                    GridDrug.Visible = true;
                }
                else
                {
                    var drug = new Visit()
                    {
                        ID = Convert.ToInt32(IDEdit.Text),
                        Date = dob,
                        DoctorID = doctorID,
                        PatientID = patientID,
                        HospitalID = hospitalID,
                        ICDID = ICDId,
                        LabID = labID,
                        PrescripID = preID,
                        Outcome = outcome
                    };
                    DataBaseAllDataContext dataAll = new DataBaseAllDataContext();

                    var old = (from p in dataAll.Visits
                               where p.ID == Convert.ToInt32(IDEdit.Text)
                               select p).Single();

                    old.Date = drug.Date;
                    old.DoctorID = drug.DoctorID;
                    old.PatientID = drug.PatientID;
                    old.HospitalID = drug.HospitalID;
                    old.ICDID = drug.ICDID;
                    old.LabID = drug.LabID;
                    old.PrescripID = drug.PrescripID;
                    old.Outcome = drug.Outcome;


                    dataAll.SubmitChanges();
                    ViewState["state"] = "load";
                    GridDrug.DataBind();
                    TableAddDrug.Visible = false;
                    GridDrug.Visible = true;
                }
            }
            Session["editVisitID"] = "";
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
            foreach (Doctor dg in ctx.Doctors)
            {
                if (dg.Name.Contains(prefixText))
                {
                    result.Add(dg.Name + "---Name Field");
                }
            }
            foreach (Doctor dg in ctx.Doctors)
            {
                if (dg.Address.Contains(prefixText))
                {
                    result.Add(dg.Address + "---Address Field");
                }
            }
            foreach (Doctor dg in ctx.Doctors)
            {
                if (dg.License.Contains(prefixText))
                {
                    result.Add(dg.License + "---License Field");
                }
            }
            foreach (Doctor dg in ctx.Doctors)
            {
                if (dg.ID.ToString().Contains(prefixText))
                {
                    result.Add(dg.ID.ToString() + "---ID Field");
                }
            }



            return result.ToArray();
        }



        protected void Calendar_SelectionChanged(object sender, System.EventArgs e)
        {
            Price.Text = Calendar.SelectedDate.ToShortDateString();
        }



        protected void LinqDataSourceDrug_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            DataBaseAllDataContext dataAll = new DataBaseAllDataContext();
            //String searchCate = DropSearch.SelectedValue;
            //String searchString = "";


           
            String seaHos = SearchHos.Text;
            String seaPat = SearchPat.Text;
            String seaDoc = SearchDoc.Text;
            String seaICD = SearchICDtext.Text;
            String seaID = SearchID.Text;


            IEnumerable<Visit> Drug1 = from p in dataAll.Visits join h in dataAll.Hospitals on p.HospitalID equals h.ID
                                       where h.Name.Contains(seaHos)
                                       select p;

            IEnumerable<Visit> Drug2 = from p in dataAll.Visits join h in dataAll.Doctors on p.DoctorID equals h.ID
                                       where h.Name.Contains(seaDoc)
                                       select p;

            IEnumerable<Visit> Drug3 = from p in dataAll.Visits
                                      join h in dataAll.Patients on p.PatientID equals h.ID
                                      where h.Name.Contains(seaPat)
                                      select p;

            IEnumerable<Visit> Drug4 = from p in dataAll.Visits
                                      join h in dataAll.ICDs on p.ICDID equals h.ID
                                      where h.Name.Contains(seaICD)
                                      select p;

            IEnumerable<Visit> Drug5 = from p in dataAll.Visits
                                       where p.ID.ToString().Contains(seaID.ToString())
                                       select p;
            var InterResult = Drug1.Intersect(Drug2.Intersect(Drug3.Intersect(Drug4.Intersect(Drug5))));
            e.Result = InterResult;




            //if (SearchText.Text != null || !SearchText.Text.Equals(""))
            //{
            //    String[] lines = Regex.Split(SearchText.Text, "---");
            //    searchString = lines[0];
            //}


            //if (searchCate.Equals("Name"))
            //{
            //    IEnumerable<Doctor> Drug = from p in dataAll.Doctors
            //                               where p.Name.Contains(searchString)
            //                               select p;
            //    e.Result = Drug;
            //}
            //else if (searchCate.Equals("ID"))
            //{
            //    if (SearchText.Text == null || SearchText.Text.Equals(""))
            //    {

            //    }
            //    else
            //    {
            //        int id = Convert.ToInt32(searchString);
            //        IEnumerable<Doctor> Drug = from p in dataAll.Doctors
            //                                   where p.ID == id
            //                                   select p;

            //        e.Result = Drug;
            //    }

            //}
            //else if (searchCate.Equals("Address"))
            //{
            //    if (SearchText.Text == null || SearchText.Text.Equals(""))
            //    {

            //    }
            //    else
            //    {
            //        IEnumerable<Doctor> Drug = from p in dataAll.Doctors
            //                                   where p.Address.Contains(searchString)
            //                                   select p;
            //        e.Result = Drug;
            //    }

            //}
            //else if (searchCate.Equals("License"))
            //{
            //    if (SearchText.Text == null || SearchText.Text.Equals(""))
            //    {
            //    }
            //    else
            //    {
            //        IEnumerable<Doctor> Drug = from p in dataAll.Doctors
            //                                   where p.License.Contains(searchString)
            //                                   select p;
            //        e.Result = Drug;
            //    }
            //}
        }

        protected void Detail_Click(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            int index = gvRow.RowIndex;
            Label label = GridDrug.Rows[index].FindControl("ViewId") as Label;
            var lblId = label.Text;
            //DetalItem.Visible = true;
            //IDtext.Text = lblId;
        }

        protected void SeeDetailItem_Click(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            int index = gvRow.RowIndex;
            Label label = GridDrug.Rows[index].FindControl("ViewId") as Label;
            var lblId = label.Text;
            IDEdit.Text = lblId;

            Label ViewDate = GridDrug.Rows[index].FindControl("ViewDate") as Label;
            Label ViewHospitalID = GridDrug.Rows[index].FindControl("ViewHospitalID") as Label;
            Label ViewDoctorID = GridDrug.Rows[index].FindControl("ViewDoctorID") as Label;
            Label ViewPatientID = GridDrug.Rows[index].FindControl("ViewPatientID") as Label;
            Label ViewICDID = GridDrug.Rows[index].FindControl("ViewICDID") as Label;
            Label ViewPreID = GridDrug.Rows[index].FindControl("ViewPreID") as Label;
            Label ViewLabID = GridDrug.Rows[index].FindControl("ViewLabID") as Label;
            Label ViewOutcome = GridDrug.Rows[index].FindControl("ViewOutcome") as Label;



            Price.Text = ViewDate.Text;
            OutCome.Text = ViewOutcome.Text;
            IDHospital.Text = ViewHospitalID.Text;
            IDDoctor.Text = ViewDoctorID.Text;
            IDPatient.Text = ViewPatientID.Text;
            IDICD.Text = ViewICDID.Text;
            IDLabOrder.Text = ViewLabID.Text;
            IDPrescription.Text = ViewPreID.Text;



            DetailsView1.Visible = true;
            AddHospitalButton.Visible = false;
            DetailsView2.Visible = true;
            AddDoctorButton.Visible = false;
            DetailsView3.Visible = true;
            AddPatientButton.Visible = false;
            DetailsView4.Visible = true;
            AddICDButton.Visible = false;
            DetailsView5.Visible = true;
            AddLabOrderButton.Visible = false;
            DetailsView6.Visible = true;
            AddPrescriptionButton.Visible = false;



            TableAddDrug.Visible = true;
            GridDrug.Visible = false;
            ViewState["state"] = "add";

        }

        protected void LinqDataSource2_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            DataBaseAllDataContext dataAll = new DataBaseAllDataContext();

            String searchString = "";

            if (SearchHospital.Text != null || !SearchHospital.Text.Equals(""))
            {
                String[] lines = Regex.Split(SearchHospital.Text, "---");
                searchString = lines[0];
            }

            IEnumerable<Hospital> Drug = from p in dataAll.Hospitals
                                         where p.Name.Contains(searchString)
                                         select p;
            e.Result = Drug;
        }


        protected void ActiveSearchHospital_Click(object sender, EventArgs e)
        {
            AddHospitalGrid.DataBind();
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] getHospitalList(string prefixText)
        {
            List<string> result = new List<string>();
            var ctx = new DataBaseAllDataContext();
            foreach (Hospital dg in ctx.Hospitals)
            {
                if (dg.Name.Contains(prefixText))
                {
                    result.Add(dg.Name);
                }
            }

            return result.ToArray();
        }

        protected void Hospital_Select(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            int index = gvRow.RowIndex;
            Label label = AddHospitalGrid.Rows[index].FindControl("ViewID") as Label;
            IDHospital.Text = label.Text;
            DetailsView1.Visible = true;
            AddHospitalButton.Visible = false;
            AddHospitalDiv.Visible = false;
            ViewState["AddHos"] = "false";
        }

        protected void Remove_Hospital(object sender, EventArgs e)
        {
            IDHospital.Text = "";
            DetailsView1.Visible = false;
            AddHospitalButton.Visible = true;
        }

        protected void AddHospital_Click(object sender, EventArgs e)
        {
            AddHospitalDiv.Visible = true;
            ViewState["AddHos"] = "true";
        }

        protected void CloseHospitalAdd_Click(object sender, EventArgs e)
        {
            AddHospitalDiv.Visible = false;
            ViewState["AddHos"] = "false";
        }

        protected void LinqDataSource22_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            DataBaseAllDataContext dataAll = new DataBaseAllDataContext();

            String searchString = "";

            if (SearchDoctor.Text != null || !SearchDoctor.Text.Equals(""))
            {
                String[] lines = Regex.Split(SearchDoctor.Text, "---");
                searchString = lines[0];
            }

            IEnumerable<Doctor> Drug = from p in dataAll.Doctors
                                       where p.Name.Contains(searchString)
                                       select p;
            e.Result = Drug;
        }


        protected void ActiveSearchDoctor_Click(object sender, EventArgs e)
        {
            AddDoctorGrid.DataBind();
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] getDoctorList(string prefixText)
        {
            List<string> result = new List<string>();
            var ctx = new DataBaseAllDataContext();
            foreach (Doctor dg in ctx.Doctors)
            {
                if (dg.Name.Contains(prefixText))
                {
                    result.Add(dg.Name);
                }
            }

            return result.ToArray();
        }

        protected void Doctor_Select(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            int index = gvRow.RowIndex;
            Label label = AddDoctorGrid.Rows[index].FindControl("ViewID") as Label;
            IDDoctor.Text = label.Text;
            DetailsView2.Visible = true;
            AddDoctorButton.Visible = false;
            AddDoctorDiv.Visible = false;
            ViewState["AddDoc"] = "false";
        }

        protected void Remove_Doctor(object sender, EventArgs e)
        {
            IDDoctor.Text = "";
            DetailsView2.Visible = false;
            AddDoctorButton.Visible = true;
        }

        protected void AddDoctor_Click(object sender, EventArgs e)
        {
            AddDoctorDiv.Visible = true;
            ViewState["AddDoc"] = "true";
        }

        protected void CloseDoctorAdd_Click(object sender, EventArgs e)
        {
            AddDoctorDiv.Visible = false;
            ViewState["AddDoc"] = "false";
        }



        protected void LinqDataSource23_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            DataBaseAllDataContext dataAll = new DataBaseAllDataContext();

            String searchString = "";

            if (SearchPatient.Text != null || !SearchPatient.Text.Equals(""))
            {
                String[] lines = Regex.Split(SearchPatient.Text, "---");
                searchString = lines[0];
            }

            IEnumerable<Patient> Drug = from p in dataAll.Patients
                                        where p.Name.Contains(searchString)
                                        select p;
            e.Result = Drug;
        }


        protected void ActiveSearchPatient_Click(object sender, EventArgs e)
        {
            AddPatientGrid.DataBind();
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] getPatientList(string prefixText)
        {
            List<string> result = new List<string>();
            var ctx = new DataBaseAllDataContext();
            foreach (Patient dg in ctx.Patients)
            {
                if (dg.Name.Contains(prefixText))
                {
                    result.Add(dg.Name);
                }
            }

            return result.ToArray();
        }

        protected void Patient_Select(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            int index = gvRow.RowIndex;
            Label label = AddPatientGrid.Rows[index].FindControl("ViewID") as Label;
            IDPatient.Text = label.Text;
            DetailsView3.Visible = true;
            AddPatientButton.Visible = false;
            AddPatientDiv.Visible = false;
            ViewState["AddPat"] = "false";
        }

        protected void Remove_Patient(object sender, EventArgs e)
        {
            IDPatient.Text = "";
            DetailsView3.Visible = false;
            AddPatientButton.Visible = true;
        }

        protected void AddPatient_Click(object sender, EventArgs e)
        {
            AddPatientDiv.Visible = true;
            ViewState["AddPat"] = "true";
        }

        protected void ClosePatientAdd_Click(object sender, EventArgs e)
        {
            AddPatientDiv.Visible = false;
            ViewState["AddPat"] = "false";
        }



        protected void LinqDataSource25_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            DataBaseAllDataContext dataAll = new DataBaseAllDataContext();

            String searchString = "";

            if (SearchICD.Text != null || !SearchICD.Text.Equals(""))
            {
                String[] lines = Regex.Split(SearchICD.Text, "---");
                searchString = lines[0];
            }

            IEnumerable<ICD> Drug = from p in dataAll.ICDs
                                    where p.Name.Contains(searchString)
                                    select p;
            e.Result = Drug;
        }


        protected void ActiveSearchICD_Click(object sender, EventArgs e)
        {
            AddICDGrid.DataBind();
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] getICDList(string prefixText)
        {
            List<string> result = new List<string>();
            var ctx = new DataBaseAllDataContext();
            foreach (ICD dg in ctx.ICDs)
            {
                if (dg.Name.Contains(prefixText))
                {
                    result.Add(dg.Name);
                }
            }

            return result.ToArray();
        }

        protected void ICD_Select(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            int index = gvRow.RowIndex;
            Label label = AddICDGrid.Rows[index].FindControl("ViewID") as Label;
            IDICD.Text = label.Text;
            DetailsView4.Visible = true;
            AddICDButton.Visible = false;
            AddICDDiv.Visible = false;
            ViewState["AddICD"] = "false";
        }

        protected void Remove_ICD(object sender, EventArgs e)
        {
            IDICD.Text = "";
            DetailsView4.Visible = false;
            AddICDButton.Visible = true;
        }

        protected void AddICD_Click(object sender, EventArgs e)
        {
            AddICDDiv.Visible = true;
            ViewState["AddICD"] = "true";
        }

        protected void CloseICDAdd_Click(object sender, EventArgs e)
        {
            AddICDDiv.Visible = false;
            ViewState["AddICD"] = "false";
        }




        protected void LinqDataSource24_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            DataBaseAllDataContext dataAll = new DataBaseAllDataContext();

            String searchString = "";

            if (SearchLabOrder.Text != null || !SearchLabOrder.Text.Equals(""))
            {
                String[] lines = Regex.Split(SearchLabOrder.Text, "---");
                searchString = lines[0];
            }

            IEnumerable<LabOrder> Drug = from p in dataAll.LabOrders
                                         where p.ID.ToString().Contains(searchString)
                                         select p;
            e.Result = Drug;
        }


        protected void ActiveSearchLabOrder_Click(object sender, EventArgs e)
        {
            AddLabOrderGrid.DataBind();
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] getLabOrderList(string prefixText)
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

        protected void LabOrder_Select(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            int index = gvRow.RowIndex;
            Label label = AddLabOrderGrid.Rows[index].FindControl("ViewID") as Label;
            IDLabOrder.Text = label.Text;
            DetailsView5.Visible = true;
            AddLabOrderButton.Visible = false;
            AddLabOrderDiv.Visible = false;
            ViewState["AddLabOrder"] = "false";
        }

        protected void Remove_LabOrder(object sender, EventArgs e)
        {
            IDLabOrder.Text = "";
            DetailsView5.Visible = false;
            AddLabOrderButton.Visible = true;
        }

        protected void AddLabOrder_Click(object sender, EventArgs e)
        {
            AddLabOrderDiv.Visible = true;
            ViewState["AddLabOrder"] = "true";
            LabOrderDetailDiv.Visible = false;
        }

        protected void CloseLabOrderAdd_Click(object sender, EventArgs e)
        {
            AddLabOrderDiv.Visible = false;
            ViewState["AddLabOrder"] = "false";
        }

        protected void LabOrder_Detail(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            int index = gvRow.RowIndex;
            Label label = AddLabOrderGrid.Rows[index].FindControl("ViewID") as Label;
            LabOrderDetailID1.Text = label.Text;
            LabOrderDetailDiv.Visible = true;
        }

        protected void LinqDataSource10_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {

            DataBaseAllDataContext dataAll = new DataBaseAllDataContext();
            IEnumerable<LabOrderDetail> Drug = from p in dataAll.LabOrderDetails
                                               where p.LabOrderID == Convert.ToInt32(LabOrderDetailID1.Text)
                                               select p;
            e.Result = Drug;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            GridViewLabOrderDetail.DataBind();
        }





        protected void LinqDataSourcePre_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            DataBaseAllDataContext dataAll = new DataBaseAllDataContext();

            String searchString = "";

            if (SearchPrescription.Text != null || !SearchPrescription.Text.Equals(""))
            {
                String[] lines = Regex.Split(SearchPrescription.Text, "---");
                searchString = lines[0];
            }

            IEnumerable<Prescription> Drug = from p in dataAll.Prescriptions
                                             where p.ID.ToString().Contains(searchString)
                                             select p;
            e.Result = Drug;
        }


        protected void ActiveSearchPrescription_Click(object sender, EventArgs e)
        {
            AddPrescriptionGrid.DataBind();
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] getPrescriptionList(string prefixText)
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

        protected void Prescription_Select(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            int index = gvRow.RowIndex;
            Label label = AddPrescriptionGrid.Rows[index].FindControl("ViewID") as Label;
            IDPrescription.Text = label.Text;
            DetailsView6.Visible = true;
            AddPrescriptionButton.Visible = false;
            AddPrescriptionDiv.Visible = false;
            ViewState["AddPrescription"] = "false";
        }

        protected void Remove_Prescription(object sender, EventArgs e)
        {
            IDPrescription.Text = "";
            DetailsView6.Visible = false;
            AddPrescriptionButton.Visible = true;
        }

        protected void AddPrescription_Click(object sender, EventArgs e)
        {
            AddPrescriptionDiv.Visible = true;
            ViewState["AddPrescription"] = "true";
            PrescriptionDetailDiv.Visible = false;
        }

        protected void ClosePrescriptionAdd_Click(object sender, EventArgs e)
        {
            AddPrescriptionDiv.Visible = false;
            ViewState["AddPrescription"] = "false";
        }

        protected void Prescription_Detail(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            int index = gvRow.RowIndex;
            Label label = AddPrescriptionGrid.Rows[index].FindControl("ViewID") as Label;
            PrescriptionDetailID1.Text = label.Text;
            PrescriptionDetailDiv.Visible = true;
        }

        protected void LinqDataSourcePre10_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {

            DataBaseAllDataContext dataAll = new DataBaseAllDataContext();
            IEnumerable<PrescriptionDetail> Drug = from p in dataAll.PrescriptionDetails
                                                   where p.PrescripID == Convert.ToInt32(PrescriptionDetailID1.Text)
                                                   select p;
            e.Result = Drug;
        }



        protected void AddLabOrderToData_Click(object sender, EventArgs e)
        {
            AddLabDiv.Visible = false;
            int iddoctor = Convert.ToInt32(DoctorNameLab.Text);
            DateTime dat = DateTime.Parse(DateLab.Text);
            var drug = new LabOrder() { DoctorID = iddoctor, Date = dat };
            DataBaseAllDataContext dataAll = new DataBaseAllDataContext();
            dataAll.LabOrders.InsertOnSubmit(drug);
            dataAll.SubmitChanges();
            AddLabOrderGrid.DataBind();
        }

        protected void AddLabOrderAdd_Click(object sender, EventArgs e)
        {
            AddLabDiv.Visible = true;
        }

        
        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] getDoctorIDList(string prefixText)
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

        protected void AddPreToData_Click(object sender, EventArgs e)
        {
            PreAddnew.Visible = false;
            int iddoctor = Convert.ToInt32(DoctorIDpre.Text);
            DateTime dat = DateTime.Parse(datePro.Text);
            var drug = new Prescription() { DoctorID = iddoctor, Date = dat };
            DataBaseAllDataContext dataAll = new DataBaseAllDataContext();
            dataAll.Prescriptions.InsertOnSubmit(drug);
            dataAll.SubmitChanges();
            AddPrescriptionGrid.DataBind();
        }

        protected void AddPredd_Click(object sender, EventArgs e)
        {
            PreAddnew.Visible = true;
        }


       
    }
}