// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"

// Auto-register controllers
const context = require.context("./", true, /_controller\.js$/)
context.keys().forEach(context)
