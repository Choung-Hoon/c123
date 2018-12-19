//v.1.6 build 80512

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/

 dhtmlXGridObject.prototype.enableDragAndDrop=function(mode){if (mode=="temporary_disabled"){this.dADTempOff=false;mode=true}else
 this.dADTempOff=true;this.dragAndDropOff=convertStringToBoolean(mode)};dhtmlXGridObject.prototype.setDragBehavior=function(mode){this.dadmodec=this.dadmodefix=0;switch (mode) {case "child": this.dadmode=0;this._sbmod=false;break;case "sibling": this.dadmode=1;this._sbmod=false;break;case "sibling-next": this.dadmode=1;this._sbmod=true;break;case "complex": this.dadmode=2;this._sbmod=false;break;case "complex-next": this.dadmode=2;this._sbmod=true;break}};dhtmlXGridObject.prototype.enableDragOrder=function(mode){this._dndorder=convertStringToBoolean(mode)};dhtmlXGridObject.prototype._checkParent=function(row,ids){var z=this._h2.get[row.idd].parent;if (!z.parent)return;for (var i=0;i<ids.length;i++)if (ids[i]==z.id)return true;return this._checkParent(this.rowsAr[z.id],ids)};dhtmlXGridObject.prototype._createDragNode=function(htmlObject,e){this.editStop();if (window.dhtmlDragAndDrop.dragNode)return null;if (!this.dADTempOff)return null;htmlObject.parentObject=new Object();htmlObject.parentObject.treeNod=this;if (!this.callEvent("onBeforeDrag",[htmlObject.parentNode.idd])) return null;var z=new Array();z=this.getSelectedId();z=(((z)&&(z!=""))?z.split(","):[]);var exst=false;for (var i=0;i<z.length;i++)if (z[i]==htmlObject.parentNode.idd)exst=true;if (!exst){this.selectRow(this.rowsAr[htmlObject.parentNode.idd],false,e.ctrlKey,false);if (!e.ctrlKey){z=[]};z[this.selMultiRows?z.length:0]=htmlObject.parentNode.idd};if (this.isTreeGrid()){for (var i=z.length-1;i>=0;i--)if (this._checkParent(this.rowsAr[z[i]],z)) z.splice(i,1)};var self=this;if (z.length && this._dndorder)z.sort(function(a,b){return (self.rowsAr[a].rowIndex>self.rowsAr[b].rowIndex?1:-1)});var el = this.getFirstParentOfType(_isIE?e.srcElement:e.target,"TD");if (el)this._dndExtra=el._cellIndex;this._dragged=new Array();for (var i=0;i<z.length;i++)if (this.rowsAr[z[i]]){this._dragged[this._dragged.length]=this.rowsAr[z[i]];this.rowsAr[z[i]].treeNod=this};htmlObject.parentObject.parentNode=htmlObject.parentNode;var dragSpan=document.createElement('div');dragSpan.innerHTML=this.rowToDragElement(htmlObject.parentNode.idd);dragSpan.style.position="absolute";dragSpan.className="dragSpanDiv";return dragSpan};dhtmlXGridObject.prototype._createSdrgc=function(){this._sdrgc=document.createElement("DIV");this._sdrgc.innerHTML="&nbsp;";this._sdrgc.className="gridDragLine";this.objBox.appendChild(this._sdrgc)};function dragContext(a,b,c,d,e,f,j,h,k,l){this.source=a||"grid";this.target=b||"grid";this.mode=c||"move";this.dropmode=d||"child";this.sid=e||0;this.tid=f||window.unknown;this.sobj=j||null;this.tobj=h||null;this.sExtra=k||null;this.tExtra=l||null;return this};dragContext.prototype.valid=function(){if (this.sobj!=this.tobj)return true;if (this.sid==this.tid)return false;if (this.target=="treeGrid"){var z=this.tid
 while (z = this.tobj.getParentId(z)){if (this.sid==z)return false}};return true};dragContext.prototype.close=function(){this.sobj=null;this.tobj=null};dragContext.prototype.copy=function(){return new dragContext(this.source,this.target,this.mode,this.dropmode,this.sid,this.tid,this.sobj,this.tobj,this.sExtra,this.tExtra)};dragContext.prototype.set=function(a,b){this[a]=b;return this};dragContext.prototype.uid=function(a,b){this.nid=this.sid;while (this.tobj.rowsAr[this.nid])this.nid=this.nid+((new Date()).valueOf());return this};dragContext.prototype.data=function(){if (this.sobj==this.tobj)return this.sobj._getRowArray(this.sobj.rowsAr[this.sid]);if (this.source=="tree")return this.tobj.treeToGridElement(this.sobj,this.sid,this.tid);else
 return this.tobj.gridToGrid(this.sid,this.sobj,this.tobj)};dragContext.prototype.childs=function(){if (this.source=="treeGrid")return this.sobj._h2.get[this.sid]._xml_await?this.sobj._h2.get[this.sid].has_kids:null;return null};dragContext.prototype.pid=function(){if (this.tid==window.unknown)return 0;if (!this.tobj._h2)return 0;if (this.target=="treeGrid")if (this.dropmode=="child")return this.tid;else{var z=this.tobj.rowsAr[this.tid];var apid=this.tobj._h2.get[z.idd].parent.id;if ((this.alfa)&&(this.tobj._sbmod)&&(z.nextSibling)){var zpid=this.tobj._h2.get[z.nextSibling.idd].parent.id;if (zpid==this.tid)return this.tid;if (zpid!=apid)return zpid};return apid}};dragContext.prototype.ind=function(){if (this.tid==window.unknown)return 0;if (this.target=="treeGrid"){if (this.dropmode=="child")this.tobj.openItem(this.tid);else
 this.tobj.openItem(this.tobj.getParentId(this.tid))};var ind=this.tobj.rowsCol._dhx_find(this.tobj.rowsAr[this.tid]);if ((this.alfa)&&(this.tobj._sbmod)&&(this.dropmode=="sibling")){var z=this.tobj.rowsAr[this.tid];if ((z.nextSibling)&&(this._h2.get[z.nextSibling.idd].parent.id==this.tid))
 return ind+1};return (ind+1+((this.target=="treeGrid" && ind>=0 && this.tobj._h2.get[this.tobj.rowsCol[ind].idd].state=="minus")?this.tobj._getOpenLenght(this.tobj.rowsCol[ind].idd,0):0))};dragContext.prototype.img=function(){if ((this.target!="grid")&&(this.sobj._h2))
 return this.sobj.getItemImage(this.sid);else return null};dragContext.prototype.slist=function(){var res=new Array();for (var i=0;i<this.sid.length;i++)res[res.length]=this.sid[i][(this.source=="tree")?"id":"idd"];return res.join(",")};dhtmlXGridObject.prototype._drag=function(sourceHtmlObject,dhtmlObject,targetHtmlObject,lastLanding){var z=(this.lastLanding)
 
 if (this._autoOpenTimer)window.clearTimeout(this._autoOpenTimer);var r1=targetHtmlObject.parentNode;var r2=sourceHtmlObject.parentObject;if (!r1.idd){r1.grid=this;this.dadmodefix=0};var c=new dragContext(0,0,0,(r1.grid.dadmodec?"sibling":"child"));if (r2 && r2.childNodes)c.set("source","tree").set("sobj",r2.treeNod).set("sid",c.sobj._dragged);else{if (r2.treeNod.isTreeGrid()) c.set("source","treeGrid");c.set("sobj",r2.treeNod).set("sid",c.sobj._dragged)};if (r1.grid.isTreeGrid())
 c.set("target","treeGrid");else
 c.set("dropmode","sibling");c.set("tobj",r1.grid).set("tid",r1.idd);if (((c.tobj.dadmode==2)&&(c.tobj.dadmodec==1))&&(c.tobj.dadmodefix<0))
 if (c.tobj.obj.rows[1].idd!=c.tid)c.tid=r1.previousSibling.idd;else c.tid=window.unknown;var el = this.getFirstParentOfType(lastLanding,"TD")
 if (el)c.set("tExtra",el._cellIndex);if (el)c.set("sExtra",c.sobj._dndExtra);if (c.sobj.dpcpy)c.set("mode","copy");c.tobj._clearMove();c.tobj.dragContext=c;if (!c.tobj.callEvent("onDrag",[c.slist(),c.tid,c.sobj,c.tobj,c.sExtra,c.tExtra])) return;var result=new Array();if (typeof(c.sid)=="object"){var nc=c.copy();for (var i=0;i<c.sid.length;i++){if (!nc.set("alfa",(!i)).set("sid",c.sid[i][(c.source=="tree"?"id":"idd")]).valid()) continue;nc.tobj._dragRoutine(nc);result[result.length]=nc.nid;nc.set("dropmode","sibling").set("tid",nc.nid)};nc.close()}else
 c.tobj._dragRoutine(c);if (c.tobj.laterLink)c.tobj.laterLink();c.tobj.callEvent("onDrop",[c.slist(),c.tid,result.join(","),c.sobj,c.tobj,c.sExtra,c.tExtra]);c.tobj.dragContext=null;c.close()};dhtmlXGridObject.prototype._dragRoutine=function(c){if ((c.sobj==c.tobj)&&(c.source=="grid")&&(c.mode=="move")){if (c.sobj._dndProblematic)return;var fr=c.sobj.rowsAr[c.sid];var bind=c.sobj.rowsCol._dhx_find(fr);c.sobj.rowsCol._dhx_removeAt(c.sobj.rowsCol._dhx_find(fr));c.sobj.rowsBuffer._dhx_removeAt(c.sobj.rowsBuffer._dhx_find(fr));if (c.tobj._fake){c.tobj._fake.rowsCol._dhx_removeAt(bind);var tr=c.tobj._fake.rowsAr[c.sid];tr.parentNode.removeChild(tr)};c.sobj._insertRowAt(fr,c.ind());c.sobj.rowsBuffer._dhx_insertAt(c.ind(),fr)

 c.nid=c.sid;return};var new_row=c.uid().tobj.addRow(c.nid,c.data(),c.ind(),c.pid(),c.img(),c.childs());if (c.source=="tree"){this.callEvent("onRowAdded",[c.nid]);var sn=c.sobj._globalIdStorageFind(c.sid);if (sn.childsCount){var nc=c.copy().set("tid",c.nid).set("dropmode",c.target=="grid"?"sibling":"child");for(var j=0;j<sn.childsCount;j++){c.tobj._dragRoutine(nc.set("sid",sn.childNodes[j].id));if (c.mode=="move")j--};nc.close()}}else{c.tobj._copyUserData(c);this.callEvent("onRowAdded",[c.nid]);if ((c.source=="treeGrid")){if (c.sobj==c.tobj)new_row._xml=c.sobj.rowsAr[c.sid]._xml;var snc=c.sobj._h2.get[c.sid];if ((snc)&&(snc.childs.length)){var nc=c.copy().set("tid",c.nid);if(c.target=="grid")nc.set("dropmode","sibling");else {nc.tobj.openItem(c.tid);nc.set("dropmode","child")};var l=snc.childs.length;for(var j=0;j<l;j++){c.sobj.render_row_tree(null,snc.childs[j].id);c.tobj._dragRoutine(nc.set("sid",snc.childs[j].id));if (l!=snc.childs.length){j--;l=snc.childs.length}};nc.close()}}};if (c.mode=="move"){c.sobj[(c.source=="tree")?"deleteItem":"deleteRow"](c.sid);if ((c.sobj==c.tobj)&&(!c.tobj.rowsAr[c.sid])) {c.tobj.changeRowId(c.nid,c.sid);c.nid=c.sid}}};dhtmlXGridObject.prototype.gridToGrid = function(rowId,sgrid,tgrid){var z=new Array();for (var i=0;i<sgrid.hdr.rows[0].cells.length;i++)z[i]=sgrid.cells(rowId,i).getValue();return z};dhtmlXGridObject.prototype.checkParentLine=function(node,id){if ((!this._h2)||(!id)||(!node)) return false;if (node.id==id)return true;else return this.checkParentLine(node.parent,id)};dhtmlXGridObject.prototype._dragIn=function(htmlObject,shtmlObject,x,y){if (!this.dADTempOff)return 0;var tree=this.isTreeGrid();if(htmlObject.parentNode==shtmlObject.parentNode)return 0;if ((tree)&&((this.checkParentLine(this._h2.get[htmlObject.parentNode.idd],shtmlObject.parentNode.idd))))
 return 0;var obj=shtmlObject.parentNode.idd?shtmlObject.parentNode:shtmlObject.parentObject;if (!this.callEvent("onDragIn",[obj.idd||obj.id,htmlObject.parentNode.idd,obj.grid||obj.treeNod,htmlObject.parentNode.grid]))
 return this._setMove(htmlObject,x,y,true);this._setMove(htmlObject,x,y);if ((tree)&&(htmlObject.parentNode.expand!="")){this._autoOpenTimer=window.setTimeout(new callerFunction(this._autoOpenItem,this),1000);this._autoOpenId=htmlObject.parentNode.idd}else
 if (this._autoOpenTimer)window.clearTimeout(this._autoOpenTimer);return htmlObject};dhtmlXGridObject.prototype._autoOpenItem=function(e,gridObject){gridObject.openItem(gridObject._autoOpenId)};dhtmlXGridObject.prototype._dragOut=function(htmlObject){this._clearMove();var obj=htmlObject.parentNode.parentObject?htmlObject.parentObject.id:htmlObject.parentNode.idd;this.callEvent("onDragOut",[obj]);if (this._autoOpenTimer)window.clearTimeout(this._autoOpenTimer)};dhtmlXGridObject.prototype._setMove=function(htmlObject,x,y,skip){var a1=getAbsoluteTop(htmlObject);var a2=getAbsoluteTop(this.objBox);if ( (a1-a2-parseInt(this.objBox.scrollTop))>(parseInt(this.objBox.offsetHeight)-50) )
 this.objBox.scrollTop=parseInt(this.objBox.scrollTop)+20;if ( (a1-a2)<(parseInt(this.objBox.scrollTop)+30) )
 this.objBox.scrollTop=parseInt(this.objBox.scrollTop)-20;if (skip)return 0;if (this.dadmode==2){var z=y-a1+this.objBox.scrollTop+(document.body.scrollTop||document.documentElement.scrollTop)-2-htmlObject.offsetHeight/2;if ((Math.abs(z)-htmlObject.offsetHeight/6)>0)
 {this.dadmodec=1;if (z<0)this.dadmodefix=-1;else this.dadmodefix=1}else this.dadmodec=0}else
 this.dadmodec=this.dadmode;if (this.dadmodec){if (!this._sdrgc)this._createSdrgc();this._sdrgc.style.display="block";this._sdrgc.style.top=a1-a2+((this.dadmodefix>=0)?htmlObject.offsetHeight:0)+"px"}else{this._llSelD=htmlObject;if (htmlObject.parentNode.tagName=="TR")for (var i=0;i<htmlObject.parentNode.childNodes.length;i++){var z= htmlObject.parentNode.childNodes[i];z._bgCol=z.style.backgroundColor;z.style.backgroundColor="#FFCCCC"}}};dhtmlXGridObject.prototype._clearMove=function(){if (this._sdrgc)this._sdrgc.style.display="none";if ((this._llSelD)&&(this._llSelD.parentNode.tagName=="TR"))
 for (var i=0;i<this._llSelD.parentNode.childNodes.length;i++)this._llSelD.parentNode.childNodes[i].style.backgroundColor=this._llSelD._bgCol;this._llSelD=null};dhtmlXGridObject.prototype.rowToDragElement=function(gridRowId){var out=this.cells(gridRowId,0).getValue();return out};dhtmlXGridObject.prototype._copyUserData = function(c){if(!c.tobj.UserData[c.nid])c.tobj.UserData[c.nid] = new Hashtable();var z1 = c.sobj.UserData[c.sid];var z2 = c.tobj.UserData[c.nid];if (z1){z2.keys = z2.keys.concat(z1.keys);z2.values = z2.values.concat(z1.values)}};dhtmlXGridObject.prototype.moveRow=function(rowId,mode,targetId,targetGrid){switch(mode){case "row_sibling":
 this.moveRowTo(rowId,targetId,"move","sibling",this,targetGrid);break;case "up":
 this.moveRowUp(rowId);break;case "down":
 this.moveRowDown(rowId);break}};dhtmlXGridObject.prototype._nonTrivialNode=function(tree,targetObject,beforeNode,itemObject,z2)
{if ((tree.callEvent)&&(!z2))
 if (!tree.callEvent("onDrag",[itemObject.idd,targetObject.id,(beforeNode?beforeNode.id:null),this,tree])) return false;var gridRowId = itemObject.idd;var treeNodeId = gridRowId+(new Date()).getMilliseconds();var img=(this.isTreeGrid()?this.getItemImage(gridRowId):"")
 var newone=tree._attachChildNode(targetObject,treeNodeId,this.gridToTreeElement(tree,treeNodeId,gridRowId),"",img,img,img,"","",beforeNode);if (this._h2){var akids=this._h2.get[gridRowId];if (akids.childs.length)for (var i=0;i<akids.childs.length;i++){this._nonTrivialNode(tree,newone,0,this.rowAr[akids.childs[i].id],1);if (!this.dpcpy)i--}};if (!this.dpcpy)this.deleteRow(gridRowId);if ((tree.callEvent)&&(!z2))
 tree.callEvent("onDrop",[treeNodeId,targetObject.id,(beforeNode?beforeNode.id:null),this,tree])};dhtmlXGridObject.prototype.gridToTreeElement = function(treeObj,treeNodeId,gridRowId){return this.cells(gridRowId,0).getValue()};dhtmlXGridObject.prototype.treeToGridElement = function(treeObj,treeNodeId,gridRowId){var w=new Array();var z=this.cellType._dhx_find("tree");if (z==-1)z=0;for(var i=0;i<this.getColumnCount();i++)
 w[w.length]=(i!=z)?(treeObj.getUserData(treeNodeId,this.getColumnId(i))||""):treeObj.getItemText(treeNodeId);return w};dhtmlXGridObject.prototype.moveRowTo=function(srowId,trowId,mode,dropmode,sourceGrid,targetGrid){var c=new dragContext((sourceGrid||this).isTreeGrid()?"treeGrid":"grid",(targetGrid||this).isTreeGrid()?"treeGrid":"grid",mode,dropmode||"sibling",srowId,trowId,sourceGrid||this,targetGrid||this);c.tobj._dragRoutine(c);c.close();return c.nid};dhtmlXGridObject.prototype.enableMercyDrag=function(mode){this.dpcpy=convertStringToBoolean(mode)};




//v.1.6 build 80512

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/