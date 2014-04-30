<%@ Page Language="C#" MasterPageFile="~/UserPage.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<table style ="width :800px">

<tr style ="width :800px">
<td style ="height :35px">

    <asp:Label ID="Label1" runat="server" Text="Travel Details: " 
        Font-Names="Impact" Font-Size="Medium"></asp:Label>

</td>
</tr>
<tr>
<td>
<hr />
</td>
</tr>


<tr>

<td align="center" >


<table style ="width :600px">


<tr style ="height :45px">
<td style ="width :250px" align ="left" >

    <asp:Label ID="Label12" runat="server" Font-Bold="True" 
        Font-Names="Trebuchet MS" Text="Bus Number: "></asp:Label>

</td>
<td style ="width :350px">

    <asp:Label ID="Label13" runat="server" Font-Names="Trebuchet MS" Text="Label"></asp:Label>

</td>
</tr>


<tr style ="height :45px">
<td style ="width :250px" align ="left" >

    <asp:Label ID="Label2" runat="server" Font-Bold="True" 
        Font-Names="Trebuchet MS" Text="Source Location: "></asp:Label>

</td>
<td style ="width :350px">

    <asp:Label ID="Label3" runat="server" Font-Names="Trebuchet MS" Text="Label"></asp:Label>

</td>
</tr>

<tr style ="height :45px">
<td style ="width :250px" align ="left" >

    <asp:Label ID="Label4" runat="server" Font-Bold="True" 
        Font-Names="Trebuchet MS" Text="Destination Location: "></asp:Label>

</td>
<td style ="width :350px">

    <asp:Label ID="Label5" runat="server" Font-Names="Trebuchet MS" Text="Label"></asp:Label>

</td>
</tr>
<tr style ="height :45px">
<td style ="width :250px" align ="left" >

    <asp:Label ID="Label6" runat="server" Font-Bold="True" 
        Font-Names="Trebuchet MS" Text="Seat Quantity: "></asp:Label>

</td>
<td style ="width :350px">

    <asp:Label ID="Label7" runat="server" Font-Names="Trebuchet MS" Text="Label"></asp:Label>

</td>
</tr>
<tr style ="height :45px">
<td style ="width :250px" align ="left" >

    <asp:Label ID="Label8" runat="server" Font-Bold="True" 
        Font-Names="Trebuchet MS" Text="Fare Rate: "></asp:Label>

</td>
<td style ="width :350px">

    <asp:Label ID="Label9" runat="server" Font-Names="Trebuchet MS" Text="Label"></asp:Label>

</td>
</tr>
<tr style ="height :45px">
<td style ="width :250px" align ="left" >

    <asp:Label ID="Label10" runat="server" Font-Bold="True" 
        Font-Names="Trebuchet MS" Text="Amount Payable: "></asp:Label>

</td>
<td style ="width :350px">

    <asp:Label ID="Label11" runat="server" Font-Names="Trebuchet MS" Text="Label"></asp:Label>

</td>
</tr>

<tr style ="height :45px">
<td style ="width :250px" align ="left" >


</td>
<td style ="width :350px">

<asp:Button ID="Button1" runat="server" BackColor="#3399FF" 
        BorderColor="#0033CC" Font-Names="Arial Black" ForeColor="White" Height="35px" 
        Text="Make Payment" Width="175px" onclick="Button1_Click" />

</td>
</tr>



</table>


</td>

</tr>



</table>


</asp:Content>

