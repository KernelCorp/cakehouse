ready = ->

  # Do our DOM lookups beforehand
  header = $("#header")
  sticky = $('.sticky')
#  nav_container = $(".nav-container")
#  nav = $("nav")
  top_spacing = 0
  waypoint_offset = -70

  header.waypoint
    handler: (event, direction) ->
      if direction is "down"
        sticky.show().css("top", -header.outerHeight()).animate  top: top_spacing
      else
        sticky.hide().css("top", header.outerHeight()).animate top: ""
      return

    offset: ->
      -header.outerHeight() - waypoint_offset

  sections = $("section")
  navigation_links = $("nav a")
  sections.waypoint
    handler: (event, direction) ->
      active_section = $(this)
      active_section = active_section.prev()  if direction is "up"
      active_link = $("nav a[href=\"#" + active_section.attr("id") + "\"]")
      navigation_links.removeClass "active"
      if $(window).scrollTop() + $(window).height() is $(document).height()
        $("nav a[href=\"#contacts-block\"]").addClass "active"
      active_link.addClass "active"
      return

    offset: "25%"

  $(window).scroll ->
    if $(window).scrollTop() + $(window).height() is $(document).height()
      navigation_links.removeClass "active"
      $("nav a[href=\"#contacts-block\"]").addClass "active"
    return

  $("nav a[href*=#]").bind "click", (e) ->
    anchor = $(this)
    $("html, body").stop().animate
      scrollTop: $(anchor.attr("href")).offset().top, 1000
    e.preventDefault()
    return false

  return

$(document).ready ready