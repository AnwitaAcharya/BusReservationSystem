<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link rel ="Stylesheet" href ="Style/Styles.css" type="text/css" />
</head>
<body style="margin-top:0px; margin-left :0px; margin-right:0px">
    <form id="form1" runat="server">
    <div>
    
    <div style ="width :100%; height :120px; border-bottom :solid #009be6 1px" class="topDiv ">
    <center >
    
    <table style="height:120px">
    <tr>
    <td>
    <img src="Image/BBS.png" alt ="Babuji Bus Services" height ="100px" />
    </td>
    <td>
    <label style="font-family :Verdana ; font-size :24px; color :#ffffff; ">Babuji Bus Services</label>
    </td>
    <td style ="width :400px"></td>
    <td>
    <table >
    <tr>
    <td>
        <asp:TextBox ID="TextBox1" runat="server" placeholder="Email" style="height :25px; width :150px" CssClass="textBoxStyle "></asp:TextBox>
    </td>
    <td>
        <asp:TextBox ID="TextBox2" runat="server" placeholder="Password" style="height :25px; width :150px"  TextMode="Password" CssClass ="textBoxStyle "></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td colspan ="2" align ="right" >
        <asp:Button ID="Button1" runat="server" Text="Login" style="width :100px; height :30px; color :#fff; font-weight:bold; font-family :Trebuchet MS "  CssClass ="loginButton "/>
    </td>
    </tr>
    <tr>
    <td colspan ="2" align ="center" style ="height :30px" >
        <asp:Label ID="Label1" runat="server" Text="Do not have an account?" 
            Font-Names="Trebuchet MS" Font-Size="14px" ForeColor="White"></asp:Label>
            <asp:LinkButton
                ID="LinkButton1" runat="server" Font-Names="Trebuchet MS" 
            Font-Size="14px" ForeColor="#000099">Sign Up Now</asp:LinkButton>
    </td>
    </tr>
    </table>
    </td>
    
    </tr>
    </table>
    
    </center>
    </div>
    
    
    
    
    
    
    <center >
    <div style ="width :1100px; border-left :solid 1px #ccc; height:500px; border-right :solid 1px #ccc">
    
    </div>
    </center>
    
    
    
    </div>
    </form>
</body>
</html>
