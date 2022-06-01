/**
 * 
 */

$(document).ready(function(){
    $("#btnSearch").on("click",function(){
        location.href="authList?authName="+$("#authName").val();
    });
});

