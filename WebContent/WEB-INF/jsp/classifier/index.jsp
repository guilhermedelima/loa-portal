<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Portal LOA - Início</title>

<link rel="shortcut icon" href="<c:url value="/img/favicon.ico" />"
	type="image/x-icon" />
<link rel="stylesheet" href="<c:url value="/css/foundation.css" />" />
<script type="text/javascript" src="<c:url value="/js/modernizr.js"/>"></script>

<link rel="stylesheet" href="<c:url value="/css/default.css" />" />

</head>

<body>
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
			<h1>
				Portal LOA <img src="<c:url value="/img/moeda.png" />" />
			</h1>
			<hr />
		</div>
	</div>
	<!-- End Nav -->

	<!-- Main Page Content and Sidebar -->
	<div class="row">
		<!-- Sidebar -->
		<aside class="large-2 columns">
		<h5>Classificadores</h5>
		<ul class="side-nav">
			<c:forEach items="${enumList}" var="classifierEnum">
				<li class="menu-lateral-classificadores"><a
					href="<c:url value="/classificador/${classifierEnum.id}/2013" />" />${classifierEnum.name}</a>
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
			<a
				href="http://www.orcamentofederal.gov.br/informacoes-orcamentarias/manual-tecnico/MTO_2014.pdf">Leia
				Mais →</a>
		</div>
		</aside>
		<!-- End Sidebar -->

		<!-- Main Blog Content -->
		<div class="large-10 columns" role="content">
			<article> 
			<c:forEach items="${errors}" var="error">
				<div class="alert-box warning round">${error.message}</div>
				<hr />
			</c:forEach>
			
			<h2>
				<strong>Lei Orçamentária Anual - LOA</strong>
			</h2>

			<p>Lei de Natureza Especial - em razão do seu objeto e da forma
				peculiar de tramitação que lhe é definida pela Constituição -, por
				meio da qual são previstas as receitas, autorizadas as despesas
				públicas, explicitados a política econômica financeira e o programa
				de trabalho do Governo e definidos os mecanismos de flexibilidade
				que a Administração fica autorizada a utilizar. A LOA deriva de
				projeto (PLOA) formalmente remetido à deliberação do Legislativo
				pelo chefe do Poder Executivo, apreciado pelo Parlamento segundo a
				sistemática definida pela Constituição Federal, possuindo a
				estrutura e nível de detalhamento definido pela Lei de Diretrizes
				Orçamentárias do exercício.</p>

			<h3 class="subheader">Orçamento em formato aberto (RDF)</h3>
			<p>Um movimento no campo democrático, em escala mundial, vem
				afetando positivamente a administração pública nos últimos tempos.
				Trata-se dos esforços em atender à maior demanda por transparência e
				pelo acesso às informações de interesse geral por parte do cidadão,
				produzidas pelo governo. Este movimento ensejou, aqui no Brasil, o
				Plano de Ação Nacional sobre Governo Aberto (Decreto de 15 de
				setembro de 2011) e a assinatura da Parceira para Governo Aberto
				(PGA), firmada inicialmente entre oito países e copresidida pelo
				Brasil e pelos Estados Unidos.</p>
			<p>Neste sentido, a estratégia adotada no projeto “Orçamento
				Federal em Formato Aberto” foi criar uma ontologia da classificação
				da despesa do orçamento federal, contemplando as categorias e
				conceitos sedimentados no Manual Técnico do Orçamento 2013 - MTO
				2013 (Brasil, 2013).</p>
			<p>O trabalho é dirigido à comunidade de desenvolvedores, que
				poderá utilizá-lo para criar produtos voltados para a comunidade dos
				técnicos em finanças públicas, bem como para os cidadãos comuns,
				destinatários finais desses esforços. Nesse contexto, a ontologia
				provê a explicitação formal dos conceitos orçamentários da despesa
				pública e viabiliza o tratamento automatizado dos dados. Para obter
				todo o potencial deste manual é recomendado o conhecimento prévio
				das tecnologias RDF - Resource Description Framework e OWL –
				Ontology Web Language.</p>
			<img src="<c:url value="/img/ontologia-da-despesa.png" />" /> </article>
			<hr />
		</div>
		<!-- End Main Content -->
	</div>
	<!-- End Main Content and Sidebar -->


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
					<li><a href="http://www.orcamentofederal.gov.br/">Secretaria
							de Orçamento Federal</a></li>
					<li><a href="http://orcamento.dados.gov.br/sparql/">Endpoint</a></li>
				</ul>
			</div>
		</div>
	</div>
	</footer>

</body>
</html>