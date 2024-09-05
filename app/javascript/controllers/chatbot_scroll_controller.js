import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chatbot-scroll"
export default class extends Controller {
  connect() {
    this.scrollToBottom();
    this.element.addEventListener("submit", this.handleFormSubmit.bind(this));
  }

  disconnect() {
    this.element.removeEventListener("submit", this.handleFormSubmit.bind(this));
  }

  handleFormSubmit(event) {
    event.preventDefault(); // Prevent the default form submission
    this.scrollToBottom();
    event.target.submit(); // Submit the form after scrolling
  }

  scrollToBottom() {
    const chatbotContainer = this.element.querySelector("#questions");
    if (chatbotContainer) {
      // Use setTimeout to ensure the content is fully rendered before scrolling
      setTimeout(() => {
        chatbotContainer.scrollTop = chatbotContainer.scrollHeight;
      }, 0);
    }
  }
}
