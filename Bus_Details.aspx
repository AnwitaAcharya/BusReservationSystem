<%@ Page Language="C#" MasterPageFile="~/UserPage.master" AutoEventWireup="true" CodeFile="Bus_Details.aspx.cs" Inherits="Bus_Details" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<table>
<tr style ="width :800px">
<td style ="width :800px; height :35px">



    <asp:Label ID="Label2" runat="server" Font-Names="Impact" Font-Size="Medium" 
        Text="Bus Number: "></asp:Label>
    <asp:Label ID="Label1" runat="server" Font-Names="Verdana" Font-Size="Small" 
        Text="Label"></asp:Label>



</td>
</tr>

<tr style ="width :800px">
<td>
<hr />
</td>
</tr>


<tr style ="width :800px">
<td style ="width :800px" align="center" >

<table >

<tr>

<td>


    <asp:Label ID="Label3" runat="server" Font-Bold="True" 
        Font-Names="Trebuchet MS" Font-Size="Small" Text="Select Seats: "></asp:Label>


</td>

<td>

    <asp:DropDownList ID="DropDownList1" runat="server" Width="110px">
        <asp:ListItem>0</asp:ListItem>
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
    </asp:DropDownList>
</td>


<td style ="width :50px"></td>

<td>

    <asp:Label ID="Label4" runat="server" Font-Bold="True" 
        Font-Names="Trebuchet MS" Font-Size="Small" Text="Source: "></asp:Label>

</td>

<td>

    <asp:Label ID="Label5" runat="server" Font-Names="Trebuchet MS" Font-Size="Small" Text="Source: "></asp:Label>

</td>


<td style ="width :50px"></td>

<td>

    <asp:Label ID="Label6" runat="server" Font-Bold="True" 
        Font-Names="Trebuchet MS" Font-Size="Small" Text="Destination: "></asp:Label>

</td>

<td>

    <asp:Label ID="Label7" runat="server" Font-Names="Trebuchet MS" Font-Size="Small" Text="Destination: "></asp:Label>

</td>


</tr>

</table>
</td>
</tr>

<tr>
<td style ="height :30px"></td>
</tr>

<tr style ="width :800px">
<td style ="height :40px" align ="center" >

    <asp:Button ID="Button1" runat="server" BackColor="#3399FF" 
        BorderColor="#0033CC" Font-Names="Arial Black" ForeColor="White" Height="35px" 
        Text="Proceed to Payment" Width="175px" onclick="Button1_Click" />

</td>
</tr> 


</table>


</asp:Content>

