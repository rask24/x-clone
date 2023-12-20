import { Controller } from '@hotwired/stimulus'
import { Turbo } from '@hotwired/turbo-rails'

export default class extends Controller {
  static values = { url: String }

  visit() {
    if (this.urlValue === '') return

    Turbo.visit(this.urlValue)
  }

  back() {
    window.history.back()
  }
}
