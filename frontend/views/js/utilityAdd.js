//Create a client instance
client = null;
connected = false;
var topicControlDevice = "Room"+room_id+remoteControl;  //"Room1/remote/"
var topicTemp = "Room"+room_id+Temp;
var topicPir = "Room"+room_id+Pir;
var topicLightSensor = "Room"+room_id+Light;
var topicIR = "Room"+room_id+IR;
//console.log(AllDeviceName);

// called when the client connects
function onConnect(context) {
  // Once a connection has been made, make a subscription and send a message.
  console.log("Client Connected");
    if(AllDeviceName != 'NULL'){
      //Duyệt object
      Object.keys(AllDeviceName).forEach(function(key) {
        if(AllDeviceName[key]['value'] != 'NULL'){
      subscribe(topicControlDevice+AllDeviceName[key]['device_value'],1);
    }
});
    }
    subscribe(topicTemp, 1);
    subscribe(topicPir, 1);
    subscribe(topicLightSensor, 1);
  connected = true;
}

function onFail(context) {
  console.log("Failed to connect");
  connected = false;
}

// called when the client loses its connection
function onConnectionLost(responseObject) {
  if (responseObject.errorCode !== 0) {
    console.log("Connection Lost: " + responseObject.errorMessage);
  }
  connected = false;
}

// called when a message arrives
function onMessageArrived(message) {
  var topic = message.destinationName;
  var payload = message.payloadString;
  var qos = message.qos;
  console.log('Message Recieved: Topic: ', topic, '. Payload: ', payload, '. QoS: ', qos);
  if(topic.indexOf(topicControlDevice) != -1){
    var device_value = topic.substring(13);
    var device_id = device_value.substring(6)-1;

      //Subscription for light
    if(AllDeviceName[device_id]['value'] == "light"){
      if(payload == "0") checkLightArrived("off", device_value);
      if(payload == "1") checkLightArrived("on", device_value);     
    }
      //Subscription for fan
    if(AllDeviceName[device_id]['value'] == "fan"){
      if(payload == "0") checkFanArrived("off", device_value);
      if(payload == "1") checkFanArrived("on", device_value);     
    }
      //Subscription for fan
    if(AllDeviceName[device_id]['value'] == "air"){
      if(payload == "0") checkAirArrived("off", device_value);
      if(payload == "1") checkAirArrived("on", device_value);     
    }

  }
  if(topic==topicPir){
    //Subscription for human presence
    if(payload == "1" ) checkPirArrived("presence");
    if(payload == "0") checkPirArrived("notpresence");   
  }  
  if(topic==topicLightSensor){
    //Subscription for human presence
    if(payload == "1" ) checkLightSensorArrived("on");
    if(payload == "0") checkLightSensorArrived("off");   
  }

  if(topic==topicTemp){
    //Subscription the temperature
    if(!isNaN(message.payloadString)){
          var point = $('#container-speed').highcharts().series[0].points[0];
          point.update(parseInt(message.payloadString));
      }
  }
}

function connect(){
    if(path.length > 0){
      client = new Paho.MQTT.Client(hostname, Number(port), path, clientId);
    } else {
      client = new Paho.MQTT.Client(hostname, Number(port), clientId);
    }
    console.info('Connecting to Server: Hostname: ', hostname, '. Port: ', port, '. Path: ', client.path, '. Client ID: ', clientId);

    // set callback handlers
    client.onConnectionLost = onConnectionLost;
    client.onMessageArrived = onMessageArrived;

    //Set option
        var options = {
      invocationContext: {host : hostname, port: port, path: client.path, clientId: clientId},
      timeout: timeout,
      keepAliveInterval:keepAlive,
      cleanSession: cleanSession,
      useSSL: ssl,
      onSuccess: onConnect,
      onFailure: onFail
    };

    if(user.length > 0){
      options.userName = user;
    }
    if(pass.length > 0){
      options.password = pass;
    }

      // connect the client
        client.connect(options);
}

