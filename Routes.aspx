<%@ Page Language="C#" MasterPageFile="~/AdminLogInMasterPage.master" AutoEventWireup="true"
    CodeFile="Routes.aspx.cs" Inherits="Routes" Title="Untitled Page" EnableViewStateMac="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                        Place Name<a style="color: Red;">*</a> :
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="Place Name"></asp:TextBox><br />
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
                   for (int i = 0; i <= routes.Rows.Count - 1; i++)
                   {
                       dr = routes.Rows[i];  %>
                <% if ((dr[2].ToString().Trim() == "0") & (active_started == false))
                   {%>
                <tr>
                    <td colspan="2" style="padding-top: 10px; padding-bottom: 4px;">
                        <b>Active</b>
                    </td>
                </tr>
                <% active_started = true;
                   } %>
                <% if ((dr[2].ToString().Trim() == "1") & (inactive_started == false))
                   {%>
                <tr>
                    <td colspan="2" style="padding-top: 10px; padding-bottom: 4px;">
                        <b>Inactive</b>
                    </td>
                </tr>
                <% inactive_started = true;
                   } %>
                <tr class="table_bg_color">
                    <td>
                        <%=dr[1]%>
                    </td>
                    <td>
                        <% if (dr[2].ToString().Trim() == "1") %>
                        <%{ %>
                        <a href="/route_operation.aspx?req_type=active&req_id=<%= dr[0].ToString().Trim() %>">
                            Active</a>
                        <%} %>
                        <%else %>
                        <%{ %>
                        <a href="/route_operation.aspx?req_type=edit&req_id=<%= dr[0].ToString().Trim() %>">
                            Edit</a> <a href="/route_operation.aspx?req_type=inactive&req_id=<%= dr[0].ToString().Trim() %>">
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
