<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Doctor.aspx.cs" Inherits="Assignment2_T.Doctor1" %>

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
            <h2 class="text-success">Doctor Content :</h2>


            <div runat="server" id="DrugCotent" class="divwell" style="display: inline-block; overflow: hidden; padding-bottom: 30px; padding-top: 10px; padding-right: 30px;">

                <div id="SearchDiv" class="divwell">
                    <asp:Button ID="AddDrugButton" runat="server" Text="Add Doctor"
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
                        <asp:TableRow ID="TableRow1" runat="server" CssClass=".info">
                            <asp:TableHeaderCell>Doctor Name</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="DrugName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="DrugName" ValidationGroup="group1"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                            </asp:TableHeaderCell>

                        </asp:TableRow>
                        <asp:TableRow ID="TableRow2" runat="server">
                            <asp:TableHeaderCell>Gender</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:DropDownList ID="GenderDrop" runat="server">
                                    <asp:ListItem Text="Male" Value="1" />
                                    <asp:ListItem Text="Female" Value="2" />
                                </asp:DropDownList>
                            </asp:TableHeaderCell>

                        </asp:TableRow>
                        <asp:TableRow ID="TableRow3" runat="server">
                            <asp:TableHeaderCell>Address</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="Unit" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="Unit" ValidationGroup="group1"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                            </asp:TableHeaderCell>
                        </asp:TableRow>

                        <asp:TableRow ID="TableRow4" runat="server">
                            <asp:TableHeaderCell>Date of Birth</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="Price" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="Price" ValidationGroup="group1"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                                <asp:Calendar ID="Calendar" runat="server" OnSelectionChanged="Calendar_SelectionChanged"></asp:Calendar>
                            </asp:TableHeaderCell>
                        </asp:TableRow>

                        <asp:TableRow ID="TableRow5" runat="server">
                            <asp:TableHeaderCell>License</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="GroupID" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ControlToValidate="GroupID" ValidationGroup="group1"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>

                            </asp:TableHeaderCell>

                        </asp:TableRow>
                        <asp:TableRow ID="TableRow6" runat="server">
                            <asp:TableCell> </asp:TableCell>
                            <asp:TableHeaderCell>
                                <asp:Button ID="AddNewDrug" runat="server" ValidationGroup="group1" CausesValidation="true" Text="Add Doctor To Database" OnClick="AddNewDrug_Click" />
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
                                <asp:Label ID="EditId" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="ViewId" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                        <asp:BoundField DataField="DoB" HeaderText="DoB" SortExpression="DoB" />
                        <asp:BoundField DataField="License" HeaderText="License" SortExpression="License" />
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


                <asp:LinqDataSource ID="LinqDataSource" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="Doctors" OnSelecting="LinqDataSourceDrug_Selecting">
                </asp:LinqDataSource>

            </div>

            <div runat="server" id="DetalItem" class="divwell"
                style="display: inline-block; overflow: hidden; position: fixed; right: 0; top: 70px; padding-top: 20px; padding-left: 20px; padding-bottom: 20px;">

                <asp:FormView ID="DetailForm" runat="server" DataSourceID="LinqDataSource1">
                    <EditItemTemplate>
                        ID:
                        <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                        <br />
                        Name:
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                        <br />
                        Address:
                        <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                        <br />
                        Gender:
                        <asp:TextBox ID="GenderTextBox" runat="server" Text='<%# Bind("Gender") %>' />
                        <br />
                        DoB:
                        <asp:TextBox ID="DoBTextBox" runat="server" Text='<%# Bind("DoB") %>' />
                        <br />
                        License:
                        <asp:TextBox ID="LicenseTextBox" runat="server" Text='<%# Bind("License") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        ID:
                        <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                        <br />
                        Name:
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                        <br />
                        Address:
                        <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                        <br />
                        Gender:
                        <asp:TextBox ID="GenderTextBox" runat="server" Text='<%# Bind("Gender") %>' />
                        <br />
                        DoB:
                        <asp:TextBox ID="DoBTextBox" runat="server" Text='<%# Bind("DoB") %>' />
                        <br />
                        License:
                        <asp:TextBox ID="LicenseTextBox" runat="server" Text='<%# Bind("License") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        ID:
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Bind("ID") %>' />
                        <br />
                        Name:
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                        <br />
                        Address:
                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                        <br />
                        Gender:
                        <asp:Label ID="GenderLabel" runat="server" Text='<%# Bind("Gender") %>' />
                        <br />
                        DoB:
                        <asp:Label ID="DoBLabel" runat="server" Text='<%# Bind("DoB") %>' />
                        <br />
                        License:
                        <asp:Label ID="LicenseLabel" runat="server" Text='<%# Bind("License") %>' />
                        <br />
                    </ItemTemplate>
                </asp:FormView>


                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext" EntityTypeName="" Select="new (ID, Name, Address, Gender, DoB, License)" TableName="Doctors" Where="ID == @ID">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="IDtext" DefaultValue="1" Name="ID" PropertyName="Text" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <asp:Label ID="IDtext" runat="server" Text="Label" CssClass="hidden"></asp:Label>
                <asp:Button ID="CloseViewDetail" runat="server" Text="Close" OnClick="CloseViewDetail_Click" CssClass="btn btn-info" />
            </div>



          

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
