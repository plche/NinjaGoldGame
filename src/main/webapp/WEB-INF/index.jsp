<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Ninja Gold Game</title>
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
		<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="container col-10 offset-1">
			<div class="row justify-content-between">
				<div class="col">
					<div class="row row-cols-auto">
						<div class="col mt-4">
							<h1>Your Gold:</h1>
						</div>
						<div class="col border border-2 border-dark my-3">
							<c:if test="${goldCount lt 0}">
								<span class="fs-1 text-danger"><c:out value="${goldCount}"/></span>
							</c:if>
							<c:if test="${goldCount eq 0}">
								<span class="fs-1 text-dark"><c:out value="${goldCount}"/></span>
							</c:if>
							<c:if test="${goldCount gt 0}">
								<span class="fs-1 text-success"><c:out value="${goldCount}"/></span>
							</c:if>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="d-flex justify-content-end">
						<div class="d-flex justify-content-end">
							<form action="/Gold/Reboot" method="post">
								<button class="btn btn-danger border border-2 border-dark fw-bolder mt-4">Reboot</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-3">
				    <div class="card border border-2 border-dark text-center">
					    <div class="card-body">
						    <h5 class="card-title">Farm</h5>
						    <p class="card-text">(earns 10-20 gold)</p>
						    <form action="/Gold" method="post">
						    	<input type="hidden" name="farm" value="1"/>
						    	<input type="hidden" name="cave" value="0"/>
						    	<input type="hidden" name="house" value="0"/>
						    	<input type="hidden" name="casino" value="0"/>
								<button class="btn btn-warning btn-sm border border-2 border-dark fw-bolder">Find Gold!</button>
						    </form>
					    </div>
				    </div>
				</div>
				<div class="col-sm-3">
					<div class="card border border-2 border-dark text-center">
				    	<div class="card-body">
					    	<h5 class="card-title">Cave</h5>
					    	<p class="card-text">(earns 5-10 gold)</p>
					    	<form action="/Gold" method="post">
						    	<input type="hidden" name="farm" value="0"/>
						    	<input type="hidden" name="cave" value="1"/>
						    	<input type="hidden" name="house" value="0"/>
						    	<input type="hidden" name="casino" value="0"/>
								<button class="btn btn-warning btn-sm border border-2 border-dark fw-bolder">Find Gold!</button>
						    </form>
				    	</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="card border border-2 border-dark text-center">
						<div class="card-body">
						    <h5 class="card-title">House</h5>
						    <p class="card-text">(earns 2-5 gold)</p>
						    <form action="/Gold" method="post">
						    	<input type="hidden" name="farm" value="0"/>
						    	<input type="hidden" name="cave" value="0"/>
						    	<input type="hidden" name="house" value="1"/>
						    	<input type="hidden" name="casino" value="0"/>
								<button class="btn btn-warning btn-sm border border-2 border-dark fw-bolder">Find Gold!</button>
						    </form>
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="card border border-2 border-dark text-center">
						<div class="card-body">
							<h5 class="card-title">Casino!</h5>
							<p class="card-text">(earns/takes 0-50 gold)</p>
							<form action="/Gold" method="post">
						    	<input type="hidden" name="farm" value="0"/>
						    	<input type="hidden" name="cave" value="0"/>
						    	<input type="hidden" name="house" value="0"/>
						    	<input type="hidden" name="casino" value="1"/>
								<button class="btn btn-warning btn-sm border border-2 border-dark fw-bolder">Find Gold!</button>
						    </form>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<h2>Activities:</h2>
				<div class="row border border-2 border-dark">
					<ul class="list-group">
						<c:forEach var="activity" items="${activitiesList}">
							<li class="list-group-item list-group-item-<c:out value="${activity.getEarnOrTake()}"/>"><c:out value="${activity.getText()}"/></li>
						</c:forEach>
					</ul>				
				</div>
			</div>
		</div>
	</body>
</html>