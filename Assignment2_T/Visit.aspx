<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Visit.aspx.cs" Inherits="Assignment2_T.Visit1" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>

    <br />
    <asp:UpdateProgress ID="updateProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
        <ProgressTemplate>
            <div style="width: 50%; height: 50%; text-align: center;">
                <img src="Photo/loading1.gif" alt="Loading" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <h2 class="text-success">Visit Content :</h2>


            <div runat="server" id="DrugCotent" class="divwell" style="display: inline-block; overflow: hidden; padding-bottom: 30px; padding-top: 10px; padding-right: 30px;">



                <div id="SearchDiv" class="divwell">
                    <asp:Button ID="AddDrugButton" runat="server" Text="Insert Visit"
                        CssClass="btn btn-warning" OnClick="AddDrugButton_Click" ValidateRequestMode="Disabled" />

                    <%-- <asp:DropDownList ID="DropSearch" runat="server" CssClass="centerpadding" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:TextBox ID="SearchText" runat="server" CssClass="centerpadding"></asp:TextBox>--%>
                    <%-- <asp:AutoCompleteExtender ID="AutoCompleteExtender" runat="server"
                        Enabled="true" TargetControlID="SearchText" ServiceMethod="getAutoList"
                        MinimumPrefixLength="1" CompletionInterval="10"
                        EnableCaching="true" CompletionSetCount="12">
                    </asp:AutoCompleteExtender>--%>

                    <asp:TextBox ID="SearchHos" runat="server" CssClass="centerpadding" placeholder="Hospital Name"></asp:TextBox>
                    <asp:TextBox ID="SearchPat" runat="server" CssClass="centerpadding" placeholder="Patient Name"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="SearchDoc" runat="server" CssClass="centerpadding" placeholder="Doctor Name"></asp:TextBox>
                    <asp:TextBox ID="SearchICDtext" runat="server" CssClass="centerpadding" placeholder="ICD Name"></asp:TextBox>
                    <asp:TextBox ID="SearchID" runat="server" CssClass="centerpadding" placeholder="ID"></asp:TextBox>
                    <asp:AutoCompleteExtender ID="AutoCompleteExtender" runat="server"
                        Enabled="true" TargetControlID="SearchHos" ServiceMethod="getAutoListHos1"
                        MinimumPrefixLength="1" CompletionInterval="10"
                        EnableCaching="true" CompletionSetCount="12">
                    </asp:AutoCompleteExtender>
                    <asp:AutoCompleteExtender ID="AutoCompleteExtender6" runat="server"
                        Enabled="true" TargetControlID="SearchPat" ServiceMethod="getAutoListPat"
                        MinimumPrefixLength="1" CompletionInterval="10"
                        EnableCaching="true" CompletionSetCount="12">
                    </asp:AutoCompleteExtender>
                    <asp:AutoCompleteExtender ID="AutoCompleteExtender7" runat="server"
                        Enabled="true" TargetControlID="SearchDoc" ServiceMethod="getAutoListDoc"
                        MinimumPrefixLength="1" CompletionInterval="10"
                        EnableCaching="true" CompletionSetCount="12">
                    </asp:AutoCompleteExtender>
                    <asp:AutoCompleteExtender ID="AutoCompleteExtender8" runat="server"
                        Enabled="true" TargetControlID="SearchICDtext" ServiceMethod="getAutoListICD"
                        MinimumPrefixLength="1" CompletionInterval="10"
                        EnableCaching="true" CompletionSetCount="12">
                    </asp:AutoCompleteExtender>
                    <asp:AutoCompleteExtender ID="AutoCompleteExtender9" runat="server"
                        Enabled="true" TargetControlID="SearchID" ServiceMethod="getAutoListID"
                        MinimumPrefixLength="1" CompletionInterval="10"
                        EnableCaching="true" CompletionSetCount="12">
                    </asp:AutoCompleteExtender>
                    <asp:Button ID="ActiveSearch" runat="server" Text="Search...." OnClick="ActiveSearch_Click" CssClass="centerpadding btn btn-info" />
                </div>


                <div id="AddDrugDiv">


                    <asp:Table ID="TableAddDrug" runat="server" GridLines="Both" Height="55px" Width="612px" CssClass="table table-bordered">

                        <asp:TableRow ID="TableRow1" runat="server" CssClass=".info">
                            <asp:TableHeaderCell>Hospital</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:Button ID="AddHospitalButton" runat="server" CssClass="btn btn-info" Text="Add Hospital"
                                    OnClick="AddHospital_Click" />
                                <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="LinqDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                                    <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                                    <Fields>
                                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                                        <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                                        <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="True" SortExpression="Address" />
                                        <asp:BoundField DataField="License" HeaderText="License" ReadOnly="True" SortExpression="License" />

                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton3" OnClick="Remove_Hospital" CssClass="btn btn-info" runat="server" CausesValidation="False" Text="Remove"></asp:LinkButton>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                    </Fields>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                </asp:DetailsView>

                                <asp:TextBox ID="IDHospital" runat="server" CssClass="hidden" Text=""></asp:TextBox>

                                <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext" EntityTypeName="" Select="new (ID, Name, Address, License)" TableName="Hospitals" Where="ID == @ID">
                                    <WhereParameters>
                                        <asp:ControlParameter ControlID="IDHospital" Name="ID" PropertyName="Text" Type="Int32" />
                                    </WhereParameters>
                                </asp:LinqDataSource>

                                <div runat="server" id="AddHospitalDiv" class="divwell" style="display: inline-block; overflow: hidden; position: fixed; right: 0; top: 70px; padding-top: 20px; padding-left: 20px; padding-bottom: 20px;">
                                    <asp:TextBox ID="SearchHospital" runat="server" CssClass="centerpadding" placeholder="Hospital Name"></asp:TextBox>
                                    <asp:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server"
                                        Enabled="true" TargetControlID="SearchHospital" ServiceMethod="getHospitalList"
                                        MinimumPrefixLength="1" CompletionInterval="10"
                                        EnableCaching="true" CompletionSetCount="12">
                                    </asp:AutoCompleteExtender>
                                    <asp:Button ID="SearchHosBut" runat="server" Text="Find result" OnClick="ActiveSearchHospital_Click" CssClass="centerpadding" />

                                    <asp:GridView ID="AddHospitalGrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        DataSourceID="LinqDataSource2" ForeColor="#333333" GridLines="None"
                                        AllowPaging="True" AllowSorting="True">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID" SortExpression="ID">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="ViewID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                                            <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="True" SortExpression="Address" />
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton3" OnClick="Hospital_Select" CssClass="btn btn-info" runat="server" CausesValidation="False" Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>

                                    <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext"
                                        OnSelecting="LinqDataSource2_Selecting" EntityTypeName="" Select="new (ID, Name, Address)" TableName="Hospitals">
                                    </asp:LinqDataSource>

                                    <asp:Button ID="CloseHospitalAdd" runat="server" Text="Close" CssClass="btn btn-danger" OnClick="CloseHospitalAdd_Click" />

                                </div>
                            </asp:TableHeaderCell>

                        </asp:TableRow>
                        <asp:TableRow ID="TableRow2" runat="server">
                            <asp:TableHeaderCell>Doctor</asp:TableHeaderCell>
                            <asp:TableHeaderCell>

                                <asp:Button ID="AddDoctorButton" runat="server" CssClass="btn btn-info" Text="Add Doctor"
                                    OnClick="AddDoctor_Click" />
                                <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="LinqDataSource4" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                                    <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                                    <Fields>
                                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                                        <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                                        <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="True" SortExpression="Address" />
                                        <asp:BoundField DataField="License" HeaderText="License" ReadOnly="True" SortExpression="License" />
                                        <asp:BoundField DataField="DoB" HeaderText="DoB" ReadOnly="True" SortExpression="DoB" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton3" OnClick="Remove_Doctor" CssClass="btn btn-info" runat="server" CausesValidation="False" Text="Remove"></asp:LinkButton>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                    </Fields>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                </asp:DetailsView>

                                <asp:TextBox ID="IDDoctor" runat="server" CssClass="hidden" Text=""></asp:TextBox>

                                <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext" EntityTypeName="" Select="new (ID, Name, Address, License, DoB)" TableName="Doctors" Where="ID == @ID">
                                    <WhereParameters>
                                        <asp:ControlParameter ControlID="IDDoctor" Name="ID" PropertyName="Text" Type="Int32" />
                                    </WhereParameters>
                                </asp:LinqDataSource>

                                <div runat="server" id="AddDoctorDiv" class="divwell" style="display: inline-block; overflow: hidden; position: fixed; right: 0; top: 70px; padding-top: 20px; padding-left: 20px; padding-bottom: 20px;">
                                    <asp:TextBox ID="SearchDoctor" runat="server" CssClass="centerpadding" placeholder="Doctor Name"></asp:TextBox>
                                    <asp:AutoCompleteExtender ID="AutoCompleteExtender12" runat="server"
                                        Enabled="true" TargetControlID="SearchDoctor" ServiceMethod="getDoctorList"
                                        MinimumPrefixLength="1" CompletionInterval="10"
                                        EnableCaching="true" CompletionSetCount="12">
                                    </asp:AutoCompleteExtender>
                                    <asp:Button ID="SearchDocBut" runat="server" Text="Find result" OnClick="ActiveSearchDoctor_Click" CssClass="centerpadding" />

                                    <asp:GridView ID="AddDoctorGrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        DataSourceID="LinqDataSource22" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID" SortExpression="ID">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="ViewID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                                            <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="True" SortExpression="Address" />
                                            <asp:BoundField DataField="License" HeaderText="License" ReadOnly="True" SortExpression="License" />
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton3" OnClick="Doctor_Select" CssClass="btn btn-info" runat="server" CausesValidation="False" Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>

                                    <asp:LinqDataSource ID="LinqDataSource22" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext"
                                        OnSelecting="LinqDataSource22_Selecting" EntityTypeName="" Select="new (ID, Name, Address, License)" TableName="Doctors">
                                    </asp:LinqDataSource>

                                    <asp:Button ID="CloseDoctorAdd" runat="server" Text="Close" CssClass="btn btn-danger" OnClick="CloseDoctorAdd_Click" />

                                </div>

                            </asp:TableHeaderCell>

                        </asp:TableRow>
                        <asp:TableRow ID="TableRow3" runat="server">
                            <asp:TableHeaderCell>Patient</asp:TableHeaderCell>
                            <asp:TableHeaderCell>

                                <asp:Button ID="AddPatientButton" runat="server" CssClass="btn btn-info" Text="Add Patient"
                                    OnClick="AddPatient_Click" />
                                <asp:DetailsView ID="DetailsView3" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="LinqDataSource5" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                                    <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                                    <Fields>
                                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                                        <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                                        <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="True" SortExpression="Address" />
                                        <asp:BoundField DataField="DoB" HeaderText="DoB" ReadOnly="True" SortExpression="DoB" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton3" OnClick="Remove_Patient" CssClass="btn btn-info" runat="server" CausesValidation="False" Text="Remove"></asp:LinkButton>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                    </Fields>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                </asp:DetailsView>

                                <asp:TextBox ID="IDPatient" runat="server" CssClass="hidden" Text=""></asp:TextBox>

                                <asp:LinqDataSource ID="LinqDataSource5" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext"
                                    EntityTypeName="" Select="new (ID, Name, Address, DoB)" TableName="Patients" Where="ID == @ID">
                                    <WhereParameters>
                                        <asp:ControlParameter ControlID="IDPatient" Name="ID" PropertyName="Text" Type="Int32" />
                                    </WhereParameters>
                                </asp:LinqDataSource>

                                <div runat="server" id="AddPatientDiv" class="divwell" style="display: inline-block; overflow: hidden; position: fixed; right: 0; top: 70px; padding-top: 20px; padding-left: 20px; padding-bottom: 20px;">
                                    <asp:TextBox ID="SearchPatient" runat="server" CssClass="centerpadding" placeholder="Patient Name"></asp:TextBox>
                                    <asp:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server"
                                        Enabled="true" TargetControlID="SearchPatient" ServiceMethod="getPatientList"
                                        MinimumPrefixLength="1" CompletionInterval="10"
                                        EnableCaching="true" CompletionSetCount="12">
                                    </asp:AutoCompleteExtender>
                                    <asp:Button ID="SearchPatBut" runat="server" Text="Find result" OnClick="ActiveSearchPatient_Click" CssClass="centerpadding" />

                                    <asp:GridView ID="AddPatientGrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        DataSourceID="LinqDataSource23" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID" SortExpression="ID">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="ViewID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                                            <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="True" SortExpression="Address" />
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton3" OnClick="Patient_Select" CssClass="btn btn-info" runat="server" CausesValidation="False" Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>

                                    <asp:LinqDataSource ID="LinqDataSource23" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext"
                                        OnSelecting="LinqDataSource23_Selecting" EntityTypeName="" Select="new (ID, Name, Address)" TableName="Patients">
                                    </asp:LinqDataSource>

                                    <asp:Button ID="ClosePatientAdd" runat="server" Text="Close" CssClass="btn btn-danger" OnClick="ClosePatientAdd_Click" />

                                </div>

                            </asp:TableHeaderCell>
                        </asp:TableRow>

                        <asp:TableRow ID="TableRow4" runat="server">
                            <asp:TableHeaderCell>Date</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="Price" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="Price" ValidationGroup="group1"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                                <asp:Calendar ID="Calendar" runat="server" OnSelectionChanged="Calendar_SelectionChanged"></asp:Calendar>
                            </asp:TableHeaderCell>
                        </asp:TableRow>

                        <asp:TableRow ID="TableRow7" runat="server">
                            <asp:TableHeaderCell>ICD</asp:TableHeaderCell>

                            <asp:TableHeaderCell>
                                <asp:Button ID="AddICDButton" runat="server" CssClass="btn btn-info" Text="Add ICD"
                                    OnClick="AddICD_Click" />
                                <asp:DetailsView ID="DetailsView4" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="LinqDataSource6" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                                    <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                                    <Fields>
                                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                                        <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                                        <asp:BoundField DataField="Code" HeaderText="Code" ReadOnly="True" SortExpression="Code" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton3" OnClick="Remove_ICD" CssClass="btn btn-info" runat="server" CausesValidation="False" Text="Remove"></asp:LinkButton>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                    </Fields>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                </asp:DetailsView>

                                <asp:TextBox ID="IDICD" runat="server" CssClass="hidden" Text=""></asp:TextBox>

                                <asp:LinqDataSource ID="LinqDataSource6" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext" EntityTypeName="" Select="new (ID, Name, Code)" TableName="ICDs" Where="ID == @ID">
                                    <WhereParameters>
                                        <asp:ControlParameter ControlID="IDICD" Name="ID" PropertyName="Text" Type="Int32" />
                                    </WhereParameters>
                                </asp:LinqDataSource>

                                <div runat="server" id="AddICDDiv" class="divwell" style="display: inline-block; overflow: hidden; position: fixed; right: 0; top: 70px; padding-top: 20px; padding-left: 20px; padding-bottom: 20px;">
                                    <asp:TextBox ID="SearchICD" runat="server" CssClass="centerpadding" placeholder="ICD Name"></asp:TextBox>
                                    <asp:AutoCompleteExtender ID="AutoCompleteExtender3" runat="server"
                                        Enabled="true" TargetControlID="SearchICD" ServiceMethod="getICDList"
                                        MinimumPrefixLength="1" CompletionInterval="10"
                                        EnableCaching="true" CompletionSetCount="12">
                                    </asp:AutoCompleteExtender>
                                    <asp:Button ID="Button1" runat="server" Text="Find result" OnClick="ActiveSearchICD_Click" CssClass="centerpadding" />

                                    <asp:GridView ID="AddICDGrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        DataSourceID="LinqDataSource7" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID" SortExpression="ID">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="ViewID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                                            <asp:BoundField DataField="Code" HeaderText="Code" ReadOnly="True" SortExpression="Code" />
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton3" OnClick="ICD_Select" CssClass="btn btn-info" runat="server" CausesValidation="False" Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>

                                    <asp:LinqDataSource ID="LinqDataSource7" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext"
                                        OnSelecting="LinqDataSource25_Selecting" EntityTypeName="" Select="new (ID, Name, Code)" TableName="ICDs">
                                    </asp:LinqDataSource>

                                    <asp:Button ID="CloseICDAdd" runat="server" Text="Close" CssClass="btn btn-danger" OnClick="CloseICDAdd_Click" />

                                </div>

                            </asp:TableHeaderCell>
                        </asp:TableRow>

                        <asp:TableRow ID="TableRow5" runat="server">
                            <asp:TableHeaderCell>Out Come</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="OutCome" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ControlToValidate="OutCome" ValidationGroup="group1"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                            </asp:TableHeaderCell>
                        </asp:TableRow>


                        <asp:TableRow ID="TableRow8" runat="server">
                            <asp:TableHeaderCell>Lab Order</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:Button ID="AddLabOrderButton" runat="server" CssClass="btn btn-info" Text="Add LabOrder"
                                    OnClick="AddLabOrder_Click" />
                                <asp:DetailsView ID="DetailsView5" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="LinqDataSource8" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                                    <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                                    <Fields>
                                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                                        <asp:BoundField DataField="DoctorID" HeaderText="DoctorID" ReadOnly="True" SortExpression="DoctorID" />
                                        <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="True" SortExpression="Date" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton3" OnClick="Remove_LabOrder" CssClass="btn btn-info" runat="server" CausesValidation="False" Text="Remove"></asp:LinkButton>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                    </Fields>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                </asp:DetailsView>

                                <asp:TextBox ID="IDLabOrder" runat="server" CssClass="hidden" Text=""></asp:TextBox>

                                <asp:LinqDataSource ID="LinqDataSource8" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext" EntityTypeName="" Select="new (ID, DoctorID, Date)" TableName="LabOrders" Where="ID == @ID">
                                    <WhereParameters>
                                        <asp:ControlParameter ControlID="IDLabOrder" Name="ID" PropertyName="Text" Type="Int32" />
                                    </WhereParameters>
                                </asp:LinqDataSource>

                                <div runat="server" id="AddLabOrderDiv" class="divwell" style="display: inline-block; overflow: hidden; position: fixed; right: 0; top: 70px; padding-top: 20px; padding-left: 20px; padding-bottom: 20px;">
                                    <asp:TextBox ID="SearchLabOrder" runat="server" CssClass="centerpadding" placeholder="LabOrder Name"></asp:TextBox>
                                    <asp:AutoCompleteExtender ID="AutoCompleteExtender4" runat="server"
                                        Enabled="true" TargetControlID="SearchLabOrder" ServiceMethod="getLabOrderList"
                                        MinimumPrefixLength="1" CompletionInterval="10"
                                        EnableCaching="true" CompletionSetCount="12">
                                    </asp:AutoCompleteExtender>
                                    <asp:Button ID="Button2" runat="server" Text="Find result" OnClick="ActiveSearchLabOrder_Click" CssClass="centerpadding" />


                                    <asp:GridView ID="AddLabOrderGrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        DataSourceID="LinqDataSource24" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID" SortExpression="ID">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="ViewID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="DoctorID" SortExpression="DoctorID">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("DoctorID") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DoctorID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="True" SortExpression="Date" />
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton6" OnClick="LabOrder_Select" CssClass="btn btn-info" runat="server" CausesValidation="False" Text="Select"></asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButton100" OnClick="LabOrder_Detail" CssClass="btn btn-info" runat="server" CausesValidation="False" Text="Details"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                    <asp:LinqDataSource ID="LinqDataSource24" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext"
                                        OnSelecting="LinqDataSource24_Selecting" EntityTypeName="" Select="new (ID, DoctorID, Date)" TableName="LabOrders">
                                    </asp:LinqDataSource>

                                    <asp:Button ID="CloseLabOrderAdd" runat="server" Text="Close" CssClass="btn btn-danger" OnClick="CloseLabOrderAdd_Click" />
                                    <asp:Button ID="AddLab" runat="server" Text="Add New Lab" CssClass="btn btn-info" OnClick="AddLabOrderAdd_Click" />

                                    <div runat="server" id="AddLabDiv" class="divwell"
                                        style="display: inline-block; overflow: hidden; position: fixed; left: 10px; top: 70px; padding-top: 20px; padding-left: 20px; padding-bottom: 20px; padding-right: 10px;">
                                        
                                       
                                        <br />
                                        <asp:TextBox ID="DoctorNameLab" runat="server" placeholder="Doctor ID"></asp:TextBox>

                                          <asp:AutoCompleteExtender ID="AutoCompleteExtender101" runat="server"
                                        Enabled="true" TargetControlID="DoctorNameLab" ServiceMethod="getDoctorIDList"
                                        MinimumPrefixLength="1" CompletionInterval="10"
                                        EnableCaching="true" CompletionSetCount="12">

                                    </asp:AutoCompleteExtender>
                                        <br />
                                        <asp:TextBox ID="DateLab" runat="server" placeholder="Date"></asp:TextBox>
                                        <br />
                                        <asp:Button ID="AddLabtoData" runat="server" Text="Add Lab" CssClass="btn btn-info" OnClick="AddLabOrderToData_Click" />


                                    </div>

                                    <div runat="server" id="LabOrderDetailDiv" class="divwell"
                                        style="display: inline-block; overflow: hidden; position: fixed; left: 0; bottom: 20px; padding-top: 20px; padding-left: 20px; padding-bottom: 20px; padding-right: 10px;">

                                        <asp:GridView ID="GridViewLabOrderDetail" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource10" AllowPaging="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                                            <Columns>
                                                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                                                <asp:BoundField DataField="Result" HeaderText="Result" ReadOnly="True" SortExpression="Result" />
                                                <asp:BoundField DataField="LabOrderID" HeaderText="LabOrderID" ReadOnly="True" SortExpression="LabOrderID" />
                                                <%-- <asp:BoundField DataField="MedicalServiceID" HeaderText="MedicalServiceID" ReadOnly="True" SortExpression="MedicalServiceID" />--%>
                                                <asp:TemplateField HeaderText="MedicalServiceID" SortExpression="MedicalServiceID">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("MedicalServiceID") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("MedicalServiceID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <FooterStyle BackColor="White" ForeColor="#333333" />
                                            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="White" ForeColor="#333333" />
                                            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                            <SortedAscendingHeaderStyle BackColor="#487575" />
                                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                            <SortedDescendingHeaderStyle BackColor="#275353" />
                                        </asp:GridView>
                                        <asp:LinqDataSource ID="LinqDataSource10" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext"
                                            OnSelecting="LinqDataSource10_Selecting" EntityTypeName="" Select="new (ID, Result, LabOrderID, MedicalServiceID)" TableName="LabOrderDetails" Where="LabOrderID == @LabOrderID">
                                            <WhereParameters>
                                                <asp:ControlParameter ControlID="LabOrderDetailID1" Name="LabOrderID" PropertyName="Text" Type="Int32" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                        <asp:Label ID="LabOrderDetailID1" CssClass="hidden" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </asp:TableHeaderCell>
                        </asp:TableRow>

                        <asp:TableRow ID="TableRow10" runat="server">
                            <asp:TableHeaderCell>Prescription</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:Button ID="AddPrescriptionButton" runat="server" CssClass="btn btn-info" Text="Add Prescription"
                                    OnClick="AddPrescription_Click" />
                                <asp:DetailsView ID="DetailsView6" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="LinqDataSource101" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                                    <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                                    <Fields>
                                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                                        <asp:BoundField DataField="DoctorID" HeaderText="DoctorID" ReadOnly="True" SortExpression="DoctorID" />
                                        <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="True" SortExpression="Date" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton3" OnClick="Remove_Prescription" CssClass="btn btn-info" runat="server" CausesValidation="False" Text="Remove"></asp:LinkButton>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                    </Fields>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                </asp:DetailsView>

                                <asp:TextBox ID="IDPrescription" runat="server" CssClass="hidden" Text=""></asp:TextBox>

                                <asp:LinqDataSource ID="LinqDataSource101" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext" EntityTypeName="" Select="new (ID, DoctorID, Date)" TableName="Prescriptions" Where="ID == @ID">
                                    <WhereParameters>
                                        <asp:ControlParameter ControlID="IDPrescription" Name="ID" PropertyName="Text" Type="Int32" />
                                    </WhereParameters>
                                </asp:LinqDataSource>

                                <div runat="server" id="AddPrescriptionDiv" class="divwell" style="display: inline-block; overflow: hidden; position: fixed; right: 0; top: 70px; padding-top: 20px; padding-left: 20px; padding-bottom: 20px;">
                                    <asp:TextBox ID="SearchPrescription" runat="server" CssClass="centerpadding" placeholder="Prescription Name"></asp:TextBox>
                                    <asp:AutoCompleteExtender ID="AutoCompleteExtender5" runat="server"
                                        Enabled="true" TargetControlID="SearchPrescription" ServiceMethod="getPrescriptionList"
                                        MinimumPrefixLength="1" CompletionInterval="10"
                                        EnableCaching="true" CompletionSetCount="12">
                                    </asp:AutoCompleteExtender>
                                    <asp:Button ID="Button3" runat="server" Text="Find result" OnClick="ActiveSearchPrescription_Click" CssClass="centerpadding" />


                                    <asp:GridView ID="AddPrescriptionGrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        DataSourceID="LinqDataSource102" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID" SortExpression="ID">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="ViewID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="DoctorID" SortExpression="DoctorID">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("DoctorID") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DoctorID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="True" SortExpression="Date" />
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton6" OnClick="Prescription_Select" CssClass="btn btn-info" runat="server" CausesValidation="False" Text="Select"></asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButton100" OnClick="Prescription_Detail" CssClass="btn btn-info" runat="server" CausesValidation="False" Text="Details"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>

                                    <asp:LinqDataSource ID="LinqDataSource102" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext"
                                        OnSelecting="LinqDataSourcePre_Selecting" EntityTypeName="" Select="new (ID, DoctorID, Date)" TableName="Prescriptions">
                                    </asp:LinqDataSource>

                                    <asp:Button ID="ClosePrescriptionAdd" runat="server" Text="Close" CssClass="btn btn-danger" OnClick="ClosePrescriptionAdd_Click" />

                                    <asp:Button ID="AddPre" runat="server" Text="Add New Pre" CssClass="btn btn-info" OnClick="AddPredd_Click" />



                                      <div runat="server" id="PreAddnew" class="divwell"
                                        style="display: inline-block; overflow: hidden; position: fixed; left: 10px; top: 70px; padding-top: 20px; padding-left: 20px; padding-bottom: 20px; padding-right: 10px;">
                                        
                                       
                                        <br />
                                        <asp:TextBox ID="DoctorIDpre" runat="server" placeholder="Doctor ID"></asp:TextBox>

                                          <asp:AutoCompleteExtender ID="AutoCompleteExtender10" runat="server"
                                        Enabled="true" TargetControlID="DoctorIDpre" ServiceMethod="getDoctorIDList"
                                        MinimumPrefixLength="1" CompletionInterval="10"
                                        EnableCaching="true" CompletionSetCount="12">

                                    </asp:AutoCompleteExtender>
                                        <br />
                                        <asp:TextBox ID="datePro" runat="server" placeholder="Date"></asp:TextBox>
                                        <br />
                                        <asp:Button ID="AddpretoData" runat="server" Text="Add Pre" CssClass="btn btn-info" OnClick="AddPreToData_Click" />


                                    </div>

                                    <div runat="server" id="PrescriptionDetailDiv" class="divwell"
                                        style="display: inline-block; overflow: hidden; position: fixed; left: 0; bottom: 20px; padding-top: 20px; padding-left: 20px; padding-bottom: 20px; padding-right: 10px;">

                                        <asp:GridView ID="GridViewPrescriptionDetail" runat="server" DataSourceID="LinqDataSource232" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                            <Columns>
                                                <asp:TemplateField HeaderText="ID" SortExpression="ID">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="DrugID" HeaderText="DrugID" ReadOnly="True" SortExpression="DrugID" />
                                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" ReadOnly="True" SortExpression="Quantity" />
                                                <asp:BoundField DataField="Dose" HeaderText="Dose" ReadOnly="True" SortExpression="Dose" />
                                                <asp:BoundField DataField="Instruction" HeaderText="Instruction" ReadOnly="True" SortExpression="Instruction" />
                                            </Columns>
                                            <FooterStyle BackColor="White" ForeColor="#000066" />
                                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                            <RowStyle ForeColor="#000066" />
                                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                                        </asp:GridView>
                                        <asp:Label ID="PrescriptionDetailID1" CssClass="hidden" runat="server" Text="4"></asp:Label>

                                        <asp:LinqDataSource ID="LinqDataSource232" runat="server" EntityTypeName="" ContextTypeName="Assignment2_T.DataBaseAllDataContext" Select="new (ID, DrugID, Quantity, Dose, Instruction)" TableName="PrescriptionDetails" Where="PrescripID == @PrescripID">
                                            <WhereParameters>
                                                <asp:ControlParameter ControlID="PrescriptionDetailID1" Name="PrescripID" PropertyName="Text" Type="Int32" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                    </div>
                                </div>

                            </asp:TableHeaderCell>
                        </asp:TableRow>
                        <asp:TableRow ID="TableRow6" runat="server">
                            <asp:TableCell> </asp:TableCell>
                            <asp:TableHeaderCell>
                                <asp:Button ID="AddNewDrug" runat="server" ValidationGroup="group1" CausesValidation="true" Text="Add Visit To Database" OnClick="AddNewDrug_Click" />
                                <asp:Button ID="Cancel" runat="server" CausesValidation="true" Text="Cancel" OnClick="ClearRecord" />

                            </asp:TableHeaderCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>

                <br />
                <%--<asp:Updatepanel id="updatepanel1" runat="server">
        <contenttemplate>--%>
                <asp:GridView ID="GridDrug" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                    CellPadding="4" DataKeyNames="ID" DataSourceID="LinqDataSource" ForeColor="#333333"
                    GridLines="None">

                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-info" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="ViewID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date" SortExpression="Date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="ViewDate" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="HospitalID" SortExpression="HospitalID">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("HospitalID") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="ViewHospitalID" runat="server" CssClass="hidden" Text='<%# Bind("HospitalID") %>'></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Hospital.Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DoctorID" SortExpression="DoctorID">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("DoctorID") %>'></asp:TextBox>

                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="ViewDoctorID" runat="server" CssClass="hidden" Text='<%# Bind("DoctorID") %>'></asp:Label>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Doctor.Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PatientID" SortExpression="PatientID">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("PatientID") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="ViewPatientID" runat="server" CssClass="hidden" Text='<%# Bind("PatientID") %>'></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Patient.Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ICDID" SortExpression="ICDID">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ICDID") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="ViewICDID" runat="server" CssClass="hidden" Text='<%# Bind("ICDID") %>'></asp:Label>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("ICD.Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PrescripID" SortExpression="PrescripID">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("PrescripID") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="ViewPreID" runat="server" Text='<%# Bind("PrescripID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LabID" SortExpression="LabID">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("LabID") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="ViewLabID" runat="server" Text='<%# Bind("LabID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Outcome" SortExpression="Outcome">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Outcome") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="ViewOutcome" runat="server" Text='<%# Bind("Outcome") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="SeeDetailItem" CssClass="btn btn-info" runat="server"
                                    CausesValidation="False" OnClick="SeeDetailItem_Click" Text="Details"></asp:LinkButton>

                            </ItemTemplate>

                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />

                </asp:GridView>
                <asp:TextBox ID="IDEdit" runat="server" CssClass="hidden"></asp:TextBox>

                <asp:LinqDataSource ID="LinqDataSource" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="Visits" OnSelecting="LinqDataSourceDrug_Selecting">
                </asp:LinqDataSource>

            </div>







        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
