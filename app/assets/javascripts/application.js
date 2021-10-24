// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//タイマー機能
var to_timeup = 1500;
var intervalid;
var start_flag = false;

function count_start() {
  console.log("count_start");
  if (start_flag === false) {
    intervalid = setInterval(count_down, 1000);
    start_flag = true;
  }
}

function count_down() {
  console.log("count_down");
  var timer = document.getElementById("timer");
  if (to_timeup === 0) {
    timer.style.color = "red";
    count_stop();
    alert("時間です！");
  }
  else {
    to_timeup--;
    padding();
  }
}

function padding() {
  var timer = document.getElementById("timer");
  var min = 0;
  var sec = 0;
  min = Math.floor(to_timeup / 60);
  sec = (to_timeup % 60);
  min = ("0" + min).slice(-2);
  sec = ("0" + sec).slice(-2);
  timer.innerHTML = min + ":" + sec;
}

function count_stop() {
  console.log(count_stop);
  clearInterval(intervalid);
  start_flag = false;
}

function count_work_time() {
  console.log(count_work_time);
  var timer = document.getElementById("timer");
  clearInterval(intervalid);
  start_flag = false;
  to_timeup = 1500;
  padding();
  timer.style.color = "#212529";
}

function count_rest_time() {
  console.log(count_rest_time);
  var timer = document.getElementById("timer");
  clearInterval(intervalid);
  start_flag = false;
  to_timeup = 300;
  padding();
  timer.style.color = "#212529";
}

window.addEventListener = function() {
  padding();
  var startbutton = document.getElementById("startbutton");
  startbutton.addEventListener("click", count_start, false);
  var stopbutton = document.getElementById("stopbutton");
  stopbutton.addEventListener("click", count_stop, false);
  var workbutton = document.getElementById("workbutton");
  workbutton.addEventListener("click", count_work_time, false);
  var restbutton = document.getElementById("restbutton");
  restbutton.addEventListener("click", count_rest_time, false);
}