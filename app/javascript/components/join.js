button = document.getElementById("join-button");
if (button){
    console.log("button found")
    button.addEventListener("click",(event) => {
        event.preventDefault();
        console.log("hm")
        console.log(button.innerText);
        button.innerText = button.innerText == "Leave" ? "Join" : "Leave"
        
    })
}