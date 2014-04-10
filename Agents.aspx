<%@ Page Language="C#" MasterPageFile="~/AdminLogInMasterPage.master" AutoEventWireup="true"
    CodeFile="Agents.aspx.cs" Inherits="Agents" Title="Untitled Page" EnableViewStateMac="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            First Name<a style="color: Red;">*</a> :
            <asp:TextBox ID="TextBox1" runat="server" placeholder="First Name"></asp:TextBox><br />
            Last Name :
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Last Name"></asp:TextBox><br />
            Email<a style="color: Red;">*</a> :
            <asp:TextBox ID="TextBox3" runat="server" placeholder="Email"></asp:TextBox><br />
            Password<a style="color: Red;">*</a> :
            <asp:TextBox ID="TextBox4" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox><br />
            Mobile :
            <asp:TextBox ID="TextBox5" runat="server" placeholder="Mobile"></asp:TextBox><br />
            Date of birth<a style="color: Red;">*</a> :
            <asp:TextBox ID="TextBox6" runat="server" placeholder="MM/DD/YYYY"></asp:TextBox><br />
            <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table cellpadding="0" cellspacing="0" border="1">
                <thead>
                    <tr>
                        <td>
                            Name
                        </td>
                        <td>
                            Email
                        </td>
                        <td>
                        </td>
                    </tr>
                </thead>
                <% Boolean active_started = false; %>
                <% Boolean inactive_started = false; %>
                <% System.Data.DataRow dr;
                   for (int i = 0; i <= agents.Rows.Count - 1; i++)
                   {
                       dr = agents.Rows[i];  %>
                <% if ((dr[14].ToString().Trim() == "0") & (active_started == false))
                   {%>
                <tr>
                    <td colspan="3">
                        <b>Active</b>
                    </td>
                </tr>
                <% active_started = true;
                   } %>
                <% if ((dr[14].ToString().Trim() == "1") & (inactive_started == false))
                   {%>
                <tr>
                    <td colspan="3">
                        <b>Inactive</b>
                    </td>
                </tr>
                <% inactive_started = true;
                   } %>
                <tr>
                    <td>
                        <%=dr[0] + " " + dr[1]%>
                    </td>
                    <td>
                        <%= dr[2] %>
                    </td>
                    <td>
                        <a>Edit</a> <a onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
                <% } %>
            </table>
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
