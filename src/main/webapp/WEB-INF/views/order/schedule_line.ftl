<div id="content-outer">
    <div id="content">
        <div class="about2">
            <div class="wrapper clearfix-time">
                <div class="tit">
                    <h5 class="f24">教室安排时间表</h5>
                    <h6 class="f16">All</h6>
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
        <div class="roomCode" style="text-align: center; color: whitesmoke; padding-top: 25px">@Room ${_result_[0].roomCode}</div>
    </div>
</div>

<div id="calendar" style="position:fixed;right: 0;top:100px;left:auto;bottom:200px;width:335px;height: 335px;background:#262728;margin-right: 0px">
    <div style="height: 100px"></div>
</div>

<script type="text/javascript" src="${rc.contextPath}/resources/calendar/javascripts/simple-calendar.js"></script>
<script>
    var myCalendar = new SimpleCalendar('#calendar');
    myCalendar.updateSize('335px', '335px');

</script>