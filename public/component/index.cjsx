React = require 'react'
ReactDOM = require 'react-dom'
Router = require('react-router').Router
Route = require('react-router').Route
Link = require('react-router').Link
HashHistory = require('react-router').hashHistory
BrowserHistory = require('react-router').browserHistory

#require 'react-bootstrap'

#渐变显示组件
Opacity = require './opacityComponent.cjsx'
AddTodo = require('./todo.cjsx').AddTodo
TodoList = require('./todo.cjsx').TodoList
Footer = require('./todo.cjsx').Footer
MainNav = require('./nav.cjsx').MainNav



App = React.createClass
    render: () ->
        <div>
            <h1>App </h1>
            <ul>
                <li><Link to="/about">About </Link></li>
                <li><Link to="/inbox">Inbox </Link></li>
            </ul>
            {@props.children}
        </div>


Dashboard = React.createClass
    render: () ->
        <div>Welcome to the app! </div>

About = React.createClass
    render: () ->
        <div>
            <h3>About </h3>
            <AddTodo onAddClick={(text) -> console.log 'add todo', text } />
            <TodoList
                todos={[
                    {
                        text: 'Use Redux'
                        completed: true
                    }
                    {
                        text: 'Learn to connect it to React'
                        completed: false
                    }
                ]}
                onTodoClick={
                    (todo) ->
                        console.log('todo clicked', todo)
                }
            />
            <Footer
                filter='SHOW_ALL'
                onFilterChange={
                    (filter) ->
                        console.log('filter change', filter)
                }
            />
        </div>



Inbox = React.createClass
    render: () ->
        <div>
            <h2>Inbox </h2>
            {this.props.children || "Welcome to your Inbox"}
        </div>

Message = React.createClass
    render: () ->
        console.log 'Message'
        <h3>
            Message
            {@props.params.id}
        </h3>


routes = {
    path: '/'
    component: MainNav
    indexRoute: {
        component: Dashboard
    }
    childRoutes: [
        {
            path: '/about'
            component: About
        }
        {
            path: '/inbox'
            component: Inbox
            childRoutes: [
                {
                    path: 'messages/:id'
                    onEnter: (params) ->
                        return params.replace("/messages/#{params.id}")
                }
            ]
        }
        {
            component: Inbox,
            childRoutes: [
                {
                    path: 'messages/:id'
                    component: Message
                }
            ]
        }
    ]
}


ReactDOM.render(
    <Router routes={routes} history={BrowserHistory}/>,
    document.getElementById('example')
)

