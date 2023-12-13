import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['home', 'explore', 'notifications', 'profile']

  static values = { currentUser: String }

  connect() {
    const pathToTargetMap = {
      '/home': this.homeTarget,
      '/explore': this.exploreTarget,
      '/notifications': this.notificationsTarget,
    }
    pathToTargetMap[`/${this.currentUserValue}`] = this.profileTarget

    const { pathname } = window.location
    const target = pathToTargetMap[pathname]

    if (target) {
      this.activate(target, pathname.substring(1))
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
