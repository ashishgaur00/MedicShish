<%@ include file="/WEB-INF/views/common/taglib.jsp" %>
 <%@ taglib prefix="t" uri="WEB-INF/mylib" %>
<html>
<head>
    <title>Dynamic Drop Down List Demo - CodeJava.net</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

 <jsp:include page="/WEB-INF/views/masters/masterHeader.jsp"/>
 <script>
 jQuery(document).ready(function() {
  $('.datepicker').datepicker();
  callCurrencyPercentageExchange();
  $("#showIfChecked").hide();
   $("#amountLabel").hide();
 $("#listOFDiscountTypeId").change(function() {
  callCurrencyPercentageExchange();
 });
 $("#listOFDiscountTypeId").change(function() {
   callCurrencyPercentageExchange();
  });
  $("#customCheck").change(function() {
     ifcheckedShowAmount();
    });

    jQuery("#saveMaster").click(function(){
    jQuery.ajax({
        data:jQuery("#discountMasterForm").serialize(),
        url :jQuery("#discountMasterForm").attr("action"),
        type : "POST",
        success : function(response){
        alert("success");
        }
    });
 });
 });

 function callCurrencyPercentageExchange(){

 if(jQuery("#listOFDiscountTypeId").val()== 101){
   $("#percentLabel").show();
     $("#currencySymbolID").hide();
  }
   if(jQuery("#listOFDiscountTypeId").val()== 100){
    $("#percentLabel").hide();
    $("#currencySymbolID").show();
   }
  if(jQuery("#listOFDiscountTypeId").val()== 102){
    $("#percentLabel").hide();
    $("#currencySymbolID").hide();
   }
}
   function ifcheckedShowAmount(){
    if($("#customCheck").prop("checked") == true){

         $("#amountLabel").show();
        $("#showIfChecked").show();
        }
       else if($("#customCheck").prop("checked") == false){
         $("#showIfChecked").hide();
          $("#amountLabel").hide();
       }
}

 </script>
</head>
<body>


<div class="shiftMargin" >
<form:form modelAttribute="discountMaster" method="POST" action="/MedicShish/discountMaster/save" id="discountMasterForm">
     <div class="row">
          <div class="col-sm-4">< form:label path="startDate">From date:</form:label></div>
          <div class="col-sm-4"><label  path="endDate">To date:</label></div>
     </div>
     <div class="row">
          <div class="col-sm-4"><form:input path="startDate"  class="datepicker" /></div>
          <div class="col-sm-4"><form:input  path="endDate"  class="datepicker"  /></div>
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

    <div class="row">
         <div class="col-sm-4"><label for="usr">Discount Type:</label></div>
         <div class="col-sm-4"><label for="usr">Amount:</label></div>
    </div>
    <div class="row">
          <div class="col-sm-4">
               <form:select  path="discountType.id" class="btn custom-select  dropdown-toggle " id="listOFDiscountTypeId"  data-toggle="dropdown">
               <c:forEach var="list" items="${listOFDiscountType}">
               <form:option value="${list.id}" path="discountType.id">${list.value}</form:option>
               </c:forEach>
               </form:select>
          </div>
          <div class="col-sm-4">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                 <div id ="currencySymbolID"><label class="input-group-text">Rs</label></div>
                 </div>
              <form:input type="text"  path="amount" class="form-control" aria-label="Dollar amount (with dot and two decimal places)"/>
              <div id="percentLabel"><label class="input-group-text">%</label></div>
              </div>
          </div>
    </div>
    <br>
    <div class="row">
         <div class="col-sm-4">Calculated On</div>
         <div class="col-sm-4">Applied To</div>
    </div>
    <div class="row">
          <div class="col-sm-4">
                       <form:select  path="calculatedOn.id" class="btn custom-select  dropdown-toggle "  data-toggle="dropdown">
                                      <c:forEach var="list" items="${listOFCalculatedOn}">
                                      <option value="${list.id}">${list.value}</option>
                                      </c:forEach>
                                      </form:select>
          </div>
          <div class="col-sm-4">
              <form:select  path="applyTo.id" class="btn custom-select  dropdown-toggle "  data-toggle="dropdown">
                                      <c:forEach var="list" items="${listOFApplyTo}">
                                      <option value="${list.id}">${list.value}</option>
                                      </c:forEach>
                                      </form:select>
          </div>
    </div>
    <br>
    <div class="row">
         <div class="col-sm-4"></div>
         <div class="col-sm-4"><div id="amountLabel">Amount</div></div>
    </div>
    <div class="row">
         <div class="col-sm-4">
               <div class="custom-control custom-checkbox mb-3">
                   <form:checkbox path="minimunPurchase"  class="custom-control-input" id="customCheck" name="example1" />
                   <label class="custom-control-label" for="customCheck">Discount requries minimum purchase amount</label>
                  </div>
         </div>
         <div class="col-sm-4">
                     <div class="input-group mb-3" id="showIfChecked">
                           <div class="input-group-prepend"><label class="input-group-text">Rs</label></div>
                           <form:input type="text"  path="minimunPurchaseAmount" class="form-control" aria-label="Dollar amount (with dot and two decimal places)"/>
                     </div>
         </div>

     </div>
  </form:form>
  </div>

</body>
<footer>
<jsp:include page="/WEB-INF/views/masters/masterFooter.jsp"/>
</footer>
</html>