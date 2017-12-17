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
<title>Insert title here</title>
<style type="text/css">
.container{
	width: 48%;
	position: relative;
	float: left;
	border-radius: 5px;
	border: 1px solid #d4d4d4;
	-webkit-box-shadow: 0 2px 1px -1px rgba(0, 0, 0, 0.1);
	-moz-box-shadow: 0 2px 1px -1px rgba(0, 0, 0, 0.1);
	box-shadow: 0 2px 1px -1px rgba(0, 0, 0, 0.1);
	margin: 10px 10px 10px 10px;
}
.container .pannel_heading{
	line-height: 34px;
	padding: 0 15px;
	min-height: 34px;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	-webkit-border-radius: 0px;
	-moz-border-radius: 0px;
	border-radius: 0px;
	position: relative;
	box-shadow: inset 0 -2px 0 rgba(0,0,0,.05);
	-moz-box-shadow: inset 0 -2px 0 rgba(0,0,0,.05);
	-webkit-box-shadow: inset 0 -2px 0 rgba(0,0,0,.05);
    color: #2b2b2b;
    background-color: #f5f5f5;
    border-color: #dddddd;
    border-right-color: rgb(221, 221, 221);
    border-left-color: rgb(221, 221, 221);
    background: #F7F7F7;
    background-color: rgb(247, 247, 247);
    color: #688a7e;
    padding: 10px 15px;
	border-bottom: 1px solid transparent;
    border-bottom-color: transparent;
}
.pic_container{
		position:relative;
 		//padding: 15px;
		height:400px;
		width:100%;
}
.infobox_container{
	width:100%;
	position: relative;
	margin:10px auto;
	height:170px;
}
.bg{
	width:20%;
	color: #fff;
	background: #57889c;
    background-color: rgb(87, 136, 156);
	background-color: #57889c;
	min-height: 140px;
	margin-bottom: 30px;
	padding: 20px;
	color: white;
	-webkit-box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.35), 0 3px 1px -1px rgba(0, 0, 0, 0.1);
	-moz-box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.35), 0 3px 1px -1px rgba(0, 0, 0, 0.1);
	box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.35), 0 3px 1px -1px rgba(0, 0, 0, 0.1);
	display:inline-block;
	margin-left:15px;
}
.icon_blue
{
	width: 37%;
	//height: 50%;
	position: relative;
	left: 5%;
	position: relative;
	float: left;
}
.bg .icon_blue img 
{
	width: 100%;
	height: 100%;
	position: relative;
	left: 10%;
}
.bg .number
{
	position:relative;
	float:right;
	width:35%;
	margin-top: 20px;
	margin-right:10%;
	font-size: 34px;
	font-weight: 700;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;	
}
.bg .discription
{
	width:50%;
	font-size: 12px;
	text-transform: uppercase;
	font-weight: 600;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	position: relative;
	float: left;
	left: 20%;
}
.greenbg{
	
	background: #26c281;
    background-color: rgb(38, 194, 129);
	background-color: #26c281;
}
.perplebg
{
	
	background: #993366 ;
    background-color: rgb(153,51,102);
	background-color: #993366 ;
}
.blackbg
{
	
	background: #330099  ;
    background-color: rgb(51,0,153);
	background-color: #330099  ;
}
</style>
</head>
<script src="<%=basePath %>/echarts-2.2.7/build/dist/echarts.js"></script>
<script type="text/javascript">
//json_array后台传回json数组
var json_array = [{value:5, name:'车贷'},{value:200, name:'房贷'},{value:10, name:'消费贷'},{value:10, name:'助学贷'},{value:10, name:'中银e贷'},{value:20, name:'MMP贷'}];
//json_array1后台传回json数组
var json_array1 = [{value:20, name:'基金'}, {value:100, name:'理财产品'}, {value:20, name:'其它'}];
//风险评估概率数据，100为满风险
var sucre_data=20;
var data1 = new Array();//贷款类型数组
var data2 =new Array();//贷款类型对应的值
var response_data = [{value:5, name:'车贷'},{value:200, name:'房贷'},{value:10, name:'消费贷'},{value:10, name:'助学贷'},{value:10, name:'中银e贷'},{value:20, name:'MMP贷'}];
for(var i=0;i<response_data.length;i++){
	data1.push(response_data[i].name);
	data2.push(response_data[i].value);
}
var color_list = ['#C1232B','#B5C334','#FCCE10','#E87C25','#27727B', '#FE8463'];
function f1(){
 require.config({
        paths: {
            echarts: './echarts-2.2.7/build/dist'
        }
    });
    // 使用
    require(
        [
            'echarts',
            'echarts/chart/pie' // 
        ],
        function (ec) {
            // 基于准备好的dom，初始化echarts图表
            var myChart = ec.init(document.getElementById('main1')); 
            option = {
            	    title : {
            	        text: '贷款分布',
            	        subtext: '',
            	        x:'center'
            	    },
            	    tooltip : {
            	        trigger: 'item',
            	        formatter: "{a} <br/>{b} : {c} ({d}%)"
            	    },
            	    legend: {
            	        orient : 'vertical',
            	        x : 'left',
            	        data:['车贷','房贷','消费贷','助学贷','中银e贷','MMP贷']
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            magicType : {
            	                show: true, 
            	                type: ['pie', 'funnel'],
            	                option: {
            	                    funnel: {
            	                        x: '25%',
            	                        width: '50%',
            	                        funnelAlign: 'left',
            	                        max: 1548
            	                    }
            	                }
            	            },
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    calculable : true,
            	    series : [
            	        {
            	            name:'贷款分布(单位:万)',
            	            type:'pie',
            	            radius : '55%',
            	            center: ['50%', '60%'],
            	            data:json_array
            	        }
            	    ]
            	};
            myChart.setOption(option);
        }
            	                     
    );
}
function f2(){
    // 路径配置
    require.config({
        paths: {
            echarts: './echarts-2.2.7/build/dist'
        }
    });
    // 使用
    require(
        [
            'echarts',
            'echarts/chart/pie' // 
        ],
        function (ec) {
            // 基于准备好的dom，初始化echarts图表
            var myChart = ec.init(document.getElementById('main2')); 
            option = {
            	    title : {
            	        text: '金额分布',
            	        subtext: '',
            	        x:'center'
            	    },
            	    tooltip : {
            	        trigger: 'item',
            	        formatter: "{a} <br/>{b} : {c} ({d}%)"
            	    },
            	    legend: {
            	        orient : 'vertical',
            	        x : 'left',
            	        data:['基金','理财产品','其它']
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            magicType : {
            	                show: true, 
            	                type: ['pie', 'funnel'],
            	                option: {
            	                    funnel: {
            	                        x: '25%',
            	                        width: '50%',
            	                        funnelAlign: 'left',
            	                        max: 1548
            	                    }
            	                }
            	            },
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    calculable : true,
            	    series : [
            	        {
            	            name:'金额(单位:万)',
            	            type:'pie',
            	            radius : '55%',
            	            center: ['50%', '60%'],
            	            data:json_array1
            	        }
            	    ]
            	};
            myChart.setOption(option);
        }
            	                     
    );
}
function f3(){
	 require.config({
         paths: {
             echarts: './echarts-2.2.7/build/dist'
         }
     });
     // 使用
     require(
         [
             'echarts',
             'echarts/chart/gauge' // 
         ],
         function (ec) {
             // 基于准备好的dom，初始化echarts图表
             var myChart = ec.init(document.getElementById('main3')); 
             
             option = {
            		 title : {
             	        text: '风险预测',
             	        subtext: '',
             	        x:'center'
             	    }, 
             	    tooltip : {
             	        formatter: "{a} <br/>{b} : {c}%"
             	    },
             	    toolbox: {
             	        show : true,
             	        feature : {
             	            mark : {show: true},
             	            restore : {show: true},
             	            saveAsImage : {show: true}
             	        }
             	    },
             	    series : [
             	        {
             	            name:'风险评估',
             	            type:'gauge',
             	            detail : {formatter:'{value}%'},
             	            data:[{value: 50, name: '逾期概率'}]
             	        }
             	    ]
             	};
             	timeTicket = setInterval(function (){
             	   option.series[0].data[0].value  = sucre_data;
             	    myChart.setOption(option, true);
             	},2000);
         }
     );
}
function f4(){
	require(
            [
                'echarts',
                'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main4')); 
                
                option = {
                	    title: {
                	        x: 'center',
                	        text: '贷款分布,单位：万',
                	        subtext: ''
                	    },
                	    tooltip: {
                	        trigger: 'item'
                	    },
                	    toolbox: {
                	        show: true,
                	        feature: {
                	            dataView: {show: true, readOnly: false},
//                 	            restore: {show: true},
                	            saveAsImage: {show: true}
                	        }
                	    },
                	    calculable: true,
                	    grid: {
                	        borderWidth: 0,
                	        y: 80,
                	        y2: 60
                	    },
                	    xAxis: [
                	        {
                	            type: 'category',
                	            show: true,
                	            data: data1
                	        }
                	    ],
                	    yAxis: [
                	        {
                	            type: 'value',
                	            show: true
                	        }
                	    ],
                	    series: [
                	        {
                	            name: '贷款分布',
                	            type: 'bar',
                	            itemStyle: {
                	                normal: {
                	                    color: function(params) {
                	                        // build a color map as your need.
                	                        var colorList = color_list;
                	                        return colorList[params.dataIndex]
                	                    },
                	                    label: {
                	                        show: true,
                	                        position: 'top',
                	                        formatter: '{b}\n{c}'
                	                    }
                	                }
                	            },
                	            data: data2
                	        }
                	    ]
                	};
                	                    
        
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        );
}

function test(){
	f1();
	f2();
	f4();
	f3();
}

</script>
<body onload="test();">
	<div class="infobox_container">
		<div class="infobox bg bluebg">
			<div class="icon_blue"><img src="<%=basePath %>images/322322.jpg"></div>
			<div class="number">12345</div>
			<div class="discription">描述信息</div>
		</div>
		<div class="infobox bg greenbg">
			<div class="icon_blue"><img src="<%=basePath %>images/322322.jpg"></div>
			<div class="number">12345</div>
			<div class="discription">描述信息</div>
		</div>
		<div class="infobox bg perplebg">
			<div class="icon_blue"><img src="<%=basePath %>images/322322.jpg"></div>
			<div class="number">12345</div>
			<div class="discription">描述信息</div>
		</div>
		<div class="infobox bg blackbg">
			<div class="icon_blue"><img src="<%=basePath %>images/322322.jpg"></div>
			<div class="number">12345</div>
			<div class="discription">描述信息</div>
		</div>
		
	
	</div>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
   	<div class="container container1">
   		<div class="pannel_heading">
   			<div class="pannel_heading_text">头部文字</div>
		</div>
    	<div id="main3" class="pic_container" ></div>
    </div>
    <div class="container container2">
   	     <div class="pannel_heading">
   			<div class="pannel_heading_text">头部文字</div>
		</div>
    	<div id="main4" class="pic_container" ></div>
    </div>
    <div class="container container3">
    	<div class="pannel_heading">
   			<div class="pannel_heading_text">头部文字</div>
		</div>
    	<div id="main1" class="pic_container" ></div>
    </div>
    <div class="container container4">
   		 <div class="pannel_heading">
   			<div class="pannel_heading_text">头部文字</div>
		</div>
    	<div id="main2" class="pic_container"></div>
    </div>
</body>
</html>