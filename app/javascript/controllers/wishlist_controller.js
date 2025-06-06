import { Controller } from "@hotwired/stimulus"
import { toggle } from 'el-transition'

export default class extends Controller {
  // static targets = ["openUserMenu", "dropdown", "openMobileMenu", "mobileMenu"]

  udpatewishliststatus() {
    // get status if user is logged in
    // if logged-out reirect to login page
    if (this.element.dataset.userLoggedIn === "false") {
      window.location.href = "/users/sign_in"
      return;
    }

    const status = this.element.dataset.status
    const userId = this.element.dataset.userId
    const propertyId = this.element.dataset.propertyId
    const wishlistId = this.element.dataset.wishlistId

    if (status === "false") {
      this.addToWishlist(userId, propertyId)
    } else {
      this.removeFromWishlist(wishlistId)
    }
  }

  async addToWishlist(userId, propertyId) {

    const payload = {
      user_id: userId,
      property_id: propertyId
    }

    const response = await fetch("/api/wishlists", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(payload)
    })

    if (response.ok) {
      const data = await response.json()
      console.log(data)
      this.element.classList.add("fill-primary")
      this.element.classList.remove("fill-none")
      this.element.dataset.status = "true"
      this.element.dataset.wishlistId = data.id
    } else {
      console.error("Failed to add to wishlist")
    }
  }

  async removeFromWishlist(wishlistId) {

    const response = await fetch(`/api/wishlists/${wishlistId}`, {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json"
      }
    })

    if (response.ok) {
      const data = await response.json()
      console.log(data)
      this.element.classList.remove("fill-primary")
      this.element.classList.add("fill-none")
      this.element.dataset.status = "false"
      this.element.dataset.wishlistId = null
    } else {
      console.error("Failed to remove from wishlist")
    }
  }
}