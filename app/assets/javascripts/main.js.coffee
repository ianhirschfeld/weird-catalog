$ ->
  $win = $(window)
  $topbar = $('.topbar')
  $toggleInfoTrigger = $('.toggle-info')
  $infoContainer = $('.info-container')
  $infoSection = $('.info-section')
  $logoContainer = $('.topbar-right')

  $('.has-dropdown').each (i) ->
    $this = $(this)
    $trigger = $('.dropdown-trigger', $this)
    $dropdown = $('.dropdown', $this)

    triggerWidth = $trigger.outerWidth()
    dropdownWidth = $dropdown.outerWidth()

    if triggerWidth > dropdownWidth
      $trigger.width triggerWidth
      $dropdown.width triggerWidth + parseInt($trigger.css('paddingLeft').replace('px', '')) * 2
    else
      $trigger.width dropdownWidth
      $dropdown.width dropdownWidth + parseInt($trigger.css('paddingLeft').replace('px', '')) * 2

  $('.dropdown-trigger').click (event) ->
    event.preventDefault()

  $('.dropdown-trigger').mouseenter ->
    $(this).parent().addClass 'is-active'

  $('.has-dropdown').mouseleave ->
    $(this).removeClass 'is-active'

  $toggleInfoTrigger.click (event) ->
    event.preventDefault()

    $logoContainer.find('a').blur()

    if $topbar.hasClass 'is-open'
      $topbar.height 36
      $infoContainer.height 0
      $logoContainer.css
        top: 0
        right: 18
      setTimeout ->
        $topbar.removeClass 'is-open'
      , 300
    else
      $topbar.addClass 'is-open'
      $topbar.height $infoSection.outerHeight()
      $infoContainer.height $infoSection.outerHeight()
      $logoContainer.css
        top: 4
        right: ($win.outerWidth() / 2) + ($infoSection.outerWidth() / 2) - $logoContainer.outerWidth() + 5
