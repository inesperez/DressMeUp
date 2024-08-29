import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="camera"
export default class extends Controller {
  static values = {
    edit: Boolean
  }

  static targets = ["pictureButton", "retakeButton", "video", "canvas", "preview", "input",
                    "upload","uploadButton", "cameraButton", "cameraContainer", "addGarment"];

  connect() {
    console.log(this.editValue);

    this.width = 320;    // We will scale the photo width to this
    this.height = 0;     // This will be computed based on the input stream

    this.previewAvailable = false;
    this.streaming = false;

    navigator.mediaDevices
    .getUserMedia({ video: true, audio: false })
    .then((stream) => {
      this.videoTarget.srcObject = stream;
      this.videoTarget.play();
    })
    .catch((err) => {
      console.error(`An error occurred: ${err}`);
    });

  }

  fireUpload(event) {
    event.preventDefault();
    this.uploadButtonTarget.classList.add("d-none");
    this.uploadTarget.classList.remove("d-none");
    this.cameraButtonTarget.classList.toggle("primary");
    this.cameraButtonTarget.classList.toggle("btn-link");
    this.cameraButtonTarget.innerText = "Take photo instead";
  }

  fireCamera(event) {
    event.preventDefault();
    this.cameraButtonTarget.classList.toggle("d-none");
    this.cameraContainerTarget.classList.toggle("d-none");
    this.uploadButtonTarget.classList.toggle("d-none");
    this.uploadButtonTarget.innerText = "Upload photo instead";
    this.uploadButtonTarget.classList.toggle("btn-link");
    }

  resizeVideos() {
    console.log("canPLAYYYYY")
    if (!this.streaming) {
      this.height = (this.videoTarget.videoHeight / this.videoTarget.videoWidth) * this.width;

      this.videoTarget.setAttribute("width", this.width);
      this.videoTarget.setAttribute("height", this.height);
      this.canvasTarget.setAttribute("width", this.width);
      this.canvasTarget.setAttribute("height", this.height);

      this.stremaing = true;
    }
  }

  clearPicture(e) {
    if (e) e.preventDefault();

    const context = this.canvasTarget.getContext("2d");
    context.fillStyle = "#AAA";
    context.fillRect(0, 0, this.canvasTarget.width, this.canvasTarget.height);

    this.previewTarget.setAttribute("src", "");
    this.retakeButtonTarget.classList.add("d-none");
    this.pictureButtonTarget.classList.remove("d-none");
    this.videoTarget.classList.remove("d-none");
    this.inputTarget.classList.remove("d-none");
  }

  takePicture(e) {
    e.preventDefault();

    const context = this.canvasTarget.getContext("2d");

    if (this.width && this.height) {
      this.canvasTarget.width = this.width;
      this.canvasTarget.height = this.height;
      context.drawImage(this.videoTarget, 0, 0, this.width, this.height);

      this.canvasTarget.toBlob((blob) => {
        const file = new File([blob], "upload.png",{ type:"image/png", lastModified: new Date().getTime()});

        const dataContainer = new DataTransfer();
        dataContainer.items.add(file);

        this.inputTarget.files = dataContainer.files;

        const url = URL.createObjectURL(blob);

        this.previewTarget.setAttribute("src", url);

        this.inputTarget.classList.add("d-none");
        this.pictureButtonTarget.classList.add("d-none");
        this.videoTarget.classList.add("d-none");
        this.retakeButtonTarget.classList.remove("d-none");
      });
    } else {
      clearPicture();
    }
  }
}
