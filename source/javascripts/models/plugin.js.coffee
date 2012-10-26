class Branding.Models.Plugin extends Backbone.Model
  testmode: no

  fetchData: (url, cacheKey) ->
    try
      if window.localStorage?
        processedData = if @testmode
          data = JSON.parse(localStorage.getItem("#{cacheKey}-raw"))
          pdata = @processData(data, cacheKey)
          localStorage.setItem(cacheKey, JSON.stringify(pdata))
          pdata
        else
          JSON.parse(localStorage.getItem(cacheKey))

        @dataLoaded(processedData)
        return
    catch error

    $.ajax
      url: url
      data: { cacheKey }
      crossDomain: yes
      dataType: 'jsonp'
      success: (data, jqXHR) =>
        processedData = @processData(data, cacheKey)
        if window.localStorage?
          localStorage.setItem(cacheKey, JSON.stringify(processedData))
          localStorage.setItem("#{cacheKey}-raw", JSON.stringify(data)) if @testmode
        @dataLoaded(processedData)

  dataLoaded: (data) ->

  processData: (data, key) ->
    data

class Branding.Collections.Plugins extends Backbone.Collection

