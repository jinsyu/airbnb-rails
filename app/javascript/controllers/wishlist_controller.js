import { Controller } from "@hotwired/stimulus"
import { toggle } from 'el-transition'

export default class extends Controller {
  // static targets = ["openUserMenu", "dropdown", "openMobileMenu", "mobileMenu"]

  udpatewishliststatus() {
    const status = this.element.dataset.status

    if (status === "false") {
      this.element.classList.add("fill-primary")
      this.element.classList.remove("fill-none")
      this.element.dataset.status = "true"
    } else {
      this.element.classList.remove("fill-primary")
      this.element.classList.add("fill-none")
      this.element.dataset.status = "false"
    }
  }

}
