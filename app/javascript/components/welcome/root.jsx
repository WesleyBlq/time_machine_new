import React, { Component } from 'react'
import Avatar from './avatar'
import ItemList, {SportItem, ExamItem, BlogItem, CalendarItem,} from './itemlist'
import SportPage from './sportpage'
import CalendarPage from './calendar/calendarpage'
import {
  HashRouter as Router,
  Switch,
  Route,
  Link
} from 'react-router-dom'

class HomePage extends Component {

	render() { 
		const CalendarComponent = ({match}) => {
			return <CalendarPage data_path="/m/rest_time" rest_date={this.props.rest_date} />
		}
		return ( 
			<div>
				<Avatar name="Wesley" />
				<Switch>
					<Route exact path="/" component={ItemList} />
					<Route path='/sport' component={SportPage} />
					<Route path='/blog' component={BlogItem} />
					<Route path='/exam' component={ExamItem} />
					<Route path='/calendar' component={CalendarComponent} />
				</Switch>
			</div>
		);
	}
}



export default class Root extends Component {
  render() {
	const HomeComponent = ({match}) => {
		return <HomePage rest_date={this.props.rest_date}></HomePage>
	}
    return (
		<Router >
			<Route component={HomeComponent}></Route>
		</Router>
    )
  }
}