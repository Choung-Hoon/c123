//v.1.6 build 80512

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
dhtmlXGridObject.prototype._process_xmlA=function(xml){this._parsing=true;var top=xml.getXMLTopNode(this.xml.top)
 this._parseHead(top);var rows=xml.doXPath(this.xml.row,top)
 var cr=parseInt(xml.doXPath("//"+this.xml.top)[0].getAttribute("pos")||0);var total=parseInt(xml.doXPath("//"+this.xml.top)[0].getAttribute("total_count")||0);if (total && !this.rowsBuffer[total-1])this.rowsBuffer[total-1]=null;for (var i=0;i < rows.length;i++){if (this.rowsBuffer[i+cr])continue;var id=rows[i].getAttribute("id");this.rowsBuffer[i+cr]={idd:id, data:rows[i], _parser: this._process_xml_rowA, _locator:this._get_xml_dataA };this.rowsAr[id]=rows[i]};this.render_dataset();this._parsing=false};dhtmlXGridObject.prototype._process_xmlB=function(xml){this._parsing=true;var top=xml.getXMLTopNode(this.xml.top)
 this._parseHead(top);var rows=xml.doXPath(this.xml.row,top)
 var cr=parseInt(xml.doXPath("//"+this.xml.top)[0].getAttribute("pos")||0);var total=parseInt(xml.doXPath("//"+this.xml.top)[0].getAttribute("total_count")||0);if (total && !this.rowsBuffer[total-1])this.rowsBuffer[total-1]=null;for (var i=0;i < rows.length;i++){if (this.rowsBuffer[i+cr])continue;var id=rows[i].getAttribute("id");this.rowsBuffer[i+cr]={idd:id, data:rows[i], _parser: this._process_xml_rowB, _locator:this._get_xml_dataB };this.rowsAr[id]=rows[i]};this.render_dataset();this._parsing=false};dhtmlXGridObject.prototype._process_xml_rowA=function(r,xml){var strAr = [];r._attrs=this._xml_attrs(xml);for(var j=0;j<this.columnIds.length;j++){var cid=this.columnIds[j];var cellVal=r._attrs[cid]||"";if (r.childNodes[j])r.childNodes[j]._attrs={};strAr.push(cellVal)};this._fillRow(r,(this._c_order?this._swapColumns(strAr):strAr));return r};dhtmlXGridObject.prototype._get_xml_dataA=function(data,ind){return data.getAttribute(this.getColumnId(ind))};dhtmlXGridObject.prototype._process_xml_rowB=function(r,xml){var strAr = [];r._attrs=this._xml_attrs(xml);if (this._ud_enabled){var udCol = this.xmlLoader.doXPath("./userdata",xml);for (var i = udCol.length - 1;i >= 0;i--)this.setUserData(udCol[i].getAttribute("name"),udCol[i].firstChild?udCol[i].firstChild.data:"")};for (var jx=0;jx < xml.childNodes.length;jx++){var cellVal=xml.childNodes[jx];if (!cellVal.tagName)continue;var j=this.getColIndexById(cellVal.tagName);if (j<0)continue;var exc=cellVal.getAttribute("type");if (exc)r.childNodes[j]._cellType=exc;r.childNodes[j]._attrs=this._xml_attrs(cellVal);if (cellVal.getAttribute("xmlcontent"))
 {}else if (cellVal.firstChild)cellVal=cellVal.firstChild.data;else cellVal="";strAr.push(cellVal)};this._fillRow(r,(this._c_order?this._swapColumns(strAr):strAr));return r};dhtmlXGridObject.prototype._get_xml_dataB=function(data,ind){var id=this.getColumnId(ind);data=data.firstChild;while (true){if (!data)return "";if (data.tagName==id)return (data.firstChild?data.firstChild.data:"")
 data=data.nextSibling};return ""}
//v.1.6 build 80512

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/