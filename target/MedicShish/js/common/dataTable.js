var datatableInstance;

function MakerColumnHeaderHtml(columnHeaderNames){
 var table_head = '<thead class ="table-header"><tr>';
 $.each(columnHeaderNames, function(data, value){

   table_head += '<th>';
   table_head += value;
   table_head += '</th>';

 });
 table_head += '</thead></tr>';
 return  table_head ;
 }

 function getDatableDef(columnDef){
  var datatableFormat = {
    columns : columnDef,
    paging : false,
    info : false,
    searching : false,
    ordering : false
  };
  return  datatableFormat ;
  }

function loadDataTable(records, tableId)
{
 if(datatableInstance != null){
 datatableInstance.rows.add(records).draw();
 }
 else{
    var headerName = Object.keys(records[0]);
    var headerHtml = MakerColumnHeaderHtml(headerName);
    var columns = [];
    $('#'+tableId).append(headerHtml);
    for (var i=0; i< headerName.length ; i++){
    columns.push({"data" : headerName[i]});
    }
  datatableInstance = $('#'+tableId).DataTable(getDatableDef(columns));
 datatableInstance.rows.add(records).draw();
 }
}