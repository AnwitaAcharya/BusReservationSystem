<%@ Page Language="C#" MasterPageFile="~/AdminLoginMasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" Title="Untitled Page" EnableViewStateMac="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div style="width:900px; text-align:left; padding-top:100px;">
   <div class="bg-light float-left big-box grey-border shadow margin-right-30">
      <h4 class="dashboard-heading margin-top-20">Total Agents</h4>
      <div class="big-text margin-bottom-20"><%= stats.Rows[0][0] %></div>
    </div>
    <div class="bg-light float-left big-box grey-border shadow margin-right-30">
      <h4 class="dashboard-heading margin-top-20">Total Places</h4>
      <div class="big-text margin-bottom-20"><%= stats.Rows[2][0] %></div>
    </div>
    <div class="bg-light float-left big-box grey-border shadow margin-right-30">
      <h4 class="dashboard-heading margin-top-20">Total Buses</h4>
      <div class="big-text margin-bottom-20"><%= stats.Rows[1][0] %></div>
    </div>
    <div class="bg-light float-left big-box grey-border shadow">
      <h4 class="dashboard-heading margin-top-20">Todays Income</h4>
      <div class="big-text margin-bottom-20">0</div>
    </div>
    </div>
</asp:Content>
