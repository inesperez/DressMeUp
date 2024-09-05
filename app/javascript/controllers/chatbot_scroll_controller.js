import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chatbot-scroll"
export default class extends Controller {
  connect() {
    this.scrollToBottom();
  }

  scrollToBottom() {
const chatbotContainer = this.element.querySelector("#questions");    if (chatbotContainer) {
      // Use setTimeout to ensure the content is fully rendered before scrolling
      setTimeout(() => {
        chatbotContainer.scrollTop = chatbotContainer.scrollHeight;
      }, 0);
    }
  }
}
