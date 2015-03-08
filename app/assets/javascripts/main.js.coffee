$ ->
  $('.has-dropdown').each (i) ->
    $this = $(this)
    $trigger = $('.dropdown-trigger', $this)
    $dropdown = $('.dropdown', $this)

    triggerWidth = $trigger.width()
    dropdownWidth = $dropdown.width()

    if triggerWidth > dropdownWidth
      $trigger.width triggerWidth
      $dropdown.width triggerWidth + parseInt($trigger.css('paddingLeft').replace('px', '')) * 2
    else
      $trigger.width dropdownWidth
      $dropdown.width dropdownWidth + parseInt($trigger.css('paddingLeft').replace('px', '')) * 2

  $('.dropdown-trigger').mouseenter ->
    $(this).parent().addClass 'is-active'

  $('.has-dropdown').mouseleave ->
    $(this).removeClass 'is-active'
