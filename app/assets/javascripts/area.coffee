# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

autocomplete = ->
  $('#area-search').autocomplete
    source: "/areas/autocomplete.json"
  $('#area-search2').autocomplete
    source: "/areas/autocomplete.json"

  # Subject autocomplete
  #$('#faculty-search').autocomplete
  #  source: "/subjects/autocomplete_faculty.json"
  #$('#faculty-search2').autocomplete
  #  source: "/subjects/autocomplete_faculty.json"

# for turbolinks
$(document).ready(autocomplete)
$(document).on('page:update', autocomplete)