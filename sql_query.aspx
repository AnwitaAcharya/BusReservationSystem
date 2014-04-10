<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sql_query.aspx.cs" Inherits="sql_query" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:TextBox ID="TextBox1" runat="server" Height="103px" TextMode="MultiLine" 
            Width="611px"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Exexcute Query" 
            onclick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Views" onclick="Button2_Click" />
         <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </div>
    </form>
</body>
</html>
