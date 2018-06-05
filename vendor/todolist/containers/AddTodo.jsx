import React from 'react'
import { connect } from 'react-redux'
import { addTodo } from '../actions'


class AddTodo extends React.Component {
    
    costructor() {
    }

    submit_event(e) {
        e.preventDefault()
        if (!this.input.value.trim()) {
            return
        }
        this.props.dispatch(addTodo(this.input.value))
        this.input.value = ''
    }

    render() {
        // let input;
        return (
            <div>
              <form onSubmit={ this.submit_event.bind(this) } >
              <input ref={(node) => { this.input = node }} />
                <button type="sublimt">
                  Add Todo
                </button>
              </form>
            </div>      
        );
    }
}

AddTodo = connect()(AddTodo)

export default AddTodo