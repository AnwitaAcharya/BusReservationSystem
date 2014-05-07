<%@ Page Language="C#" MasterPageFile="~/UserPage.master" AutoEventWireup="true" CodeFile="GetBus.aspx.cs" Inherits="GetBus" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

<script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
    <script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
    <link href="Style/calendar-blue.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.tinyscrollbar.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#scrollbar1').tinyscrollbar();	
		});
		$(document).ready(function () {
            $("#<%=TextBox1.ClientID %>").dynDateTime({
                showsTime: true,
                ifFormat: "%d/%m/%Y",
                daFormat: "%l;%M %p, %e %m,  %Y",
                align: "BR",
                electric: false,
                singleClick: false,
                displayArea: ".siblings('.dtcDisplayArea')",
                button: ".next()"
            });
        });
	</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div style ="height :20px"></div>

<div style ="height :40px">
    <asp:Label ID="Label1" runat="server" Text="Search &amp; Book Tickets" style="padding-left :30px; font-family :Trebuchet MS; font-size :16px; font-weight :bold"></asp:Label>
</div>
<div>
<hr />
</div>
<div style ="height :20px">
    
    </div>

<div>

<table >
<tr>
<td style ="width :200px">

    <asp:Label ID="Label2" runat="server" Text="Select Source: "></asp:Label>

</td>
<td style ="width :200px">

    <asp:Label ID="Label3" runat="server" Text="Select Destination :"></asp:Label>

</td>
<td style ="width :200px">

    <asp:Label ID="Label4" runat="server" Text="Select Date :"></asp:Label>

</td>
<td style ="width :200px">

    

</td>
</tr>





<tr>
<td style ="width :200px">

    <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="150px">
    </asp:DropDownList>

</td>
<td style ="width :200px">

    <asp:DropDownList ID="DropDownList2" runat="server" Height="25px" Width="150px">
    </asp:DropDownList>

</td>
<td style ="width :200px">

    <asp:TextBox ID="TextBox1" runat="server" Width="150px" Height="25px" ></asp:TextBox>

</td>
<td style ="width :200px">

    

    <asp:Button ID="Button1" runat="server" Text="Search" CssClass ="loginButton" 
        style="height :25px; width :80px" onclick="Button1_Click" />

    

</td>
</tr>

<tr>
<td colspan ="4">
    <asp:Label ID="Label5" runat="server" Text="Label" Font-Bold="True" 
        Font-Names="Trebuchet MS" Visible="False"></asp:Label>
</td>
</tr>

<tr>
<td colspan ="4" align ="left" >
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" Width="700px" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="Id" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="bus_no" HeaderText="Bus Number" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="arrival_time" HeaderText="Start Time" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</td>
</tr>


</table>

</div>

</asp:Content>

