(($) ->
  $.fn.extend
    dapperSelect : (options) ->
      if not $.browser.msie or ($.browser.msie and $.browser.version > 6)
        this.each ->
          currentSelected = $(this).find(':selected')
          ### If the function is rebinded, remove any previous spans ###
          $(this).parent().find('span.dapper-select').remove()
          $(this).after('<span class="dapper-select"><span class="dapper-select-inner">'+currentSelected.text()+'</span></span>').css({position:'absolute', opacity:0,fontSize:$(this).next().css('font-size')})
          selectBoxSpan = $(this).next()
          selectBoxWidth = parseInt($(this).width()) - parseInt(selectBoxSpan.css('padding-left')) - parseInt(selectBoxSpan.css('padding-right'));
          selectBoxSpanInner = selectBoxSpan.find(':first-child');
          selectBoxSpan.css({display:'inline-block'});
          selectBoxSpanInner.css({width:selectBoxWidth, display:'inline-block'});
          selectBoxHeight = parseInt(selectBoxSpan.height()) + parseInt(selectBoxSpan.css('padding-top')) + parseInt(selectBoxSpan.css('padding-bottom'));
          $(this).height(selectBoxHeight).bind 'change', ->
            selectBoxSpanInner.text($(this).find(':selected').text()).parent().addClass('changed')
          ### Improve Form usability, show combo on :focus ###
          $(this).focus -> $(this).css('opacity', 1)
          $(this).blur -> $(this).css('opacity', 0)
)(jQuery)