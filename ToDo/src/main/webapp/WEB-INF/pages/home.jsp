<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@page isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title><c:out value='${page }'></c:out></title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
  <a class="navbar-brand text-white font-weight-bold" href="#">ToDoIt!</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link" href='<c:url value='/home'></c:url>'>Home <span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link" href='<c:url value='/add'></c:url>'>Add ToDo Task</a>
      <a class="nav-item nav-link" href='<c:url value='/home'></c:url>'>View All ToDo Tasks</a>
<!--       <a class="nav-item nav-link disabled" href="#">Disabled</a> -->
    </div>
  </div>
</nav>
	<div class="container mt-4">
<!-- 		<h2 class="text-center">Welcome to ToDo Manager</h2> -->
		
		<c:if test="${not empty delmsg}">
		<div class="alert alert-success">
		<b><c:out value="${delmsg}"></c:out></b>
		</div>
		</c:if>
		
		<div class="row">
<!-- 			<div class="col-md-4"> -->
<!-- 				<h4 class="text-center">Options</h4> -->
<!-- 				<div class="list-group"> -->
<!-- 					<button type="button" -->
<!-- 						class="list-group-item list-group-item-action active"> -->
<!-- 						Menu</button> -->
<%-- 					<a href='<c:url value='/add'></c:url>' --%>
<!-- 						class="list-group-item list-group-item-action">Add Todo</a> -->
<%-- 					<a href='<c:url value='/home'></c:url>' --%>
<!-- 						class="list-group-item list-group-item-action">View ToDo</a> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="col-md-8">
<!-- 				<h4 class="text-center">Content</h4> -->
				
				<c:if test="${page=='Add' }">
					<h4>Add ToDo</h4>
					<form:form action='saveToDo' method="post" modelAttribute="todo">
					<div class='form-group'>
						<form:input path="todoTitle" cssClass='form-control' placeholder='Enter task title' required="true"/>
					</div>
					<div class='form-group'>
						<form:textarea path="todoContent" cssClass='form-control' placeholder='Enter task description' required="true" cssStyle="height:200px"/>
					</div>
					<div class="container">
					<button class="btn btn-outline-success">Add</button>
					</div>
					</form:form>
				</c:if>
<%-- 				<c:if test="${page=='Update' }"> --%>
<!-- 				<div class='container'> -->
<%-- 				<form:form action='updateToDo' method="post" modelAttribute="todo"> --%>
<%-- 					<c:set var="to" value="${todoObj }"></c:set> --%>
<!-- 					<div class='form-group'> -->
<%-- 						<form:input path="todoTitle" cssClass='form-control' required="true"/> --%>
<!-- 					</div> -->
<!-- 					<div class='form-group'> -->
<%-- 						<form:textarea path="todoContent" cssClass='form-control' required="true" cssStyle="height:200px"/> --%>
<!-- 					</div> -->
<!-- 					<div class="container"> -->
<!-- 					<button class="btn btn-outline-success">Add</button> -->
<!-- 					</div> -->
<%--  					<input type="hidden" name="todoId" value="${todo.todoId }">  --%>
<%-- 					</form:form> --%>
<!-- 					</div> -->
<%-- 				</c:if> --%>
				<c:if test="${page=='Home' }">
				<c:if test="${not empty msg}">
		<div class="alert alert-success">
		<b><c:out value="${msg}"></c:out></b>
		</div>
		</c:if>
					<c:if test="${empty todos}">
		<div class="alert alert-success">
		<b><c:out value="You have completed all the tasks!"></c:out>
		<a class="nav-item nav-link" href='<c:url value='/add'></c:url>'>Click here to add tasks</a></b>
		</div>
		</c:if>
					<c:forEach items="${todos }" var="t">
					
					<div class="card w-200">
					<div class="card-body">
					<h3><c:out value="${t.todoTitle }"></c:out></h3>
					<p><c:out value="${t.todoContent }"></c:out></p>
					<div class="container">
					<form:form action="deleteToDo/todoId" method="post" modelAttribute="todo">
					<input type="hidden" name="todoId" value="${t.todoId}">
					<button class="btn btn-outline-danger" name = "deletebtn">Delete</button>
					</form:form>
					<form:form action="updatepage/todoId" method="post" modelAttribute="todo">
					<input type="hidden" name="todoId" value="${t.todoId}">
					<button class="btn btn-outline-success" name = "editbtn">Edit</button>
					</form:form>
					</div>
  					</div>
					</div>
					
					</c:forEach>
					<c:if test="${not empty todos}">
					<h2><a href='<c:url value='/add'></c:url>' class="badge badge-success">Add More</a></h2>
					</c:if>
				</c:if>
				</div>
		</div>
	</div>
	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>