function disconnect(){
    console.info('Disconnecting from Server');
    client.disconnect();
    var statusSpan = document.getElementById("connectionStatus");
    statusSpan.innerHTML = 'Connection - Disconnected.';
    connected = false;
    setFormEnabledState(false);
}


function publish(topic, message){
    console.info('Publishing Message: Topic: ', topic, '. QoS: ' + qos + '. Message: ', message);
    newMessage = new Paho.MQTT.Message(message);
    newMessage.destinationName = topic;
    newMessage.qos = qos;
    newMessage.retained = retain;
    client.send(newMessage);
}


function subscribe(topic, qos){
    console.info('Subscribing to: Topic: ', topic, '. QoS: ', qos);
    client.subscribe(topic, {qos: Number(qos)});
}

// Just in case someone sends html
function safe_tags_regex(str) {
   return str.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
}

//Publish message when click button
function checkLight(element){
  var id = jQuery(element).parent().parent().parent().parent().attr('id');
  if ($('#'+id+' .cube-switch').hasClass('active')) { publish(topicControlDevice+id,"1");}
  else publish(topicControlDevice+id, "0");
}

function checkFan(element){
  var id = jQuery(element).parent().parent().parent().parent().attr('id');
  if($('#'+id+' .cube-switch3').hasClass('active3')) { publish(topicControlDevice+id,"1");}
  else publish(topicControlDevice+id, "0");
}

function checkAir(element){
  var id = jQuery(element).parent().parent().parent().parent().attr('id');
  if($('#'+id+' .cube-switch3').hasClass('active3')) { publish(topicControlDevice+id,"1");}
  else publish(topicControlDevice+id, "0");
}

function checkIR(element){
  var id = jQuery(element).parent().parent().parent().parent().attr('id');
  var value = jQuery(element).val();
  publish(topicIR, value);
}

//Subscribe topic and change device's state when message arrive
function checkLightArrived(state, id){
  if(state == "off") {
      if ($('#'+id+' .cube-switch').hasClass('active')) {
          $('#'+id+' .cube-switch').removeClass('active');
          $('#'+id+' .light-bulb-on').css({'opacity': '0'});
     }
  }
  else if(state == "on") {
      if (!$('#'+id+' .cube-switch').hasClass('active')) {
          $('#'+id+' .cube-switch').addClass('active');
          $('#'+id+' .light-bulb-on').css({'opacity': '1'});
     }
  }
}

function checkFanArrived(state, id){
  if(state == "off") {
    if ($('#'+id+' .cube-switch3').hasClass('active3')) {
        $('#'+id+' .cube-switch3').removeClass('active3');
        $('#fan'+id).removeClass('rotate');
    }
  }
  else if(state == "on") {
      if (!$('#'+id+' .cube-switch').hasClass('active')) {
          $('#'+id+' .cube-switch3').addClass('active3');
          $('#fan'+id).addClass('rotate');
     }
  }
}

function checkAirArrived(state, id){
  if(state == "off") {
    if ($('#'+id+' .cube-switch3').hasClass('active3')) {
        $('#'+id+' .cube-switch3').removeClass('active3');
    }
  }
  else if(state == "on") {
      if (!$('#'+id+' .cube-switch').hasClass('active')) {
          $('#'+id+' .cube-switch3').addClass('active3');
     }
  }
}

function checkPirArrived(state) {
  if(state == "presence") {
    $('#humanpresence').attr('src','views/pictures/Human.PNG');
    var now = new moment();
    now = now.format("YYYY-MM-DD HH:mm:ss");
    document.getElementById('lastPresence').innerHTML = "Last presence:"+now;
    $.ajax({
        url : "index.php?action=home_add_presence",
        type : "post",
        dataType:"text",
        data : {room_id : room_id, time: now},
        success: function (responsse) { 
        }
    });
  }
  else {
    $('#humanpresence').attr('src','views/pictures/notHuman.PNG');
  }
}

function checkLightSensorArrived(state) {
  if(state == "off") {
    $('#lightsensor').attr('src','../pictures/lightoff.png');
  }
  else if(state == "on") {
    $('#lightsensor').attr('src','../pictures/lighton.jpg');
  }
}