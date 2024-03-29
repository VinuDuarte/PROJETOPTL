
<%@page import="model.ProdutoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Produto"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
      <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="datatables/jquery.dataTables.min.css"/>
        <link rel="stylesheet" href="estilo/EstiloPadrao.css"/>
      
       
        <script type="text/javascript"> 
            function confirmarExclusao(id,nome){
                if(confirm('Deseja realmente excluir o Produto: ' + nome+ '?')){
                    location.href='gerenciar_produto.do?acao=deletar&idProduto='+id;
                }
            }
             function confirmarVenda(id,nome){
                if(confirm('Deseja realmente Vender o Produto: ' + nome+ '?')){
                    location.href='gerenciar_produto.do?acao=vender&idProduto='+id;
                }
            }
        
        </script>
       
        <title>Lista de Produtos</title>
    </head>
    <body>
        <div class="container-fluid">
             <%@include     file="fundoCima.jsp"  %>
            <%@include     file="menu.jsp"  %>
           
            
            <h1>Lista de Produtos  </h1>
            
            <a href="form_produto.jsp" class="btn btn-primary" id="novo">Novo Produto</a>
            <table class="table table-hover table-striped table-bordered display" id="listarProduto">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome </th>
                    <th>Marca</th>
                    <th>Tamanho</th>
                    <th>Preco</th>
                    <th>Imagem</th>
                    <th>Status</th>
                    <th>Quantidade</th>
                    <th>Fornecedor</th>
                    <th>Opções</th>
                </tr>
                </thead>
                <tfoot>
               <tr>
                    <th>ID</th>
                    <th>Nome </th>
                    <th>Marca</th>
                    <th>Tamanho</th>
                    <th>Preco</th>
                    <th>Imagem</th>
                    <th>Status</th>
                    <th>Quantidade</th>
                    <th>Fornecedor</th>
                    <th>Opções</th>
              </tr>
                </tfoot>
             
                
                <jsp:useBean class="model.ProdutoDAO" id="pDAO"/> <!-- Criando um perfil com jstl-->
                <tbody>
                <c:forEach var="p" items="${pDAO.lista}">
                
                    <tr>
                    <td>${p.idProduto}</td> <!-- Imprimir a lista pesquisada -->
                    <td>${p.nome}</td>
                    <td>${p.marca}</td>
                    <td>${p.tamanho}</td>
                    <td>${p.preco}</td>
                    <td><img src="${p.imagem}" width="40px" height="40px" /></td>
                    <td>
                        <c:if test="${p.status==1}">
                            <P style="color: blue;font-weight: bolder">Disponível</P
                        </c:if>
                         
                          
                            
                                 <c:if test="${p.status==3}">
                                     <P style="color: red;font-weight: bolder">Em Falta</P
                            </c:if> 
                                       
                        </td>        
                        <td>${p.qntd}</td>
                     <td>${p.fornecedor.nome}</td>
                    <td>
                        <a class="btn btn-primary" style="background-color: gold; border-color: gold;"  
                           href="gerenciar_produto.do?acao=visualizar&idProduto=${p.idProduto}">  <!-- ELEMNTOS DO BOOTSTRAP-->
                            <i class="glyphicon glyphicon-eye-open" ></i>
                        </a>
                        
                        <a class="btn btn-primary" href="gerenciar_produto.do?acao=alterar&idProduto=${p.idProduto}">  <!-- ELEMNTOS DO BOOTSTRAP-->
                            <i class="glyphicon glyphicon-edit" ></i>
                        </a>
                            
                                              
                            <button class="btn btn-danger" onclick="confirmarExclusao(${p.idProduto},'${p.nome}')">
                        <i class="glyphicon glyphicon-trash"> </i>
                        </button>
                    </td>
                </tr>
                </c:forEach> <!-- FIM DO JSTL-->
                </tbody>
            </table>
            
                <script type="text/javascript" src="datatables/jquery.js"> </script> <!-- TRADUÇÃO DAS DATATABLES-->
                <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
                <script type="text/javascript">
                    $(document).ready(function(){
                        $("#listarProduto").dataTable({
                            "bJQueryUI":true,
                            "oLanguage":{
                                "sProcessing":"Processando...",
                                "sLengthMenu":"Mostrar _MENU_ registros",
                                "sZeroRecords":"Não foram encontrados resultados",
                                "sInfo":"Mostrar de _START_ até _END_ de _TOTAL_ registros",
                                "sInfoEmpty":"Mostrando de 0 até 0 de 0 registros",
                                "sInfoFiltered":"",
                                "sInfoPostFix":"",
                                "sSearch":"Pesquisar",
                                "sUrl":"",
                                "oPaginate":{
                                    "sFirst":"Primeiro",
                                    "sPrevious":"Anterior ",
                                    "sNext":" Próximo",
                                    "sLast":"Último"
                                }
                            }
                        
                        }
                      )
                    }
                    )
                   </script>
        </div>
    </body>
</html>
