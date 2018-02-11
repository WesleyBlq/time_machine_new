// import 'babel-polyfill'

import React from 'react'
import { render } from 'react-dom'
import ModalGallery from './modal_gallery'

console.log(window.location)

render(
  <ModalGallery location={window.location} />,
  document.getElementById('root')
)
