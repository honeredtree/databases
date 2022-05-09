<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="project.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe - Place Bid</title>
    <link rel="stylesheet" href="style.css?v=1.0"/>
</head>
<body>
	<%
	String bidder = request.getParameter("bidder");
	int productId = Integer.parseInt(request.getParameter("productId"));
	boolean isStartingBid = Boolean.parseBoolean(request.getParameter("isStartingBid"));
	Locale locale = new Locale("en", "US");
	NumberFormat currency = NumberFormat.getCurrencyInstance(locale);
	float price = Float.parseFloat(request.getParameter("price"));
	float minPrice = Float.parseFloat(request.getParameter("minPrice"));
	
	%>
	<%@ include file="navbar.jsp" %>
	<form action="bidHandler.jsp?bidder=<%= bidder %>&productId=<%= productId %>&isStartingBid=<%= isStartingBid %>" method="POST" class="place-bid-form">
		<% if (isStartingBid) { %>
			
			<label for="bidAmount">Bid <%= currency.format(price) %> or higher</label><br>
			<input type="number" step="0.01" name="bid" placeholder="Enter bid" min="<%= price %>" max="100000000.01" id="bidAmount" required>
		<% } else { %>
			<label for="bidAmount">Bid higher than <%= currency.format(price) %></label><br>
			<input type="number" step="0.01" name="bid" placeholder="Enter bid" min="<%= minPrice %>" max="100000000.01" id="bidAmount" required>
		<% } %>
		<input type="submit" value="Place bid">
		</form>

</body>
</html>