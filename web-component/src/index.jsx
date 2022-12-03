import React from 'react'
import * as ReactDOM from 'react-dom/client'
import reactToWebComponent from 'react-to-webcomponent'

const App = () => <div>Hello Tebukuro Form</div>

const TebukuroForm = reactToWebComponent(App, React, ReactDOM)

customElements.define('tebukuro-form', TebukuroForm)
