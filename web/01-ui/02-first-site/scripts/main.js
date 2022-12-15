let mayImage = document.querySelector('img')

mayImage.onclick = function() {
    let mySrc = mayImage.getAttribute('src');
    if (mySrc === 'images/firefox.jpeg') {
        mayImage.setAttribute('src', 'images/firefox-2.jpeg')
    } else {
        mayImage.setAttribute('src', 'images/firefox.jpeg')
    }
}

let myButton = document.querySelector('button');
let myHeading = document.querySelector('h1');

function setUserName() {
    let myName = prompt('请输入你的名字。');
    if(!myName) {
        setUserName();
    } else {
        // 跨 session 存储很厉害了
        localStorage.setItem('name', myName);
        myHeading.textContent = 'Mozilla 酷毙了，' + myName;
    }
}

if (!localStorage.getItem('name')) {
    setUserName();
} else {
    let storedName = localStorage.getItem('name');
    myHeading.textContent = 'Mozilla 酷毙了，' + storedName;
}

myButton.onclick = function() {
    setUserName();
}
