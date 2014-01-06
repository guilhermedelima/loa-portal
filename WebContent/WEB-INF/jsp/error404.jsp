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
		<div class="row">
			<div class="large-12 columns">
				<div class="nav-bar right">
					<ul class="button-group">
						<li><a href="<c:url value="/" />" class="button">Início</a></li>
						<li><a href="http://www.orcamentofederal.gov.br/"
							class="button">Secretaria de Orçamento Federal</a></li>
						<li><a href="http://orcamento.dados.gov.br/sparql/"
							class="button">Endpoint - Orçamento Federal</a></li>
					</ul>
				</div>
				<h1>Portal LOA <img src="<c:url value="/img/moeda.png" />" /></h1>
				<hr />
			</div> 
		</div>
		<!-- End Nav --> 

		<!-- Main Page Content and Sidebar -->
		<div class="row">

			<!-- Sidebar -->
			<aside class="large-2 columns">
			<ul class="side-nav">
				<c:forEach items="${enumList}" var="classifierEnum">
					<li class="menu-lateral-classificadores">
						<a href="<c:url value="/classificadores/${classifierEnum.id}/2013" />${classifierEnum.name}</a>
					</li>
					<li class="divider"></li>
				</c:forEach>
			</ul>
			<div class="panel">
				<h5>Orçamento Federal</h5>
				<p>O orçamento da União pode ser representado como uma lista de
					itens de despesa. A cada item desta lista estão associados valores
					financeiros que correspondem aos diversos estágios da execução
					orçamentária.</p>
				<a href="http://www.orcamentofederal.gov.br/informacoes-orcamentarias/manual-tecnico/MTO_2014.pdf">Leia Mais →</a>
			</div>
			</aside>
			<!-- End Sidebar -->


			<!-- Main Blog Content -->
			<div class="large-10 columns" role="content">

				<article>
				<h3>
					<a href="#">Página não encontrada - Erro 404</a>
				</h3>
				<a href="#" class="button" onclick="history.go(-1);">Voltar</a>
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
			<div class="large-6 columns">
				<ul class="inline-list right">
					<li><a href="<c:url value="/" />">Início</a></li>
					<li><a href="http://www.orcamentofederal.gov.br/">Secretaria de Orçamento Federal</a></li>
					<li><a href="http://orcamento.dados.gov.br/sparql/">Endpoint</a></li>
				</ul>
			</div>
		</div>
	</div>
	</footer>

</body>
</html>