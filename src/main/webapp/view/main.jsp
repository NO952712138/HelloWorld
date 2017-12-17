<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>PDF DEMO</title>
<style type="text/css">

body{
    margin: 0px;
    font-family: "Microsoft YaHei", sans-serif;
}

.container{

    display: flex;
    justify-content: center;
    flex-flow: row wrap;

}

.tools{
    position: fixed;
    right: 16px;
    bottom: 16px;
    text-align: center;
}

.tools button{
    padding: 8px;
    border: 1px #aaa solid;
    border-radius: 4px;
    outline: none;
    font-size: 16px;
    transition: background-color 0.3s;
}

.tools button:hover{
    background-color: orange;
}

.tools button:active{
    background-color: #FF8800;
}

#content{
    display: flex;
    flex-flow: row nowrap;
    flex-direction: column;
    width: 595px;
    height: 840px;
}

.content-banner{
    color: white;
    display: flex;
    align-items: center;
    width: 100%;
    min-height: 200px;
    background: url(../image/banner.jpg);
    background-repeat: no-repeat;
    background-size: cover;
}

.content-banner-logo{
    margin: 18px;
    width: 120px;
    height: 120px;
    border-radius: 60px;
}

.content-main{
    flex: 1;
    background-color: #f5f5f5;
    text-align: center;
}
</style>
</head>
<body>
   <div class="tools">
            <button id="btn-html2canvas">export PDF by using jspdf + html2canvas</button>
        </div>

        <div class="container">

            <div id="content">
                <div class="content-main">

                    <h3>我是中文，会不会乱码呢</h3>
                    <h3>Hello World!</h3>
                    <h3>Hello World!</h3>
                    <h3>Hello World!</h3>
                    <h3>Hello World!</h3>
                    <h3>Hello World!</h3>
                    <h3>Hello World!</h3>
                    <h3>Hello World!</h3>
                    <h3>Hello World!</h3>
                    <h3>Hello World!</h3>
                    <h3>Hello World!</h3>
                    <h3>Hello World!</h3>
                    <h3>Hello World!</h3>

                </div>

            </div>
<a href="javascript:void(0)" id="mybtn">downloadpdf</a>
        </div>

</body>
 <script src="https://code.jquery.com/jquery-git.js"></script>
 <script src="<%=basePath%>js/jspdf.debug.js"></script>
 <script src="<%=basePath%>js/html2canvas.min.js"></script>
 <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.debug.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>   -->

<script type="text/javascript">
$("#mybtn").click(function(){
	 html2canvas(document.getElementById("content"), {

	        // 渲染完成时调用，获得 canvas
	        onrendered: function(canvas) {

	            // 从 canvas 提取图片数据
	            var imgData = canvas.toDataURL('image/jpeg');

	            var doc = new jsPDF("p", "mm", "a4");
	            //                               |
	            // |—————————————————————————————|                     
	            // A0 841×1189                           
	            // A1 594×841                            
	            // A2 420×594                            
	            // A3 297×420                            
	            // A4 210×297                            
	            // A5 148×210                            
	            // A6 105×148                            
	            // A7 74×105                             
	            // A8 52×74                              
	            // A9 37×52                              
	            // A10 26×37             
	            //     |——|———————————————————————————|
	            //                                 |——|——|
	            //                                 |     |      
	            doc.addImage(imgData, 'JPEG', 0, 0,210,297);

	            doc.save('content.pdf');
	        }
	});
	
});


</script>
</html>