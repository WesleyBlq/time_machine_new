// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

const Hello = props => (
    <div>Hello {props.name}!, this is a todolist component in directory of todolist</div>
)

Hello.defaultProps = {
    name: 'David'
}

Hello.propTypes = {
    name: PropTypes.string
}

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
        <Hello name="React" />,
        document.body.appendChild(document.createElement('div')),
    )
})


class Welcome extends React.Component {
    static propTypes = {
        className: PropTypes.string,
        name: PropTypes.string,
    };

    constructor(props) {
        super(props);
    }

    render() {
        return (
           <h1>Hello {this.props.name}!, this is a todolist component in directory of todolist</h1> 
        );
    }
}

class NumberList extends React.Component {

    render() {
        const numbers = this.props.numbers;
        const listItems = numbers.map((number) =>
            <li key={number} >{number}</li>
        );

        return (
            <ul>{listItems}</ul>
        );    
    }
}

const numbers = [1, 2, 3, 4, 5];


function tick() {
    // <NumberList numbers={numbers} />
    const element = (
        <div>
                    
            <Welcome name={"Wesley"} />
            <h2>It is {new Date().toLocaleTimeString()}.</h2>
        </div>
    );

    ReactDOM.render(
        element,
        document.getElementById('root')
    );
}

setInterval(tick, 1000);


