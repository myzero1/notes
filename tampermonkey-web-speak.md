```js


// ==UserScript==
// @name         web朗读
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://m.xs7.la/book_69842/*
// @grant        none
// @require    http://code.jquery.com/jquery-1.11.0.min.js
// https://www.inqingdao.cn/5988.html
// ==/UserScript==

(function() {
    'use strict';

    // Your code here...
    $(document).ready(function(){

        var bdtts=`
            <div id="bdtts_div_id">
                <audio id="tts_autio_id" autoplay="autoplay">
                    <source id="tts_source_id" src="http://tts.baidu.com/text2audio?lan=zh&ie=UTF-8&spd=9&text=播报内容" type="audio/mpeg">
                    <embed id="tts_embed_id" height="0" width="0" src="">
                </audio>
            </div>
        `;
        $('body').append(bdtts)


        function doTTS(ttsText){
            var ttsDiv = document.getElementById('bdtts_div_id');
            var ttsAudio = document.getElementById('tts_autio_id');


            // 这样为什么替换不了播放内容
            /*var ssrcc = 'http://tts.baidu.com/text2audio?lan=zh&ie=UTF-8&spd=10&text='+ttsText;
            document.getElementById('tts_source_id').src=ssrcc;*/

            // 这样就可实现播放内容的替换了
            ttsDiv.removeChild(ttsAudio);
            var au1 = '<audio id="tts_autio_id" autoplay="autoplay">';
            var sss = '<source id="tts_source_id" src="https://tts.baidu.com/text2audio?lan=zh&ie=UTF-8&spd=5&text='+ttsText+'" type="audio/mpeg">';
            var eee = '<embed id="tts_embed_id" height="0" width="0" src="">';
            var au2 = '</audio>';
            ttsDiv.innerHTML = au1 + sss + eee + au2;

            ttsAudio = document.getElementById('tts_autio_id');

            ttsAudio.play();
        }

        function splitStr(str, length){
            var strArr = [];
            var n = length;
            for (var i = 0, l = str.length; i < l/n; i++) {
                var a = str.slice(n*i, n*(i+1));
                strArr.push(a);
            }

            return strArr
        }


        var bodyText = $('#nr1').text()
        var bodyarray = splitStr(bodyText.replace(/\s*/g,""), 100)
        window.strTmp = bodyarray

        for (var i = 0; i < bodyarray.length; i++) {
            setTimeout(function(){
                var strTmp = window.strTmp.shift()
                doTTS(encodeURI(strTmp))

            }, i * 23000)

            if(i == bodyarray.length-1){
                setTimeout(function(){
                    window.location.href=$('#pb_next').attr('href')
                }, (i+1) * 23000)
            }
        }
    });


})();

````
