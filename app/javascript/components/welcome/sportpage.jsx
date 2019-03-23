import React, { Component, PropTypes } from 'react';

class SportPage extends Component {

    render() { 
        return ( 
            <div>
                <div className="weui_cells_title">带图标、说明、跳转的列表项</div>
                <div className="weui_cells weui_cells_access">
                    <div className="weui_cell">
                        <div className="weui_cell_hd">
                            <img src="" alt="icon" style={{width:"20px", margin_right:"5px", display:"block"}} />
                        </div>
                            <div className="weui_cell_bd weui_cell_primary">
                                <p>cell standard</p>
                            </div>
                            <div className="weui_cell_ft"></div>
                    </div>
                    <div className="weui_cell" >
                        <div className="weui_cell_hd">
                            <img src="" alt="icon" style={{ width: "20px", margin_right: "5px", display: "block" }} />
                        </div>
                        <div className="weui_cell_bd weui_cell_primary">
                            <p>cell standard</p>
                        </div>
                        <div className="weui_cell_ft">说明文字</div>
                    </div>
                </div>
            </div>
        );
    }
}
 
export default SportPage;
