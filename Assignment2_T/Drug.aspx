<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Drug.aspx.cs" Inherits="Assignment2_T.Drug1" %>

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
            <h2 class="text-success">Drug Content :&nbsp;&nbsp; 
                <asp:Button ID="ChangeContent" runat="server" Text="Drug" CssClass="btn btn-large btn-primary" OnClick="ChangeContent_Click" />
            </h2>

            <div runat="server" id="DrugCotent" class="divwell" style="display: inline-block; overflow: hidden; padding-bottom: 30px; padding-top: 10px; padding-right: 30px;">

                <div id="SearchDiv" class="divwell">
                    <asp:Button ID="AddDrugButton" runat="server" Text="Add Drug"
                        CssClass="btn btn-warning" OnClick="AddDrugButton_Click" ValidateRequestMode="Disabled" />

                    <asp:DropDownList ID="DropSearch" runat="server" CssClass="centerpadding" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:DropDownList ID="Equavalance" runat="server" CssClass="centerpadding">
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
                        <asp:TableRow runat="server" CssClass=".info">
                            <asp:TableHeaderCell>Drug Name</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="DrugName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="DrugName" ValidationGroup="group1"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                            </asp:TableHeaderCell>

                        </asp:TableRow>
                        <asp:TableRow ID="TableRow1" runat="server">
                            <asp:TableHeaderCell>Generic Name</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="GenName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="GenName" ValidationGroup="group1"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                            </asp:TableHeaderCell>

                        </asp:TableRow>
                        <asp:TableRow ID="TableRow2" runat="server">
                            <asp:TableHeaderCell>Unit</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="Unit" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="Unit" ValidationGroup="group1"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                            </asp:TableHeaderCell>

                        </asp:TableRow>
                        <asp:TableRow ID="TableRow3" runat="server">
                            <asp:TableHeaderCell>Price</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="Price" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="Price" ValidationGroup="group1"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                    ErrorMessage="Number only !!"
                                    ControlToValidate="Price"
                                    ValidationGroup="group1" ValidationExpression="^\d+$">
                                </asp:RegularExpressionValidator>
                            </asp:TableHeaderCell>

                        </asp:TableRow>
                        <asp:TableRow ID="TableRow4" runat="server">
                            <asp:TableHeaderCell>Group ID</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="GroupID" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ControlToValidate="GroupID" ValidationGroup="group1"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                                <asp:AutoCompleteExtender ID="AutoCompleteExtender1" Enabled="true"
                                    TargetControlID="GroupID" ServiceMethod="getGroupIDlist"
                                    MinimumPrefixLength="1" CompletionInterval="10"
                                    EnableCaching="true" CompletionSetCount="12"
                                    runat="server">
                                </asp:AutoCompleteExtender>
                            </asp:TableHeaderCell>

                        </asp:TableRow>
                        <asp:TableRow ID="TableRow5" runat="server">
                            <asp:TableCell> </asp:TableCell>
                            <asp:TableHeaderCell>
                                <asp:Button ID="AddNewDrug" runat="server" ValidationGroup="group1" CausesValidation="true" Text="Add Drug To Database" OnClick="AddNewDrug_Click" />
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
                        <asp:BoundField DataField="DrugName" HeaderText="DrugName" SortExpression="DrugName" />
                        <asp:BoundField DataField="GenericName" HeaderText="GenericName" SortExpression="GenericName" />
                        <asp:BoundField DataField="Unit" HeaderText="Unit" SortExpression="Unit" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:TemplateField HeaderText="drugGroup" SortExpression="drugGroup">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("drugGroup") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("drugGroup") %>'></asp:Label>
                              <%--  <%# Eval("drugGroup.Name") %>--%>
                                
                            </ItemTemplate>
                        </asp:TemplateField>
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
                    EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="Drugs" OnSelecting="LinqDataSourceDrug_Selecting">
                </asp:LinqDataSource>
                <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext" EntityTypeName="" TableName="DrugGroups"></asp:LinqDataSource>

            </div>

            <div runat="server" id="DetalItem" class="divwell"
                style="display: inline-block; overflow: hidden; position: fixed; right: 0; top: 70px; padding-top: 20px; padding-left: 20px; padding-bottom: 20px;">

                <asp:FormView ID="FormView1" runat="server" DataSourceID="LinqDataSource2">
                    <EditItemTemplate>
                        ID:
                        <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                        <br />
                        DrugName:
                        <asp:TextBox ID="DrugNameTextBox" runat="server" Text='<%# Bind("DrugName") %>' />
                        <br />
                        GenericName:
                        <asp:TextBox ID="GenericNameTextBox" runat="server" Text='<%# Bind("GenericName") %>' />
                        <br />
                        Unit:
                        <asp:TextBox ID="UnitTextBox" runat="server" Text='<%# Bind("Unit") %>' />
                        <br />
                        Price:
                        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                        <br />
                        drugGroup:
                        <asp:TextBox ID="drugGroupTextBox" runat="server" Text='<%# Bind("drugGroup") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        ID:
                        <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                        <br />
                        DrugName:
                        <asp:TextBox ID="DrugNameTextBox" runat="server" Text='<%# Bind("DrugName") %>' />
                        <br />
                        GenericName:
                        <asp:TextBox ID="GenericNameTextBox" runat="server" Text='<%# Bind("GenericName") %>' />
                        <br />
                        Unit:
                        <asp:TextBox ID="UnitTextBox" runat="server" Text='<%# Bind("Unit") %>' />
                        <br />
                        Price:
                        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                        <br />
                        drugGroup:
                        <asp:TextBox ID="drugGroupTextBox" runat="server" Text='<%# Bind("drugGroup") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        ID:
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Bind("ID") %>' />
                        <br />
                        DrugName:
                        <asp:Label ID="DrugNameLabel" runat="server" Text='<%# Bind("DrugName") %>' />
                        <br />
                        GenericName:
                        <asp:Label ID="GenericNameLabel" runat="server" Text='<%# Bind("GenericName") %>' />
                        <br />
                        Unit:
                        <asp:Label ID="UnitLabel" runat="server" Text='<%# Bind("Unit") %>' />
                        <br />
                        Price:
                        <asp:Label ID="PriceLabel" runat="server" Text='<%# Bind("Price") %>' />
                        <br />
                        drugGroup:
                        <asp:Label ID="drugGroupLabel" runat="server" Text='<%# Bind("drugGroup") %>' />
                        <br />
                    </ItemTemplate>
                </asp:FormView>

                <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext" EntityTypeName="" Select="new (ID, DrugName, GenericName, Unit, Price, drugGroup)" TableName="Drugs" Where="ID == @ID">
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
                    <asp:Button ID="AddDrugButtonG" runat="server" Text="Add Drug Group"
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
                        <asp:TableRow ID="TableRow6" runat="server" CssClass=".info">
                            <asp:TableHeaderCell>Drug Group Name</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="DrugNameG" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                    ControlToValidate="DrugNameG" ValidationGroup="group1G"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
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
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
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
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="DrugGroups" OnSelecting="LinqDataSourceDrug_SelectingG">
                </asp:LinqDataSource>


            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>


