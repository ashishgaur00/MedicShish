<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



<style>
body {
	font-family: Arial;
}

* {
	box-sizing: border-box;
}

div.example input[type=text] {
	padding: 10px;
	font-size: 17px;
	border: 1px solid grey;
	float: left;
	width: 80%;
	background: #f1f1f1;
}


div.example button {
	float: left;
	width: 20%;
	padding: 10px;
	background: #2196F3;
	color: white;
	font-size: 17px;
	border: 1px solid grey;
	border-left: none;
	cursor: pointer;
}

div.tab-customerss {
	float: right;
	width: 50%;
	padding: 10px;
	background: #2196F3;
	color: black;
	font-size: 17px;
	border: 1px solid grey;
	border-left: none;
	cursor: pointer;
}

div.example button:hover {
	background: #0b7dda;
}

div.example::after {
	content: "";
	clear: both;
	display: table;
}

.pop-outer {
	background-color: rgba(0, 0, 0, 0.5);
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.pop-inner {
	background-color: #fff;
	width: 500px;
	height: 300px;
	padding: 25px;
	margin: 5% auto;
}

.float-container {
    border: 3px solid #fff;
    padding: 20px;
}

.float-childFirst {
    width: 40%;
    float: left;
    padding: 20px;
    border: 2px solid red;
}
.float-childSecond {
    width: 60%;
    float: left;
    padding: 20px;
  
}
label{
    display: inline-block;
    float: left;
    clear: left;
    width: 100px;
    text-align: left;
}
input {
  display: inline-block;
  float: left;
}
</style>

   <!-- BootStap and jquery for Modal -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/DataTables/datatables.css">
<script type="text/javascript" charset="utf8" src="/DataTables/datatables.js"></script>
<link rel="stylesheet" type="text/css"	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
	
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
<!--<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>-->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script>
	$(document).ready(function() {
		jQuery("#mainSearchedTable").hide();
		<!--jQuery(".tab-customerss").hide(); -->
		$("#searchbutton").click(function() {
			<!--$(".pop-outer").fadeIn("slow");-->
			  $("#myModal").modal();
			callAllSearchParameter();
		});
		$(".open").click(function() {
			$(".pop-outer").fadeIn("slow");
			callAllSearchParameter();
		});
		$(".close").click(function() {
			$(".pop-outer").fadeOut("slow");
		});

		$.fn.serializeObject = function() {
			var o = {};
			var a = this.serializeArray();
			$.each(a, function() {
				if (o[this.name] !== undefined) {
					if (!o[this.name].push) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		};

		$("#loadTest").click(function() {
			performCalculation();
			jQuery("#mainSearchedTable").show();
		});



		

	});

	function onClickEventOfDatatable() {
        var name ;
        var prize;
        var ttlQuantityPresent;
		<!--$(".pop-outer").fadeOut("slow"); -->
		$("#myModal").modal("hide");
		$('#medicineSearchDisplayModal tbody').on('click', 'b', function() {
			var data = myTable.row($(this).closest('tr')).data();
			$("#search").val(data.name);
			name=data.name;
            prize=data.prize;
            ttlQuantityPresent=data.ttlQuantityPresent;

		});
		setTimeout(function(){ callSearch(name,prize,ttlQuantityPresent); }, 0.1);

		$('#medicineSearchDisplayModal tbody').on('click', 'button',
				function() {
					var data = myTable.row($(this).closest('tr')).data();
					$("#search").val(data.name);
				});

		jQuery("#mainSearchedTable").show();

	}

	function performCalculation() {

		var inputName = $("#inputName").val();
		$.ajax({

			url : '/MedicShish/actionOnSearch/calculate',
			async : false,
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			type : "GET",
			data : {
				'name' : inputName
				/* 'quantity' :  $("#inputQuantity").val(),
				'prize' :  $("#inputPrize").val(),
				'discount' :  $("#inputDiscount").val(), */
				
			},
			success : function(data) {
				loadDatatable(data);
			}

		});
	}

	function callSearch(name,prize,ttlQuantityPresent) {
		var searchedWord = $("#search").val();
		$.ajax({

			url : '/MedicShish/actionOnSearch/search',
			async : false,
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			type : "GET",
			data : {
				'searchedWord' : searchedWord,
				'prize' : prize,
				'ttlQuantityPresent' : ttlQuantityPresent
			},
			success : function(data) {
				loadDatatable(data);
			}
		});

	}

	function loadDatatable(data) {

		$('#result').text(JSON.stringify(data));
		if (data != null) {
			var myTable = $('#medicineSearchDisplay').DataTable({
				"retrieve" : true,
				"paging" : true,
				"lengthChange" : true,
				"searching" : true,
				"ordering" : true,
				"info" : true,
				"autoWidth" : true,
				"deferRender": false,
				 "order": [1],
		        "footerCallback": function (tfoot, data, start, end, display) {
		            var api = this.api();
		            var p = api.column(7).data().reduce(function (a, b) {
		                return a + b;
		            }, 0)
		            $(api.column(7).footer()).html(p);
		            $("#total").val(p);
		        },
				"data" : [],
				"columns" : [ {
					"title" : "id",
					"data" : "id",
					"render" : function(data, type, full, meta) {
						return '<input type="checkbox" checked >';
					}
				}, {
					"title" : "name",
					"data" : "name"
				}, {
					"title" : "quantity",
					"data" : "quantity",
					"render": function (data) {
	                    return '<input type="text" style="width:50px" value="' + data + '">';}
				}, {
					"title" : "prize",
					"data" : "prize"
				}, {
					"title" : "cgst",
					"data" : "cgst"
				}, {
					"title" : "igst",
					"data" : "igst"
				}, {
					"title" : "discount",
					"data" : "discount"
				}, {
					"title" : "total",
					"data" : "total"
				} ]
			});

			  //myTable.clear();
			$.each(data, function(index, value) {
				myTable.row.add(value);
			});
			myTable.draw();
			
			 myTable.on("change", "input[type='checkbox']", function (evtObj) {
			       /*  var num = this.value;
			      alert(num);
			       
			       if (num=='on'){
			    	   alert("Check box in Checked");
			    	  rowData.id =$("input[type=checkbox]").prop('checked', false).uniform();   
                     } else {
                 alert("Check box is Unchecked");
                 rowData.id =$("input[type=checkbox]").prop('checked', true).uniform();
                    } */
			       var rowData = myTable.rows($(this).closest("tr")).data()[0]; 
			       alert(rowData.id);
			       if(rowData.id==1){
			    	   myTable.columns().checkboxes.deselect(true);
			      rowData.id =0;
			       }
			       if(rowData.id==0){
			    	   myTable.columns().checkboxes.deselect(false);
				      rowData.id =1;
				       }
			       rowData.total=0;
			       myTable.rows($(this).closest("tr")).invalidate().draw();
			        myTable.data().sum();
			    });
			 myTable.on("change", "input[type='text']", function (evtObj) {
			        var num = parseInt(this.value)
			        var rowData = myTable.rows($(this).closest("tr")).data()[0];
			        rowData.quantity = num;
			        rowData.total = num * rowData.prize;
			        myTable.rows($(this).closest("tr")).invalidate().draw();
			        myTable.data().sum();
			    });

		}
	}

	function callAllSearchParameter() {
		var searchedWord = $("#search").val();
		$
				.ajax({

					url : '/MedicShish/actionOnSearch/allRelated',
					async : false,
					contentType : "application/json;charset=utf-8",
					dataType : "json",
					type : "GET",
					data : {
						'searchedWord' : searchedWord
					},
					success : function(data) {
						if (data != null) {
							myTable = $('#medicineSearchDisplayModal')
									.DataTable(
											{
												"retrieve" : true,
												"paging" : true,
												"lengthChange" : true,
												"searching" : true,
												"ordering" : true,
												"info" : true,
												"autoWidth" : true,
												"data" : [],
												"columns" : [

														{
															"title" : "name",
															"data" : "name",
															"render" : function(
																	data, type,
																	row, meta) {
																return '<b onClick="onClickEventOfDatatable();">'
																		+ data
																		+ '</b>';
															}
														},
														{
															"title" : "ttlQuantityPresent",
															"data" : "ttlQuantityPresent"
														},
														{
                                                        		"title" : "prize",
                                                        		"data" : "prize"
                                                        },

														{
															data : null,
															title : "Prodlog",
															"fnCreatedCell" : function(
																	nTd, sData,
																	oData,
																	iRow, iCol) {
																$(nTd)
																		.html(
																				"<button>add!</button>");
															}
														} ]
											});

							myTable.clear();
							$.each(data, function(index, value) {
								myTable.row.add(value);
							});
							myTable.draw();
						}
					}
				});

	}
</script>

</head>
<body>
	<h2>WelCome</h2>
	<div class="example" id="searchForm"
		style="margin: auto; max-width: 300px">
		<input id="search" type="text" placeholder="Search.." name="search">
		<button id="searchbutton">
			<i class="fa fa-search"></i>
		</button>
	</div>
<div class="float-container">
<div class="float-childFirst">
	<form id="myform" action="/MedicShish/actionOnSearch/calculate"
		enctype="multipart/form-data" method="post">

      <label>Name:</label><input id="inputName" type="text">
      <label>Quantity:</label><input  id="inputQuantity" type = "text">
      <label>Prize:</label><input id="inputPrize" type="text">
      <label>Discount:</label><input id="inputDiscount" type="text">
	</form>
	<br>
      <p>
		<button id="loadTest">
			<i class="fa fa-search"></i>
		</button>
		 </p>
		<br>
	</div>
	
	<div class="float-childSecond">
		<div class="tab-customers"  id="mainSearchedTable">
				<table id="medicineSearchDisplay" class=" table table-striped table-bordered cell-border hover " cellspacing="0">
					<thead>
						<tr>
							<th>id</th>
							<th>name</th>
							<th>quantity</th>
							<th>prize</th>
							<th>cgst</th>
							<th>igst</th>
							<th>discount</th>
							<th>total</th>
						</tr>
					</thead>
					<tfoot>
                  <tr>
                            <th>id</th>
							<th>name</th>
							<th>quantity</th>
							<th>prize</th>
							<th>cgst</th>
							<th>igst</th>
							<th>discount</th>
							<th>total</th>
        </tr>
        </tfoot>
				</table>
				<label>Total</label>
                 <input type="text" id="total" class="form-control" readonly value="0.0" />
			</div>
	</div>
	</div>
	<!-- <div style="display: none;" class="pop-outer">
		<div class="pop-inner">
			<button class="close">X</button>
			<div>
				<div id="tab-customerss">
					<table id="medicineSearchDisplayModal"
						class="table table-striped table-bordered cell-border hover "  cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>name</th>
								<th>ttlQuantityPresent</th>
								<th>prize</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div> -->



 <div class="container mt-3">
     <!-- <h2>Activate Modal with JavaScript</h2>
  Trigger the modal with a button
   <button type="button" class="btn btn-primary" id="myBtn">Open Modal</button>  -->

   <!-- The Modal -->
   <div class="modal fade" id="myModal">
     <div class="modal-dialog">
       <div class="modal-content">

         <!-- Modal Header -->
         <div class="modal-header">
           <h4 class="modal-title">Modal Heading</h4>
           <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>

         <!-- Modal body -->
         <div class="modal-body">
           <table id="medicineSearchDisplayModal"
           						class="table table-striped table-bordered cell-border hover "  cellspacing="0" width="100%">
           						<thead>
           							<tr>
           								<th>name</th>
           								<th>ttlQuantityPresent</th>
           								<th>prize</th>
           							</tr>
           						</thead>
           					</table>
         </div>

         <!-- Modal footer -->
         <div class="modal-footer">
           <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
         </div>

       </div>
     </div>
   </div>
 </div>

</body>
</html>
