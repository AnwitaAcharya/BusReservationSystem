<%@ Page Language="C#" MasterPageFile="~/AdminLogInMasterPage.master" AutoEventWireup="true"
    CodeFile="admin_accounts.aspx.cs" Inherits="admin_accounts" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 <script src="/SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>

    <link href="/SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
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
                                <%= err_text[e_i]%></li>
                            <%} %>
                        </ul>
                    </td>
                </tr>
            </table>
            <%} %>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="TabbedPanels1" class="TabbedPanels">
        <ul class="TabbedPanelsTabGroup">
            <li class="TabbedPanelsTab">Password Update</li>
            <li class="TabbedPanelsTab">Email Update</li>
        </ul>
        <div class="TabbedPanelsContentGroup">
            <div class="TabbedPanelsContent">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    Current Password<a style="color: Red;">*</a> :
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Current Password" TextMode="Password"></asp:TextBox><br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr class="label-underline">
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    New Password<a style="color: Red;">*</a> :
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox><br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr class="label-underline">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Retype Password<a style="color: Red;">*</a> :
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server" placeholder="Retype Password" TextMode="Password"></asp:TextBox><br />
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
            </div>
            <div class="TabbedPanelsContent">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    Email<a style="color: Red;">*</a> :
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox4" runat="server" placeholder="Email"></asp:TextBox><br />
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
                                    <asp:Button ID="Button2" runat="server" Text="Save" CssClass="submit_button" OnClick="Button2_Click" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
    </script>

</asp:Content>
