&GLOBAL-DEFINE OUT PUT UNFORMATTED
DEF VAR vprog AS CHAR.
DEF VAR vtema AS CHAR.
DEF VAR v-temas  AS CHAR.
DEF STREAM paso.
OUTPUT STREAM paso TO xxx.txt.
PROPATH = PROPATH + ",c:\oscar\prog,.".

{&OUT} '
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
            <meta name="apple-mobile-web-app-capable" content="yes">
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

            <title>test_coverflow_1</title>

            <!-- THEME UTILITY -->
            <link rel="stylesheet" href="wink/_themes/utils/loader.css" type="text/css">
            <!-- END THEME UTILITY -->

            <style>
                #container
                ~{
                    position: absolute;
                    width: 100%;
                    height: 100%;
                    margin-top: 0;
                    overflow: hidden;
                }

                @media screen and (min-device-width: 768px)
                ~{
                    #container ~{
                        height: 80%;
                        margin-top: 20%;
                    }
                }

                .backfaces
                ~{
                    display STREAM paso: none;
                }

                .backface
                ~{
                    font-size: 20px;
                }
            </style>
                        <!-- THEME UTILITY -->
                        <script type="text/javascript" src="../../../../_themes/utils/loader.js"></script>
                        <!-- END THEME UTILITY -->
                      '  SKIP.



            {&OUT} '
            <!-- CORE -->
            <!-- Can be replaced by wink.min.js -->
            <script type="text/javascript" src="wink/_amd/js/amd.js"></script>
            <script type="text/javascript" src="wink/_base/_base/js/base.js"></script>
            <script type="text/javascript" src="wink/_base/error/js/error.js"></script>
            <script type="text/javascript" src="wink/_base/json/js/json.js"></script>
            <script type="text/javascript" src="wink/_base/ua/js/ua.js"></script>
            <script type="text/javascript" src="wink/_base/topics/js/topics.js"></script>
            <script type="text/javascript" src="wink/_base/_feat/js/feat.js"></script>
            <script type="text/javascript" src="wink/_base/_feat/js/feat_json.js"></script>
            <script type="text/javascript" src="wink/_base/_feat/js/feat_css.js"></script>
            <script type="text/javascript" src="wink/_base/_feat/js/feat_event.js"></script>
            <script type="text/javascript" src="wink/_base/_feat/js/feat_dom.js"></script>
            <script type="text/javascript" src="wink/fx/_xy/js/2dfx.js"></script>
            <script type="text/javascript" src="wink/math/_basics/js/basics.js"></script>
            <script type="text/javascript" src="wink/net/xhr/js/xhr.js"></script>
            <script type="text/javascript" src="wink/ui/xy/layer/js/layer.js"></script>
            <script type="text/javascript" src="wink/ux/event/js/event.js"></script>
            <script type="text/javascript" src="wink/ux/touch/js/touch.js"></script>
            <!-- END CORE -->
            <script type="text/javascript" src="wink/ux/window/js/window.js"></script>

            <script type="text/javascript" src="wink/math/_geometric/js/geometric.js"></script>
            <script type="text/javascript" src="wink/math/_matrix/js/matrix.js"></script>
            <script type="text/javascript" src="wink/fx/_xyz/js/3dfx.js"></script>
            <script type="text/javascript" src="wink/ux/movementtracker/js/movementtracker.js"></script>
            <script type="text/javascript" src="wink/ux/gesture/js/gesture.js"></script>

            <script type="text/javascript" src="wink/ui/xyz/coverflow/js/coverflow.js"></script>
	</head>
	
	<body >
                
		<div class="w_box w_header w_bg_dark">
			<span id="title">' v-titulo '</span>
		</div>

' skip.
vtema = OS-GETENV("thema").
IF OS-GETENV("theme") MATCHES "*nihilo*" THEN vtema = "#E6E6FA".   
ELSE IF OS-GETENV("theme") MATCHES "*claro*"  THEN vtema = "#87CEFA".    
ELSE IF OS-GETENV("theme") MATCHES "*chocolate*" THEN vtema = "#FFE4C4".
ELSE IF OS-GETENV("theme") MATCHES "*default*" THEN vtema = "#D3D3D3".
ELSE IF OS-GETENV("theme") = ? THEN vtema = "#D3D3D3".
