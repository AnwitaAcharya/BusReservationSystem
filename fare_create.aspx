<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fare_create.aspx.cs" Inherits="fare_create" %>

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
&nbsp;