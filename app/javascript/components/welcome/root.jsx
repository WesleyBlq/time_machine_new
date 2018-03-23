import React, { Component } from 'react'
import Avatar from './avatar'
import ItemList, { SportItem, ExamItem, BlogItem, CalendarItem, } from './itemlist'
import SportPage from './sportpage'

import calendar from './calendar/calendar_reducer'
import CalendarContainer from './calendar/calendar_container'

import {
	HashRouter as Router,
	Switch,
	Route,
	Link
} from 'react-router-dom'

import { Provider } from 'react-redux'
import { createStore } from 'redux'
import { combineReducers } from 'redux'



class HomePage extends Component {

	render() {
		
		return (
			<div>
				<Avatar name="Wesley" />
				<Switch>
					<Route exact path="/" component={ItemList} />
					<Route path='/sport' component={SportPage} />
					<Route path='/blog' component={BlogItem} />
					<Route path='/exam' component={ExamItem} />
					<Route path='/calendar' component={CalendarContainer} />
				</Switch>
			</div>
		);
	}
}

export default class Root extends Component {
	
	render() {
		const homeApp = combineReducers({
			calendar,
		});

		const initState = {
			calendar: { 
				time: this.props.rest_date,
				data_path: "/m/rest_time",
			},
		};
		let store = createStore(homeApp, initState);

		return (
			<Provider store={store}>
				<Router >
					<Route component={HomePage}></Route>
				</Router>
			</Provider>
		)
	}
}