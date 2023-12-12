import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['home', 'explore', 'notifications']

  connect() {
    const { pathname } = window.location

    switch (pathname) {
      case '/home':
        this.activate(this.homeTarget, 'home')
        break
      case '/explore':
        this.activate(this.exploreTarget, 'explore')
        break
      case '/notifications':
        this.activate(this.notificationsTarget, 'notifications')
        break
      default:
        break
    }
  }

  activate(target, iconName) {
    const normalIcon = document.getElementById(iconName)
    const boldIcon = document.getElementById(`${iconName}-bold`)
    const navTextElement = target.querySelector('div.mx-3')

    normalIcon.classList.toggle('hidden')
    boldIcon.classList.toggle('hidden')
    navTextElement.classList.add('font-bold')
  }
}
