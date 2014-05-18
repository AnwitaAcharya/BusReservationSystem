<%@ Page Language="C#" MasterPageFile="~/AdminLogInMasterPage.master" AutoEventWireup="true"
    CodeFile="bus_operation.aspx.cs" Inherits="bus_operation" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
    <%if (req_type == "edit") %>
    <%{ %>

    <script type="text/javascript">
    function value_selected(route, arival_time)
    {
    var tr_ar=$("#bus_associated tr");
    if(tr_ar.length>1)
    {
    var tr = $(tr_ar[tr_ar.length - 1]);
    tr.children().children(".route_select").val(route);
    tr.children().children(".hour_select").val(arival_time.split(":")[0]);
    tr.children().children(".minute_select").val(arival_time.split(":")[1]);
    }
    }
    function add_more()
    {
    var route_select = $("#hidden .route_select").html();
    var hour_select = $("#hidden .hour_select").html();
    var minute_select = $("#hidden .minute_select").html();
    $("#bus_associated tr:last").after("<tr><td align='right'>"+ ($("#bus_associated tr").length) +"</td><td align='center'><select class='route_select'>" + route_select + "</select></td><td align='center'><select class='hour_select'>" + hour_select + "</select><select class='minute_select'>" + minute_select + "</select></td><td align='center'><a class='delete' onclick='delete_row(this)'>X</a></td></tr>")
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
    $.ajax({type: 'POST',url:"/bus_create.aspx?id=<%= req_id %>",data: {'bus_no':bus_no,'category':category, 'weekday': weekday, 'sl_nos': sl_nos, 'route_selects': route_selects, 'arrival_times': arrival_times},success:function(result){
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
    <div class="float_left" id="ajax_error">
                </div>
    <table>
        <tr>
            <td>
                BusNo.<a style="color: Red;">*</a> :
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Bus No"></asp:TextBox><br />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr class="label-underline">
            </td>
        </tr>
        <tr>
            <td>
                Category<a style="color: Red;">*</a> :
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                        </asp:DropDownList>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr class="label-underline">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <%if (bus.Rows[0][4].ToString().Trim().Contains("1"))%>
                <% { %>
                <input type="checkbox" id="sun" checked="checked" />Sun
                <% } %>
                <% else %>
                <% { %>
                <input type="checkbox" id="sun" />Sun
                <% } %>
                <%if (bus.Rows[0][4].ToString().Trim().Contains("2"))%>
                <% { %>
                <input type="checkbox" id="mon" checked="checked" />Mon
                <% } %>
                <% else %>
                <% { %>
                <input type="checkbox" id="mon" />Mon
                <% } %>
                <%if (bus.Rows[0][4].ToString().Trim().Contains("3"))%>
                <% { %>
                <input type="checkbox" id="tue" checked="checked" />Tue
                <% } %>
                <% else %>
                <% { %>
                <input type="checkbox" id="tue" />Tue
                <% } %>
                <%if (bus.Rows[0][4].ToString().Trim().Contains("4"))%>
                <% { %>
                <input type="checkbox" id="wed" checked="checked" />Wed
                <% } %>
                <% else %>
                <% { %>
                <input type="checkbox" id="wed" />Wed
                <% } %>
                <%if (bus.Rows[0][4].ToString().Trim().Contains("5"))%>
                <% { %>
                <input type="checkbox" id="thu" checked="checked" />Thu
                <% } %>
                <% else %>
                <% { %>
                <input type="checkbox" id="thu" />Thu
                <% } %>
                <%if (bus.Rows[0][4].ToString().Trim().Contains("6"))%>
                <% { %>
                <input type="checkbox" id="fri" checked="checked" />Fri
                <% } %>
                <% else %>
                <% { %>
                <input type="checkbox" id="fri" />Fri
                <% } %>
                <%if (bus.Rows[0][4].ToString().Trim().Contains("7"))%>
                <% { %>
                <input type="checkbox" id="sat" checked="checked" />Sat
                <% } %>
                <% else %>
                <% { %>
                <input type="checkbox" id="sat" />Sat
                <% } %>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr class="label-underline">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                Routes, Time, Fare set
                <hr />
                <table id="bus_associated" border="1">
                    <tr class="head">
                        <td style="width: 50px; overflow: hidden;">
                            Sl No.
                        </td>
                        <td style="width: 120px; overflow: hidden;">
                            Place Name
                        </td>
                        <td style="width: 100px; overflow: hidden;">
                            Time
                        </td>
                        <td style="width: 20px; overflow: hidden;">
                        </td>
                    </tr>
                </table>
                <a style="color: green; cursor: pointer; float: right;" onclick="add_more()">+ Add</a>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr class="label-underline">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <input type="button" value="Save" class="submit_button" onclick="save()" />
            </td>
        </tr>
    </table>
    <%for (int i = 0; i < bus_details.Rows.Count; i++) %>
    <% { %>

    <script type="text/javascript">
                    add_more();
                    value_selected('<%= bus_details.Rows[i][3].ToString().Trim()%>','<%= bus_details.Rows[i][4].ToString().Trim()%>');
    </script>

    <% } %>
    <%} %>
</asp:Content>
