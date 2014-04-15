<%@ Page Language="C#" MasterPageFile="~/AdminLogInMasterPage.master" AutoEventWireup="true"
    CodeFile="bus_operation.aspx.cs" Inherits="bus_operation" Title="Untitled Page" %>

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
    <%if (req_type=="edit") %>
    <%{ %>
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
    <%} %>
</asp:Content>
