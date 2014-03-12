<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="pt-BR" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Portal LOA</title>
	
	<link rel="shortcut icon" href="<c:url value="/img/favicon.ico" />" type="image/x-icon"/>
	<link rel="stylesheet" href="<c:url value="/css/foundation.css" />" />
	<link rel="stylesheet" href="<c:url value="/DataTables/media/css/dataTables.foundation.css" />" />
	<link rel="stylesheet" href="<c:url value="/css/default.css" />" />
		
	<script type="text/javascript" charset="utf-8" src="<c:url value="/DataTables/media/js/jquery.js" />"></script>
	<script type="text/javascript" charset="utf-8" src="<c:url value="/DataTables/media/js/jquery.dataTables.js" />"></script>
	<script type="text/javascript" charset="utf-8" src="<c:url value="/DataTables/media/js/dataTables.foundation.js" />"></script>
	<script type="text/javascript" src="<c:url value="/js/modernizr.js"/>" ></script>	
		
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
		    
			$('#table_id').show();
		});

		$(function(){
			$("[id^=button]").click(function(){
				var year = $(this).text();
				$('input[name="year"]').val(year);

				$("form").submit();								
			});
		});				
	</script>
	
</head>

<body>
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
			<h2><strong>Consulta Personalizada</strong></h2>
			<hr/>
			
			<form id="form" action="<c:url value="/classificadores/busca"/>" method="post">
				<input type="hidden" name="year" value="">
				<c:forEach items="${selectedEnumList}" var="classifier">
					<input type="hidden" name="idList[]" value="${classifier.id}">
				</c:forEach>
			</form>
			
			<h6 class="subheader"><em><strong>Classificadores selecionados</strong></em></h6>
			<ul class="inline-list">
				<c:forEach items="${selectedEnumList}" var="selectedClassifier">
					<li><a href="<c:url value="/classificador/${selectedClassifier.id}/2013" />" >${selectedClassifier.name}</a></li>
				</c:forEach>
			</ul>
			
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
								<a id="button${year}">${year}</a>
							</dd>
				</c:forEach>
			</dl>
			<table id="table_id" style="display: none;">
				<thead>
					<tr>
						<c:forEach items="${selectedEnumList}" var="classifier">
							<th><small>Código ${classifier.name}</small></th>
							<th><small>${classifier.name}</small></th>
						</c:forEach>
 						<th><small>Valor Projeto Lei</small></th>
  						<th><small>Valor Dotação Inicial</small></th>
 						<th><small>Lei Mais Crédito</small></th>
 						<th><small>Empenhado</small></th>
 						<th><small>Liquidado</small></th>
 						<th><small>Pago</small></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${itemList}" var="item">
						<tr>
							<c:forEach items="${item.classifierList}" var="classifier">
								<td align="center"><small>${classifier.code}</small></td>
								<td align="left">${classifier.label}</td>
							</c:forEach>
 							<td align="right"><small><fmt:formatNumber
 										value="${item.valueProjetoLei}" currencySymbol=""
 										type="currency" /></small></td>
							<td align="right"><small><fmt:formatNumber
										value="${item.valueDotacaoInicial}" currencySymbol=""
										type="currency" /></small></td>
							<td align="right"><small><fmt:formatNumber
 										value="${item.valueLeiMaisCredito}" currencySymbol=""
 										type="currency" /></small></td>
 							<td align="right"><small><fmt:formatNumber
 										value="${item.valueEmpenhado}" currencySymbol=""
 										type="currency" /></small></td>
 							<td align="right"><small><fmt:formatNumber
 										value="${item.valueLiquidado}" currencySymbol=""
 										type="currency" /></small></td>
 							<td align="right"><small><fmt:formatNumber
 										value="${item.valuePago}" currencySymbol=""
 										type="currency" /></small></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<a class="button" onclick="history.go(-1); return false;">Voltar</a>
			
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
	    </div>
	  </div>
	</footer>
	
</body>
</html>