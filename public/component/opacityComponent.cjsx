React = require 'react'
ReactDOM = require 'react-dom'


changeColor = (flag) ->
    switch flag
        when '1'
            return '#7A67EE'
        when '0.8'
            return '#006400'
        when '0.6'
            return '#EEEE00'
        when '0.4'
            return '#FF3030'
        when '0.2'
            return '#FF3030'
        else
            return '#000000'


Opacity = React.createClass
    getInitialState: () ->
        return {
            opacity: 1.0
            color: '#000000'
            message: 'Hello World!'
        }
    componentDidMount: () ->
        self = @
        setInterval () ->
            color = self.state.color
            opacity = self.state.opacity
            opacity -= 0.2
            if opacity < 0.2
                opacity = 1.0
            color = changeColor(opacity.toPrecision(1))
            self.setState { opacity: opacity, color: color }
        , 100

    render: () ->
        <h1 style={ opacity: @state.opacity, color: @state.color }>
            {@state.message}
        </h1>

module.exports = Opacity