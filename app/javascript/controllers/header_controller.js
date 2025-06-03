import { Controller } from "@hotwired/stimulus"
import { toggle } from 'el-transition'

export default class extends Controller {
  static targets = ["openUserMenu", "dropdown", "openMobileMenu", "mobileMenu"]

  connect() {
    console.log("Header controller connected")

    this.openUserMenuTarget.addEventListener("click", () => {
      toggle(this.dropdownTarget)
    })

    this.openMobileMenuTarget.addEventListener("click", () => {
      console.log("Mobile menu button clicked")
      toggle(this.mobileMenuTarget)
    })
  }
}
