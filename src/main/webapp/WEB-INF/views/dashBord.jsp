<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


  <meta name="viewport" content="width=device-width, initial-scale=1" />





<style>

.modalInputDiv{
position: relative;
background: none;
color:black;
}

.lovDiv{
 margin-top: 30px;
  margin-bottom: 70px;
  margin-right: 200px;
  margin-left: 480px;
position: relative;
}

.lovDiv{
background: none;
color:black;
}

input:focus ~ .floating-label,
input:not(:focus):valid ~ .floating-label{
  top:-0.7rem;
  left: 0.7rem;
  font-size :15px;
  background:white;
}


.inputText {
 border :2px solid #a9a9a9;
 border-radius: 5px 0px 0px 5px;
 outline: none;
 background:none;
 padding: 10px;
 color:black;

}

.floating-label {
position: absolute;
top:0.9rem;
left:1rem;
cursor:text;
transition :top 200ms ease-in, left 200ms ease-in , font-size 200ms ease-in;
}

.inputText:focus{
border: 2px solid black;
}
#demo:focus{
border: 2px solid black;
background: solid black;
}

#demo {
  border :2px solid #a9a9a9;
  border-radius: 0px 5px 5px 0px;
  background: #a9a9a9;
  outline: none;
  padding: 14.30px;
  color: white;
  }

  .float-childFirst {
      width: 50%;
      float: left;

  }
  .float-childSecond {
      width: 50%;
      float: left;
      }

</style>
<script src="<c:url value="/js/dashbord.js" />"></script>
</head>
<body>
<div class="lovDiv">
  <input type="text" class="inputText" id="lovSearch" required/><!--
  --><label class="floating-label">Search..</label><!--
  --><button type="submit" id="demo"><i class="fa fa-search"></i></button>
</div>
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
               								<th>NAME</th>
               								<th>QuantityPresent</th>
               								<th>PRIZE</th>
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


      <div class="container mt-3">
              <!-- <h2>Activate Modal with JavaScript</h2>
           Trigger the modal with a button
            <button type="button" class="btn btn-primary" id="myBtn">Open Modal</button>  -->

            <!-- The Modal -->
            <div class="modal fade" id="addModal">
              <div class="modal-dialog">
                <div class="modal-content">

                  <!-- Modal Header -->
                  <div class="modal-header">
                    <h4 class="modal-title">Modal Heading</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>

                  <!-- Modal body -->
                  <div class="modal-body ">
                       <div class="row">
                             <div class="col-sm-6"><input type="text" class="inputText" id="inputName" required/>
                                                       <label class="floating-label">Name..</label>
                             </div>
                             <div class="col-sm-6"><input type="text" class="inputText" id="lovSearch" required/>
                                                       <label class="floating-label">Quantity..</label>
                             </div>
                       </div>
                       <br>
                       <div class="row">
                                 <div class="col-sm-6"><input type="text" class="inputText" id="lovSearch" required/>
                                                       <label class="floating-label">Prize..</label>
                                 </div>
                                 <div class="col-sm-6"><input type="text" class="inputText" id="lovSearch" required/>
                                                       <label class="floating-label">CGST..</label>
                                 </div>
                       </div>
                       <br>
                       <div class="row">
                                  <div class="col-sm-6"><input type="text" class="inputText" id="lovSearch" required/>
                                                         <label class="floating-label">IGST..</label>
                                  </div>
                                  <div class="col-sm-6"><input type="text" class="inputText" id="lovSearch" required/>
                                                        <label class="floating-label">Discount..</label>
                                  </div>
                       </div>
                       </div>
                  <!-- Modal footer -->
                  <div class="modal-footer">
                    <button type="button" class="btn btn-danger"  id ="loadTest">Add</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                  </div>

                </div>
              </div>
            </div>

          </div>

</body>
</html>
