import React, { Component, PropTypes } from 'react';
import {
    HashRouter as Router,
    Switch,
    Route,
    Link
} from 'react-router-dom'

export class SportItem extends Component {
    render() { 
        return (  
            <div href="" className="weui_grid">
                <div className="weui_grid_icon" style={{ color: "green" }}>
                    <i className="fa fa-wheelchair-alt" aria-hidden="true"></i>
                </div>
                <p className="weui_grid_label">运动</p>
            </div>  
        )
    }
}

export class BlogItem extends Component {
    render() {
        return (
            <div href="" className="weui_grid">
                <div className="weui_grid_icon" style={{ color: "red" }}>
                    <i className="fa fa-tint" aria-hidden="true"></i>
                </div>
                <p className="weui_grid_label">博客</p>
            </div>
        )
    }
}
 
export class ExamItem extends Component {
    render() {
        return (
            <div href=" " className="weui_grid">
                <div className="weui_grid_icon" style={{ color: "red" }}>
                    <i className="fa fa-tint" aria-hidden="true"></i>
                </div>
                <p className="weui_grid_label">公务测试</p>
            </div>
        )
    }
}

export class CalendarItem extends Component {
    render() {
        return (
            <div href="" className="weui_grid">
                <div className="weui_grid_icon" style={{ color: "red" }}>
                    <i className="fa fa-calendar" aria-hidden="true"></i>
                </div>
                <p className="weui_grid_label">工作日历</p>
            </div>
        );
    }
}

class ItemList extends Component {

    render() {
        return (
            <div>
                <div className="session">
                    <p>服务</p>
                </div>
                <div className="weui_grids">
                    <Link to="/sport"><SportItem /></Link>
                    <Link to="/blog"><BlogItem /></Link>
                    <Link to="/exam"><ExamItem /></Link>
                    <Link to="/calendar"><CalendarItem /></Link>
                </div>    
                <div className="footer">
                    <p>@Inner Wall</p>
                </div>
            </div>            
        );
    }
}

export default ItemList;
