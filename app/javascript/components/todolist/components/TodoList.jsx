import React from 'react'
import PropTypes from 'prop-types'
import Todo from './Todo'

class TodoList extends React.Component {

    render() {
        return (
        <ul>
            {
                this.props.todos.map(todo => (
                        <Todo key={todo.id} {...todo} onClick={() => this.props.onTodoClick(todo.id)} />
                    )
                )
            }
        </ul>   
        )   
    }
}

export default TodoList
