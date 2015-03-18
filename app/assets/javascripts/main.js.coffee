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

  $win.resize $.throttle(250, setupDropdowns)
  setupDropdowns()

  $('.dropdown-trigger').click (event) ->
    event.preventDefault()

  if Modernizr.touch
    $('.dropdown-trigger').click (event) ->
      $(this).parent().toggleClass 'is-active'
  else
    $('.dropdown-trigger').mouseenter ->
      $(this).parent().addClass 'is-active'

    $('.has-dropdown').mouseleave ->
      $(this).removeClass 'is-active'

  $toggleInfoTrigger.click (event) ->
    event.preventDefault()

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
        top: 5
        right: $win.outerWidth() - $logoContainer.outerWidth() - $blend.position().left + parseInt($logoContainerA.css('paddingLeft').replace('px', ''))

  $hamburger.click (event) ->
    event.preventDefault()

    if $topbar.hasClass 'is-menu-open'
      $topbar.removeClass 'is-menu-open'
    else
      $topbar.addClass 'is-menu-open'
      setupDropdowns()

  $('.catalog-item-container a').click (event) ->
    if Modernizr.touch
      $currentActive = $('.catalog-item-container.is-active')
      $container = $(this).closest('.catalog-item-container')
      if !$container.hasClass 'is-active'
        event.preventDefault()
        $container.addClass 'is-active'
      else
        $container.removeClass 'is-active'
      $currentActive.removeClass 'is-active'

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
