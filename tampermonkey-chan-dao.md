# 禅道DI统计


```



// ==UserScript==
// @name         chandao
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        http://172.16.62.3/zentaopms/www/project-bug-18-status,id_desc-0-1136-50-1.html
// @grant        none
// @require    http://code.jquery.com/jquery-1.11.0.min.js
// ==/UserScript==

function getNowFormatDate() {
    var date = new Date();
    /*
    date.getYear();        //获取当前年份(2位)
    date.getFullYear();    //获取完整的年份(4位,2014)
    date.getMonth();       //获取当前月份(0-11,0代表1月)
    date.getDate();        //获取当前日(1-31)
    date.getDay();         //获取当前星期X(0-6,0代表星期天)
    date.getTime();        //获取当前时间(从1970.1.1開始的毫秒数)
    date.getHours();       //获取当前小时数(0-23)
    date.getMinutes();     //获取当前分钟数(0-59)
    date.getSeconds();     //获取当前秒数(0-59)
    date.getMilliseconds();    //获取当前毫秒数(0-999)
    date.toLocaleDateString();     //获取当前日期   如 2014年6月25日
    date.toLocaleTimeString();     //获取当前时间   如 下午4:45:06
    date.toLocaleString();         //获取日期与时间 如 2014年6月25日 下午4:45:06
    */
    return date.getFullYear() + '-' + (parseInt(date.getMonth())+1) + '-' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
}

(function() {
    'use strict';

    // Your code here...
    $(document).ready(function(){
        var di = {};
        var delay = 0;
        var requirement = 0;

        $("#bugList tbody tr").each(function(){
            var name = $(this).children("td:eq(5)").text();
            // console.log(name);
            if(name == 'Closed'){
                return false;//实现break功能
                // return ;//实现continue功能
            }
            var val = parseInt($(this).children("td:eq(1)").text());
            /*
            1---10
            2---3
            3---1
            4---0.1
            */

            switch(val) {
                case 1:
                    val = 10;
                    break;
                case 2:
                    val = 3;
                    break;
                case 3:
                    val = 1;
                    break;
                case 4:
                    val = 0.1;
                    break;
            }

            if(di[name] == undefined){
                di[name] = 0
            }

            di[name] = di[name] + val;

            if('延期处理' == $(this).children("td:eq(7)").text()){
                delay = delay + val;
            }

            if($(this).children("td:eq(3)").text().indexOf('需求') != -1){
                requirement = requirement + val;
            }
        });

        var items = [];
        var total = 0;
        items.push('<tr  style="color:red"><td>明细</td><td></td></tr>');
        for (var k in di) {
            // var item = listStr + k + ':' + di[k] + "<br>";
            items.push('<tr><td>'+k+'</td><td>'+di[k].toFixed(1)+'</td></tr>');

            total = di[k] + total;
        }

        var subtotal = [];
        var endTotal = (total-delay-requirement).toFixed(1);
        subtotal.push('<tr  style="color:red"><td>概要</td><td></td></tr>');
        subtotal.push('<tr><td>'+'统计时间'+'</td><td>'+getNowFormatDate()+'</td></tr>');
        subtotal.push('<tr><td>'+'总计-需求-延期处理'+'</td><td>'+endTotal+'</td></tr>');
        subtotal.push('<tr><td>'+'总计'+'</td><td>'+total+'</td></tr>');
        subtotal.push('<tr><td>'+'需求'+'</td><td>'+requirement+'</td></tr>');
        subtotal.push('<tr><td>'+'延期处理'+'</td><td>'+delay+'</td></tr>');

        var itemsStr = '<table class="table table-condensed table-hover table-striped tablesorter table-fixed">'+subtotal.join('')+items.join('')+'</table>'

        $('#titlebar').after('<div style="margin-bottom:50px">'+itemsStr+'</div>');

        // console.log(di);
    });


})();




```
