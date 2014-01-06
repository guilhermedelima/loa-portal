<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="pt-BR" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Portal LOA - ${selectedEnum.name}</title>
	
	<link rel="shortcut icon" href="<c:url value="/img/favicon.ico" />" type="image/x-icon"/>
	<link rel="stylesheet" href="<c:url value="/css/foundation.css" />" />
	<script type="text/javascript" src="<c:url value="/js/modernizr.js"/>" ></script>
	
	<script type="text/javascript" charset="utf-8" src="<c:url value="/DataTables/media/js/jquery.js" />"></script>
	<script type="text/javascript" charset="utf-8" src="<c:url value="/DataTables/media/js/jquery.dataTables.js" />"></script>
	<script type="text/javascript" charset="utf-8" src="<c:url value="/DataTables/media/js/dataTables.foundation.js" />"></script>
	
	<link rel="stylesheet" href="<c:url value="/DataTables/media/css/dataTables.foundation.css" />" />
	
	<link rel="stylesheet" href="<c:url value="/css/default.css" />" />
		
	<script type="text/javascript"> 
		$(document).ready( function () {
		    $('#table_id').dataTable( {
				 "oLanguage": {
					 "sSearch": "Buscar por",
					 "sLoadingRecords": "Carregando...",
					 "sLengthMenu": "_MENU_ resultados por página",
					 "sZeroRecords": "Não foram encontrados resultados",
					 "sInfoEmpty": "Nenhum resultado a ser exibido",
					 "sInfoFiltered": "(filtrado de _MAX_ registros)",
					 "sInfo": "Mostrando _START_ - _END_ , total de _TOTAL_ resultados"
				 }
			} );
		} );
	</script>
	
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
	         <li><a href="http://orcamento.dados.gov.br/sparql/" class="button">Endpoint - Orçamento Federal</a></li>
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
		<h5>Classificadores</h5>
		<ul class="side-nav">
			<c:forEach items="${enumList}" var="classifierEnum">
				<li class="menu-lateral-classificadores">
					<a href="<c:url value="/classificador/${classifierEnum.id}/2013" />" />${classifierEnum.name}</a>
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
			<h2>Classificador <strong>"${selectedEnum.name}"</strong></h2>
			
			<hr/>
			
			<h4 class="subheader">Conceito orçamentário - ${selectedEnum.name}: </h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur
				tristique lectus felis. Fusce venenatis massa at lacus scelerisque,
				at malesuada metus tristique. Donec pretium sodales neque quis
				posuere. Morbi risus eros, aliquam a aliquam id, tempus vel ipsum.
				Duis lacinia magna vitae consectetur vulputate. Aenean adipiscing,
				dolor in gravida auctor, libero mauris viverra tellus, ut feugiat
				sem felis non nibh. Donec enim nisl, vestibulum nec ornare ac,
				varius non sem. Quisque luctus velit feugiat mattis venenatis.</p>
			
			<hr/>
			
			<h4 class="subheader ">Dados orçamentários - ${selectedEnum.name} (${selectedYear}):</h4>
			<h6 class="subheader"><em><strong>Selecione um exercício</strong></em></h6>
			<dl class="sub-nav">
				<c:forEach items="${loaYears}" var="year">
					<c:choose>
						<c:when test="${year == selectedYear}">
							<dd class="active">
						</c:when>
						<c:otherwise>
							<dd>
						</c:otherwise>
					</c:choose>
								<a href="<c:url value="/classificador/${selectedEnum.id}/${year}"/>" />${year}</a>
							</dd>
				</c:forEach>
			</dl>
			<table id="table_id">
				<thead>
					<tr>
						<th><small>Código</small></th>
						<th><small>Título</small></th>
						<th><small>Valor Projeto Lei</small></th>
						<th><small>Valor Dotação Inicial</small></th>
						<th><small>Lei Mais Crédito</small></th>
						<th><small>Empenhado</small></th>
						<th><small>Liquidado</small></th>
						<th><small>Pago</small></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${classifiersList}" var="classifier">
						<tr>
							<td align="center"><small>${classifier.code}</small></td>
							<td align="left">${classifier.label}
							</th>
							<td align="right"><small><fmt:formatNumber
										value="${classifier.valueProjetoLei}" currencySymbol=""
										type="currency" /></small></td>
							<td align="right"><small><fmt:formatNumber
										value="${classifier.valueDotacaoInicial}" currencySymbol=""
										type="currency" /></small></td>
							<td align="right"><small><fmt:formatNumber
										value="${classifier.valueLeiMaisCredito}" currencySymbol=""
										type="currency" /></small></td>
							<td align="right"><small><fmt:formatNumber
										value="${classifier.valueEmpenhado}" currencySymbol=""
										type="currency" /></small></td>
							<td align="right"><small><fmt:formatNumber
										value="${classifier.valueLiquidado}" currencySymbol=""
										type="currency" /></small></td>
							<td align="right"><small><fmt:formatNumber
										value="${classifier.valuePago}" currencySymbol=""
										type="currency" /></small></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<hr /> 
		</article>
			
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
	          <li><a href="http://www.orcamentofederal.gov.br/">Secretaria de Orçamento Federal</a></li>
	          <li><a href="http://orcamento.dados.gov.br/sparql/">Endpoint</a></li>
	        </ul>
	      </div>
	    </div>
	  </div>
	</footer>
	
</body>
</html>