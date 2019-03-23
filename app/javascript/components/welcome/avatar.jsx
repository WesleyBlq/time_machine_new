import React, { Component, PropTypes } from 'react';

class Avatar extends Component {

    render() {
        return (
            <div className="head" >
                <div className="avatar" >
                    <img src="" id="avatar_id" />
                </div>
                <p>{this.props.name}的数据中心</p>
            </div>            
        );
    }
}

export default Avatar;
