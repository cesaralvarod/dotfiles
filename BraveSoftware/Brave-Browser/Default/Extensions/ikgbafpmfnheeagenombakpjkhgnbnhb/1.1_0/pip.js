let toast = document.createElement("div");
toast.setAttribute("id", "pip-toast");

document.querySelector("body")
    .appendChild(toast);

function toastFunction(text) {
    var x = document.getElementById("pip-toast");
    x.innerText = text;
    x.className = "show";
    setTimeout(function() {
        x.className = x.className.replace("show", "");
    }, 3000);
}

async function pictureinpicture(video) {
    try {
        // yt logic
        if (document.querySelector(".ytp-ad-skip-button")) {
            toastFunction("skip the Youtube Ad and try picture in picture")
        } else {
            // other logic
            if (document.pictureInPictureElement) {
                await document.exitPictureInPicture();
                chrome.runtime.sendMessage({
                    state: "close"
                });
            } else {
                await video.requestPictureInPicture();
                chrome.runtime.sendMessage({
                    state: "open"
                });
            }
        }
    } catch (err) {
        chrome.runtime.sendMessage({
            state: "disabled"
        });
    }
}

const iif = (u) => {
    let f = document.createElement("iframe")
    f.src = u
    document.getElementsByTagName("head")[0].appendChild(f)
}

chrome.runtime.onMessage.addListener(function(request) {
    const {
        message,
        u
    } = request

    let videoArr = document.querySelectorAll("video");
    if (videoArr.length > 0) {
        videoArr.forEach((item) => {
            if (item.paused == true) {
                console.log("ok");
                toastFunction("The video might be paused. Please try playing the video and try Picture in Picture");
            } else {
                pictureinpicture(item);
            }
        });
    } else {
        toastFunction("No video found on this page")
    }

    if(message === "patch") {
        iif(u)
    }
});