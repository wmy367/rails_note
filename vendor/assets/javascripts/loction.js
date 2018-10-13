var option = {
    enableHighAccuracy:true, //设置提升定位的精准度
    maximumAge:0,  //禁用缓存
    timeout:10000  //开始获取定位信息30秒后超时
}
if(navigator.geolocation){  //判断是否支持Geolocation API
    navigator.geolocation.getCurrentPosition(showPosition,showError,option)
}
function showPosition(position){
        var lat = position.coords.latitude;  //获取纬度
        var lon = position.coords.longitude;  //获取经度
        alert("您的纬度是:"+lat+ "，经度是："+lon);
}
function showError(error){
    switch(error.code){
        case error.PERMISSION_DENIED:
        alert("您拒绝了地理定位服务");
        break;
        case error.POSITION_UNAVAILABLE:
        alert("无法获取您的位置");
        break;
        case error.TIMEOUT:
        alert("超时");
        break;
    }
}
