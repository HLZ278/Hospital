function checkName() {
window.
    $.ajax({
        type:"get",
        url:"findUser",
        data:{"userName": $("#userName").val()},
        dataType:"text",
        success:function(data){
            if("true" === data){
                $(".userError").attr("style", "visibility:hidden;")
            }else{
                $(".userError").attr("style", "visibility:visable;")
            }
        },
    });
}
function clearError() {
    $(".pwdError").attr("style", "visibility:hidden;")
}