pragma Singleton

import Quickshell

Singleton {
    function get(url, callback) {
        const xhr = new XMLHttpRequest();
        xhr.open("GET", url, true);

        xhr.onreadystatechange = () => {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    callback(xhr.responseText);
                } else {
                    console.warn(xhr.statusText);
                }
            }
        }

        xhr.send();
    }
}
