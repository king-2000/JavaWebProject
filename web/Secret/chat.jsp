<%--
  Created by IntelliJ IDEA.
  User: king
  Date: 2019/4/25
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WebSocket</title>
    <%--动态背景--%>
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/style.css">
    <div class="clouds"></div>
    <!--svg 纸飞机-->
    <svg class="airplane" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" width="301.18" height="99.44" viewBox="0 0 301.18 99.44">
        <defs>
            <style>
                .cls-1, .cls-2 {
                    fill: #fff;
                }

                .cls-1 {
                    stroke: #000;
                    stroke-miterlimit: 10;
                }
            </style>
        </defs>
        <title>airplane</title>
        <g>
            <polyline class="cls-1" points="296.18 13.18 1.27 0.56 25.2 24.35"/>
            <g>
                <polygon class="cls-2" points="24.76 23.82 296.61 12.82 34.29 98.78 24.76 23.82"/>
                <path d="M1166.08,987.66,907.75,1072.3l-9.38-73.81,267.71-10.83m7.14-1.29-276,11.17,9.67,76.09,266.31-87.26Z" transform="translate(-873.05 -974.19)"/>
            </g>
            <g>
                <polygon class="cls-2" points="41.11 38.61 295.66 13.13 34.45 98.72 41.11 38.61"/>
                <path d="M1164.18,988.28l-256.1,83.92,6.52-58.94,249.58-25m9-1.91-259.52,26-6.79,61.28,266.31-87.26Z" transform="translate(-873.05 -974.19)"/>
            </g>
            <g>
                <polygon class="cls-2" points="41.76 38.55 297.93 13 99.94 96.46 41.76 38.55"/>
                <path d="M1167.73,988l-194.63,82-57.2-56.93L1167.73,988m6.49-1.65-260.52,26,59.17,58.89,201.35-84.87Z" transform="translate(-873.05 -974.19)"/>
            </g>
        </g>
    </svg>

    <!--树部分-->
    <div class="trees"></div>

    <script type="text/javascript">
        //创建Websocket对象
        var webSocket = new WebSocket("ws://localhost:8080/chatSocket");
        webSocket.onopen = function () {
            webSocket.onmessage = function (event) {
                document.getElementById('show').innerHTML
                    += event.data + "<br>";
            }
        };
        var  sendMsg = function () {
            var inputElement = document.getElementById('msg');
            webSocket.send(inputElement.value);
            inputElement.value = "";
        }
    </script>
</head>
<body>
<div style="width: 600px; height: 240px; overflow-y: auto;border: 1px solid #3c3c3c;" id="show"></div>
<input type="text" size="80" id="msg" name="msg"/>
<input type="button" value="发送" onclick="sendMsg();"/>
</body>
</html>
