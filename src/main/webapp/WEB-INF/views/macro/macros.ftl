

<!-- 分页信息处理:  -->
<#macro pagination_article>
	<input type="hidden" id="count" value="${_count_}">
	<input type="hidden" id="page" value="${page}">
	<div class="pagingBoxs clearfix">
		<div class="col-sm-5">
			<div class="pagingSkipb dataTables_length" id="pageLeft">每页行数：
				<span id="pageRowNum" ></span>
				<button type="button" class="btn btn-default btn_normal" id="refresh"   onclick="refresh_search()" ><span class="fa fa-refresh"></span>刷新</button>
				<button type="button" class="btn btn-default btn_normal" id="excelOut"  onclick="excelOut()" style="display: none;"><span class="fa fa-download"></span>下载</button>
				<span class="count">&nbsp;&nbsp;总计：${_count_}条记录</span>
			</div>
		</div>
		<div class="col-sm-7">
		   <div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
		   	<nav id="jpager">
				<div class="pagination"><span class="current prev" rel="prev">前一页</span>
					<span class="current">1</span>
					<a href="#">2</a><a href="#">3</a>
					<a href="#">4</a><a href="#">5</a>
					<span>...</span><a href="#" class="ep">7077</a>
					<a href="#" class="next" rel="next">后一页</a>
				</div>
			</nav>
		   </div>
		</div>
	</div>
	
	<script>
		$(function(){
			var a =  window.screen.height;
  			var b = window.screen.width;
			if (false && (a==864&&b==1536 || a==1080&&b==1920)){
    			$("#pageRowNum").html("<input type='text' id='rows'  style='height:22px;width:31px;border:1px solid;text-align:center' onChange='check(this)'/>");
    		}else{
    			var op = '<select class="form-control" id="rows"><option value="10">10</option><option value="20">20</option><option value="50">50</option><option value="100">100</option><option value="200">200</option></select>';
    			$("#pageRowNum").html(op);
   			}
		});
	</script>
</#macro>

<!--默认每页展示50行-->
<#macro paginationDivExtProduct>
	<input type="hidden" id="pageCount" value="50">
</#macro>





