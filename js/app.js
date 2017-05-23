angular.module("acfun",[
	'ng',
	'ngRoute',
	'ngAnimate'
])
	.controller("parentCtrl",function($scope,$location){
		//父控制器,作用范围包含所有的ngView所对应的所有控制器——此控制器一般放在body上
		$scope.jump=function(url){
	      $location.path(url);//此处的路由地址也必须省略#
	    }
	})
	.controller("startCtrl",function($scope){
		
	})
	.controller("mainCtrl",function($scope,$http){
		$scope.hasMoreData = true; //服务器是否还有更多数据可供加载
		//从服务器端获取最开始的5个商品数据
		$scope.goodsList = [];
		//控制器一加载立即请求前5条记录
		$http.get("data/goods_getbypage.php")
			.success(function(data){
				$scope.goodsList=data;//把服务器异步返回的数据声明为model数据
			});
		//当前已经加载的记录条数
		//"加载更多"按钮的监听函数
		$scope.loadMore=function(){
			$http.get('data/goods_getbypage.php?start=' + $scope.goodsList.length)
				.success(function(data){
					if(data.length<5){
						$scope.hasMoreData = false;
					}
					//把新获取的数据追加到之前已经获取的数据的尾部
					$scope.goodsList=$scope.goodsList.concat(data);//把服务器异步返回的数据声明为model数据
				})
		}
		//监视Model数据kw的改变,只要一改变就要发起异步服务器请求
		$scope.$watch('kw',function(){
			//console.log('Model数据kw改变为:'+$scope.kw);
			if(!$scope.kw){//模型数据为空
	        		return;
	        }else{//模型数据改变,发起AJAX请求
	        		$http.get("data/goods_getbykw.php?kw="+$scope.kw)
	        			.success(function(data){
	        				$scope.goodsList=data;//清除已有的记录，只显示此次查询到的记录
	        			});
	        }
		});
	})
	.controller('detailCtrl',function($scope,$location,$routeParams,$http){
	    //console.log('路由参数:');
	    //console.log($routeParams);
	    $http.get('data/goods_getbyid.php?did='+$routeParams.did)
	      .success(function(data){
	        $scope.good = data[0];
	      });
	    //console.log($routeParams.did);
	    $scope.jumpToOrder=function(){
	      $location.path('/order/'+$routeParams.did);
	    }
	 })
	
	.controller('orderCtrl',function($scope,$routeParams,$http,$rootScope){
		//通过方向2的绑定可以将view中的表单输入的值绑定到Model中
		$scope.order={did:$routeParams.did};
		//测试数据
	    //$scope.order.user_name='沈林焕';
	    //$scope.order.sex='1';
	    //$scope.order.phone='13501234567';
	    //$scope.order.addr='外包大楼';
	    
	    $scope.ordSuc=true;
	    $scope.submitOrder=function(){
	    		$scope.ordSuc=false;
	    		//console.log($scope.order);
			//必须把js中的对象转换为kw=v&kw=v&kw=v的字符串形式,才能发生到服务器端
			var orderData=jQuery.param($scope.order);
			//console.log(orderData);
			//使用get请求提交数据--由于表单中所有的数据总长度可能超过1024个字节,所以此场景下不推荐使用GET请求
      	    /*$http.get('data/order_add.php?'+orderData)
				.success(function(data){
				console.log('接收到服务器返回的数据:');
				console.log(data);
			})*/
			$http.post('data/order_add.php',orderData)
				.success(function(data){
					//console.log(data);
					$rootScope.phone = $scope.order.phone;
				})
	    }
	})
	.controller('myorderCtrl',function($scope,$routeParams,$http,$rootScope){
	    $scope.orderList = [];
	    $http.get('data/order_getbyphone.php?phone='+$rootScope.phone) //php?phone=13501234567
	      .success(function(data){
	        $scope.orderList = data;
	    });
	 })
	
	
	
	.config(function($routeProvider){
		$routeProvider
			.when('/start',{
				templateUrl:'tpl/start.html',
				controller:'startCtrl'
			})
			.when('/main',{
				templateUrl:'tpl/main.html',
				controller:'mainCtrl'
			})
			.when('/detail/:did',{
				templateUrl:'tpl/detail.html',
				controller:'detailCtrl'
			})
			.when('/order/:did',{
		    	templateUrl: 'tpl/order.html',
		     	controller: 'orderCtrl'
		    })
		    .when('/myorder',{
		    	templateUrl: 'tpl/myorder.html',
		     	controller: 'myorderCtrl'
		    })
			.otherwise({
		    		redirectTo:'/start' //重定向
		    })
	})
	.run(function($http){//修改POST请求的默认头部
	    $http.defaults.headers.post=
	    {'Content-Type':'application/x-www-form-urlencoded'};
	})
