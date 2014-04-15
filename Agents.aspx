﻿<%@ Page Language="C#" MasterPageFile="~/AdminLogInMasterPage.master" AutoEventWireup="true"
    CodeFile="Agents.aspx.cs" Inherits="Agents" Title="Untitled Page" EnableViewStateMac="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script>
$(function() {
$( "#<%= TextBox6.ClientID %>" ).datepicker({
showOn: "button",
buttonImage: "/jquery-ui/images/calendar.gif",
buttonImageOnly: true
});
$( "#datepicker" ).datepicker( "option", "dateFormat", "dd/mm/yyyy" );
});
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel100" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <% if (err == true) %>
            <%{ %>
            <table class="error">
                <tr>
                    <td>
                        <ul>
                            <%for (int e_i = 0; e_i <= err_text.Count - 1; e_i++) %>
                            <%{ %>
                            <li>
                                <%= err_text[e_i] %></li>
                            <%} %>
                        </ul>
                    </td>
                </tr>
            </table>
            <%} %>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table>
                <tr>
                    <td>
                        First Name<a style="color: Red;">*</a> :
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="First Name"></asp:TextBox><br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr class="label-underline">
                    </td>
                </tr>
                <tr>
                    <td>
                        Last Name :
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" placeholder="Last Name"></asp:TextBox><br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr class="label-underline">
                    </td>
                </tr>
                <tr>
                    <td>
                        Email<a style="color: Red;">*</a> :
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" placeholder="Email"></asp:TextBox><br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr class="label-underline">
                    </td>
                </tr>
                <tr>
                    <td>
                        Password<a style="color: Red;">*</a> :
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox><br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr class="label-underline">
                    </td>
                </tr>
                <tr>
                    <td>
                        Mobile :
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" placeholder="Mobile"></asp:TextBox><br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr class="label-underline">
                    </td>
                </tr>
                <tr>
                    <td>
                        Date of birth<a style="color: Red;">*</a> :
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server" placeholder="DD/MM/YYYY"></asp:TextBox><br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr class="label-underline">
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Save" CssClass="submit_button" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table cellpadding="0" cellspacing="0" class="list">
                <% Boolean active_started = false; %>
                <% Boolean inactive_started = false; %>
                <% System.Data.DataRow dr;
                   for (int i = 0; i <= agents.Rows.Count - 1; i++)
                   {
                       dr = agents.Rows[i];  %>
                <% if ((dr[15].ToString().Trim() == "0") & (active_started == false))
                   {%>
                <tr>
                    <td colspan="3" style="padding-top:10px; padding-bottom:4px;">
                        <b>Active</b>
                    </td>
                </tr>
                <% active_started = true;
                   } %>
                <% if ((dr[15].ToString().Trim() == "1") & (inactive_started == false))
                   {%>
                <tr>
                    <td colspan="3" style="padding-top:10px; padding-bottom:4px;">
                        <b>Inactive</b>
                    </td>
                </tr>
                <% inactive_started = true;
                   } %>
                <tr class="table_bg_color">
                    <td>
                        <%=dr[1] + " " + dr[2]%>
                    </td>
                    <td>
                        <%= dr[3] %>
                    </td>
                    <td>
                        <% if (dr[15].ToString().Trim() == "1") %>
                        <%{ %>
                        <a href="/agent_operation.aspx?req_type=active&req_id=<%= dr[0].ToString().Trim() %>">
                            Active</a>
                        <%} %>
                        <%else %>
                        <%{ %>
                        <a href="/agent_operation.aspx?req_type=edit&req_id=<%= dr[0].ToString().Trim() %>">
                            Edit</a> <a href="/agent_operation.aspx?req_type=inactive&req_id=<%= dr[0].ToString().Trim() %>">
                                Inactive</a>
                        <%} %>
                    </td>
                </tr>
                <% } %>
            </table>
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
