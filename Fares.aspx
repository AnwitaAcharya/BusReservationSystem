<%@ Page Language="C#" MasterPageFile="~/AdminLogInMasterPage.master" AutoEventWireup="true"
    CodeFile="Fares.aspx.cs" Inherits="Fares" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
function save()
{
var category = $("#<%= DropDownList1.ClientID %>").val();
all_data={};
$.each( $("table#fare_table input"), function( i, l ){
all_data[$(l).attr("id")]= $(l).val();
});
$.ajax({type: 'POST',url:"/fare_create.aspx?category="+category,data: all_data,success:function(result){
/*if(result.toString().trim()[0]==1)
{
window.open("/buses.aspx", "_self");
}
if(result.toString().length>10)
{*/
$("#ajax_error").html(result);
/*}*/
}}); 
}
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="ajax_error">
    </div>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true">
    </asp:DropDownList>
    <%if (selected.Length > 3) %>
    <%{ %>
    <table id="fare_table">
        <%for (int i = 0; i <= routes.Rows.Count; i++) %>
        <%{ %>
        <tr>
            <%for (int j = 0; j <= routes.Rows.Count; j++) %>
            <%{ %>
            <td>
                <%if ((i == 0) & (j > 0)) %>
                <%{ %>
                <%= routes.Rows[j - 1][1].ToString().Trim()%>
                <%} %>
                <%else if ((j == 0) & (i > 0)) %>
                <%{ %>
                <%= routes.Rows[i - 1][1].ToString().Trim()%>
                <%} %>
                <%else if (i == j) %>
                <%{ %>
                <%if (i != 0) %>
                <%{ %>
                -
                <%} %>
                <%} %>
                <%else %>
                <%{ %>
                <%if (j < i) %>
                <%{ %>
                <% string val = "0"; %>
                <% System.Data.DataRow[] find_rows = fares.Select("(source_id = '" + routes.Rows[i - 1][0].ToString().Trim() + "' and destination_id = '" + routes.Rows[j - 1][0].ToString().Trim() + "') or (source_id = '" + routes.Rows[j - 1][0].ToString().Trim() + "' and destination_id = '" + routes.Rows[i - 1][0].ToString().Trim() + "')"); %>
                <%if (find_rows.Length > 0) { val = find_rows[0][5].ToString().Trim(); } %>
                <input type="text" id="<%= routes.Rows[i - 1][0].ToString().Trim() + "_" + routes.Rows[j - 1][0].ToString().Trim()%>" value="<%=val %>" />
                <%} %>
                <%} %>
            </td>
            <% }%>
        </tr>
        <% }%>
    </table>
    <input type="button" value="save" onclick="save()" />
    <%} %>
</asp:Content>
