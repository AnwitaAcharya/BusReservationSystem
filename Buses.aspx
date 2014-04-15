<%@ Page Language="C#" MasterPageFile="~/AdminLogInMasterPage.master" AutoEventWireup="true"
    CodeFile="Buses.aspx.cs" Inherits="Buses" Title="Untitled Page" EnableViewStateMac="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script src="/SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>

    <link href="/SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
    function add_more()
    {
    var route_select = $("#hidden .route_select").html();
    var hour_select = $("#hidden .hour_select").html();
    var minute_select = $("#hidden .minute_select").html();
    $("#bus_associated tr:last").after("<tr><td>"+ ($("#bus_associated tr").length) +"</td><td><select class='route_select'>" + route_select + "</select></td><td><select class='hour_select'>" + hour_select + "</select><select class='minute_select'>" + minute_select + "</select></td><td><a class='delete' onclick='delete_row(this)'>X</a></td></tr>")
    }
    function delete_row(th_is)
    {
    $(th_is).parent().parent().remove();
    sl_no_update();
    }
    function sl_no_update()
    {
    $.each( $("#bus_associated tr"), function( i, l ){
if(i!=0)
{
$($(l).children()[0]).html(i);
}
});
    }
    function save()
    {
    var bus_no = $("#<%= TextBox1.ClientID %>").val();
    var category = $("#<%= DropDownList1.ClientID %>").val();
    weekday = []
    if($("#sun").is(':checked'))
    {
    weekday.push(1);
    }
    if($("#mon").is(':checked'))
    {
    weekday.push(2);
    }
    if($("#tue").is(':checked'))
    {
    weekday.push(3);
    }
    if($("#wed").is(':checked'))
    {
    weekday.push(4);
    }
    if($("#thu").is(':checked'))
    {
    weekday.push(5);
    }
    if($("#fri").is(':checked'))
    {
    weekday.push(6);
    }
    if($("#sat").is(':checked'))
    {
    weekday.push(7);
    }
    var sl_nos = [];
    var route_selects = [];
    var arrival_times = [];
     $.each( $("#bus_associated tr"), function( i, l ){
       if(i!=0)
       {
       sl_nos.push(i);
       $.each( $(l).children(), function( j, k ){
       if($(k).children(".route_select").length==1)
       {
       route_selects.push($(k).children(".route_select").val());
       }
        if($(k).children(".hour_select").length==1)
       {
       arrival_times.push($(k).children(".hour_select").val()+ ":"+$(k).children(".minute_select").val());
       }
       });
       }
     });
    $.ajax({type: 'POST',url:"/bus_create.aspx",data: {'bus_no':bus_no,'category':category, 'weekday': weekday, 'sl_nos': sl_nos, 'route_selects': route_selects, 'arrival_times': arrival_times},success:function(result){
if(result.toString().trim()[0]==1)
{
window.open("/buses.aspx", "_self");
}
if(result.toString().length>10)
{
$("#ajax_error").html(result);
}
}}); 
    //console_log(fares)
    }
    function console_log(msg)
    {
    console.log(msg);
    }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="hidden">
        <select class="route_select">
            <%for (int i = 0; i <= routes.Rows.Count - 1; i++) %>
            <%{ %>
            <option value="<%= routes.Rows[i][0].ToString().Trim() %>">
                <%= routes.Rows[i][1].ToString().Trim() %></option>
            <%} %>
        </select>
        <select class="hour_select">
            <%for (int i = 0; i <= 23; i++) %>
            <%{ %>
            <option value="<%= i.ToString().Trim() %>">
                <%= i.ToString().Trim() %></option>
            <%} %>
        </select>
        <select class="minute_select">
            <%for (int i = 0; i <= 59; i++) %>
            <%{ %>
            <option value="<%= i.ToString().Trim() %>">
                <%= i.ToString().Trim() %></option>
            <%} %>
        </select>
    </div>
    <asp:UpdatePanel ID="UpdatePanel100" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <% if (err == true) %>
            <%{ %>
            <table class="error">
                <tr>
                    <td>
                        <ul>
                            <%for (int e_i = 0; e_i <= err_text.Count - 1; e_i++) %>
                            <%{ %>
                            <li>
                                <%= err_text[e_i] %></li>
                            <%} %>
                        </ul>
                    </td>
                </tr>
            </table>
            <%} %>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="TabbedPanels1" class="TabbedPanels">
        <ul class="TabbedPanelsTabGroup">
            <li class="TabbedPanelsTab">Bus Creation</li>
            <li class="TabbedPanelsTab">Bus Category</li>
        </ul>
        <div class="TabbedPanelsContentGroup">
            <div class="TabbedPanelsContent">
                <div class="float_left" id="ajax_error">
                
                </div>
                BusNo.<a style="color: Red;">*</a> :
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Bus No"></asp:TextBox><br />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        Category<a style="color: Red;">*</a> :
                        <asp:DropDownList ID="DropDownList1" runat="server">
                        </asp:DropDownList>
                        <br />
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
                <input type="checkbox" id="sun" />Sun
                <input type="checkbox" id="mon" />Mon
                <input type="checkbox" id="tue" />Tue
                <input type="checkbox" id="wed" />Wed
                <input type="checkbox" id="thu" />Thu
                <input type="checkbox" id="fri" />Fri
                <input type="checkbox" id="sat" />Sat
                <br />
                Routes, Time, Fare set
                <hr />
                <table id="bus_associated" border="1">
                    <tr class="head">
                        <td>
                            Sl No.
                        </td>
                        <td>
                            Place Name
                        </td>
                        <td>
                            Time
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
                <a style="color: green; cursor: pointer;" onclick="add_more()">+ Add</a>
            <br />
            <input type="button" value="Save" onclick="save()" />
            </div>
            <div class="TabbedPanelsContent">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        Category Name<a style="color: Red;">*</a> :
                        <asp:TextBox ID="TextBox2" runat="server" placeholder="Category Name"></asp:TextBox><br />
                        <asp:Button ID="Button2" runat="server" Text="Save" OnClick="Button2_Click" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table cellpadding="0" cellspacing="0" border="1">
                <thead>
                    <tr>
                        <td>
                            Bus No.
                        </td>
                        <td>
                        </td>
                    </tr>
                </thead>
                <% Boolean active_started = false; %>
                <% Boolean inactive_started = false; %>
                <% System.Data.DataRow dr;
                   for (int i = 0; i <= buses.Rows.Count - 1; i++)
                   {
                       dr = buses.Rows[i];  %>
                <% if ((dr[1].ToString().Trim() == "0") & (active_started == false))
                   {%>
                <tr>
                    <td colspan="2">
                        <b>Active</b>
                    </td>
                </tr>
                <% active_started = true;
                   } %>
                <% if ((dr[1].ToString().Trim() == "1") & (inactive_started == false))
                   {%>
                <tr>
                    <td colspan="2">
                        <b>Inactive</b>
                    </td>
                </tr>
                <% inactive_started = true;
                   } %>
                <tr>
                    <td>
                        <%=dr[1]%>
                    </td>
                    <td>
                        <% if (dr[1].ToString().Trim() == "1") %>
                        <%{ %>
                        <a href="/route_operation.aspx?req_type=active&req_id=<%= dr[0].ToString().Trim() %>">
                            Active</a>
                        <%} %>
                        <%else %>
                        <%{ %>
                        <a href="/route_operation.aspx?req_type=edit&req_id=<%= dr[0].ToString().Trim() %>">
                            Edit</a> <a href="/route_operation.aspx?req_type=inactive&req_id=<%= dr[0].ToString().Trim() %>">
                                Inactive</a>
                        <%} %>
                    </td>
                </tr>
                <% } %>
            </table>
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>

    <script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
    </script>

</asp:Content>
