﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bus_create.aspx.cs" Inherits="bus_create" %>

<% if (err == true) %>
<%{ %>
<div class="error">
    <ul>
        <%for (int e_i = 0; e_i <= err_text.Count - 1; e_i++) %>
        <%{ %>
        <li>
            <%= err_text[e_i] %></li>
        <%} %>
    </ul>
</div>
<%} %>
&nbsp;