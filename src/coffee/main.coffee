$(document).ready ->

  TabBlock =
    s: animLen: 200
    init: ->
      TabBlock.bindUIActions()
      TabBlock.hideInactive()
      return
    bindUIActions: ->
      $('.tabBlock-tabs').on 'click', '.tabBlock-tab', ->
        TabBlock.switchTab $(this)
        return
      return
    hideInactive: ->
      $tabBlocks = $('.tabBlock')
      $tabBlocks.each (i) ->
        $tabBlock = $($tabBlocks[i])
        $panes = $tabBlock.find('.tabBlock-pane')
        $activeTab = $tabBlock.find('.tabBlock-tab.is-active')
        $panes.hide()
        $($panes[$activeTab.index()]).show()
        return
      return
    switchTab: ($tab) ->
      $context = $tab.closest('.tabBlock')
      if !$tab.hasClass('is-active')
        $tab.siblings().removeClass 'is-active'
        $tab.addClass 'is-active'
        TabBlock.showPane $tab.index(), $context
      return
    showPane: (i, $context) ->
      $panes = $context.find('.tabBlock-pane')
      $panes.slideUp TabBlock.s.animLen
      $($panes[i]).slideDown TabBlock.s.animLen
      return
  $ ->
    TabBlock.init()
    return

