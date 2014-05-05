<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Prescription.aspx.cs" Inherits="Assignment2_T.Prescription1" %>

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



            <%-- <asp:Button ID="Search" runat="server" Text="Search" Style="position: relative; top: 3px; left: 82px;" OnClick="Search_Click" />--%>
            <h2 class="text-success">Prescription Content :&nbsp;&nbsp; 
                <asp:Button ID="ChangeContent" runat="server" Text="Prescription Detail" CssClass="btn btn-large btn-primary" OnClick="ChangeContent_Click" />
            </h2>

            <div runat="server" id="DrugCotent" class="divwell" style="display: inline-block; overflow: hidden; padding-bottom: 30px; padding-top: 10px; padding-right: 30px;">

                <div id="SearchDiv" class="divwell">
                    <asp:Button ID="AddDrugButton" runat="server" Text="Add Prescription Detail"
                        CssClass="btn btn-warning" OnClick="AddDrugButton_Click" ValidateRequestMode="Disabled" />

                    <asp:DropDownList ID="DropSearch" runat="server" CssClass="centerpadding" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:TextBox ID="SearchText" runat="server" CssClass="centerpadding"></asp:TextBox>
                    <asp:AutoCompleteExtender ID="AutoCompleteExtender" runat="server"
                        Enabled="true" TargetControlID="SearchText" ServiceMethod="getAutoList"
                        MinimumPrefixLength="1" CompletionInterval="10"
                        EnableCaching="true" CompletionSetCount="12">
                    </asp:AutoCompleteExtender>

                    <asp:Button ID="ActiveSearch" runat="server" Text="Search...." OnClick="ActiveSearch_Click" CssClass="centerpadding" />
                </div>
                <div id="AddDrugDiv">



                    <asp:Table ID="TableAddDrug" runat="server" GridLines="Both" Height="55px" Width="612px" CssClass="table table-bordered">

                        <asp:TableRow ID="TableRow1" runat="server">
                            <asp:TableHeaderCell>PrescripID </asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="PresID" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="PresID" ValidationGroup="group1"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                                <asp:AutoCompleteExtender ID="AutoCompleteExtender2" Enabled="true"
                                    TargetControlID="PresID" ServiceMethod="getPreIDlist"
                                    MinimumPrefixLength="1" CompletionInterval="10"
                                    EnableCaching="true" CompletionSetCount="12"
                                    runat="server">
                                </asp:AutoCompleteExtender>
                            </asp:TableHeaderCell>
                        </asp:TableRow>

                        <asp:TableRow ID="TableRow2" runat="server">
                            <asp:TableHeaderCell>Drug ID </asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="DrugID" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="DrugID" ValidationGroup="group1"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                                <asp:AutoCompleteExtender ID="AutoCompleteExtender3" Enabled="true"
                                    TargetControlID="DrugID" ServiceMethod="getDrugIDlist"
                                    MinimumPrefixLength="1" CompletionInterval="10"
                                    EnableCaching="true" CompletionSetCount="12"
                                    runat="server">
                                </asp:AutoCompleteExtender>
                            </asp:TableHeaderCell>
                        </asp:TableRow>

                        <asp:TableRow ID="TableRow3" runat="server">
                            <asp:TableHeaderCell>Quantity </asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="Quantity" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="Quantity" ValidationGroup="group1"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                    ErrorMessage="Number only !!"
                                    ControlToValidate="Quantity"
                                    ValidationGroup="group1" ValidationExpression="^\d+$">
                                </asp:RegularExpressionValidator>
                            </asp:TableHeaderCell>
                        </asp:TableRow>

                        <asp:TableRow ID="TableRow4" runat="server">
                            <asp:TableHeaderCell>Dose </asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="Dose" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="Dose" ValidationGroup="group1"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                    ErrorMessage="Number only !!"
                                    ControlToValidate="Dose"
                                    ValidationGroup="group1" ValidationExpression="^\d+$">
                                </asp:RegularExpressionValidator>
                            </asp:TableHeaderCell>
                        </asp:TableRow>


                        <asp:TableRow ID="TableRow5" runat="server">
                            <asp:TableHeaderCell>Instruction </asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="Instruction" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ControlToValidate="Instruction" ValidationGroup="group1"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                            </asp:TableHeaderCell>
                        </asp:TableRow>


                        <asp:TableRow ID="TableRow6" runat="server">
                            <asp:TableCell> </asp:TableCell>
                            <asp:TableHeaderCell>
                                <asp:Button ID="AddNewDrug" runat="server" ValidationGroup="group1" CausesValidation="true" Text="Add Prescription Detail To Database" OnClick="AddNewDrug_Click" />
                            </asp:TableHeaderCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>

                <br />
                <%--<asp:Updatepanel id="updatepanel1" runat="server">
        <contenttemplate>--%>


                <asp:GridView ID="GridDrug" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID"
                    DataSourceID="LinqDataSourceDrug" ForeColor="#333333" Style="margin-left: 0px; margin-bottom: 0px;" OnSelectedIndexChanged="GridDrug_SelectedIndexChanged" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-info" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" CssClass="btn btn-info" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-info" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" CssClass="btn btn-info" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton3" CssClass="btn btn-info" runat="server" CausesValidation="False" OnClick="Detail_Click" Text="View"></asp:LinkButton>

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
                        <asp:BoundField DataField="PrescripID" HeaderText="PrescripID" SortExpression="PrescripID" />
                        <asp:BoundField DataField="DrugID" HeaderText="DrugID" SortExpression="DrugID" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        <asp:BoundField DataField="Dose" HeaderText="Dose" SortExpression="Dose" />
                        <asp:BoundField DataField="Instruction" HeaderText="Instruction" SortExpression="Instruction" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" BorderColor="Yellow" BorderWidth="1px" />
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

                <asp:LinqDataSource ID="LinqDataSourceDrug" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext"
                    EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="PrescriptionDetails" OnSelecting="LinqDataSourceDrug_Selecting">
                </asp:LinqDataSource>
            </div>

            <div runat="server" id="DetalItem" class="divwell"
                style="display: inline-block; overflow: hidden; position: fixed; right: 0; top: 70px; padding-top: 20px; padding-left: 20px; padding-bottom: 20px;">
                <asp:FormView ID="FormView1" runat="server" DataSourceID="LinqDataSource2">
                    <EditItemTemplate>
                        ID:
                        <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                        <br />
                        PrescripID:
                        <asp:TextBox ID="PrescripIDTextBox" runat="server" Text='<%# Bind("PrescripID") %>' />
                        <br />
                        DrugID:
                        <asp:TextBox ID="DrugIDTextBox" runat="server" Text='<%# Bind("DrugID") %>' />
                        <br />
                        Quantity:
                        <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                        <br />
                        Dose:
                        <asp:TextBox ID="DoseTextBox" runat="server" Text='<%# Bind("Dose") %>' />
                        <br />
                        Instruction:
                        <asp:TextBox ID="InstructionTextBox" runat="server" Text='<%# Bind("Instruction") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        ID:
                        <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                        <br />
                        PrescripID:
                        <asp:TextBox ID="PrescripIDTextBox" runat="server" Text='<%# Bind("PrescripID") %>' />
                        <br />
                        DrugID:
                        <asp:TextBox ID="DrugIDTextBox" runat="server" Text='<%# Bind("DrugID") %>' />
                        <br />
                        Quantity:
                        <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                        <br />
                        Dose:
                        <asp:TextBox ID="DoseTextBox" runat="server" Text='<%# Bind("Dose") %>' />
                        <br />
                        Instruction:
                        <asp:TextBox ID="InstructionTextBox" runat="server" Text='<%# Bind("Instruction") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        ID:
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Bind("ID") %>' />
                        <br />
                        PrescripID:
                        <asp:Label ID="PrescripIDLabel" runat="server" Text='<%# Bind("PrescripID") %>' />
                        <br />
                        DrugID:
                        <asp:Label ID="DrugIDLabel" runat="server" Text='<%# Bind("DrugID") %>' />
                        <br />
                        Quantity:
                        <asp:Label ID="QuantityLabel" runat="server" Text='<%# Bind("Quantity") %>' />
                        <br />
                        Dose:
                        <asp:Label ID="DoseLabel" runat="server" Text='<%# Bind("Dose") %>' />
                        <br />
                        Instruction:
                        <asp:Label ID="InstructionLabel" runat="server" Text='<%# Bind("Instruction") %>' />
                        <br />
                    </ItemTemplate>
                </asp:FormView>
                

                <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext" EntityTypeName="" Select="new (ID, PrescripID, DrugID, Quantity, Dose, Instruction)" TableName="PrescriptionDetails" Where="ID == @ID">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="IDtext" Name="ID" PropertyName="Text" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
                

                <asp:Label ID="IDtext" runat="server" Text="Label" CssClass="hidden"></asp:Label>
                <asp:Button ID="CloseViewDetail" runat="server" Text="Close" OnClick="CloseViewDetail_Click" CssClass="btn btn-info" />


            </div>

            <%--Drug Group Contetn--%>
            <div runat="server" id="DrugCotentG" class="divwell" style="display: inline-block; overflow: hidden; padding-bottom: 30px; padding-top: 10px; padding-right: 30px;">

                <div id="SearchDivG" class="divwell">
                    <asp:Button ID="AddDrugButtonG" runat="server" Text="Add Prescripton"
                        CssClass="btn btn-warning" OnClick="AddDrugButton_ClickG" ValidateRequestMode="Disabled" />

                    <asp:DropDownList ID="DropSearchG" runat="server" CssClass="centerpadding" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:TextBox ID="SearchTextG" runat="server" CssClass="centerpadding"></asp:TextBox>
                    <asp:AutoCompleteExtender ID="AutoCompleteExtenderG" runat="server"
                        Enabled="true" TargetControlID="SearchTextG" ServiceMethod="getAutoListG"
                        MinimumPrefixLength="1" CompletionInterval="10"
                        EnableCaching="true" CompletionSetCount="12">
                    </asp:AutoCompleteExtender>


                    <asp:Button ID="ActiveSearchG" runat="server" Text="Search...." OnClick="ActiveSearch_ClickG" CssClass="centerpadding" />
                </div>
                <div id="AddDrugDivG">
                    <asp:Table ID="TableAddDrugG" runat="server" GridLines="Both" Height="55px" Width="612px" CssClass="table table-bordered">

                        <asp:TableRow ID="TableRow8" runat="server">
                            <asp:TableHeaderCell>DoctorID </asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="DoctorID" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                    ControlToValidate="DoctorID" ValidationGroup="group1G"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                                <asp:AutoCompleteExtender ID="AutoCompleteExtender1" Enabled="true"
                                    TargetControlID="DoctorID" ServiceMethod="getGroupIDlist"
                                    MinimumPrefixLength="1" CompletionInterval="10"
                                    EnableCaching="true" CompletionSetCount="12"
                                    runat="server">
                                </asp:AutoCompleteExtender>
                            </asp:TableHeaderCell>
                        </asp:TableRow>

                         <asp:TableRow ID="TableRow7" runat="server">
                            <asp:TableHeaderCell>Date </asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="date" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                    ControlToValidate="date" ValidationGroup="group1G"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                                <asp:Calendar ID="Calendar" runat="server" OnSelectionChanged="Calendar_SelectionChanged"></asp:Calendar>
                            </asp:TableHeaderCell>
                        </asp:TableRow>


                        <asp:TableRow ID="TableRow5G" runat="server">
                            <asp:TableCell> </asp:TableCell>
                            <asp:TableHeaderCell>
                                <asp:Button ID="AddNewDrugG" runat="server" ValidationGroup="group1G" CausesValidation="true" Text="Add Drug Group To Database" OnClick="AddNewDrug_ClickG" />
                            </asp:TableHeaderCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>


                <asp:GridView ID="GridDrugG" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource1" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="486px" DataKeyNames="ID">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-info"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-info"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-info"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-info"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" InsertVisible="False" />
                        <asp:BoundField DataField="DoctorID" HeaderText="DoctorID" SortExpression="DoctorID" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
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
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext"
                     EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" 
                    TableName="Prescriptions" OnSelecting="LinqDataSourceDrug_SelectingG">
                </asp:LinqDataSource>


            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
