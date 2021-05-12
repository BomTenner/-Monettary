

console.log("hello!")

const top = document.querySelector(".slider-top");
const bottom = document.querySelector(".slider-bottom");
const lock = document.querySelector(".safe-pic");

const animOnLogin = () => {
  lock.classList.remove('hidden')
  gsap.fromTo(lock, { opacity: "1"}, {duration: 3,  opacity: "0"});
  gsap.fromTo(top, { height: "50%"}, {duration: 1.5,  height: "0%", delay: 2});
  gsap.fromTo(bottom, { height: "50%"}, {duration: 1.5,  height: "0%", delay: 2});
  //setTimeout(() => lock.classList.add('hidden'), 5000);
  
}

//const sideBar = document.getElementById('side-bar');

const loginForm = document.getElementById("new_user")

// loginForm.addEventListener("submit", (event) => {
//   event.preventDefault();
//   setTimeout( () => {
//     document.getElementById("new_user").submit()
//   }, 500)
// })

window.addEventListener('load', (event) => {

  if (document.querySelector(".homepage-container")) {
    animOnLogin()
  }
});

//animOnLogin()