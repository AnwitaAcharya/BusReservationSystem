<%@ Page Language="C#" MasterPageFile="~/AdminLogInMasterPage.master" AutoEventWireup="true" CodeFile="route_operation.aspx.cs" Inherits="route_operation" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
   
</asp:Content>

