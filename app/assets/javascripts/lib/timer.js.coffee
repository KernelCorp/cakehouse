ready = ->
  startDate = new Date(2014,1,1)
  currentDate = Date.now()
  liftOff = 10800 - ((currentDate - startDate) / 1000) % 10800
  $('#timer').countdown until: +liftOff, format: 'HMS',
  layout: "<div class='digit-pair'><div class='digit-c'><span>{h10}</span></div><div class='digit-c'><span>{h1}</span></div></div>
           <div class='digit-pair'><div class='digit-c'><span>{m10}</span></div><div class='digit-c'><span>{m1}</span></div></div>
           <div class='digit-pair'><div class='digit-c'><span>{s10}</span></div><div class='digit-c'><span>{s1}</span></div></div>"

$(document).ready ready