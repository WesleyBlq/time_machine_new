import React, { Component, PropTypes } from 'react';

class ItemList extends Component {

    render() {
        return (
            <div>
                <div className="session">
                    <p>服务</p>
                </div>
                <div className="weui_grids">
                    <a href="" className="weui_grid">
                        <div className="weui_grid_icon" style={{color: "green"}}>
                            <i className="fa fa-wheelchair-alt" aria-hidden="true"></i>
                        </div>
                        <p className="weui_grid_label">
                            运动
                        </p>
                    </a>
                    <a href="javascript:;" className="weui_grid">
                        <div className="weui_grid_icon" style={{color: "red"}}>
                            <i className="fa fa-tint" aria-hidden="true"></i>
                        </div>
                        <p className="weui_grid_label">
                            博客
                        </p>
                    </a>

                    <a href=" " className="weui_grid">
                        <div className="weui_grid_icon" style={{color: "red"}}>
                            <i className="fa fa-tint" aria-hidden="true"></i>
                        </div>
                        <p className="weui_grid_label">
                            公务测试
                        </p>
                    </a>
                    <a href="" className="weui_grid">
                        <div className="weui_grid_icon" style={{color: "red"}}>
                            <i className="fa fa-calendar" aria-hidden="true"></i>
                        </div>
                        <p className="weui_grid_label">
                            工作日历
                        </p>
                    </a>
                </div>    
                <div className="footer">
                    <p>@Inner Wall</p>
                </div>
            </div>            
        );
    }
}

export default ItemList;
