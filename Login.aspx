<%@ Page Language="C#" MasterPageFile="~/LogOutMasterPage.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Login" Title="Untitled Page" EnableViewStateMac="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel100" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <% if (err == true) %>
            <%{ %>
            <div class="error">
                <ul>
                    <%for (int e_i = 0; e_i <= err_text.Count - 1; e_i++) %>
                    <%{ %>
                    <li>
                        <%= err_text[e_i] %></li>
                    <%} %>
                </ul>
            </div>
            <%} %>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:TextBox ID="TextBox1" runat="server" placeholder="Email"></asp:TextBox>
    <asp:TextBox ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
</asp:Content>
