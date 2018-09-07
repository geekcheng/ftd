﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common/tag.jsp"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>添加菜单</title>
    <%@include file="../common/header.jsp"%>
    <link href="${ctx}/static/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/plugins/fontIconPicker-2.0.0/css/jquery.fonticonpicker.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/static/plugins/fontIconPicker-2.0.0/themes/bootstrap-theme/jquery.fonticonpicker.bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
        var path = "<%=path%>";
    </script>
    <style type="text/css">
        .form-group .control-label {
            width: 10%;
        }
    </style>
</head>
<body>
<div class="container" style="width: 100%; padding: 0; margin: 0;min-height: 500px">
    <div style="margin: 20px 0 20px 10px;font-size: 15px;">
        <c:forEach items="${parents}" var="res">
            <a style="text-decoration: none" href="${ctx}/menu/list?id=${res.id}">${res.menuName}</a>&nbsp;&nbsp;>
        </c:forEach>
        <c:choose>
            <c:when test="${empty item.menuName}">
                <cite>添加</cite>
            </c:when>
            <c:otherwise>
                <cite>${item.menuName}</cite>
            </c:otherwise>
        </c:choose>
    </div>
    <section class="my-container">
        <form role="form" class="form-horizontal"
              data-validator-option="{timely:3, theme:'n-right', stopOnError: true}">
            <input type="hidden" name="id" value="${item.id}">
            <input type="hidden" name="parentId" value="${item.parentId}">
            <input type="hidden" name="menuType" value="${pItem.menuType}">
            <div class="form-group">
                <label class="col-sm-2 control-label">父级菜单</label>
                <div class="col-sm-5">
                    <input type="text" value="${empty pItem?'无':pItem.menuName}" class="layui-input" readOnly/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">菜单图标<span style="color: red;"> *</span></label>
                <div class="col-sm-5">
                    <input type="text" name="menuIcon" value="${item.menuIcon}" lay-verify="required" id="myStyle"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">菜单名称<span style="color: red;"> *</span></label>
                <div class="col-sm-5">
                    <input type="text" name="menuName" value="${item.menuName}" lay-verify="required"
                           class="layui-input" data-rule="required"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">菜单路径</label>
                <div class="col-sm-5">
                    <input type="text" name="menuUrl" value="${item.menuUrl}" class="layui-input" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-5">
                    <button type="button" class="layui-btn" id="formSubmit">提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </section>
</div>

