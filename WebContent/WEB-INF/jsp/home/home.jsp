<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Loa - Home</title>
	
	<link rel="stylesheet" href="<c:url value="/css/foundation.css" />" />
	<script type="text/javascript" src="<c:url value="/js/modernizr.js"/>" ></script>
	
	<script type="text/javascript" charset="utf-8" src="<c:url value="/DataTables/media/js/jquery.js" />"></script>
	<script type="text/javascript" charset="utf-8" src="<c:url value="/DataTables/media/js/jquery.dataTables.js" />"></script>
	<script type="text/javascript" charset="utf-8" src="<c:url value="/DataTables/media/js/dataTables.foundation.js" />"></script>
	
	<style type="text/css" title="currentStyle">
   		@import "<c:url value="/DataTables/media/css/dataTables.foundation.css" />";
	</style>
	
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
	       	 <li><a href="<c:url value="/" />" class="button">Home</a></li>
	         <li><a href="https://www.siop.planejamento.gov.br/siop/" class="button">Ministério do Planejamento</a></li>
	         <li><a href="http://orcamento.dados.gov.br/sparql/" class="button">Endpoint - Orçamento Federal</a></li>
	        </ul>
	      </div>
	      <h1>Portal LOA</h1>
	      <hr />
	    </div>
	</div>
	<!-- End Nav -->
 	
	<!-- Main Page Content and Sidebar -->
	<div class="row">

		<!-- Sidebar -->
	   <aside class="large-3 columns">
	     <h5>Classificadores</h5>
		     <ul class="side-nav">
		       <c:forEach items="${enumList}" var="classifierEnum">
		       		<li>
		       			<form id="form${classifierEnum.name}" method="post" action="<c:url value="/searchClassifier"/>">
			       			<input type="hidden" name="enumType" value="${classifierEnum}"/>
			       			<input type="hidden" name="year" value="2013"/>
		       			</form>
		       			<a onclick="document.getElementById('form${classifierEnum.name}').submit(); return false" >${classifierEnum.name}</a>
		       		</li>
		       </c:forEach>
		     </ul>	     
	     <div class="panel">
	       <h5>Orçamento Federal</h5>
	       <p>O orçamento da União pode ser representado como uma lista de itens de despesa. A cada item desta lista estão associados valores financeiros que correspondem aos diversos estágios da execução orçamentária.</p>
	       <a href="http://vocab.e.gov.br/2013/09/loa">Leia Mais →</a>
	     </div>
	   </aside>
	   <!-- End Sidebar -->
	
	
	
	
	   <!-- Main Blog Content -->
	   <div class="large-9 columns" role="content">
	 	<c:choose>
	 		<c:when test="${empty classifiersList}">
		 		<article>
			       <h3><a href="#">Orçamento em RDF</a></h3>
			       <br></br>

			       <div class="row">
			         <div class="large-6 columns">
			           <p>Um movimento no campo democrático, em escala mundial, vem afetando positivamente a administração pública nos últimos tempos. Trata-se dos esforços em atender à maior demanda por transparência e pelo acesso às informações de interesse geral por parte do cidadão, produzidas pelo governo.</p>
			         </div>
			         <div class="large-6 columns">
			           <img width="400" height="500" src="<c:url value="/img/ontologia-da-despesa.png" />" />
			         </div>
			       </div>
			       <p>Como parte destes esforços a Secretaria apresenta neste espaço um portal que exibe para o público os dados da despesa do Orçamento Geral da União no período de 2000 a 2013, no padrão de dados abertos definido pelo consórcio nacional formado para definir os padrões mundiais de internet – W3C, o RDF – Resource Description Framework.</p>
			     </article>
	 		</c:when>
	 		<c:otherwise>
	 			<article>
			       <h3><a href="#">${selectedEnum.name} - ${selectedYear}</a></h3>
			       <h6>Selecione o Exercício</h6>
			       <dl class="sub-nav">
			       		<c:forEach items="${loaYears}" var="year">
			       			<form id="form${year}" method="post" action="<c:url value="/searchClassifier"/>">
			       				<input type="hidden" name="enumType" value="${selectedEnum}"/>
			       				<input type="hidden" name="year" value="${year}"/>
			       			</form>
			       			<c:choose>
			       				<c:when test="${year == selectedYear}">
			       					<dd class="active"><a onclick="document.getElementById('form${year}').submit() ; return false">${year}</a></dd>
			       				</c:when>
			       				<c:otherwise>
			       					<dd><a onclick="document.getElementById('form${year}').submit() ; return false">${year}</a></dd>
			       				</c:otherwise>
			       			</c:choose>
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
			       					<th align="center"><small>${classifier.code}</small></th>
			       					<th align="left"><small>${classifier.label}</small></th>
			       					<th align="right"><small>${classifier.valueProjetoLei}</small></th>
			       					<th align="right"><small>${classifier.valueDotacaoInicial}</small></th>
			       					<th align="right"><small>${classifier.valueLeiMaisCredito}</small></th>
			       					<th align="right"><small>${classifier.valueEmpenhado}</small></th>
			       					<th align="right"><small>${classifier.valueLiquidado}</small></th>
			       					<th align="right"><small>${classifier.valuePago}</small></th>
			       				</tr>
					       </c:forEach>
			      		</tbody>
		       		</table>
			     </article>
	 		</c:otherwise>
	 	</c:choose>
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
	        <p>© Copyright no one at all. Go to town.</p>
	      </div>
	      <div class="large-6 columns">
	        <ul class="inline-list right">
	          <li><a href="<c:url value="/" />">Home</a></li>
	          <li><a href="https://www.siop.planejamento.gov.br/siop/">Ministério do Planejamento</a></li>
	          <li><a href="http://orcamento.dados.gov.br/sparql/">Endpoint</a></li>
	        </ul>
	      </div>
	    </div>
	  </div>
	</footer>
	
</body>
</html>