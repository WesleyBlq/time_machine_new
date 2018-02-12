import React from 'react';
import { Calendar, Modal } from 'antd';
import moment from 'moment';
// import 'antd/dist/antd.css';
import { imagePath } from 'rwr-view-helpers';

class CalendarPage extends React.Component {

    constructor(props) {
        super(props);

        this.rest_day = moment(this.props.rest_date);

        this.select_day = this.rest_day;
        this.state = {
            visible: false,
        };
    }

    render() {
        return (
            <div>
                <Calendar dateCellRender={this.dateCellRender.bind(this)}
                    onSelect={this.onSelect.bind(this)}
                />
                <Modal visible={this.state.visible}
                    onOk={this.handleOk.bind(this)} onCancel={this.handleCancel.bind(this)}>
                    <p>设定今天为休息日？</p>
                    <p>{this.select_day.format()}</p>
                </Modal>
            </div>
        )
    }

    handleOk() {
        console.log("clicked ok");

        this.rest_day = this.select_day.subtract(2, "hours");
        this.select_day = this.rest_day;
        var json_data = { "rest_date": this.rest_day.format() };

        fetch(this.props.data_path, {
            method: "post",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(json_data),
        });

        this.setState({
            visible: false,
        });
    }

    handleCancel() {
        console.log("clicked cancel");
        this.setState({
            visible: false,
        });
    }

    dateCellRender(date_moment) {

        // 计算上班时间
        var count = date_moment.diff(this.rest_day, 'day');
        var rest_type;
        if (date_moment.isBefore(this.rest_day)) {
            count += -1;
        }
        console.log(count % 3);
        // console.log(date_moment);
        // console.log(this.rest_day);
        switch (count % 3) {
            case 0:
                rest_type = (<RestCell />);
                break;
            case 1:
            case -2:
                rest_type = (<DayCell />);
                break;
            case 2:
            case -1:
                rest_type = (<NightCell />);
                break;
        }

        return (
            <div>
                {rest_type}
            </div>
        )
    }

    onSelect(date) {
        this.select_day = date;
        this.setState({
            visible: true,
        });
    }
};

class RestCell extends React.Component {
    render() {
        return (
            <div>
                {/* <img src={imagePath('rest.png')} style={{ width: '240%', margin: '-20px 0 0 -20px', margin_top: '-20px' }} /> */}
                <p>休息</p>
            </div>
        )
    }
}

class DayCell extends React.Component {
    render() {
        return (
            <div>
                {/* <img src={imagePath('day_work.png')} style={{ width: '120%' }} /> */}
                <p>白班</p>
            </div>
        )
    }
}

class NightCell extends React.Component {
    render() {
        return (
            <div>
                {/* <img src={imagePath('night_work.png')} style={{ width: '100%' }} /> */}
                <p>夜班</p>
            </div>
        )
    }
}

export default CalendarPage;