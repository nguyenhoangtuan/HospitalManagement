<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Assignment2_T.User1" %>
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
            <h2 class="text-success">User Content :</h2>


            <div runat="server" id="DrugCotent" class="divwell" style="display: inline-block; overflow: hidden; padding-bottom: 30px; padding-top: 10px; padding-right: 30px;">

                <div id="SearchDiv" class="divwell">
                    <asp:Button ID="AddDrugButton" runat="server" Text="Add User"
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
                            <asp:TableHeaderCell>User Account</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="DrugName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="DrugName" ValidationGroup="group1"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                            </asp:TableHeaderCell>

                        </asp:TableRow>
                        <asp:TableRow ID="TableRow2" runat="server">
                            <asp:TableHeaderCell>Role</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:DropDownList ID="GenderDrop" runat="server">
                                    <asp:ListItem Text="Admin" Value="1" />
                                    <asp:ListItem Text="Normal" Value="2" />
                                </asp:DropDownList>
                            </asp:TableHeaderCell>

                        </asp:TableRow>
                        <asp:TableRow ID="TableRow3" runat="server">
                            <asp:TableHeaderCell>Password</asp:TableHeaderCell>
                            <asp:TableHeaderCell>
                                <asp:TextBox ID="Unit" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="Unit" ValidationGroup="group1"
                                    ErrorMessage="Can not be empty !!"></asp:RequiredFieldValidator>
                            </asp:TableHeaderCell>
                        </asp:TableRow>
                        <asp:TableRow ID="TableRow6" runat="server">
                            <asp:TableCell> </asp:TableCell>
                            <asp:TableHeaderCell>
                                <asp:Button ID="AddNewDrug" runat="server" ValidationGroup="group1" CausesValidation="true" Text="Add User To Database" OnClick="AddNewDrug_Click" />
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
                        <asp:BoundField DataField="UserAcc" HeaderText="UserAcc" SortExpression="UserAcc" />
                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                        <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
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


                <asp:LinqDataSource ID="LinqDataSource" runat="server" ContextTypeName="Assignment2_T.DataBaseAllDataContext"
                     EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
                     TableName="Users" OnSelecting="LinqDataSourceDrug_Selecting">
                </asp:LinqDataSource>

            </div>

           
            </div>



          

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
