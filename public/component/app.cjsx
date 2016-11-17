React = require 'react'
ReactDOM = require 'react-dom'
Link = require('react-router').Link

Nav = require('react-bootstrap').Nav
Navbar = require('react-bootstrap').Navbar
NavItem = require('react-bootstrap').NavItem
NavbarBrand = require('react-bootstrap').NavbarBrand


module.exports =

    app: React.createClass
        componentWillMount: () ->
            console.log @props
        render: () ->
            <div>
                <Navbar>
                    <ul className={'nav navbar-nav navbar-static-top'}>
                        <li><Link to="/">GoGoLoo </Link></li>
                        <li><Link to="/welcom">Welcome </Link></li>
                        <li><Link to="/about">About </Link></li>
                    </ul>
                    <ul className={'nav navbar-nav pull-right'}>
                        <li><Link to="/login">Login </Link></li>
                    </ul>
                </Navbar>
                <div className={'header header-bg-alt'}>
                    <div className={'container-fluid'}>
                        <div className={'main-headline'}>
                            <h1>Lllll </h1>
                            <h3>Wwwww </h3>
                            <div className={'lead'}>
                                Two amazing days of learning, growing, and mingling with the Laravel community - returning to the Big Apple.
                            </div>
                            <div>
                                <Link to="/">
                                    <button className={'btn btn-primary btn-lg'}>Tickets On Sale Soon </button>
                                </Link>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    {@props.children}
                </div>
            </div>