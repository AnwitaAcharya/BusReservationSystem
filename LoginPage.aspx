<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="LoginPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:#e6f2ff">
<head runat="server">
    <title>Babuji Bus Service: Login</title>
    <link rel ="Stylesheet" href ="Style/Styles.css" type="text/css" />
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
    <div style ="width :1100px; border-left :solid 1px #ccc; height:500px; border-right :solid 1px #ccc">
    
    <center>
    <div style ="width :350px; height :245px" class ="credentialDiv ">
    <table style ="width :340px">
    
    <tr>
    <td style ="height :30px">
        <asp:Label ID="Label1" runat="server" Text="Login" Font-Bold="True" 
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
     <asp:TextBox ID="TextBox1" runat="server" placeholder="Email" style="height :25px; width :250px" CssClass="textBoxStyle "></asp:TextBox>
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
    <td style ="height :15px" align="center">
        <asp:Label ID="Label2" runat="server" Text="" style="color:Red; font-size:13px;"></asp:Label>
    </td>
    </tr>
    
     <tr>
    <td style ="height :30px" align ="center" >
    
    <asp:Button ID="Button1" runat="server" Text="Login" 
            style="width :100px; height :30px; color :#fff; font-weight:bold; font-family :Trebuchet MS "  
            CssClass ="loginButton " onclick="Button1_Click"/>
    
    </td>
    </tr>
    
    
         <tr>
    <td style ="height :30px" align ="center" >
    
        <asp:LinkButton ID="LinkButton1" runat="server" Font-Names="Trebuchet MS" 
            Font-Size="12px" ForeColor="#000099">Forgot your Password?</asp:LinkButton>
    
    </td>
    </tr>
     <tr>
    <td style ="height :30px" align ="center" >
    
        Do not have an account? 
        <asp:LinkButton ID="LinkButton2" runat="server" Font-Names="Trebuchet MS" 
            Font-Size="12px" ForeColor="#000099" onclick="LinkButton2_Click">Sign up</asp:LinkButton>
    
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
