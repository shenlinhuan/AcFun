<?php
    /*
    order.html
    获取客户端提交的订单数据,保存到数据库中,
    向客户端返回保存的结果,以JSON格式
    */
    $output=[];
    @$user_name = $_REQUEST['user_name'];
    @$phone = $_REQUEST['phone'];
    @$sex = $_REQUEST['sex'];
    @$addr = $_REQUEST['addr'];
    @$did = $_REQUEST['did'];
    $order_time = time()*1000;
    if( !$user_name || !$phone || !$addr || !$did ){
        echo '{"result":"err","msg":"INVALID REQUEST DATA"}';
        return;
    }

    $conn=mysqli_connect('127.0.0.1','root','','acfun','3306');
    $sql='SET NAMES UTF8';
    mysqli_query($conn,$sql);
    $sql="INSERT INTO ac_order VALUES(NULL,'$phone','$user_name','$sex','$order_time','$addr','$did')";
    $result=mysqli_query($conn,$sql);
    if( $result ){  //执行成功
        $output['result'] = 'ok';
        //获取刚刚执行的SQL语句生成的自增编号
        $output['oid'] = mysqli_insert_id($conn);
    }else{         //执行失败
        $output['result'] = 'fail';
        $output['msg'] = '添加失败！很可能是SQL语法错误:'.$sql;
    }

    echo json_encode($output);
?>