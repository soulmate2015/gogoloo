React = require 'react'
ReactDOM = require 'react-dom'

Router = require('react-router').Router
Route = require('react-router').Route
browserHistory = require('react-router').browserHistory
IndexRoute = require('react-router').IndexRoute
Link = require('react-router').Link

App = require('../component/app.cjsx').app
Well = require('../component/welcome.cjsx').welcome
NotFound = require('../component/404page.cjsx').notFound

routes = {
    path: '/'
    component: Well
    indexRoute: Well
}


ReactDOM.render(
    <Router history={browserHistory}>
        <Route patch='/' component={App}>
            <IndexRoute component={Well}/>
            <Route path="welcom" component={Well} />
            <Route path="*" component={NotFound}/>
        </Route>
    </Router>
#    <Router routes={routes} history={browserHistory} />
    document.getElementById('container')
)


