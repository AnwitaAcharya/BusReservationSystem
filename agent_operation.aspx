<%@ Page Language="C#" MasterPageFile="~/AdminLogInMasterPage.master" AutoEventWireup="true"
    CodeFile="agent_operation.aspx.cs" Inherits="agent_operation" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
$(function() {
$( "#<%= TextBox6.ClientID %>" ).datepicker({
showOn: "button",
buttonImage: "/jquery-ui/images/calendar.gif",
buttonImageOnly: true
});
$( "#<%= TextBox6.ClientID %>" ).datepicker( "option", "dateFormat", "dd/mm/yy" );
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
</asp:Content>
