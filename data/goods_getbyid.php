<?php
    /*
        该php页面用于detail.html
        根据菜品编号向客户端分页返回某道菜品的详情,以JSON格式
    */
    $output=[];
    @$did=$_REQUEST['did'];
    if(!$did){ //若客户端未提交菜品编号或编号为空
        echo '{"errno":101, "errmsg":"未提供菜品ID，无法查询"}';
        return;//退出当前页面的执行
    }
    $conn=mysqli_connect('127.0.0.1','root','','acfun','3306');
    $sql='SET NAMES UTF8';
    mysqli_query($conn,$sql);
    $sql="SELECT did,name,price,img_lg,material,detail FROM ac_goods WHERE did=$did";
    $result=mysqli_query($conn,$sql);
    if( ($row=mysqli_fetch_assoc($result))!==NULL ){  //一行一行的读取数据
        $output[]=$row;
    }
    echo json_encode($output);
?>