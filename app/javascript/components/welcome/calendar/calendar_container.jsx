import { connect } from 'react-redux'
import CalendarPage from './calendarpage'

import { toggleNewTime } from './calendar_action'

const mapStateToProps = state => {
    
	return {
        rest_date: state.calendar.time,
        data_path: state.calendar.data_path,
	}
}

const mapDispatchToProps = dispatch => {
	return {
		change_success: (new_time) => {
			dispatch(toggleNewTime(new_time))
		}
	}
}

const CalendarContainer = connect(
	mapStateToProps,
	mapDispatchToProps
)(CalendarPage)

export default CalendarContainer
