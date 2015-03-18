currentImage = 'none'

$imageWrapper = $('.admin-catalog-item-image-wrapper')
$imageContainer = $('.admin-catalog-item-image-container')
$image = $('.admin-catalog-item-image')
$fileInput = $('#catalog_item_feature_image')
$remoteInput = $('#catalog_item_upload_url')
$monthSelect = $('#date_month')
$daySelect = $('#date_day')
$yearSelect = $('#date_year')
$monthInput = $('#catalog_item_released_month')
$dayInput = $('#catalog_item_released_day')
$yearInput = $('#catalog_item_released_year')

$ ->
  $imageContainer.click (event) ->
    event.preventDefault()
    $fileInput.click()

  $fileInput.change ->
    $remoteInput.val ''
    image = $fileInput[0].files[0]
    reader = new FileReader()
    reader.onload = (file) ->
      $image.css 'backgroundImage', "url('#{file.target.result}')"
      $imageWrapper.addClass 'has-image'
    reader.readAsDataURL(image)

  $remoteInput.change ->
    $fileInput.val ''
    currentImage = $image.css 'backgroundImage' if currentImage is 'none'
    url = $remoteInput.val()

    if url is ''
      if currentImage is 'none'
        $image.css 'backgroundImage', "url('')"
        $imageWrapper.removeClass 'has-image'
      else
        $image.css 'backgroundImage', currentImage
        $imageWrapper.addClass 'has-image'
        currentImage = 'none'
    else
      $image.css 'backgroundImage', "url('#{url}')"
      $imageWrapper.addClass 'has-image'

  $monthSelect.change ->
    $monthInput.val $monthSelect.val()

  $daySelect.change ->
    $dayInput.val $daySelect.val()

  $yearSelect.change ->
    $yearInput.val $yearSelect.val()
