define ["d3", "underscore", "react"], (d3, _, React) ->

  React.createClass
    displayName: "Root"

    computeLayout: ->
      width: window.innerWidth
      height: window.innerHeight

    getInitialState: ->
      layout: @computeLayout()

    componentDidMount: ->
      d3.select(window).on "resize", => @setState layout: @computeLayout()

    componentWillUnmount: ->
      d3.select(window).on "resize", null

    render: ->
      React.DOM.small null, "Behold just another worthless piece of futile bullshit..."
