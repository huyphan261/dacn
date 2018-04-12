var hostname = "tapit.vn";
var port = 9001;
var clientId = makeid();
var path = "/ws";
var ssl = false;
var user = "vinhkhai";
var pass = "vinhkhai";
var keepAlive = 60;
var timeout = 3;
var cleanSession = false;
var qos = 1;
var retain = true;

var remoteControl = "/remote/";
var latchControl = "/latch/";

var Pir	   = "/sensor/pir";
var PirDub = "/sensor/pir/dub";
var Temp   = "/sensor/temp";
var Light   = "/sensor/light";
var IR   = "/sensor/ir";

function makeid()
{
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 5; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return text;
}