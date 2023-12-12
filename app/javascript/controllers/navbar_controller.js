import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['home', 'explore', 'notification']

  static values = {
    homeBoldIcon: {
      type: String,
      default:
        'M21.591 7.146L12.52 1.157c-.316-.21-.724-.21-1.04 0l-9.071 5.99c-.26.173-.409.456-.409.757v13.183c0 .502.418.913.929.913H9.14c.51 0 .929-.41.929-.913v-7.075h3.909v7.075c0 .502.417.913.928.913h6.165c.511 0 .929-.41.929-.913V7.904c0-.301-.158-.584-.408-.758z',
    },
    exploreBoldIcon: {
      type: String,
      default:
        'M10.25 4.25c-3.314 0-6 2.686-6 6s2.686 6 6 6c1.657 0 3.155-.67 4.243-1.757 1.087-1.088 1.757-2.586 1.757-4.243 0-3.314-2.686-6-6-6zm-9 6c0-4.971 4.029-9 9-9s9 4.029 9 9c0 1.943-.617 3.744-1.664 5.215l4.475 4.474-2.122 2.122-4.474-4.475c-1.471 1.047-3.272 1.664-5.215 1.664-4.971 0-9-4.029-9-9z',
    },
    notificationBoldIcon: {
      type: String,
      default:
        'M11.996 2c-4.062 0-7.49 3.021-7.999 7.051L2.866 18H7.1c.463 2.282 2.481 4 4.9 4s4.437-1.718 4.9-4h4.236l-1.143-8.958C19.48 5.017 16.054 2 11.996 2zM9.171 18h5.658c-.412 1.165-1.523 2-2.829 2s-2.417-.835-2.829-2z',
    },
  }

  connect() {
    const { pathname } = window.location

    switch (pathname) {
      case '/home':
        this.activate(this.homeTarget, this.homeBoldIconValue)
        break
      case '/explore':
        this.activate(this.exploreTarget)
        break
      case '/notification':
        this.activate(this.notificationTarget)
        break
      default:
        break
    }
  }

  activate(target, boldIconValue) {
    const svgElement = target.querySelector('path')
    const navTextElement = target.querySelector('div.mx-3')

    svgElement.setAttribute('d', boldIconValue)
    navTextElement.classList.add('font-bold')
  }
}
