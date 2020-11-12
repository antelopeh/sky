<div id="content">
    <div class="about2">
        <div class="wrapper clearfix-time">
            <div class="tit">
                <h5 class="f24">教室安排时间表</h5>
                <h6 class="f16">${_result_[0].dateTime?string ["MM-dd"]}</h6>
            </div>
            <ul class="clearfix-time">
                <#list _result_ as item>
                    <li>
                        <h4 class="f30">${item.dateTime?date}</h4>
                        <#if item.timeStart = item.timeEnd>
                            <span class="span">${item.timeStart}</span>
                        <#else>
                            <span class="span">第${item.timeStart}-${item.timeEnd}课时</span>
                        </#if>
                        <p class="f14">
                            使用人：${item.user}
                        </p>
                        <p>
                            ${item.remark}
                        </p>
                    </li>
                </#list>
            </ul>
        </div>
    </div>
    <div class="roomCode" style="color: whitesmoke; bottom: 20px; left: 50%; position: absolute">@Room ${_result_[0].roomCode}</div>
</div>
