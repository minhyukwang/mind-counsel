// jQuery Ajax 공통
var ComAjax = function () {
    var f = {};
    var o = { $f:jQuery(f), type:"POST", async:true, dataType:"json", contentType:"application/json; charset=UTF-8"};

    f.url = function(url)
    {
        o.url = url;

        return f;
    };

    f.type = function(type)
    {
        o.type = type;

        return f;
    };

    f.async = function(async)
    {
        o.async = async;

        return f;
    };

    f.param = function(param)
    {
        o.param = JSON.stringify(param);

        return f;
    };

    f.dataType = function(dataType)
    {
        o.dataType = dataType;

        return f;
    };

    f.contentType = function(contentType)
    {
        o.contentType = contentType;

        return f;
    };

    f.before = function(before)
    {
        o.before = before;

        return f;
    };

    f.success = function(success)
    {
        o.success = success;

        return f;
    };

    f.call = function call(){
        $.ajax({
            url         : o.url,
            type        : o.type,
            async       : o.async,
            data        : o.param,
            dataType    : o.dataType,
            contentType : o.contentType,
            // Type: Function( jqXHR jqXHR, PlainObject settings )
            beforeSend:function() {
                if(!fnIsNull(o.before)){
                    if(typeof(o.before) == "function"){
                        o.before();
                    }
                    else {
                        eval(o.before + "();");
                    }
                }
            },
            // Type: Function( jqXHR jqXHR, String textStatus, String errorThrown )
            error: function (xhr, status, errorThrown){
                alert("aJax 통신 오류 : " + xhr.status + " : " + status + " : " + errorThrown);
            },

            // Type: Function( Anything data, String textStatus, jqXHR jqXHR )
            success : function(data, status, xhr) {
                if(status == "success" && xhr.status == 200){
                    if(typeof(o.success) == "function"){
                        o.success(data);
                    }
                    else {
                        eval(o.success + "(data);");
                    }
                }
            }
        });
    };
    return f;
};