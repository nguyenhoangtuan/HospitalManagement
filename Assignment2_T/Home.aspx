<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Assignment2_T.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
    <h1> Welcome to the main page of Hospital</h1>

    <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" Text="View Crystal Report 1" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" CssClass="btn btn-info" Text="View Crystal Report 2" OnClick="Button2_Click"/>
</asp:Content>
