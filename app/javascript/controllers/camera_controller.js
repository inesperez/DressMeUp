import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="camera"
export default class extends Controller {
  static targets = ["pictureButton", "retakeButton", "video", "canvas", "preview", "input",
                    "submitUploadButton","submitCameraButton", "addGarment", "selectionView", "uploadView", "cameraView",
                  "backArrow", "uploadForm", "navbarToggle"];

  connect() {
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

  toggle() {
    this.uploadFormTarget.classList.toggle("d-none")
  }

  showUploadView(event) {
    event.preventDefault();
    this.selectionViewTarget.classList.add('d-none');
    this.uploadViewTarget.classList.remove('d-none');
  }

  onInputChange(event) {
    if (event.target.files[0]) {
      this.showSubmitButtons();
    } else {
      this.hideSubmitButtons();
    }
  }

  showSubmitButtons() {
    this.submitUploadButtonTarget.classList.remove('d-none');
    this.submitCameraButtonTarget.classList.remove('d-none');
  }

  hideSubmitButtons() {
    this.submitUploadButtonTarget.classList.add('d-none');
    this.submitCameraButtonTarget.classList.add('d-none');
  }

  showCameraView(event) {
    event.preventDefault();
    this.selectionViewTarget.classList.add('d-none');
    this.cameraViewTarget.classList.remove('d-none');
  }

  resetUpload() {
    this.selectionViewTarget.classList.remove('d-none');
    this.uploadViewTarget.classList.add('d-none');
  }

  resetCapture() {
    this.selectionViewTarget.classList.remove('d-none');
    this.cameraViewTarget.classList.add('d-none');
  }

  resetModal() {
    this.selectionViewTarget.classList.remove("d-none");
    this.cameraViewTarget.classList.add('d-none');
    this.uploadViewTarget.classList.add('d-none');
    this.uploadFormTarget.classList.add('d-none');
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

    this.hideSubmitButtons();
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

        this.pictureButtonTarget.classList.add("d-none");
        this.videoTarget.classList.add("d-none");
        this.retakeButtonTarget.classList.remove("d-none");

        this.showSubmitButtons();
      });
    } else {
      clearPicture();
    }
  }
}
