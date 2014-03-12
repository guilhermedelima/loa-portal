<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Portal LOA - Início</title>

<link rel="shortcut icon" href="<c:url value="/img/favicon.ico" />" type="image/x-icon"/>
<link rel="stylesheet" href="<c:url value="/css/foundation.css" />" />
<script type="text/javascript" src="<c:url value="/js/modernizr.js"/>"></script>

<link rel="stylesheet" href="<c:url value="/css/default.css" />" />

</head>

<body>
	<div id="container">
		<!-- Nav Bar -->
	    <div id="header" style="background-color:#00500F">
			<div id="barra-brasil">
				<div class="barra">
					<ul>
						<li><a title="Acesso Ã  informação" class="ai"
							href="http://www.acessoainformacao.gov.br">www.sic.gov.br</a></li>
						<li><a title="Portal de Estado do Brasil" class="brasilgov"
							href="http://www.brasil.gov.br">www.brasil.gov.br</a></li>
					</ul>
				</div>
			</div>
		</div>
		</br></br>
		<!-- End Nav --> 

		<!-- Main Page Content and Sidebar -->
		<div class="row">

			<!-- Main Blog Content -->
			<div class="large-12 columns" role="content">
				<article>
				
					<c:choose>
						<c:when test="${errorCode eq 500}">
							<h3>
								<a href="#">Erro Interno do Servidor - Erro 500</a>
							</h3>
							<c:if test="${not empty errorMessage}">
								<div class="alert-box warning round">
				       				${errorMessage}
				       			</div>
				       		</c:if>
						</c:when>
						<c:otherwise>
							<h3>
								<a href="#">Página não encontrada - Erro 404</a>
							</h3>
						</c:otherwise>
					</c:choose>

					</br></br>
					<a href="#" class="button" onclick="history.go(-1); return false;">Voltar</a>
				</article>
				<hr />
			</div>
			<!-- End Main Content -->
		</div>
		<!-- End Main Content and Sidebar -->
		<div id="push"></div>
	</div>

	<!-- Footer -->
	<footer class="row">
	  <div class="large-12 columns">
	    <hr />
	    <div class="row">
	      <div class="large-6 columns">
	        <p>© Copyright.</p>
	      </div>
	    </div>
	  </div>
	</footer>

</body>
</html>