function setRowColors() {
//var range = SpreadsheetApp.getActiveSheet().getDataRange();
  var range = SpreadsheetApp.getActiveSheet().getDataRange();
var statusColumnOffset = getStatusColumnOffset();
for (var i = range.getRow(); i < range.getLastRow(); i++) {
rowRange = range.offset(i, 0, 1);
//rowRange = range.offset(i, 0, 1);
status = rowRange.offset(0, statusColumnOffset).getValue();
if (status == 'Calls BUYING') {
  rowRange.setBackgroundColor("#99CC99");
} else if (status == 'Puts BUYING') {
  rowRange.setBackgroundColor("#E57373");
} else if (status == 'Calls SELLING') {
  rowRange.setBackgroundColor("#FFDD88");
} else if (status == 'Puts SELLING'){
  rowRange.setBackgroundColor("#80D8FF");
}
}
  
     //FreezePanes
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getActiveRange();
  
  // Freezes the first column
  ss.setFrozenColumns(1);
  ss.setFrozenRows(1);
  
  // Insert Chart Link column
  ss.insertColumnAfter(1);
  
   var sheetX = ss.getActiveSheet()
   sheetX.getRange("B2").setValue("=CONCATENATE(WatchList!$C$1,A2,WatchList!$D$1)")
   sheetX.getRange("B1").setValue("ChartLink")
    
  
   //Filldown
   var origin = ss.getRange("B2");
  var target = ss.getRange("B2:B500");
  origin.copyTo(target);
  target.clearFormat()

  
  //Re-size columns
  sheetX.autoResizeColumn(1);
  sheetX.setColumnWidth(2, 40);
  sheetX.autoResizeColumn(3);
  sheetX.autoResizeColumn(4);
  sheetX.autoResizeColumn(5);
  sheetX.autoResizeColumn(6);
  sheetX.autoResizeColumn(7);
  sheetX.autoResizeColumn(8);
  sheetX.autoResizeColumn(9);
  sheetX.autoResizeColumn(10);
  sheetX.autoResizeColumn(11);
  sheetX.autoResizeColumn(12);
  
  
//Returns the offset value of the column titled "Status"
//(eg, if the 7th column is labeled "Status", this function returns 6)
function getStatusColumnOffset() {
lastColumn = SpreadsheetApp.getActiveSheet().getLastColumn();
var range = SpreadsheetApp.getActiveSheet().getRange(1,1,1,lastColumn);
for (var i = 0; i < range.getLastColumn(); i++) {
if (range.offset(0, i, 1, 1).getValue() == "OptionType") {
return i;
}
}
}
}