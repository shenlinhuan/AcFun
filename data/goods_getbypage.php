<?php
	/*
        该php页面用于main.html
        向客户端分页返回菜品数据,以JSON格式向客户端返回
        每次最多返回5条菜品数据
        需要客户端提供从哪一行(0/5/10...)开始读取数据
        若客户端未提供起始行,则默认从第0行开始读取5条
    */
   $output=[];
   $count=5;//每次最多返回的记录数
   @$start=$_REQUEST['start']; //接收起始行的位置  @--压制当前行产生的错误信息
   if($start===NULL){
        $start=0;
   }
   $conn=mysqli_connect('127.0.0.1','root','','acfun','3306');
   $sql='SET NAMES UTF8';
   mysqli_query($conn,$sql);
   $sql="SELECT did,name,price,img_sm,material FROM ac_goods LIMIT $start,$count";
   $result=mysqli_query($conn,$sql);
   while( ($row=mysqli_fetch_assoc($result))!==NULL ){  //一行一行的读取数据
	 $output[]=$row;
   }
   echo json_encode($output);
?>