$(function() {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
        if (item.action == 'show') {
            document.getElementById("woodPrice").innerHTML = item.wood + "$";
            document.getElementById("stonePrice").innerHTML = item.stone + "$";
            document.getElementById("coalPrice").innerHTML = item.coal + "$";
            document.getElementById("ironPrice").innerHTML = item.iron + "$";
            document.getElementById("goldPrice").innerHTML = item.gold + "$";
        }
    })

    document.onkeyup = function(data) {
        if (data.which == 27) {
            $.post("http://vl_leado/exit", JSON.stringify({}));
            return
        }
    };

    $("#buy-1").click(function() {
        $.post('https://vl_leado/buy-1', JSON.stringify({}));
        return
    })
    $("#sell-1").click(function() {
        $.post('https://vl_leado/sell-1', JSON.stringify({}));
        return
    })
    $("#buy-2").click(function() {
        $.post('https://vl_leado/buy-2', JSON.stringify({}));
        return
    })
    $("#sell-2").click(function() {
        $.post('https://vl_leado/sell-2', JSON.stringify({}));
        return
    })
    $("#buy-3").click(function() {
        $.post('https://vl_leado/buy-3', JSON.stringify({}));
        return
    })
    $("#sell-3").click(function() {
        $.post('https://vl_leado/sell-3', JSON.stringify({}));
        return
    })
    $("#buy-4").click(function() {
        $.post('https://vl_leado/buy-4', JSON.stringify({}));
        return
    })
    $("#sell-4").click(function() {
        $.post('https://vl_leado/sell-4', JSON.stringify({}));
        return
    })
    $("#buy-5").click(function() {
        $.post('https://vl_leado/buy-5', JSON.stringify({}));
        return
    })
    $("#sell-5").click(function() {
        $.post('https://vl_leado/sell-5', JSON.stringify({}));
        return
    })
})