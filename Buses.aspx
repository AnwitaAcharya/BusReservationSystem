<%@ Page Language="C#" MasterPageFile="~/AdminLogInMasterPage.master" AutoEventWireup="true"
    CodeFile="Buses.aspx.cs" Inherits="Buses" Title="Untitled Page" EnableViewStateMac="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script src="/SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>

    <link href="/SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="TabbedPanels1" class="TabbedPanels">
        <ul class="TabbedPanelsTabGroup">
            <li class="TabbedPanelsTab">Bus Creation</li>
            <li class="TabbedPanelsTab">Bus Category</li>
        </ul>
        <div class="TabbedPanelsContentGroup">
            <div class="TabbedPanelsContent">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        BusNo.<a style="color: Red;">*</a> :
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="Bus No"></asp:TextBox><br />
                        Category<a style="color: Red;">*</a> :
                        <asp:DropDownList ID="DropDownList1" runat="server">
                        </asp:DropDownList>
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <div class="TabbedPanelsContent">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        Category Name<a style="color: Red;">*</a> :
                        <asp:TextBox ID="TextBox2" runat="server" placeholder="Category Name"></asp:TextBox><br />
                        <asp:Button ID="Button2" runat="server" Text="Save" OnClick="Button2_Click" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table cellpadding="0" cellspacing="0" border="1">
                <thead>
                    <tr>
                        <td>
                            Name
                        </td>
                        <td>
                        </td>
                    </tr>
                </thead>
                <% Boolean active_started = false; %>
                <% Boolean inactive_started = false; %>
                <% System.Data.DataRow dr;
                   for (int i = 0; i <= buses.Rows.Count - 1; i++)
                   {
                       dr = buses.Rows[i];  %>
                <% if ((dr[1].ToString().Trim() == "0") & (active_started == false))
                   {%>
                <tr>
                    <td colspan="2">
                        <b>Active</b>
                    </td>
                </tr>
                <% active_started = true;
                   } %>
                <% if ((dr[1].ToString().Trim() == "1") & (inactive_started == false))
                   {%>
                <tr>
                    <td colspan="2">
                        <b>Inactive</b>
                    </td>
                </tr>
                <% inactive_started = true;
                   } %>
                <tr>
                    <td>
                        <%=dr[0]%>
                    </td>
                    <td>
                        <% if (dr[1].ToString().Trim() == "1") %>
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

    <script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
    </script>

</asp:Content>
