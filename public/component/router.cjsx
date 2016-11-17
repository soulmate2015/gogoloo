React = require 'react'
Link = require('react-router').Link
RouteHandler = require('react-router').RouteHandler


module.exports =

    React.createClass
        displayName: 'GOGOLOO'
        render: () ->
            <div>
                <header>
                    <Link to="hello">Hello </Link>|<Link to="styleguide">Styleguide </Link>
                </header>
                <RouteHandler/>
            </div>
