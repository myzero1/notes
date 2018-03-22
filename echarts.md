#用百度地图api获取MapGeoData
```html
            <!DOCTYPE html>
            <html>
            <head>
              <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
              <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
              <style type="text/css">
                body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
              </style>
              <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=您的密钥"></script>
              <title>添加行政区划</title>
            </head>
            <body>
              用百度地图api获取MapGeoData<br>
              进入 http://developer.baidu.com/map/jsdemo.htm#c1_10 <br>
              把这里的代码完全复制进去并运行，运行完后，就可以看大数据结果 <br>

              <textarea id="output" rows="4">the output....</textarea>
              <div id="allmap"></div>
            </body>
            </html>
            <script type="text/javascript">
              // 百度地图API功能
              var map = new BMap.Map("allmap");
              map.centerAndZoom(new BMap.Point(116.403765, 39.914850), 5);
              map.enableScrollWheelZoom();

                var areaPoints = new Array();


              function getBoundary(name){       
                var bdary = new BMap.Boundary();
                            var city =     {
                                  "type": "Feature",
                                  "properties": {
                                    "name": name
                                  },
                                  "geometry": {
                                    "type": "MultiPolygon",
                                    "coordinates": ""
                                  }
                                }
                bdary.get(name, function(rs){       //获取行政区域
                  // map.clearOverlays();        //清除地图覆盖物       
                  var count = rs.boundaries.length; //行政区域的点有多少个
                  if (count === 0) {
                    alert('未能获取当前输入行政区域---'+name);
                    return ;
                  }
                        var pointArray = [];
                  for (var i = 0; i < count; i++) {
                    var ply = new BMap.Polygon(rs.boundaries[i], {strokeWeight: 2, strokeColor: "#ff0000"}); //建立多边形覆盖物
                    map.addOverlay(ply);  //添加覆盖物
                    pointArray = pointArray.concat(ply.getPath());
                            // console.log(pointArray);

                            var points = [];

                            for (var i = 0; i < pointArray.length; i++) {
                              // console.log(pointArray[i]);
                              var point = [];
                              point.push(pointArray[i].lng);
                              point.push(pointArray[i].lat);
                              points.push(point);
                              // console.log(point);
                            }

                            var pointsend = new Array(new Array(points));
                            city['geometry']['coordinates'] = pointsend;




                          //console.log(city);
                          areaPoints.push(city);

                            // console.log(JSON.stringify(city));



                  }    
                  map.setViewport(pointArray);    //调整视野  
                  addlabel();    
                      // console.log(city);
                      return city;
                });   
              }
              //getBoundary('大名县');

              /*
              setTimeout(function(){
                getBoundary();
              }, 2000);
               */


                 var areas = [
            "邯山区",
            "丛台区",
            "复兴区",
            "峰峰矿区",
            "临漳县",
            "成安县",
            "大名县",
            "涉县",
            "磁县",
            "肥乡县",
            "永年县",
            "邱县",
            "鸡泽县",
            "广平县",
            "馆陶县",
            "魏县",
            "曲周县",
            "武安市",
            "馆陶县"
                ];

                for (var i = 0; i < areas.length; i++) { 
                  result = getBoundary(areas[i]);
                  // console.log(getBoundary(areas[i]));
                  // areaspoint.push( getBoundary(areas[i]) );
                }
                setTimeout(function(){
                  var result = {
                    "type": "FeatureCollection",
                    "features": areaPoints
                  }
                //console.log(areaPoints);
                  // $('#output').val(result);
                  document.getElementById('output').value=JSON.stringify(result);
                  // console.log(JSON.stringify(result));
              }, 5000);

                // console.log(JSON.stringify(areaspoint));





            </script>



```
