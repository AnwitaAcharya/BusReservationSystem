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
    <table>
        <tr>
            <td>
                Select Bus Category :
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr class="label-underline">
            </td>
        </tr>
    </table>
    <%if (selected.Length > 3) %>
    <%{ %>
    <div style="max-width:940px; overflow:auto;">
    <table id="fare_table">
        <%for (int i = 0; i <= routes.Rows.Count; i++) %>
        <%{ %>
        <tr>
            <%for (int j = 0; j <= routes.Rows.Count; j++) %>
            <%{ %>
            <td class="table_bg_color">
                <%if ((i == 0) & (j > 0)) %>
                <%{ %>
                <b style="margin-left:4px; margin-right:4px;"><%= routes.Rows[j - 1][1].ToString().Trim()%></b>
                <%} %>
                <%else if ((j == 0) & (i > 0)) %>
                <%{ %>
                <b style="margin-left:4px; margin-right:4px;"><%= routes.Rows[i - 1][1].ToString().Trim()%></b>
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
                <input type="text" id="<%= routes.Rows[i - 1][0].ToString().Trim() + "_" + routes.Rows[j - 1][0].ToString().Trim()%>"
                    value="<%=val %>" />
                <%} %>
                <%} %>
            </td>
            <% }%>
        </tr>
        <% }%>
    </table>
</div>
    <input type="button" value="save" onclick="save()" class="submit_button" />
    <%} %>
</asp:Content>
