<!-- Content Wrapper. Contains page content -->
<!-- ***** Header Area Start ***** -->
<header class="header-area">
    <!-- Main Header Start -->
    <div class="main-header-area">
        <div class="classy-nav-container breakpoint-off">
            <!-- Classy Menu -->
            <nav class="classy-navbar justify-content-between" id="pocaNav">

                <!-- Logo -->
                <a class="nav-brand" href="index.html"><img src="" alt=""></a><!--./img/core-img/logo.png -->

                <!-- Navbar Toggler -->
                <div class="classy-navbar-toggler">
                    <span class="navbarToggler"><span></span><span></span><span></span></span>
                </div>

                <!-- Menu -->
                <div class="classy-menu">

                    <!-- Menu Close Button -->
                    <div class="classycloseIcon">
                        <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                    </div>

                    <!-- Nav Start -->
                    <div class="classynav">
                        <ul id="nav">
                            <li class="current-item">
                                <a href="/login">Home</a>
                            </li>
                            <#if _MENU_MAP_?? && _MENU_MAP_?size gt 0>
                                <#list _MENU_MAP_?keys as key>
                                    <#assign item = _MENU_MAP_[key]>
                                    <li><a href="${url(key)}">${key}</a>
                                        <#if item?size gt 0>
                                        <ul class="dropdown">
                                            <#list item as itemValue>
                                                <li><a href="${url(itemValue)}">${itemValue}</a></li>
                                            </#list>
                                        </ul>
                                        </#if>
                                    </li>
                                </#list>
                            </#if>
                        </ul>

                        <!-- Top Search Area -->
                        <div class="top-search-area">
                            <form action="index.html" method="post">
                                <input type="search" name="top-search-bar" class="form-control" placeholder="点击搜索。。。">
                                <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                            </form>
                        </div>



                        <#include "tools/account.ftl">
                    </div>
                    <!-- Nav End -->
                </div>
            </nav>
        </div>
    </div>
</header>
<!-- ***** Header Area End ***** -->

<script>


</script>

