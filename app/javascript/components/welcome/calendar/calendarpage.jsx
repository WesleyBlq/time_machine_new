import React from 'react';
import { Calendar, Modal, LocaleProvider } from 'antd';
import moment from 'moment';
// import axios from 'axios';
import axios from 'axios-on-rails'
// import $ from 'jquery';

import 'antd/dist/antd.css';
import zhCN from 'antd/lib/locale-provider/zh_CN';

import day_work_png from './images/day_work.png';
import night_work_png from './images/night_work.png';
import rest_png from './images/rest.png';


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
            <LocaleProvider locale={zhCN}>
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
            </LocaleProvider>
        )
    }

    handleOk() {
        // console.log("clicked ok");

        this.rest_day = this.select_day.subtract(2, "hours");
        this.select_day = this.rest_day;
        var json_data = { "rest_date": this.rest_day.format() };

        console.log(this.props.data_path);

        axios.post(this.props.data_path, { 
            "rest_date": this.rest_day.format() 
        }).then((response) => {
            console.log(response.data)
        })


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
        // console.log("####");
        // console.log(count % 3);
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
            <div>{rest_type}</div>
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
                <img src={rest_png} style={cell_image} />
                <p style={cell_content} >休</p>
            </div>
        )
    }
}

class DayCell extends React.Component {
    render() {
        return (
            <div>
                <img src={day_work_png} style={cell_image} />
                <p style={cell_content}>白</p>
            </div>
        )
    }
}

class NightCell extends React.Component {
    render() {
        return (
            <div>
                <img src={night_work_png} style={cell_image} />
                <p style={cell_content} >夜</p>
            </div>
        )
    }
}

const cell_image = {
    width: "100%",
    marginTop: "10px",
}

const cell_content = {
    textAlign: "center",
    paddingTop: "10px",
    overflow: "hidden",
}


export default CalendarPage;
