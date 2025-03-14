// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import SlimController from "./slim_controller";
application.register("slim", SlimController);
eagerLoadControllersFrom("controllers", application)
