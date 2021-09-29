
jQuery(document).ready(function() {

    jQuery("#demo").click(function() {
             callAllSearchParameter();
     		 $("#myModal").modal();

     		});
      jQuery("#loadTest").click(function() {
                  performCalculation();
          		 $("#addModal").modal("hide");

          		});

  initializeDataTable();

} );

function callAllSearchParameter() {
		var searchedWord = jQuery("#lovSearch").val();

				jQuery.ajax({

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
							myTable = jQuery('#medicineSearchDisplayModal')
									.DataTable(
											{
												"retrieve" : true,
												"paging" : false,
												"lengthChange" : true,
												"searching" : false,
												"ordering" : true,
												"info" : true,
												"autoWidth" : true,
												"data" : [],
												"columns" : [

														{
															"title" : "Name",
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
															"title" : "Quantity",
															"data" : "ttlQuantityPresent"
														},
														{
                                                        		"title" : "Prize",
                                                        		"data" : "prize"
                                                        },

														 ]
											});

							myTable.clear();
							jQuery.each(data, function(index, value) {
								myTable.row.add(value);
							});
							myTable.draw();
						}
					}
				});

	}

	function onClickEventOfDatatable() {
            var name ;
            var prize;
            var ttlQuantityPresent;
    		$("#myModal").modal("hide");
    		$('#medicineSearchDisplayModal tbody').on('click', 'b', function() {
    			var data = myTable.row($(this).closest('tr')).data();
    			$("#lovSearch").val(data.name);
    			name=data.name;
                prize=data.prize;
                ttlQuantityPresent=data.ttlQuantityPresent;

    		});
    		setTimeout(function(){ callSearch(name,prize,ttlQuantityPresent); }, 0.1);
    	}

    	function callSearch(name,prize,ttlQuantityPresent) {
        		var searchedWord = $("#lovSearch").val();
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
        			 initializeDataTable();

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

        	function initializeDataTable()
        	{

        	myTable = $('#medicineSearchDisplay').DataTable({
                    				"retrieve" : true,
                    				"paging" : false,
                    				"lengthChange" : true,
                    				"searching" : true,
                    				"ordering" : true,
                    				"info" : false,
                    				"autoWidth" : true,
                    				"deferRender": false,
                    				 "order": [1],
                    				 "dom": 'Bfrtip',
                                     "buttons": [
                                                         {
                                                            "text": 'ADD',
                                                            "action": function ( e, dt, node, config ) {
                                                             showAddModal();
                                                               }
                                                         }
                                                                     ],
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
                    					"title" : "Name",
                    					"data" : "name"
                    				}, {
                    					"title" : "Quantity",
                    					"data" : "quantity",
                    					"render": function (data) {
                    	                    return '<input type="text" style="width:50px" value="' + data + '">';}
                    				}, {
                    					"title" : "Prize",
                    					"data" : "prize"
                    				}, {
                    					"title" : "cgst",
                    					"data" : "cgst"
                    				}, {
                    					"title" : "igst",
                    					"data" : "igst"
                    				}, {
                    					"title" : "Discount",
                    					"data" : "discount"
                    				}, {
                    					"title" : "Total",
                    					"data" : "total"
                    				} ]
                    			});

        	}

        	function showAddModal()
        	{
        	 $("#addModal").modal();
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
