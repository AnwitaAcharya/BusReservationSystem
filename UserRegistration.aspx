<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserRegistration.aspx.cs" Inherits="UserRegistration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <link rel ="Stylesheet" href ="Style/Styles.css" type="text/css" />
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
            $("#<%=TextBox5.ClientID %>").dynDateTime({
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
</head>
<body style="margin-top:0px; margin-left :0px; margin-right:0px">
    <form id="form1" runat="server">
    <div>
    
    <div style ="width :100%; height :100px; border-bottom :solid #009be6 1px" class="topDiv ">
    <center >
    
    <table style="height:100px">
    <tr>
    <td>
    <img src="Image/BBS.png" alt ="Babuji Bus Services" height ="90px" />
    </td>
    <td>
    <label style="font-family :Verdana ; font-size :24px; color :#ffffff; ">Babuji Bus Services</label>
    </td>    
    </tr>
    </table>
    
    </center>
    </div>
    
    
    <div style ="height :50px"></div>
    
    
    
    <center >
    <div style ="width :1100px; height:500px; ">
    
    <center>
    <div style ="width :350px; height :450px" class ="credentialDiv ">
    <table style ="width :340px">
    
    <tr>
    <td style ="height :30px">
        <asp:Label ID="Label1" runat="server" Text="Sign Up" Font-Bold="True" 
            Font-Names="Trebuchet MS" Font-Size="14px"></asp:Label>
    </td>
    </tr>
    
    <tr>
    <td style ="height :20px">
    <div style ="height :1px; background-color:#bbb"></div>
    </td>
    </tr>
    
    <tr>
    <td style ="height :10px"></td>
    </tr>
    
    <tr>
    <td style ="height :30px" align="center" >
     <asp:TextBox ID="TextBox1" runat="server" placeholder="First Name" style="height :25px; width :250px" CssClass="textBoxStyle "></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td style ="height :10px"></td>
    </tr>
    
    <tr>
    <td style ="height :30px" align="center" >
     <asp:TextBox ID="TextBox3" runat="server" placeholder="Last Name" style="height :25px; width :250px" CssClass="textBoxStyle "></asp:TextBox>
    </td>
    </tr>
    
    <tr>
    <td style ="height :10px"></td>
    </tr>
    
    <tr>
    <td style ="height :30px" align="center" >
     <asp:TextBox ID="TextBox4" runat="server" placeholder="Email" style="height :25px; width :250px" CssClass="textBoxStyle "></asp:TextBox>
    </td>
    </tr>
    
    
    <tr>
    <td style ="height :10px"></td>
    </tr>
    
    <tr>
    <td align ="center" >
    
    <asp:TextBox ID="TextBox2" runat="server" placeholder="Password" style="height :25px; width :250px"  TextMode="Password" CssClass ="textBoxStyle "></asp:TextBox>
    
    </td>
    </tr>
    
    
    
    <tr>
    <td style ="height :10px"></td>
    </tr>
    
    <tr>
    <td style ="height :30px" align="center" >
     <asp:TextBox ID="TextBox5" runat="server" placeholder="Date of Birth" style="height :25px; width :250px" CssClass="textBoxStyle "></asp:TextBox>
    </td>
    </tr>
    
    <tr>
    <td style ="height :10px"></td>
    </tr>
    
    <tr>
    <td style ="height :30px" align="center" >
     <asp:TextBox ID="TextBox6" runat="server" placeholder="Address" style="width :250px; max-width :250px; min-width :250px; min-height :50px; max-height :50px" Rows ="4" CssClass="textBoxStyle " TextMode="MultiLine"></asp:TextBox>
    </td>
    </tr>
    
    
     <tr>
    <td style ="height :10px"></td>
    </tr>
    
    
     <tr>
    <td style ="height :30px" align ="center" >
    
    <asp:Button ID="Button1" runat="server" Text="Register" 
            style="width :100px; height :30px; color :#fff; font-weight:bold; font-family :Trebuchet MS "  
            CssClass ="loginButton " onclick="Button1_Click"/>
    
    </td>
    </tr>
    
    
         <tr>
    <td style ="height :30px" align ="center" >
    
        <asp:Label ID="Label2" runat="server" Text="Exception Message" ForeColor="Red" Visible="False" Font-Names="Trebuchet MS" Font-Size="12px"></asp:Label>
    
    </td>
    </tr>
    
    
    </table>
    </div>
    </center>
    
    </div>
    </center>
    
    
    
    </div>
    </form>
</body>
</html>
