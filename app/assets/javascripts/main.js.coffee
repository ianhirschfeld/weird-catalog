$win = $(window)
$topbar = $('.topbar')
$toggleInfoTrigger = $('.toggle-info')
$infoContainer = $('.info-container')
$infoSection = $('.info-section')
$logoContainer = $('.topbar-right')
$logoContainerA = $('.topbar-right a')
$blend = $('.blend')
$hamburger = $('.hamburger')

$ ->
  $('.reveal').removeClass 'reveal'

  setupDropdowns()

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
      $topbar.attr 'style', ''
      $infoContainer.attr 'style', ''
      $logoContainer.attr 'style', ''
      setTimeout ->
        $topbar.removeClass 'is-open'
      , 300
    else
      $topbar.addClass 'is-open'
      $topbar.height $infoSection.outerHeight()
      $infoContainer.height $infoSection.outerHeight()
      $logoContainer.css
        top: 6
        right: $win.outerWidth() - $logoContainer.outerWidth() - $blend.position().left + parseInt($logoContainerA.css('paddingLeft').replace('px', ''))

  $hamburger.click (event) ->
    event.preventDefault()

    $hamburger.blur()

    if $topbar.hasClass 'is-menu-open'
      $topbar.removeClass 'is-menu-open'
    else
      $topbar.addClass 'is-menu-open'
      setupDropdowns()

setupDropdowns = ->
  $('.has-dropdown').each (i) ->
    $this = $(this)
    $trigger = $('.dropdown-trigger', $this)
    $dropdown = $('.dropdown', $this)

    $trigger.attr 'style', ''
    $dropdown.attr 'style', ''

    triggerWidth = $trigger.outerWidth()
    dropdownWidth = $dropdown.outerWidth()

    if triggerWidth > dropdownWidth
      $trigger.width triggerWidth
      $dropdown.width triggerWidth + parseInt($trigger.css('paddingLeft').replace('px', '')) * 2
    else
      $trigger.width dropdownWidth
      $dropdown.width dropdownWidth + parseInt($trigger.css('paddingLeft').replace('px', '')) * 2
