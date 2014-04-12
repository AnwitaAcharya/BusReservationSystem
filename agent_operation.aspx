<%@ Page Language="C#" MasterPageFile="~/AdminLogInMasterPage.master" AutoEventWireup="true" CodeFile="agent_operation.aspx.cs" Inherits="agent_operation" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script>
$(function() {
$( "#<%= TextBox6.ClientID %>" ).datepicker({
showOn: "button",
buttonImage: "/jquery-ui/images/calendar.gif",
buttonImageOnly: true,
});
$( "#datepicker" ).datepicker( "option", "dateFormat", "mm/dd/yyyy" );
});
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
   
</asp:Content>

