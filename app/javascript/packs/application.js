import React from 'react'
import { createRoot } from 'react-dom/client'
import App from '../src/App'

// Import Turbo and other Rails functionality
import '@hotwired/turbo-rails'
import '../controllers'

// Mount React app if root element exists
document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root')
  if (root) {
    const reactRoot = createRoot(root)
    reactRoot.render(React.createElement(App))
  }
})
