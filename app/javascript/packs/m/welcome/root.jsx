import React, { Component } from 'react'
import Avatar from './avatar'
import ItemList from './itemlist'

export default class Root extends Component {
  render() {
    return (
      <div className="">
        <Avatar name="name test" />
        <ItemList />
      </div>
    )
  }
}