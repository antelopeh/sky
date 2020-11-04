<#assign operator=Session["_SESSION_OPERATOR_"]>
<div class="user dropdown user-menu" >
	<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="height:40px;padding-top:8px;color: black">
	   <img src="${rc.contextPath}${operator.titleimage}" class="user-image" alt="User Image">
	   <span class="hidden-xs">${operator.name}</span>
	</a>
	<ul class="dropdown-menu">
		<!-- User image -->
		<li class="user-header"><img src="${rc.contextPath}${operator.titleimage}" class="img-circle" alt="User Image">
			<p>
				<small style="">${operator.name}</small>
				<br/>
				<small style="">${operator.email}</small>
			</p>
		</li>
		<!-- Menu Body -->
		<li class="user-body" style="display:none">
			<div class="row">
				<div class="col-xs-4 text-center">
					<a href="#"></a>
				</div>
				<div class="col-xs-4 text-center">
					<a href="#"></a>
				</div>
				<div class="col-xs-4 text-center">
					<a href="#"></a>
				</div>
			</div>
			<!-- /.row -->
		</li>
		<!-- Menu Footer-->
		<li class="user-footer">
			<div class="pull-left">
				<a href="javascript:void(0);" style="background: black" class="change-font btn btn-default btn-flat" data-addtab="iframe_0503"  onclick="null">个人设置</a>
			</div>
			<div class="pull-right">
				<a href="/logout" style="background: black" class="change-font btn btn-default btn-flat">安全登出</a>
			</div>
		</li>
	</ul>
</div>

<div>
</div>
