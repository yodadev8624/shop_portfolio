// 빈 값일 시 문자열 ""  return
function fn_strNullCheck(str){
    var newStr = str;

    if(newStr == null || newStr == "" || newStr == undefined || newStr == "undefined") {
        newStr = "";
    }

    return newStr;
}

