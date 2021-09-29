<%@ include file="/WEB-INF/views/common/taglib.jsp" %>
<html>
<head>
<jsp:include page="/WEB-INF/views/masters/masterHeader.jsp"/>
<script src="<c:url value="/js/common/dataTable.js" />"></script>
<script src="<c:url value="/js/masters/productMappingCreate.js" />"></script>
</head>
<body>

<div class="shiftMargin" >
<form:form modelAttribute="brand" method="POST" action="/MedicShish/brandProductMappingController/save" id="brandProductMapingForm">
     <div class="row">
          <div class="col-sm-4">< form:label path="name">Brand Name</form:label></div>
          <div class="col-sm-4"><label  path="productsMapping">Product</label></div>
     </div>
     <div class="row">
          <div class="col-sm-4"><form:input type="text"  path="name" class="form-control" id="name" name="name" /></div>
         <a href="#" path="productsMapping"  id="productsMapping" name="productsMapping" >Add Product</a>

     </div>
     <br>
     <div class="row">
          <div class="col-sm-4">Code</div>
          <div class="col-sm-4"></div>
    </div>
    <div class="row">
         <div class="col-sm-4"> <form:input type="text"  path="code" class="form-control" id="code" name="code" /></div>
         <div class="col-sm-4"></div>
    </div>
    <br>
  </form:form>
  </div>


  <div class="container mt-3">
     <div class="modal fade" id="myModal">
         <div class="modal-dialog">
            <div class="modal-content">

               <!-- Modal Header -->
             <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
             </div>
             <div class="modal-body">
                  <div class="row">
                     <div class="col-sm-4"><label path="productsMapping.name">Product Name</label></div>
                     <div class="col-sm-4"><label  path="productsMapping.code">Code</label></div>
                  </div>
                  <div class="row">
                     <div class="col-sm-4"><input title ="Name" Json="json"  path="productsMapping.name" class="form-control" id="productsMapping.name" name="productsMapping.name" /></div>
                     <div class="col-sm-4"><input title ="Code" Json="json"  path="productsMapping.code" class="form-control" id="productsMapping.code" name="productsMapping.code" /></div>
                  </div>
                  <br>
                  <div class="row">
                  <div class="col-sm-4"><button type="button" id="add" class="btn btn-danger" >ADD</button></div>
                  </div>
               <br>
               <br>
               <div class="row" class="col-sm-6">
                   <table id ="exampleTable" class ="display" style ="width:100%">
                   </table>
               </div>
             </div>
             <div class="modal-footer">
                   <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
           </div>
         </div>
     </div>
  </div>


</body>
<footer>
<jsp:include page="/WEB-INF/views/masters/masterFooter.jsp"/>
</footer>
</html>