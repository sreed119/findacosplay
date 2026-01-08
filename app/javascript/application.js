// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
console.log("Application JS loaded");

import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
import "custom"

ActiveStorage.start()

import "controllers"
