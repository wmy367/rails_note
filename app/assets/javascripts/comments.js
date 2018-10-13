

function addComment(targetid){
	if (document.getElementById){
        target=document.getElementById(targetid);
            if (target.style.display=="block"){
                alert("你好，我是一个警告框！");
                target.style.display="none";
            } else {
                alert("你好，我是一个警告框！");
                target.style.display="block";
            }
    }
}
