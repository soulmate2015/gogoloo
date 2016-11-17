React = require 'react'
ReactDOM = require 'react-dom'



module.exports = exports =

    AddTodo: React.createClass(
        propTypes: {
            onAddClick: React.PropTypes.func.isRequired
        }
        getInitialState: () ->
            return {
                enterText: 'default'
            }
        handleClick: (e) ->
            node = ReactDOM.findDOMNode(@refs.todoInput)
            text = node.value.trim()
            @setState {enterText: text}, () ->
                @props.onAddClick(@state.enterText)
            node.value = ''
        render: () ->
            self = @
            <div>
                <input type='text' ref='todoInput' />
                <button onClick={(e) -> self.handleClick(e)}>
                    Add
                </button>
                <p>{@state.enterText}</p>
            </div>
    )

    Todo: () ->
        propTypes: {
            onClick: React.PropTypes.func.isRequired
            text: React.PropTypes.string.isRequired
            completed: React.PropTypes.bool.isRequired
        }

        render: () ->
            <li onClick={@props.onClick}
                style={{textDecoration: this.props.completed ? 'line-through' : 'none',
                cursor: this.props.completed ? 'default' : 'pointer'}}>
                {@props.text}
            </li>

    TodoList: () ->
        Todo = exports.Todo
        propTypes: {
            onTodoClick: React.PropTypes.func.isRequired
        }

        render: () ->
            self = @
            <ul>
                {@props.todos.map (todo, index) ->
                    <Todo
                        key={index}
                        onClick={
                            () ->
                                self.props.onTodoClick(index)
                        }
                    />
                }
            </ul>

    Footer: () ->
        propTypes: {
            onFilterChange: React.PropTypes.func.isRequired
            filter: React.PropTypes.oneOf([
                'SHOW_ALL', 'SHOW_COMPLETED', 'SHOW_ACTIVE'
            ]).isRequired
        }

        renderFilter: (filter, name) ->
            self = @
            if filter is @props.filter
                return name
            a =
                <a href='#'
                    onClick={
                        (e) ->
                            console.log 'onClick!!!'
                            e.preventDefault()
                            self.props.onFilterChange(filter)
                        }>
                    {name}
                </a>
            return a

        render: () ->
            <p>
                Show:
                {' '}
                {@renderFilter('SHOW_ALL', 'All')}
                {', '}
                {@renderFilter('SHOW_COMPLETED', 'Completed')}
                {', '}
                {@renderFilter('SHOW_ACTIVE', 'Active')}
                .
            </p>