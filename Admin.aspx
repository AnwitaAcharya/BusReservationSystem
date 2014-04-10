<%@ Page Language="C#" MasterPageFile="~/AdminLoginMasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" Title="Untitled Page" EnableViewStateMac="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <% System.Data.DataRow dr;
        for (int i = 0; i <= users_data.Rows.Count - 1; i++)
      {
          dr = users_data.Rows[i];
          %>
      <%=dr[0] %><br />
     <% } %>
</asp:Content>