<%@include file="../common/footer.jsp"%>
<script type="text/javascript" src="${ctx}/static/plugins/nice-validator/dist/jquery.validator.min.js?local=zh-CN"></script>
<script type="text/javascript" src="${ctx}/static/plugins/fontIconPicker-2.0.0/jquery.fonticonpicker.min.js" ></script>
<script type="text/javascript" src="<%=path%>/static/js/sys/menu/menu.js" ></script>
<script type="text/javascript" src="<%=path%>/static/js/sys/menu/menuLayui.js" ></script>
<script type="text/javascript">
    var dataSource = ['fa fa-cog','fa fa-list','fa fa-arrows','fa fa-user','fa fa-database','fa fa-file-archive-o','fa fa-align-left',
        'fa fa-arrow-circle-o-up','fa fa-search','fa fa-times-circle','fa fa-address-book','fa fa-address-book-o','fa fa-address-card','fa fa-address-card-o','fa fa-bandcamp','fa fa-bath','fa fa-bathtub','fa fa-drivers-license','fa fa-drivers-license-o','fa fa-eercast','fa fa-envelope-open','fa fa-envelope-open-o','fa fa-etsy','fa fa-free-code-camp','fa fa-grav','fa fa-handshake-o','fa fa-id-badge','fa fa-id-card','fa fa-id-card-o','fa fa-imdb','fa fa-linode','fa fa-meetup','fa fa-microchip','fa fa-podcast','fa fa-quora','fa fa-ravelry','fa fa-s','fa fa-shower','fa fa-snowflake-o','fa fa-superpowers','fa fa-telegram','fa fa-thermometer','fa fa-thermometer-','fa fa-thermometer-empty','fa fa-thermometer-full','fa fa-thermometer-half','fa fa-thermometer-quarter','fa fa-thermometer-three-quarters','fa fa-times-rectangle','fa fa-times-rectangle-o','fa fa-user-circle','fa fa-user-circle-o','fa fa-user-o','fa fa-vcard','fa fa-vcard-o','fa fa-window-close','fa fa-window-close-o','fa fa-window-maximize','fa fa-window-minimize','fa fa-window-restore','fa fa-wpexplorer','fa fa-adjust','fa fa-american-sign-language-interpreting','fa fa-anchor','fa fa-archive','fa fa-area-chart','fa fa-arrows','fa fa-arrows-h','fa fa-arrows-v','fa fa-asl-interpreting','fa fa-assistive-listening-systems','fa fa-asterisk','fa fa-at','fa fa-audio-description','fa fa-automobile','fa fa-balance-scale','fa fa-ban','fa fa-bank','fa fa-bar-chart','fa fa-bar-chart-o','fa fa-barcode','fa fa-bars','fa fa-battery','fa fa-battery-','fa fa-battery-empty','fa fa-battery-full','fa fa-battery-half','fa fa-battery-quarter','fa fa-battery-three-quarters','fa fa-bed','fa fa-beer','fa fa-bell','fa fa-bell-o','fa fa-bell-slash','fa fa-bell-slash-o','fa fa-bicycle','fa fa-binoculars','fa fa-birthday-cake','fa fa-blind','fa fa-bluetooth','fa fa-bluetooth-b','fa fa-bolt','fa fa-bomb','fa fa-book','fa fa-bookmark','fa fa-bookmark-o','fa fa-braille','fa fa-briefcase','fa fa-bug','fa fa-building','fa fa-building-o','fa fa-bullhorn','fa fa-bullseye','fa fa-bus','fa fa-cab','fa fa-calculator','fa fa-calendar','fa fa-calendar-check-o','fa fa-calendar-minus-o','fa fa-calendar-o','fa fa-calendar-plus-o','fa fa-calendar-times-o','fa fa-camera','fa fa-camera-retro','fa fa-car','fa fa-caret-square-o-down','fa fa-caret-square-o-left','fa fa-caret-square-o-right','fa fa-caret-square-o-up','fa fa-cart-arrow-down','fa fa-cart-plus','fa fa-cc','fa fa-certificate','fa fa-check','fa fa-check-circle','fa fa-check-circle-o','fa fa-check-square','fa fa-check-square-o','fa fa-child','fa fa-circle','fa fa-circle-o','fa fa-circle-o-notch','fa fa-circle-thin','fa fa-clock-o','fa fa-clone','fa fa-close','fa fa-cloud','fa fa-cloud-download','fa fa-cloud-upload','fa fa-code','fa fa-code-fork','fa fa-coffee','fa fa-cog','fa fa-cogs','fa fa-comment','fa fa-comment-o','fa fa-commenting','fa fa-commenting-o','fa fa-comments','fa fa-comments-o','fa fa-compass','fa fa-copyright','fa fa-creative-commons','fa fa-credit-card','fa fa-credit-card-alt','fa fa-crop','fa fa-crosshairs','fa fa-cube','fa fa-cubes','fa fa-cutlery','fa fa-dashboard','fa fa-database','fa fa-deaf','fa fa-deafness','fa fa-desktop','fa fa-diamond','fa fa-dot-circle-o','fa fa-download','fa fa-edit','fa fa-ellipsis-h','fa fa-ellipsis-v','fa fa-envelope','fa fa-envelope-o','fa fa-envelope-square','fa fa-eraser','fa fa-exchange','fa fa-exclamation','fa fa-exclamation-circle','fa fa-exclamation-triangle','fa fa-external-link','fa fa-external-link-square','fa fa-eye','fa fa-eye-slash','fa fa-eyedropper','fa fa-fax','fa fa-feed','fa fa-female','fa fa-fighter-jet','fa fa-file-archive-o','fa fa-file-audio-o','fa fa-file-code-o','fa fa-file-excel-o','fa fa-file-image-o','fa fa-file-movie-o','fa fa-file-pdf-o','fa fa-file-photo-o','fa fa-file-picture-o','fa fa-file-powerpoint-o','fa fa-file-sound-o','fa fa-file-video-o','fa fa-file-word-o','fa fa-file-zip-o','fa fa-film','fa fa-filter','fa fa-fire','fa fa-fire-extinguisher','fa fa-flag','fa fa-flag-checkered','fa fa-flag-o','fa fa-flash','fa fa-flask','fa fa-folder','fa fa-folder-o','fa fa-folder-open','fa fa-folder-open-o','fa fa-frown-o','fa fa-futbol-o','fa fa-gamepad','fa fa-gavel','fa fa-gear','fa fa-gears','fa fa-gift','fa fa-glass','fa fa-globe','fa fa-graduation-cap','fa fa-group','fa fa-hand-grab-o','fa fa-hand-lizard-o','fa fa-hand-paper-o','fa fa-hand-peace-o','fa fa-hand-pointer-o','fa fa-hand-rock-o','fa fa-hand-scissors-o','fa fa-hand-spock-o','fa fa-hand-stop-o','fa fa-hard-of-hearing','fa fa-hashtag','fa fa-hdd-o','fa fa-headphones','fa fa-heart','fa fa-heart-o','fa fa-heartbeat','fa fa-history','fa fa-home','fa fa-hotel','fa fa-hourglass','fa fa-hourglass-','fa fa-hourglass-end','fa fa-hourglass-half','fa fa-hourglass-o','fa fa-hourglass-start','fa fa-i-cursor','fa fa-image','fa fa-inbox','fa fa-industry','fa fa-info','fa fa-info-circle','fa fa-institution','fa fa-key','fa fa-keyboard-o','fa fa-language','fa fa-laptop','fa fa-leaf','fa fa-legal','fa fa-lemon-o','fa fa-level-down','fa fa-level-up','fa fa-life-bouy','fa fa-life-buoy','fa fa-life-ring','fa fa-life-saver','fa fa-lightbulb-o','fa fa-line-chart','fa fa-location-arrow','fa fa-lock','fa fa-low-vision','fa fa-magic','fa fa-magnet','fa fa-mail-forward','fa fa-mail-reply','fa fa-mail-reply-all','fa fa-male','fa fa-map','fa fa-map-marker','fa fa-map-o','fa fa-map-pin','fa fa-map-signs','fa fa-meh-o','fa fa-microphone','fa fa-microphone-slash','fa fa-minus','fa fa-minus-circle','fa fa-minus-square','fa fa-minus-square-o','fa fa-mobile','fa fa-mobile-phone','fa fa-money','fa fa-moon-o','fa fa-mortar-board','fa fa-motorcycle','fa fa-mouse-pointer','fa fa-music','fa fa-navicon','fa fa-newspaper-o','fa fa-object-group','fa fa-object-ungroup','fa fa-paint-brush','fa fa-paper-plane','fa fa-paper-plane-o','fa fa-paw','fa fa-pencil','fa fa-pencil-square','fa fa-pencil-square-o','fa fa-percent','fa fa-phone','fa fa-phone-square','fa fa-photo','fa fa-picture-o','fa fa-pie-chart','fa fa-plane','fa fa-plug','fa fa-plus','fa fa-plus-circle','fa fa-plus-square','fa fa-plus-square-o','fa fa-power-off','fa fa-print','fa fa-puzzle-piece','fa fa-qrcode','fa fa-question','fa fa-question-circle','fa fa-question-circle-o','fa fa-quote-left','fa fa-quote-right','fa fa-random','fa fa-recycle','fa fa-refresh','fa fa-registered','fa fa-remove','fa fa-reorder','fa fa-reply','fa fa-reply-all','fa fa-retweet','fa fa-road','fa fa-rocket','fa fa-rss','fa fa-rss-square','fa fa-search-minus','fa fa-search-plus','fa fa-send','fa fa-send-o','fa fa-server','fa fa-share','fa fa-share-alt','fa fa-share-alt-square','fa fa-share-square','fa fa-share-square-o','fa fa-shield','fa fa-ship','fa fa-shopping-bag','fa fa-shopping-basket','fa fa-shopping-cart','fa fa-sign-in','fa fa-sign-language','fa fa-sign-out','fa fa-signal','fa fa-signing','fa fa-sitemap','fa fa-sliders','fa fa-smile-o','fa fa-soccer-ball-o','fa fa-sort','fa fa-sort-alpha-asc','fa fa-sort-alpha-desc','fa fa-sort-amount-asc','fa fa-sort-amount-desc','fa fa-sort-asc','fa fa-sort-desc','fa fa-sort-down','fa fa-sort-numeric-asc','fa fa-sort-numeric-desc','fa fa-sort-up','fa fa-space-shuttle','fa fa-spinner','fa fa-spoon','fa fa-square','fa fa-square-o','fa fa-star','fa fa-star-half','fa fa-star-half-empty','fa fa-star-half-full','fa fa-star-half-o','fa fa-star-o','fa fa-sticky-note','fa fa-sticky-note-o','fa fa-street-view','fa fa-suitcase','fa fa-sun-o','fa fa-support','fa fa-tablet','fa fa-tachometer','fa fa-tag','fa fa-tags','fa fa-tasks','fa fa-taxi','fa fa-television','fa fa-terminal','fa fa-thumb-tack','fa fa-thumbs-down','fa fa-thumbs-o-down','fa fa-thumbs-o-up','fa fa-thumbs-up','fa fa-ticket','fa fa-times','fa fa-times-circle-o','fa fa-tint','fa fa-toggle-down','fa fa-toggle-left','fa fa-toggle-off','fa fa-toggle-on','fa fa-toggle-right','fa fa-toggle-up','fa fa-trademark','fa fa-trash','fa fa-trash-o','fa fa-tree','fa fa-trophy','fa fa-truck','fa fa-tty','fa fa-tv','fa fa-umbrella','fa fa-universal-access','fa fa-university','fa fa-unlock','fa fa-unlock-alt','fa fa-unsorted','fa fa-upload','fa fa-user','fa fa-user-plus','fa fa-user-secret','fa fa-user-times','fa fa-users','fa fa-video-camera','fa fa-volume-control-phone','fa fa-volume-down','fa fa-volume-off','fa fa-volume-up','fa fa-warning','fa fa-wheelchair','fa fa-wheelchair-alt','fa fa-wifi','fa fa-wrench','fa fa-hand-o-down','fa fa-hand-o-left','fa fa-hand-o-right','fa fa-hand-o-up','fa fa-ambulance','fa fa-subway','fa fa-train','fa fa-genderless','fa fa-intersex','fa fa-mars','fa fa-mars-double','fa fa-mars-stroke','fa fa-mars-stroke-h','fa fa-mars-stroke-v','fa fa-mercury','fa fa-neuter','fa fa-transgender','fa fa-transgender-alt','fa fa-venus','fa fa-venus-double','fa fa-venus-mars','fa fa-file','fa fa-file-o','fa fa-file-text','fa fa-file-text-o','fa fa-cc-amex','fa fa-cc-diners-club','fa fa-cc-discover','fa fa-cc-jcb','fa fa-cc-mastercard','fa fa-cc-paypal','fa fa-cc-stripe','fa fa-cc-visa','fa fa-google-wallet','fa fa-paypal','fa fa-bitcoin','fa fa-btc','fa fa-cny','fa fa-dollar','fa fa-eur','fa fa-euro','fa fa-gbp','fa fa-gg','fa fa-gg-circle','fa fa-ils','fa fa-inr','fa fa-jpy','fa fa-krw','fa fa-rmb','fa fa-rouble','fa fa-rub','fa fa-ruble','fa fa-rupee','fa fa-shekel','fa fa-sheqel','fa fa-try','fa fa-turkish-lira','fa fa-usd','fa fa-won','fa fa-yen','fa fa-align-center','fa fa-align-justify','fa fa-align-left','fa fa-align-right','fa fa-bold','fa fa-chain','fa fa-chain-broken','fa fa-clipboard','fa fa-columns','fa fa-copy','fa fa-cut','fa fa-dedent','fa fa-files-o','fa fa-floppy-o','fa fa-font','fa fa-header','fa fa-indent','fa fa-italic','fa fa-link','fa fa-list','fa fa-list-alt','fa fa-list-ol','fa fa-list-ul','fa fa-outdent','fa fa-paperclip','fa fa-paragraph','fa fa-paste','fa fa-repeat','fa fa-rotate-left','fa fa-rotate-right','fa fa-save','fa fa-scissors','fa fa-strikethrough','fa fa-subscript','fa fa-superscript','fa fa-table','fa fa-text-height','fa fa-text-width','fa fa-th','fa fa-th-large','fa fa-th-list','fa fa-underline','fa fa-undo','fa fa-unlink','fa fa-angle-double-down','fa fa-angle-double-left','fa fa-angle-double-right','fa fa-angle-double-up','fa fa-angle-down','fa fa-angle-left','fa fa-angle-right','fa fa-angle-up','fa fa-arrow-circle-down','fa fa-arrow-circle-left','fa fa-arrow-circle-o-down','fa fa-arrow-circle-o-left','fa fa-arrow-circle-o-right','fa fa-arrow-circle-o-up','fa fa-arrow-circle-right','fa fa-arrow-circle-up','fa fa-arrow-down','fa fa-arrow-left','fa fa-arrow-right','fa fa-arrow-up','fa fa-arrows-alt','fa fa-caret-down','fa fa-caret-left','fa fa-caret-right','fa fa-caret-up','fa fa-chevron-circle-down','fa fa-chevron-circle-left','fa fa-chevron-circle-right','fa fa-chevron-circle-up','fa fa-chevron-down','fa fa-chevron-left','fa fa-chevron-right','fa fa-chevron-up','fa fa-long-arrow-down','fa fa-long-arrow-left','fa fa-long-arrow-right','fa fa-long-arrow-up','fa fa-backward','fa fa-compress','fa fa-eject','fa fa-expand','fa fa-fast-backward','fa fa-fast-forward','fa fa-forward','fa fa-pause','fa fa-pause-circle','fa fa-pause-circle-o','fa fa-play','fa fa-play-circle','fa fa-play-circle-o','fa fa-step-backward','fa fa-step-forward','fa fa-stop','fa fa-stop-circle','fa fa-stop-circle-o','fa fa-youtube-play','fa fa-adn','fa fa-amazon','fa fa-android','fa fa-angellist','fa fa-apple','fa fa-behance','fa fa-behance-square','fa fa-bitbucket','fa fa-bitbucket-square','fa fa-black-tie','fa fa-buysellads','fa fa-chrome','fa fa-codepen','fa fa-codiepie','fa fa-connectdevelop','fa fa-contao','fa fa-css','fa fa-dashcube','fa fa-delicious','fa fa-deviantart','fa fa-digg','fa fa-dribbble','fa fa-dropbox','fa fa-drupal','fa fa-edge','fa fa-empire','fa fa-envira','fa fa-expeditedssl','fa fa-fa','fa fa-facebook','fa fa-facebook-f','fa fa-facebook-official','fa fa-facebook-square','fa fa-firefox','fa fa-first-order','fa fa-flickr','fa fa-font-awesome','fa fa-fonticons','fa fa-fort-awesome','fa fa-forumbee','fa fa-foursquare','fa fa-ge','fa fa-get-pocket','fa fa-git','fa fa-git-square','fa fa-github','fa fa-github-alt','fa fa-github-square','fa fa-gitlab','fa fa-gittip','fa fa-glide','fa fa-glide-g','fa fa-google','fa fa-google-plus','fa fa-google-plus-circle','fa fa-google-plus-official','fa fa-google-plus-square','fa fa-gratipay','fa fa-hacker-news','fa fa-houzz','fa fa-html','fa fa-instagram','fa fa-internet-explorer','fa fa-ioxhost','fa fa-joomla','fa fa-jsfiddle','fa fa-lastfm','fa fa-lastfm-square','fa fa-leanpub','fa fa-linkedin','fa fa-linkedin-square','fa fa-linux','fa fa-maxcdn','fa fa-meanpath','fa fa-medium','fa fa-mixcloud','fa fa-modx','fa fa-odnoklassniki','fa fa-odnoklassniki-square','fa fa-opencart','fa fa-openid','fa fa-opera','fa fa-optin-monster','fa fa-pagelines','fa fa-pied-piper','fa fa-pied-piper-alt','fa fa-pied-piper-pp','fa fa-pinterest','fa fa-pinterest-p','fa fa-pinterest-square','fa fa-product-hunt','fa fa-qq','fa fa-ra','fa fa-rebel','fa fa-reddit','fa fa-reddit-alien','fa fa-reddit-square','fa fa-renren','fa fa-resistance','fa fa-safari','fa fa-scribd','fa fa-sellsy','fa fa-shirtsinbulk','fa fa-simplybuilt','fa fa-skyatlas','fa fa-skype','fa fa-slack','fa fa-slideshare','fa fa-snapchat','fa fa-snapchat-ghost','fa fa-snapchat-square','fa fa-soundcloud','fa fa-spotify','fa fa-stack-exchange','fa fa-stack-overflow','fa fa-steam','fa fa-steam-square','fa fa-stumbleupon','fa fa-stumbleupon-circle','fa fa-tencent-weibo','fa fa-themeisle','fa fa-trello','fa fa-tripadvisor','fa fa-tumblr','fa fa-tumblr-square','fa fa-twitch','fa fa-twitter','fa fa-twitter-square','fa fa-usb','fa fa-viacoin','fa fa-viadeo','fa fa-viadeo-square','fa fa-vimeo','fa fa-vimeo-square','fa fa-vine','fa fa-vk','fa fa-wechat','fa fa-weibo','fa fa-weixin','fa fa-whatsapp','fa fa-wikipedia-w','fa fa-windows','fa fa-wordpress','fa fa-wpbeginner','fa fa-wpforms','fa fa-xing','fa fa-xing-square','fa fa-y-combinator','fa fa-y-combinator-square','fa fa-yahoo','fa fa-yc','fa fa-yc-square','fa fa-yelp','fa fa-yoast','fa fa-youtube','fa fa-youtube-square','fa fa-h-square','fa fa-hospital-o','fa fa-medkit','fa fa-stethoscope','fa fa-user-md'];
    $(function(){

        $('#myStyle').fontIconPicker({
            source:dataSource,
            theme:"fip-bootstrap",
            emptyIcon: true,
            hasSearch: true
        });
        $("#formSubmit").click(function(){
            //防止重复点击
            $(this).attr("disabled", "true");
            $.ajax({
                url:"${ctx}/menu/addAjax",
                type:"post",
                data:$("form.form-horizontal").serialize(),
                dataType:"json",
                success:function(json){
                    if(json.errorcode==0){
                        layer.msg(json.message, {time:1000}, function(){
                            if("${item.parentId}"=="0"){
                                window.location.href='${ctx}/menu/list';
                            }else{
                                window.location.href='${ctx}/menu/list?id=${item.parentId}';
                            }
                        });
                    }else{
                        layer.msg(json.message, {time:1000});
                    }
                    $(this).removeAttr("disabled");
                },
                error:function(json){
                    layer.msg("操作失败！", {time:1000}, function(){
                        location=location;
                        $(this).removeAttr("disabled");
                    });
                }
            });
        });
    });
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
    });
</script>
</body>
</html>