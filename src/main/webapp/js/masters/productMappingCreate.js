jsonObj = [];
 jQuery(document).ready(function() {
  $("#productsMapping").click(function() {
  			  $("#myModal").modal();
  			  });

    jQuery("#saveMaster").click(function(){
    jQuery.ajax({
        data:{
        Brand : jQuery("#brandProductMapingForm").serialize(),
        productJson : JSON.stringify(jsonObj)
        },
        url :jQuery("#brandProductMapingForm").attr("action"),
        type : "POST",
        success : function(response){
        alert("success");
        }
    });
 });



 jQuery("#add").click(function(){


  loadDataTable(createJSON() ,'exampleTable');
 });

});


 function getTableData() {

 return $.ajax({
    url : "/MedicShish/actionOnSearch/allRelated",
    method : "Get",
    data : {'searchedWord' : "par"
    		}
 });
 }

 function createJSON() {

     item = {}
     $("input[Json=json]").each(function() {

         var key = $(this).attr("title");
         var value = $(this).val();


         item [key] = value;

     });
     jsonObj.push(item);
     return jsonObj;
 }

